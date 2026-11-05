package com.autochips.carplay.service;

import android.os.Message;
import com.autochips.carplay.common.CarplayMessage;

/* JADX INFO: loaded from: classes.dex */
final class c extends b {
    final /* synthetic */ a ti;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    private c(a aVar) {
        super(aVar, (byte) 0);
        this.ti = aVar;
    }

    /* synthetic */ c(a aVar, byte b) {
        this(aVar);
    }

    @Override // com.autochips.carplay.service.b
    final int dt() {
        return 0;
    }

    public final boolean processMessage(Message message) {
        B(CarplayMessage.messageString(message.what));
        if (message.what != 257) {
            B("Unhandled message - " + CarplayMessage.messageString(message.what));
            return false;
        }
        this.ti.tg = message.arg1;
        this.ti.transitionTo(this.ti.tb);
        return true;
    }
}
