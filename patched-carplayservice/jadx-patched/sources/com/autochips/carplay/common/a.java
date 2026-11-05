package com.autochips.carplay.common;

import android.os.Handler;
import android.os.Looper;

/* JADX INFO: loaded from: classes.dex */
public abstract class a extends Handler {
    String TAG;

    public a(Looper looper) {
        super(looper);
        this.TAG = "CarplayAdapter";
    }

    protected static void V(int i) {
        com.autochips.carplay.service.g.dx().dz().sendMessage(i);
    }
}
