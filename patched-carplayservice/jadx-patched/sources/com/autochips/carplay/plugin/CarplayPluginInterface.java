package com.autochips.carplay.plugin;

/* JADX INFO: loaded from: classes.dex */
public class CarplayPluginInterface {
    private CarplayPluginJniCallbacks mCarplayPluginJniCallbacks = new CarplayPluginJniCallbacks();

    static {
        System.loadLibrary("carplay_plugin_jni");
        classInitNative();
    }

    static native void classInitNative();

    public void cleanup() {
        if (this.mCarplayPluginJniCallbacks != null) {
            this.mCarplayPluginJniCallbacks.cleanup();
        }
    }

    native void cleanupNative();

    native int forceKeyFrameNative();

    native boolean initNative();

    native int requestSiriActionNative(int i);

    native int requestUINative(String str);

    native int sendChangeModeRequestNative(int i, int i2, int i3, int i4, int i5, int i6, int i7, int i8, int i9, int i10, int i11, boolean z);

    native int setBluetoothAddressNative(String str);

    native int setDeviceIDNative(String str);

    native int setIAP2StateNative(boolean z);

    native int setLimitedUINative(boolean z);

    native int setNightModeNative(boolean z);

    native int setOemIconLabelNative(String str);

    native int setScreenSizeNative(int i, int i2);

    native int setVideoResolutionNative(int i, int i2);

    native int shutdownCarplayNative();

    native int startupCarplayNative();

    native int updateKnobNative(boolean z, boolean z2, boolean z3, int i, int i2, int i3);

    native int updateMediaBuottnNative(int i);

    native int updateTelephonyNative(int i);

    native int updateTouchScreenNative(boolean z, int i, int i2);
}
