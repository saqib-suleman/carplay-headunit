package com.autochips.carplay.service;

import android.os.IBinder;
import android.util.Slog;

/* JADX INFO: loaded from: classes.dex */
final class m implements IBinder.DeathRecipient {
    private IBinder mBinder;
    private int uj;
    final /* synthetic */ CarplayService uk;

    m(CarplayService carplayService, IBinder iBinder, int i) {
        this.uk = carplayService;
        this.mBinder = iBinder;
        this.uj = i;
    }

    @Override // android.os.IBinder.DeathRecipient
    public final void binderDied() {
        Slog.d("CarplayService", "Binder is dead - unregister " + this.uj);
        this.mBinder.unlinkToDeath(this, 0);
        this.uk.o(this.uj, 1);
    }
}
