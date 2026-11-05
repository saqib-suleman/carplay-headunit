package com.autochips.carplay.wired;

import android.os.IBinder;
import android.util.Slog;

/* JADX INFO: loaded from: classes.dex */
final class c implements IBinder.DeathRecipient {
    private IBinder mBinder;
    final /* synthetic */ a uQ;
    private int uR = 0;

    c(a aVar, IBinder iBinder) {
        this.uQ = aVar;
        this.mBinder = iBinder;
    }

    @Override // android.os.IBinder.DeathRecipient
    public final void binderDied() {
        Slog.d("CarplayUSBNCMAdapter", "usbdservice is dead");
        this.mBinder.unlinkToDeath(this, 0);
        this.uQ.sendMessage(this.uQ.obtainMessage(3));
    }
}
