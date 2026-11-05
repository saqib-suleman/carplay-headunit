package com.autochips.carplay.av;

import android.util.Log;
import android.view.Surface;

/* JADX INFO: loaded from: classes.dex */
public class VideoStream {
    private static final boolean DBG = true;
    private static final String TAG = "VideoStream";
    private long mNativeContext;
    private long mNativeSurfaceTexture;

    static {
        System.loadLibrary("carplay_av_jni");
        native_init();
    }

    public VideoStream() {
        native_setup();
    }

    private final native void native_dump(int i);

    private final native void native_finalize();

    private static final native void native_init();

    private final native void native_release();

    private final native int native_setSurface(Surface surface);

    private final native void native_setup();

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

    public int setSurface(Surface surface) {
        if (this.mNativeContext != 0) {
            return native_setSurface(surface);
        }
        Log.w(TAG, "native VideoStream went away");
        return -2;
    }

    public int start() {
        if (this.mNativeContext != 0) {
            return native_start();
        }
        Log.w(TAG, "native VideoStream went away");
        return -2;
    }

    public int stop() {
        if (this.mNativeContext != 0) {
            return native_stop();
        }
        Log.w(TAG, "native VideoStream went away");
        return -2;
    }
}
