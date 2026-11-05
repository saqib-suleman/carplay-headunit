package com.autochips.carplay.service;

import android.os.Message;
import com.android.internal.util.IState;
import com.autochips.carplay.common.CarplayMessage;

/* JADX INFO: loaded from: classes.dex */
public final class x extends q {
    final /* synthetic */ p uD;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public x(p pVar) {
        super(pVar, (byte) 0);
        this.uD = pVar;
    }

    @Override // com.autochips.carplay.service.q
    public final void enter() {
        super.enter();
        p.a(this.uD, 5);
    }

    @Override // com.autochips.carplay.service.q
    public final void exit() {
        super.exit();
    }

    public final synchronized boolean processMessage(Message message) {
        p pVar;
        IState iState;
        boolean z;
        B("processMessage: " + CarplayMessage.messageString(message.what));
        int i = message.what;
        if (i == 776) {
            pVar = this.uD;
            iState = this.uD.uv;
        } else if (i == 1291 || i == 1293 || i == 1301 || i == 1303 || i == 1311) {
            z = true;
        } else if (i != 1313) {
            B("Unhandled message - " + CarplayMessage.messageString(message.what));
            z = false;
        } else {
            pVar = this.uD;
            iState = this.uD.us;
        }
        pVar.transitionTo(iState);
        z = true;
        return z;
    }
}
