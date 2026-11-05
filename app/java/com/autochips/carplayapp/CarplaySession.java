package com.autochips.carplayapp;

import android.content.Context;
import android.content.Intent;
import android.util.Log;
import android.view.Surface;
import com.autochips.carplay.CarplayCommon;
import com.autochips.carplay.CarplayDevice;
import com.autochips.carplay.CarplayManager;
import com.autochips.carplay.CarplayResourceState;
import java.util.List;

/**
 * Process-wide bridge to the head unit's CarplayManager.
 *
 * Callbacks are registered only while a CarPlay session is live (started by
 * {@link CarplayClientService}). The vendor CarplayService treats the death of any registered
 * client as a crash and restarts CarPlay, so this process must not stay registered after a session.
 *
 * Every vendor call is wrapped: the vendor CarplayManager has unlock-without-lock bugs and reads
 * its service reference without the lock, so it can throw while CarPlay is starting or stopping.
 */
final class CarplaySession {

    interface Listener {
        void onCarplayConnected();

        void onCarplaySessionEnded();

        void onAccessoryScreenRequested();

        /** The iPhone gave the screen back after it took it over from the head unit's own UI. */
        void onIphoneScreenTakeoverEnded();
    }

    static final String TAG = "CarplayApp";

    private static CarplaySession instance;

    private final Context applicationContext;
    private final CarplayManager carplayManager;
    private Listener listener;
    private CarplayEventsRegistration currentEventsRegistration;
    private int lastMainScreenOwner = CarplayCommon.ENTITY_NOT_APPLICABLE;
    private boolean isIphoneScreenTakeoverActive;
    private boolean isMainScreenStreaming;
    private boolean isCarplayScreenVisible;

    private CarplaySession(Context applicationContext, CarplayManager carplayManager) {
        this.applicationContext = applicationContext;
        this.carplayManager = carplayManager;
    }

    /** Returns the session, or null when the head unit's CarPlay manager service is not running. */
    static synchronized CarplaySession getOrCreate(Context context) {
        if (instance != null) {
            return instance;
        }
        CarplayManager carplayManager;
        try {
            carplayManager = CarplayManager.getDefaultManager();
        } catch (RuntimeException carplayManagerUnavailable) {
            Log.e(TAG, "carplay_manager system service failed", carplayManagerUnavailable);
            return null;
        }
        if (carplayManager == null) {
            Log.e(TAG, "carplay_manager system service not available");
            return null;
        }
        instance = new CarplaySession(context.getApplicationContext(), carplayManager);
        return instance;
    }

    void setListener(Listener listener) {
        this.listener = listener;
    }

    void clearListener(Listener listener) {
        if (this.listener == listener) {
            this.listener = null;
        }
    }

    void setCarplayScreenVisible(boolean isCarplayScreenVisible) {
        this.isCarplayScreenVisible = isCarplayScreenVisible;
    }

    /** Replaces any earlier registration, so late events from a previous session are ignored. */
    void startNewEventsRegistration() {
        // The vendor starts the service again when the iPhone reconnects inside a live session; its
        // CONNECTED event may land on the old registration and be ignored, so reconnect here.
        boolean isReconnectWithinLiveSession = currentEventsRegistration != null;
        stopListeningToCarplay();
        // The events sent at connect time fired before this registration existed.
        lastMainScreenOwner = readCurrentMainScreenOwner();
        isIphoneScreenTakeoverActive = false;
        isMainScreenStreaming = false;
        currentEventsRegistration = new CarplayEventsRegistration(this);
        try {
            logVendorResult("registerCallback", carplayManager.registerCallback(currentEventsRegistration, null));
        } catch (RuntimeException registerFailed) {
            logVendorFailure("registerCallback", registerFailed);
        }
        if (isReconnectWithinLiveSession && listener != null) {
            listener.onCarplayConnected();
        }
    }

    void stopListeningToCarplay() {
        CarplayEventsRegistration endingEventsRegistration = currentEventsRegistration;
        if (endingEventsRegistration == null) {
            return;
        }
        currentEventsRegistration = null;
        isMainScreenStreaming = false;
        try {
            carplayManager.unregisterCallback(endingEventsRegistration);
        } catch (RuntimeException unregisterFailed) {
            logVendorFailure("unregisterCallback", unregisterFailed);
        }
    }

    boolean isCurrentEventsRegistration(CarplayEventsRegistration eventsRegistration) {
        return eventsRegistration == currentEventsRegistration;
    }

    /**
     * Called when the iPhone disconnects or CarPlay turns off: close the screen and release the
     * vendor service. The app never switches CarPlay off itself: on this unit that also switches
     * Bluetooth off, which can hang the Bluetooth stack and take down Android's core process.
     */
    void endSession() {
        Log.i(TAG, "CarPlay session ended");
        stopListeningToCarplay();
        if (listener != null) {
            listener.onCarplaySessionEnded();
        }
        applicationContext.stopService(new Intent(applicationContext, CarplayClientService.class));
    }

    boolean isConnected() {
        return readConnectionStatus() == CarplayConnectionStatus.CONNECTED;
    }

    CarplayConnectionStatus readConnectionStatus() {
        try {
            if (!carplayManager.isEnabled()) {
                return CarplayConnectionStatus.DISCONNECTED;
            }
            List<CarplayDevice> connectedDevices = carplayManager.getConnectedDevices();
            if (connectedDevices == null) {
                return CarplayConnectionStatus.DISCONNECTED;
            }
            for (CarplayDevice connectedDevice : connectedDevices) {
                if (carplayManager.getConnectionState(connectedDevice) == CarplayCommon.CONNECTION_STATE_CONNECTED) {
                    return CarplayConnectionStatus.CONNECTED;
                }
            }
            return CarplayConnectionStatus.DISCONNECTED;
        } catch (RuntimeException carplayServiceNotReady) {
            Log.w(TAG, "Could not read connection state", carplayServiceNotReady);
            return CarplayConnectionStatus.UNKNOWN;
        }
    }

    /** True once the vendor reports the iPhone's screen stream as created; a startVideo return code is not proof. */
    boolean isMainScreenStreaming() {
        return isMainScreenStreaming;
    }

    void startVideo(Surface surface) {
        try {
            logVendorResult("startVideo", carplayManager.startVideo(surface));
        } catch (RuntimeException startVideoFailed) {
            logVendorFailure("startVideo", startVideoFailed);
        }
    }

    /**
     * Always passes userSelect=true: the vendor treats that as "the car took the screen back", and
     * the call is also what resets its "video started" flag for the next session.
     */
    void stopVideo() {
        try {
            logVendorResult("stopVideo", carplayManager.stopVideo(true));
        } catch (RuntimeException stopVideoFailed) {
            logVendorFailure("stopVideo", stopVideoFailed);
        }
    }

    void sendTouch(boolean isPressed, int videoX, int videoY) {
        try {
            carplayManager.updateTouchScreen(isPressed, videoX, videoY);
        } catch (RuntimeException touchFailed) {
            Log.w(TAG, "updateTouchScreen failed", touchFailed);
        }
    }

    void sendSiriButton(boolean isPressed) {
        int siriAction = isPressed ? CarplayCommon.SIRI_ACTION_BUTTON_DOWN : CarplayCommon.SIRI_ACTION_BUTTON_UP;
        try {
            logVendorResult("requestSiri", carplayManager.requestSiri(siriAction));
        } catch (RuntimeException requestSiriFailed) {
            logVendorFailure("requestSiri", requestSiriFailed);
        }
    }

    void sendMediaButton(int carplayMediaButton) {
        try {
            logVendorResult("updateMedia", carplayManager.updateMedia(carplayMediaButton));
        } catch (RuntimeException updateMediaFailed) {
            logVendorFailure("updateMedia", updateMediaFailed);
        }
    }

    void bringCarplayScreenToFront() {
        Intent carplayScreenIntent = new Intent(applicationContext, CarplayActivity.class)
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_REORDER_TO_FRONT);
        applicationContext.startActivity(carplayScreenIntent);
    }

    void handleConnectionStateChanged(CarplayDevice device, int state) {
        Log.i(TAG, "onConnectionStateChanged: " + device + " state=" + state);
        switch (state) {
            case CarplayCommon.CONNECTION_STATE_CONNECTED:
                if (listener != null) {
                    listener.onCarplayConnected();
                }
                bringCarplayScreenToFront();
                break;
            case CarplayCommon.CONNECTION_STATE_DISCONNECTED:
                endSession();
                break;
            case CarplayCommon.CONNECTION_STATE_CONNECTING:
            case CarplayCommon.CONNECTION_STATE_DISCONNECTING:
                break;
            default:
                Log.w(TAG, "Unknown connection state: " + state);
                break;
        }
    }

    void handleEnableStateChanged(int previousState, int newState) {
        Log.i(TAG, "onEnableStateChanged: " + previousState + " -> " + newState);
        switch (newState) {
            case CarplayCommon.STATE_OFF:
            case CarplayCommon.STATE_TURNING_OFF:
                // Car power-off, airplane mode or vendor crash recovery: no DISCONNECTED is guaranteed.
                endSession();
                break;
            case CarplayCommon.STATE_TURNING_ON:
            case CarplayCommon.STATE_ON:
                break;
            default:
                Log.w(TAG, "Unknown enable state: " + newState);
                break;
        }
    }

    void handleResourceStateChanged(CarplayResourceState resourceState) {
        Log.i(TAG, "onResourceStateChanged: " + resourceState);
        if (resourceState == null) {
            return;
        }
        // Fires on audio changes too, so react only to changes in who owns the screen.
        int mainScreenOwner = resourceState.getMainScreen();
        int previousMainScreenOwner = lastMainScreenOwner;
        lastMainScreenOwner = mainScreenOwner;
        boolean hasIphoneJustTakenScreen = mainScreenOwner == CarplayCommon.ENTITY_CONTROLLER
                && previousMainScreenOwner != CarplayCommon.ENTITY_CONTROLLER;
        boolean hasIphoneJustReturnedScreen = mainScreenOwner == CarplayCommon.ENTITY_ACCESSORY
                && previousMainScreenOwner == CarplayCommon.ENTITY_CONTROLLER;

        if (hasIphoneJustTakenScreen) {
            // Siri, an incoming call or a turn-by-turn prompt while the driver was on the car's own
            // UI is temporary: put the driver back when the iPhone returns the screen.
            isIphoneScreenTakeoverActive = !isCarplayScreenVisible;
            bringCarplayScreenToFront();
            return;
        }
        if (hasIphoneJustReturnedScreen && isIphoneScreenTakeoverActive) {
            isIphoneScreenTakeoverActive = false;
            if (listener != null) {
                listener.onIphoneScreenTakeoverEnded();
            }
        }
    }

    void handleAccessoryScreenRequested(int urlId) {
        // Driver tapped the car's own icon inside CarPlay: return to the head unit's home screen.
        Log.i(TAG, "onRequestAccessoryUI: " + urlId);
        isIphoneScreenTakeoverActive = false;
        if (listener != null) {
            listener.onAccessoryScreenRequested();
        }
    }

    void handleStreamStateChanged(int streamId, int audioType, int streamState) {
        Log.i(TAG, "onStreamStateChanged: stream=" + streamId + " audioType=" + audioType + " state=" + streamState);
        if (streamId != CarplayCommon.STREAM_ID_MAIN_SCREEN) {
            return;
        }
        switch (streamState) {
            case CarplayCommon.STREAM_STATE_STARTED:
                isMainScreenStreaming = true;
                break;
            case CarplayCommon.STREAM_STATE_STOPPED:
                isMainScreenStreaming = false;
                break;
            default:
                Log.w(TAG, "Unknown stream state: " + streamState);
                break;
        }
    }

    private int readCurrentMainScreenOwner() {
        try {
            CarplayResourceState currentResourceState = carplayManager.getResourceState();
            if (currentResourceState == null) {
                return CarplayCommon.ENTITY_NOT_APPLICABLE;
            }
            return currentResourceState.getMainScreen();
        } catch (RuntimeException resourceStateUnavailable) {
            // Vendor getResourceState() has the same unlock-without-lock bug as getConnectedDevices().
            logVendorFailure("getResourceState", resourceStateUnavailable);
            return CarplayCommon.ENTITY_NOT_APPLICABLE;
        }
    }

    private static void logVendorResult(String vendorMethodName, int vendorResultCode) {
        Log.i(TAG, vendorMethodName + ": " + vendorResultCode);
    }

    private static void logVendorFailure(String vendorMethodName, RuntimeException vendorFailure) {
        Log.w(TAG, vendorMethodName + " failed", vendorFailure);
    }
}
