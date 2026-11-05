package com.autochips.carplay.wired;

/* JADX INFO: loaded from: classes.dex */
public class CarplayUsbNcmJni {
    static {
        System.loadLibrary("carplay_wired_jni");
    }

    static native void cleanupNative();

    static native boolean getUpStateNative(String str);

    static native boolean initNative();

    static native boolean setUpStateNative(String str, boolean z);
}
