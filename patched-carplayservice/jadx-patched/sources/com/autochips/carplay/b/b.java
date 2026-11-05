package com.autochips.carplay.b;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.util.Log;
import com.autochips.backcar.BackCar;
import com.autochips.carplay.common.CarplayMessage;
import java.util.ArrayList;

/* JADX INFO: loaded from: classes.dex */
final class b extends Handler {
    final /* synthetic */ a rX;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    b(a aVar, Looper looper) {
        super(looper);
        this.rX = aVar;
    }

    @Override // android.os.Handler
    public final void handleMessage(Message message) {
        com.autochips.carplay.service.h hVar;
        int i;
        int i2 = message.what;
        if (i2 != 1) {
            if (i2 != 6) {
                switch (i2) {
                    case 3:
                        Log.i("BackcarMonitor", "MSG_EVENT_BACKCAR_STOP");
                        synchronized (this.rX.rS) {
                            this.rX.rT = false;
                            break;
                        }
                        hVar = this.rX.mCarplayMonitor;
                        i = CarplayMessage.BACKCAR_EVENT_STOP;
                        break;
                    case 4:
                        Log.i("BackcarMonitor", "MSG_EVENT_BACKCAR_ARM2_EXIT");
                        hVar = this.rX.mCarplayMonitor;
                        i = CarplayMessage.BACKCAR_EVENT_ARM2_EXIT;
                        break;
                }
            } else {
                Log.i("BackcarMonitor", "MSG_EVENT_BACKCAR_SERVICE_DIED");
                if (this.rX.rU != null) {
                    this.rX.rU.setListener(this.rX.rW, (ArrayList) null);
                }
                this.rX.rU = new BackCar();
                synchronized (this.rX.rS) {
                    if (this.rX.mStarted) {
                        this.rX.rU.setListener(this.rX.rW, this.rX.rV);
                    }
                }
            }
            super.handleMessage(message);
        }
        Log.i("BackcarMonitor", "MSG_EVENT_BACKCAR_START");
        synchronized (this.rX.rS) {
            this.rX.rT = true;
        }
        hVar = this.rX.mCarplayMonitor;
        i = CarplayMessage.BACKCAR_EVENT_START;
        hVar.sendMessage(i);
        super.handleMessage(message);
    }
}
