package com.autochips.carplay.service;

import android.os.Message;
import android.util.Log;
import com.autochips.carplay.CarplayDevice;
import com.autochips.carplay.common.CarplayMessage;

/* JADX INFO: loaded from: classes.dex */
public final class r extends q {
    final /* synthetic */ p uD;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public r(p pVar) {
        super(pVar, (byte) 0);
        this.uD = pVar;
    }

    @Override // com.autochips.carplay.service.q
    public final void enter() {
        super.enter();
        p.a(this.uD, 4);
    }

    @Override // com.autochips.carplay.service.q
    public final void exit() {
        super.exit();
    }

    public final synchronized boolean processMessage(Message message) {
        CarplayDevice carplayDeviceEc;
        p pVar;
        B("processMessage: " + CarplayMessage.messageString(message.what));
        int i = message.what;
        if (i == 266) {
            this.uD.ta.b((com.autochips.carplay.common.f) message.obj);
        } else if (i == 1293) {
            this.uD.sendMessageDelayed(CarplayMessage.CARPLAY_SESSION_DISCONNECT_TIMEOUT, 3000L);
            this.uD.deferMessage(message);
        } else if (i == 1803) {
            this.uD.removeMessages(CarplayMessage.CARPLAY_SESSION_DISCONNECT_TIMEOUT);
            CarplayDevice carplayDevice = (CarplayDevice) message.obj;
            if (this.uD.ec() == null || !this.uD.ec().equals(carplayDevice)) {
                Log.e(p.TAG, "carplay session disconnect from unknown device: " + carplayDevice);
            } else {
                this.uD.ta.dI();
                p.a(this.uD, new com.autochips.carplay.common.b(2, 2, 0, -1, 0, 0));
                p.a(this.uD, message);
                p.b(this.uD, message);
                this.uD.sendMessageDelayed(CarplayMessage.CARPLAY_SESSION_CONNECT_TIMEOUT, 10000L);
                this.uD.transitionTo(this.uD.uq);
            }
        } else if (i != 1806) {
            switch (i) {
                case CarplayMessage.USER_START_VIDEO /* 259 */:
                    com.autochips.carplay.b.a aVarDF = g.dx().dF();
                    if (aVarDF == null || !aVarDF.dc()) {
                        if (!this.uD.uB) {
                            p.a(this.uD, message);
                        }
                        return false;
                    }
                    Log.d(p.TAG, "In Backcar, ignore user start video");
                    break;
                case CarplayMessage.USER_STOP_VIDEO /* 260 */:
                    if (!this.uD.uC) {
                        p.a(this.uD, message);
                    }
                    return false;
                case CarplayMessage.USER_SET_AUDIO_ENABLE /* 261 */:
                    p.a(this.uD, message);
                    return false;
                case CarplayMessage.USER_REQUEST_DEVICE_UI /* 262 */:
                    int i2 = message.arg1;
                    if (message.arg2 == 286 && (carplayDeviceEc = this.uD.ec()) != null) {
                        ac.a(this.uD.sZ.getApplicationContext()).b(carplayDeviceEc.toString(), 1);
                    }
                    this.uD.ta.f(i2, (String) message.obj);
                    break;
                case CarplayMessage.USER_REQUEST_SIRI /* 263 */:
                    this.uD.ta.ah(message.arg1);
                    break;
                case CarplayMessage.USER_FORCE_KEY_FRAME /* 264 */:
                    this.uD.ta.dT();
                    break;
                default:
                    switch (i) {
                        case CarplayMessage.USER_UPDATE_TOUCH_SCREEN /* 276 */:
                            this.uD.ta.a(((Boolean) message.obj).booleanValue(), message.arg1, message.arg2);
                            break;
                        case CarplayMessage.USER_UPDATE_TELEPHONY /* 277 */:
                            this.uD.ta.af(message.arg1);
                            break;
                        case CarplayMessage.USER_UPDATE_MEDIA_BUTTON /* 278 */:
                            this.uD.ta.ag(message.arg1);
                            break;
                        case CarplayMessage.USER_UPDATE_KNOB /* 279 */:
                            this.uD.ta.a((com.autochips.carplay.common.h) message.obj);
                            break;
                        default:
                            switch (i) {
                                case CarplayMessage.CARPLAY_DUCK_AUDIO /* 1812 */:
                                case CarplayMessage.CARPLAY_UNDUCK_AUDIO /* 1813 */:
                                    pVar = this.uD;
                                    p.a(pVar, message);
                                    break;
                                case CarplayMessage.CARPLAY_MODE_CHANGED /* 1814 */:
                                    p.a(this.uD, (com.autochips.carplay.common.b) message.obj);
                                    break;
                                case CarplayMessage.CARPLAY_REQUEST_ACCESSORY_UI /* 1815 */:
                                    CarplayDevice carplayDeviceEc2 = this.uD.ec();
                                    if (carplayDeviceEc2 != null) {
                                        ac.a(this.uD.sZ.getApplicationContext()).b(carplayDeviceEc2.toString(), 0);
                                    }
                                    this.uD.sZ.aj(message.arg1);
                                    pVar = this.uD;
                                    p.a(pVar, message);
                                    break;
                                case CarplayMessage.CARPLAY_SESSION_CONTROL /* 1816 */:
                                    if (message.arg1 == 1) {
                                        this.uD.ta.F((String) message.obj);
                                    }
                                    break;
                                default:
                                    B("Unhandled message - " + CarplayMessage.messageString(message.what));
                                    return false;
                            }
                            break;
                    }
                    break;
            }
        } else {
            Log.w(p.TAG, "Carplay Session disconnect timeout");
        }
        return true;
    }
}
