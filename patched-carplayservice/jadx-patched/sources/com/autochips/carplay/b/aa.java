package com.autochips.carplay.b;

import android.content.Context;
import android.os.Looper;
import android.os.Message;
import android.widget.Toast;
import com.autochips.carplay.common.CarplayMessage;

/* JADX INFO: loaded from: classes.dex */
public final class aa extends com.autochips.carplay.av.g implements z {
    static aa si;
    private final Context mContext;
    final ac sQ;
    private Toast sS;
    private com.autochips.carplay.service.h mCarplayMonitor = null;
    private com.autochips.carplay.c.a rY = null;
    private boolean sg = false;
    private boolean sR = false;

    public aa(Context context, Looper looper) {
        this.mContext = context;
        this.sQ = new ac(this, looper);
        setOnStreamListener(new ab(this));
    }

    static /* synthetic */ boolean ac(int i) {
        return 110 == i;
    }

    static /* synthetic */ boolean c(aa aaVar) {
        aaVar.sR = true;
        return true;
    }

    public final void W(int i) {
        if (i == 0) {
            this.sQ.sendMessage(15);
        } else {
            if (i != 2) {
                return;
            }
            this.sQ.sendMessage(14);
        }
    }

    public final void a(com.autochips.carplay.service.h hVar, com.autochips.carplay.c.a aVar) {
        this.mCarplayMonitor = hVar;
        this.rY = aVar;
        if (this.mCarplayMonitor != null) {
            this.mCarplayMonitor.a(CarplayMessage.ACCESSORY_AUDIO_STATE_CHANGED, this.sQ.getHandler());
            this.mCarplayMonitor.a(CarplayMessage.ACCESSORY_CALL_STATE_CHANGED, this.sQ.getHandler());
            this.mCarplayMonitor.a(CarplayMessage.BACKCAR_EVENT_START, this.sQ.getHandler());
            this.mCarplayMonitor.a(CarplayMessage.BACKCAR_EVENT_STOP, this.sQ.getHandler());
            this.mCarplayMonitor.a(CarplayMessage.BACKCAR_EVENT_ARM2_EXIT, this.sQ.getHandler());
            this.mCarplayMonitor.a(CarplayMessage.BACKCAR_EVENT_ERROR, this.sQ.getHandler());
        }
    }

    public final void disable(int i) {
        Message messageObtainMessage = this.sQ.obtainMessage(1);
        messageObtainMessage.arg1 = i;
        this.sQ.sendMessage(messageObtainMessage);
    }
}
