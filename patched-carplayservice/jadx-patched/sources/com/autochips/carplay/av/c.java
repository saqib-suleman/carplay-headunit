package com.autochips.carplay.av;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.Parcel;
import android.util.Log;

/* JADX INFO: loaded from: classes.dex */
final class c extends Handler {
    private StreamController qp;
    final /* synthetic */ StreamController qq;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c(StreamController streamController, StreamController streamController2, Looper looper) {
        super(looper);
        this.qq = streamController;
        this.qp = streamController2;
    }

    @Override // android.os.Handler
    public final void handleMessage(Message message) {
        if (this.qp.mNativeContext == 0) {
            Log.w("StreamController", "streamCtl went away with unhandled events: " + message.what);
        }
        switch (message.what) {
            case 0:
                if (this.qq.mStreamAction != null) {
                    this.qq.mStreamAction.T(message.arg1);
                }
                if (this.qq.mOnStreamListener != null) {
                    this.qq.mOnStreamListener.h(message.arg1, message.arg2);
                    if ((message.arg1 == 100 || message.arg1 == 101) && message.obj != null && (message.obj instanceof Parcel)) {
                        this.qq.mOnStreamListener.a(message.arg1, message.arg2, (Parcel) message.obj);
                    }
                }
                break;
            case 1:
                if (this.qq.mStreamAction != null) {
                    this.qq.mStreamAction.U(message.arg1);
                }
                if (this.qq.mOnStreamListener != null) {
                    this.qq.mOnStreamListener.i(message.arg1, message.arg2);
                    Log.d("StreamController", "stream destroyed");
                }
                break;
            case 2:
                if (this.qq.mOnStreamListener != null) {
                    this.qq.mOnStreamListener.onError(message.arg1, message.arg2);
                    Log.d("StreamController", "stream error");
                }
                break;
            case 3:
                if (this.qq.mOnErrorListener != null) {
                    d dVar = this.qq.mOnErrorListener;
                    int i = message.arg1;
                    int i2 = message.arg2;
                    if (!dVar.cP()) {
                        Log.d("StreamController", "not handle");
                    }
                }
                break;
            case 4:
                if (this.qq.mOnErrorListener != null) {
                    d dVar2 = this.qq.mOnErrorListener;
                    int i3 = message.arg1;
                    int i4 = message.arg2;
                    if (!dVar2.cP()) {
                        Log.d("StreamController", "not handle");
                    }
                }
                break;
            case 5:
                if (this.qq.mOnErrorListener != null) {
                    d dVar3 = this.qq.mOnErrorListener;
                    int i5 = message.arg1;
                    int i6 = message.arg2;
                    if (!dVar3.cP()) {
                        Log.d("StreamController", "not handle");
                    }
                }
                break;
            case 6:
                if (this.qq.mOnErrorListener != null) {
                    d dVar4 = this.qq.mOnErrorListener;
                    int i7 = message.arg1;
                    int i8 = message.arg2;
                    if (!dVar4.cP()) {
                        Log.d("StreamController", "not handle");
                    }
                }
                break;
            default:
                Log.e("StreamController", "Unkonwn message type" + message.what);
                break;
        }
    }
}
