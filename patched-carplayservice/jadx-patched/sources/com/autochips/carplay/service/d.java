package com.autochips.carplay.service;

import android.os.Message;
import com.autochips.carplay.common.CarplayMessage;

/* JADX INFO: loaded from: classes.dex */
final class d extends b {
    final /* synthetic */ a ti;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    private d(a aVar) {
        super(aVar, (byte) 0);
        this.ti = aVar;
    }

    /* synthetic */ d(a aVar, byte b) {
        this(aVar);
    }

    @Override // com.autochips.carplay.service.b
    final int dt() {
        return 2;
    }

    public final boolean processMessage(Message message) {
        B(CarplayMessage.messageString(message.what));
        int i = message.what;
        if (i == 258) {
            this.ti.tg = message.arg1;
            this.ti.transitionTo(this.ti.tc);
            return true;
        }
        if (i != 1797) {
            switch (i) {
                case CarplayMessage.CARPLAY_PLUGIN_STARTED /* 1793 */:
                    this.ti.removeMessages(CarplayMessage.CARPLAY_PLUGIN_START_TIMEOUT);
                    return true;
                case CarplayMessage.CARPLAY_PLUGIN_STOPPED /* 1794 */:
                case CarplayMessage.CARPLAY_PLUGIN_START_FAILURE /* 1795 */:
                    break;
                default:
                    switch (i) {
                        case CarplayMessage.NET_IFACE_ADD /* 2049 */:
                        case CarplayMessage.NET_IFACE_REMOVE /* 2050 */:
                        case CarplayMessage.NET_IFACE_LINK_STATE_CHANGED /* 2051 */:
                            if (!this.ti.ta.dH()) {
                                return true;
                            }
                            i iVar = this.ti.ta;
                            int unused = this.ti.tg;
                            if (iVar.dP()) {
                                this.ti.sendMessageDelayed(CarplayMessage.CARPLAY_PLUGIN_START_TIMEOUT, 10000L);
                                return true;
                            }
                            a.a(this.ti, this.ti.obtainMessage(CarplayMessage.CARPLAY_PLUGIN_START_FAILURE));
                            return true;
                        default:
                            B("Unhandled message - " + CarplayMessage.messageString(message.what));
                            return false;
                    }
            }
        }
        C(CarplayMessage.messageString(message.what));
        a.a(this.ti, message);
        return true;
    }
}
