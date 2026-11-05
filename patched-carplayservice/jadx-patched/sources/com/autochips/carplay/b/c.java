package com.autochips.carplay.b;

import android.util.Log;
import com.autochips.backcar.BackCar;

/* JADX INFO: loaded from: classes.dex */
final class c implements BackCar.Listener {
    final /* synthetic */ a rX;

    c(a aVar) {
        this.rX = aVar;
    }

    public final void onEvent(int i, int i2, int i3) {
        Log.i("BackcarMonitor", "onEvent evt: " + i);
        if (2 == i) {
            if (i2 != 0) {
                this.rX.mHandler.sendEmptyMessage(1);
                return;
            } else {
                this.rX.mHandler.sendEmptyMessage(3);
                return;
            }
        }
        if (1 == i) {
            if (i2 != 0) {
                this.rX.mHandler.sendEmptyMessage(1);
                return;
            } else {
                this.rX.mHandler.sendEmptyMessage(3);
                return;
            }
        }
        if (i == 0) {
            this.rX.mHandler.sendEmptyMessage(4);
        } else if (4 == i) {
            this.rX.mHandler.sendEmptyMessage(6);
        } else {
            Log.i("BackcarMonitor", "unknown msg");
        }
    }
}
