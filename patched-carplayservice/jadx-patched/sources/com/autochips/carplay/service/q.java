package com.autochips.carplay.service;

import android.util.Log;
import com.android.internal.util.State;
import com.autochips.carplay.common.CarplayMessage;

/* JADX INFO: loaded from: classes.dex */
abstract class q extends State {
    final /* synthetic */ p uD;

    private q(p pVar) {
        this.uD = pVar;
    }

    /* synthetic */ q(p pVar, byte b) {
        this(pVar);
    }

    final void B(String str) {
        Log.i(p.TAG, getName() + ": " + str);
    }

    public void enter() {
        Log.d(p.TAG, "Enter " + getName() + ": " + CarplayMessage.messageString(this.uD.getCurrentMessage().what));
        super.enter();
    }

    public void exit() {
        this.uD.uy = this;
        Log.d(p.TAG, "Exit " + getName() + ", mPrevState: " + this.uD.uy.getName() + ": " + CarplayMessage.messageString(this.uD.getCurrentMessage().what));
        super.exit();
    }
}
