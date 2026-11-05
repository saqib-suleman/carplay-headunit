package com.autochips.carplay.a;

import android.location.OnNmeaMessageListener;
import android.os.Message;

/* JADX INFO: loaded from: classes.dex */
final class g implements OnNmeaMessageListener {
    final /* synthetic */ e rM;
    private String rN;

    private g(e eVar) {
        this.rM = eVar;
    }

    /* synthetic */ g(e eVar, byte b) {
        this(eVar);
    }

    @Override // android.location.OnNmeaMessageListener
    public final void onNmeaMessage(String str, long j) {
        this.rN = str;
        Message messageObtainMessage = this.rM.obtainMessage(3);
        messageObtainMessage.obj = str;
        this.rM.sendMessage(messageObtainMessage);
    }
}
