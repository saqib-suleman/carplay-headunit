package com.autochips.carplay;

import android.os.Handler;
import android.view.Surface;
import java.util.List;

/**
 * Compile-only stub of the head unit's CarplayManager (autochips-framework.jar).
 * Signatures match the decompiled original; the real class is on the unit's boot classpath.
 */
public class CarplayManager {

    public interface CarplayCallback {
        void onAppStateChanged(CarplayAppState appState);

        void onAudioInfo(int streamId, int audioType, CarplayAudioInfo info);

        void onCallStateChanged(CarplayCall call);

        void onConnectionStateChanged(CarplayDevice device, int state);

        void onEnableStateChanged(int previousState, int newState);

        void onRequestAccessoryUI(int urlId);

        void onResourceStateChanged(CarplayResourceState resourceState);

        void onStreamStateChanged(int streamId, int audioType, int streamState);
    }

    public static CarplayManager getDefaultManager() {
        throw new RuntimeException("stub");
    }

    public boolean isEnabled() {
        throw new RuntimeException("stub");
    }

    public int enable() {
        throw new RuntimeException("stub");
    }

    public int disable() {
        throw new RuntimeException("stub");
    }

    public List<CarplayDevice> getConnectedDevices() {
        throw new RuntimeException("stub");
    }

    public int getConnectionState(CarplayDevice device) {
        throw new RuntimeException("stub");
    }

    public CarplayResourceState getResourceState() {
        throw new RuntimeException("stub");
    }

    public int registerCallback(CarplayCallback callback, Handler handler) {
        throw new RuntimeException("stub");
    }

    public void unregisterCallback(CarplayCallback callback) {
        throw new RuntimeException("stub");
    }

    public int startVideo(Surface surface) {
        throw new RuntimeException("stub");
    }

    public int stopVideo(boolean userSelect) {
        throw new RuntimeException("stub");
    }

    public int updateTouchScreen(boolean press, int x, int y) {
        throw new RuntimeException("stub");
    }

    public int requestSiri(int action) {
        throw new RuntimeException("stub");
    }

    public int updateMedia(int media) {
        throw new RuntimeException("stub");
    }
}
