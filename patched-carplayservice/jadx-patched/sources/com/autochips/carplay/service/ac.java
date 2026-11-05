package com.autochips.carplay.service;

import android.content.Context;
import android.content.SharedPreferences;

/* JADX INFO: loaded from: classes.dex */
public final class ac {
    private static ac uJ;
    private SharedPreferences uK;
    private SharedPreferences.Editor uL;

    private ac(Context context) {
        this.uK = context.getSharedPreferences("device_ui_state", 0);
    }

    public static synchronized ac a(Context context) {
        if (uJ == null) {
            uJ = new ac(context);
        }
        return uJ;
    }

    public final int K(String str) {
        int i;
        synchronized (z.rS) {
            i = this.uK.getInt(str, 1);
        }
        return i;
    }

    public final void b(String str, int i) {
        synchronized (z.rS) {
            if (K(str) == i) {
                return;
            }
            if (this.uL == null) {
                this.uL = this.uK.edit();
            }
            this.uL.putInt(str, i).commit();
        }
    }
}
