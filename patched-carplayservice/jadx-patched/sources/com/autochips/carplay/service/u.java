package com.autochips.carplay.service;

import android.os.Message;
import com.autochips.carplay.common.CarplayMessage;

/* JADX INFO: loaded from: classes.dex */
public final class u extends q {
    final /* synthetic */ p uD;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public u(p pVar) {
        super(pVar, (byte) 0);
        this.uD = pVar;
    }

    @Override // com.autochips.carplay.service.q
    public final void enter() {
        super.enter();
    }

    @Override // com.autochips.carplay.service.q
    public final void exit() {
        super.exit();
    }

    public final synchronized boolean processMessage(Message message) {
        B("processMessage: " + CarplayMessage.messageString(message.what));
        switch (message.what) {
            case CarplayMessage.USER_SET_NIGHT_MODE /* 267 */:
                this.uD.ta.o(((Boolean) message.obj).booleanValue());
                break;
            case CarplayMessage.USER_SET_VIDEO_RESOLUTION /* 268 */:
                this.uD.ta.m(message.arg1, message.arg2);
                break;
            case CarplayMessage.USER_SET_SCREEN_SIZE /* 269 */:
                this.uD.ta.n(message.arg1, message.arg2);
                break;
            case CarplayMessage.USER_SET_OEM_ICON_LABEL /* 270 */:
                this.uD.ta.G((String) message.obj);
                break;
        }
        return true;
    }
}
