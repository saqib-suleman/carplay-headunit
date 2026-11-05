package com.autochips.carplay.av;

import android.os.Looper;
import android.util.Log;
import java.lang.ref.WeakReference;

/* JADX INFO: loaded from: classes.dex */
public class StreamController {
    private static final boolean DBG = true;
    private static final int STREAM_ACTION_ADD = 0;
    private static final int STREAM_ACTION_DEL = 1;
    private static final int STREAM_ACTION_ERR = 2;
    private static final int STREAM_ERROR_NOENT = 3;
    private static final int STREAM_ERROR_PLAYBACK = 4;
    private static final int STREAM_ERROR_RECORD = 5;
    private static final int STREAM_ERROR_UNKNOWN = 6;
    private static final String TAG = "StreamController";
    private c mEventHandler;
    private long mNativeContext;
    private d mOnErrorListener;
    private e mOnStreamListener;
    private f mStreamAction;

    static {
        System.loadLibrary("carplay_av_jni");
        native_init();
    }

    public StreamController(int i) {
        c cVar;
        Looper looperMyLooper = Looper.myLooper();
        if (looperMyLooper == null) {
            Looper mainLooper = Looper.getMainLooper();
            if (mainLooper != null) {
                cVar = new c(this, this, mainLooper);
            } else {
                this.mEventHandler = null;
            }
            native_setup(new WeakReference(this), i);
            Log.d(TAG, "StreamController create: " + this);
        }
        cVar = new c(this, this, looperMyLooper);
        this.mEventHandler = cVar;
        native_setup(new WeakReference(this), i);
        Log.d(TAG, "StreamController create: " + this);
    }

    private final native void native_finalize();

    private static final native void native_init();

    private final native void native_release();

    private final native void native_setup(Object obj, int i);

    private static void postEventFromNative(Object obj, int i, int i2, int i3, Object obj2) {
        StreamController streamController = (StreamController) ((WeakReference) obj).get();
        if (streamController != null) {
            if (streamController.mEventHandler != null) {
                streamController.mEventHandler.sendMessage(streamController.mEventHandler.obtainMessage(i, i2, i3, obj2));
                return;
            }
            return;
        }
        Log.e(TAG, "postEventFromNative: null sc! what = " + i + ", arg1 = " + i2 + ", arg2 = " + i3);
    }

    protected void finalize() {
        Log.d(TAG, "finalize() native_finalize called");
        native_finalize();
        Log.d(TAG, "finalize() native_finalize finished");
    }

    public void release() {
        native_release();
    }

    public void setOnErrorListener(d dVar) {
        this.mOnErrorListener = dVar;
    }

    public void setOnStreamListener(e eVar) {
        this.mOnStreamListener = eVar;
    }

    public void setStreamAction(f fVar) {
        this.mStreamAction = fVar;
    }
}
