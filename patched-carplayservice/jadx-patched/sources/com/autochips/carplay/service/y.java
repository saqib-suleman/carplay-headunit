package com.autochips.carplay.service;

import android.os.Message;
import com.android.internal.util.IState;
import com.autochips.carplay.CarplayDevice;
import com.autochips.carplay.common.CarplayMessage;

/* JADX INFO: loaded from: classes.dex */
public final class y extends q {
    final /* synthetic */ p uD;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public y(p pVar) {
        super(pVar, (byte) 0);
        this.uD = pVar;
    }

    @Override // com.autochips.carplay.service.q
    public final void enter() {
        super.enter();
        p.a(this.uD, 1);
    }

    @Override // com.autochips.carplay.service.q
    public final void exit() {
        super.exit();
    }

    public final synchronized boolean processMessage(Message message) {
        p pVar;
        IState iState;
        B("processMessage: " + CarplayMessage.messageString(message.what));
        int i = message.what;
        if (i != 266) {
            if (i != 1293) {
                if (i != 1321) {
                    if (i != 1802) {
                        switch (i) {
                            default:
                                switch (i) {
                                    case CarplayMessage.USER_UPDATE_TOUCH_SCREEN /* 276 */:
                                    case CarplayMessage.USER_UPDATE_TELEPHONY /* 277 */:
                                    case CarplayMessage.USER_UPDATE_MEDIA_BUTTON /* 278 */:
                                        break;
                                    default:
                                        switch (i) {
                                            case CarplayMessage.CARPLAY_SESSION_FAILED /* 1804 */:
                                                p.al(message.arg1);
                                                break;
                                            case CarplayMessage.CARPLAY_SESSION_CONNECT_TIMEOUT /* 1805 */:
                                                p.al(3);
                                                break;
                                            default:
                                                B("Unhandled message - " + CarplayMessage.messageString(message.what));
                                                return false;
                                        }
                                        break;
                                }
                            case CarplayMessage.USER_START_VIDEO /* 259 */:
                            case CarplayMessage.USER_STOP_VIDEO /* 260 */:
                            case CarplayMessage.USER_SET_AUDIO_ENABLE /* 261 */:
                            case CarplayMessage.USER_REQUEST_DEVICE_UI /* 262 */:
                                this.uD.deferMessage(message);
                                break;
                        }
                    } else {
                        this.uD.removeMessages(CarplayMessage.CARPLAY_SESSION_CONNECT_TIMEOUT);
                        p.a(this.uD, (CarplayDevice) message.obj);
                        this.uD.ta.a(this.uD.tu.a((CarplayDevice) message.obj), 1);
                        pVar = this.uD;
                        iState = this.uD.us;
                    }
                }
                pVar.transitionTo(iState);
            } else {
                this.uD.removeMessages(CarplayMessage.CARPLAY_SESSION_CONNECT_TIMEOUT);
                this.uD.removeMessages(CarplayMessage.IAP2_DISCONNECT_TIMEOUT);
            }
            pVar = this.uD;
            iState = this.uD.up;
            pVar.transitionTo(iState);
        } else if (1 == message.arg1) {
            this.uD.ta.b((com.autochips.carplay.common.f) message.obj);
        }
        return true;
    }
}
