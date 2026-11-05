package com.autochips.carplayapp;

import android.util.Log;
import com.autochips.carplay.CarplayAppState;
import com.autochips.carplay.CarplayAudioInfo;
import com.autochips.carplay.CarplayCall;
import com.autochips.carplay.CarplayDevice;
import com.autochips.carplay.CarplayManager;
import com.autochips.carplay.CarplayResourceState;

/**
 * One vendor callback registration, created fresh for every CarPlay session. The vendor
 * CarplayManager posts callbacks to the main thread independently of unregistering, so events from
 * an earlier session can still arrive after a new one started; those are dropped here.
 */
final class CarplayEventsRegistration implements CarplayManager.CarplayCallback {

    private final CarplaySession carplaySession;

    CarplayEventsRegistration(CarplaySession carplaySession) {
        this.carplaySession = carplaySession;
    }

    private boolean isFromCurrentSession(String eventName) {
        if (carplaySession.isCurrentEventsRegistration(this)) {
            return true;
        }
        Log.i(CarplaySession.TAG, "Ignoring " + eventName + " from an earlier CarPlay session");
        return false;
    }

    @Override
    public void onConnectionStateChanged(CarplayDevice device, int state) {
        if (isFromCurrentSession("onConnectionStateChanged")) {
            carplaySession.handleConnectionStateChanged(device, state);
        }
    }

    @Override
    public void onEnableStateChanged(int previousState, int newState) {
        if (isFromCurrentSession("onEnableStateChanged")) {
            carplaySession.handleEnableStateChanged(previousState, newState);
        }
    }

    @Override
    public void onResourceStateChanged(CarplayResourceState resourceState) {
        if (isFromCurrentSession("onResourceStateChanged")) {
            carplaySession.handleResourceStateChanged(resourceState);
        }
    }

    @Override
    public void onRequestAccessoryUI(int urlId) {
        if (isFromCurrentSession("onRequestAccessoryUI")) {
            carplaySession.handleAccessoryScreenRequested(urlId);
        }
    }

    @Override
    public void onStreamStateChanged(int streamId, int audioType, int streamState) {
        if (isFromCurrentSession("onStreamStateChanged")) {
            carplaySession.handleStreamStateChanged(streamId, audioType, streamState);
        }
    }

    @Override
    public void onAppStateChanged(CarplayAppState appState) {
        Log.i(CarplaySession.TAG, "onAppStateChanged: " + appState);
    }

    @Override
    public void onCallStateChanged(CarplayCall call) {
        Log.i(CarplaySession.TAG, "onCallStateChanged: " + call);
    }

    @Override
    public void onAudioInfo(int streamId, int audioType, CarplayAudioInfo info) {
        Log.i(CarplaySession.TAG, "onAudioInfo: stream=" + streamId + " audioType=" + audioType + " info=" + info);
    }
}
