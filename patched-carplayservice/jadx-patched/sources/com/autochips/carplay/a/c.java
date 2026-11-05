package com.autochips.carplay.a;

import android.os.IHwBinder;
import android.util.Log;

/* JADX INFO: loaded from: classes.dex */
final class c implements IHwBinder.DeathRecipient {
    final /* synthetic */ a rc;

    c(a aVar) {
        this.rc = aVar;
    }

    public final void serviceDied(long j) {
        Log.d("CarplayIAP2Adapter", "iapservice is dead");
        this.rc.sendMessage(this.rc.obtainMessage(3));
    }
}
