package com.autochips.carplay.service;

import android.os.Message;
import com.autochips.carplay.common.CarplayMessage;

/* JADX INFO: loaded from: classes.dex */
public final class s extends q {
    final /* synthetic */ p uD;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public s(p pVar) {
        super(pVar, (byte) 0);
        this.uD = pVar;
    }

    @Override // com.autochips.carplay.service.q
    public final void enter() {
        super.enter();
        p.a(this.uD, 6);
    }

    @Override // com.autochips.carplay.service.q
    public final void exit() {
        super.exit();
    }

    public final synchronized boolean processMessage(Message message) {
        B("processMessage: " + CarplayMessage.messageString(message.what));
        int i = message.what;
        if (i != 276) {
            switch (i) {
                case CarplayMessage.USER_START_VIDEO /* 259 */:
                    if (!this.uD.uB) {
                        this.uD.uB = true;
                        this.uD.uC = false;
                        break;
                    }
                case CarplayMessage.USER_STOP_VIDEO /* 260 */:
                    if (!this.uD.uC) {
                        this.uD.uB = false;
                        this.uD.uC = true;
                        break;
                    }
                case CarplayMessage.USER_SET_AUDIO_ENABLE /* 261 */:
                case CarplayMessage.USER_REQUEST_DEVICE_UI /* 262 */:
                    return true;
                default:
                    B("Unhandled message - " + CarplayMessage.messageString(message.what));
                    return false;
            }
        }
        return true;
    }
}
