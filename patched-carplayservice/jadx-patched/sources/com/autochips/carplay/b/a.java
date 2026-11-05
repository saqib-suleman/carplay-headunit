package com.autochips.carplay.b;

import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import com.autochips.backcar.BackCar;
import java.util.ArrayList;

/* JADX INFO: loaded from: classes.dex */
public class a {
    private final com.autochips.carplay.service.h mCarplayMonitor;
    private final Handler mHandler;
    private final Object rS = new Object();
    private boolean rT = false;
    private boolean mStarted = false;
    private BackCar.Listener rW = new c(this);
    private BackCar rU = new BackCar();
    ArrayList rV = new ArrayList(3);

    public a(Looper looper, com.autochips.carplay.service.h hVar) {
        this.mCarplayMonitor = hVar;
        this.rV.add(0);
        this.rV.add(1);
        this.rV.add(2);
        this.rV.add(4);
        this.mHandler = new b(this, looper);
    }

    public final void da() {
        Log.i("BackcarMonitor", "startMonitor");
        synchronized (this.rS) {
            this.mStarted = true;
        }
        this.rU.setListener(this.rW, this.rV);
    }

    public final void db() {
        Log.i("BackcarMonitor", "stopMonitor");
        synchronized (this.rS) {
            this.mStarted = false;
        }
        this.rU.setListener((BackCar.Listener) null, (ArrayList) null);
        this.rU.release();
    }

    public final boolean dc() {
        boolean z;
        synchronized (this.rS) {
            z = this.rT;
        }
        return z;
    }
}
