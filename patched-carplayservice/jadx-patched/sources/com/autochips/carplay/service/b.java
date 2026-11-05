package com.autochips.carplay.service;

import android.util.Log;
import com.android.internal.util.State;
import com.autochips.carplay.CarplayCommon;

/* JADX INFO: loaded from: classes.dex */
abstract class b extends State {
    final /* synthetic */ a ti;

    private b(a aVar) {
        this.ti = aVar;
    }

    /* synthetic */ b(a aVar, byte b) {
        this(aVar);
    }

    final void B(String str) {
        Log.i(a.TAG, CarplayCommon.nameForEnableState(dt()) + " : " + str);
    }

    final void C(String str) {
        Log.e(a.TAG, CarplayCommon.nameForEnableState(dt()) + " : " + str);
    }

    abstract int dt();

    public void enter() {
        int iDt = dt();
        B("entered ");
        this.ti.sZ.p(this.ti.tf, iDt);
        this.ti.tf = iDt;
    }
}
