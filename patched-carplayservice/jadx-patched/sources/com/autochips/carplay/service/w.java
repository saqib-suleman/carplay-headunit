package com.autochips.carplay.service;

import android.os.Message;
import com.android.internal.util.IState;
import com.autochips.carplay.CarplayDevice;
import com.autochips.carplay.common.CarplayMessage;

/* JADX INFO: loaded from: classes.dex */
public final class w extends q {
    final /* synthetic */ p uD;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public w(p pVar) {
        super(pVar, (byte) 0);
        this.uD = pVar;
    }

    @Override // com.autochips.carplay.service.q
    public final void enter() {
        super.enter();
        p.a(this.uD, 2);
    }

    @Override // com.autochips.carplay.service.q
    public final void exit() {
        super.exit();
    }

    /* JADX WARN: Code duplicated, block: B:17:0x004a A[Catch: all -> 0x0051, TRY_LEAVE, TryCatch #0 {, blocks: (B:3:0x0001, B:14:0x002c, B:15:0x003d, B:16:0x0041, B:17:0x004a), top: B:22:0x0001 }] */
    public final synchronized boolean processMessage(Message message) {
        boolean z;
        p pVar;
        IState iState;
        B("processMessage: " + CarplayMessage.messageString(message.what));
        int i = message.what;
        if (i == 276) {
            this.uD.deferMessage(message);
            z = true;
        } else {
            if (i == 1303) {
                pVar = this.uD;
                iState = this.uD.up;
            } else if (i != 1802) {
                switch (i) {
                    case CarplayMessage.USER_START_VIDEO /* 259 */:
                    case CarplayMessage.USER_STOP_VIDEO /* 260 */:
                    case CarplayMessage.USER_SET_AUDIO_ENABLE /* 261 */:
                    case CarplayMessage.USER_REQUEST_DEVICE_UI /* 262 */:
                        this.uD.deferMessage(message);
                        z = true;
                        break;
                    default:
                        z = false;
                        break;
                }
            } else {
                p.a(this.uD, (CarplayDevice) message.obj);
                pVar = this.uD;
                iState = this.uD.us;
            }
            pVar.transitionTo(iState);
            z = true;
        }
        return z;
    }
}
