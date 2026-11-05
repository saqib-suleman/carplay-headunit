package com.autochips.carplay.service;

import android.app.Application;
import android.util.Log;

/* JADX INFO: loaded from: classes.dex */
public class AdapterApp extends Application {
    private static int sY = 0;

    public AdapterApp() {
        synchronized (AdapterApp.class) {
            sY++;
            Log.d("CarplayAdapter_App", "REFCOUNT: Constructed " + this + " Instance Count = " + sY);
        }
    }

    protected void finalize() {
        synchronized (AdapterApp.class) {
            sY--;
            Log.d("CarplayAdapter_App", "REFCOUNT: Finalized: " + this + ", Instance Count = " + sY);
        }
    }

    @Override // android.app.Application
    public void onCreate() {
        super.onCreate();
        Log.d("CarplayAdapter_App", "onCreate");
    }
}
