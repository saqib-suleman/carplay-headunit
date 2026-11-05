package com.autochips.carplay.av;

import android.util.Log;

/* JADX INFO: loaded from: classes.dex */
public class AudioStream {
    private static final boolean DBG = true;
    private static final String TAG = "AudioStream";
    private long mNativeContext;

    static {
        System.loadLibrary("carplay_av_jni");
        native_init();
    }

    public AudioStream(int i) {
        native_setup(i);
    }

    private final native void native_dump(int i);

    private final native void native_finalize();

    private static final native void native_init();

    private final native void native_release();

    private final native int native_setVolume(float f, float f2);

    private final native void native_setup(int i);

    private final native int native_start();

    private final native int native_stop();

    protected void finalize() {
        Log.d(TAG, "finalize() native_finalize called");
        native_finalize();
        Log.d(TAG, "finalize() native_finalize finished");
    }

    public void release() {
        native_release();
    }

    public int setVolume(float f, float f2) {
        if (this.mNativeContext != 0) {
            return native_setVolume(f, f2);
        }
        Log.w(TAG, "native AudioStream went away");
        return -2;
    }

    public int start() {
        if (this.mNativeContext != 0) {
            return native_start();
        }
        Log.w(TAG, "native AudioStream went away");
        return -2;
    }

    public int stop() {
        if (this.mNativeContext != 0) {
            return native_stop();
        }
        Log.w(TAG, "native AudioStream went away");
        return -2;
    }
}
