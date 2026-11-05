package com.autochips.carplay.wired;

import android.os.Message;
import android.util.Log;
import com.autochips.usbd.INotifyCallback;
import com.autochips.usbd.USBDev;

/* JADX INFO: loaded from: classes.dex */
final class b extends INotifyCallback.Stub {
    final /* synthetic */ a uQ;

    private b(a aVar) {
        this.uQ = aVar;
    }

    /* synthetic */ b(a aVar, byte b) {
        this(aVar);
    }

    public final void onIfNameCallBack(USBDev uSBDev) {
        Log.d("CarplayUSBNCMAdapter", "onIfNameCallBack: " + uSBDev.getIfName());
        Message messageObtainMessage = this.uQ.obtainMessage(5);
        messageObtainMessage.obj = uSBDev.getIfName();
        this.uQ.sendMessage(messageObtainMessage);
    }
}
