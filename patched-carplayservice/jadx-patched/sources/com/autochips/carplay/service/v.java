package com.autochips.carplay.service;

import android.os.Message;
import android.util.Log;
import com.android.internal.util.IState;
import com.autochips.carplay.CarplayDevice;
import com.autochips.carplay.common.CarplayMessage;

/* JADX INFO: loaded from: classes.dex */
public final class v extends q {
    final /* synthetic */ p uD;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public v(p pVar) {
        super(pVar, (byte) 0);
        this.uD = pVar;
    }

    @Override // com.autochips.carplay.service.q
    public final void enter() {
        super.enter();
        p.a(this.uD, 0);
        this.uD.uA.clear();
        if (this.uD.ec() != null) {
            CarplayDevice carplayDeviceEc = this.uD.ec();
            p.a(this.uD, (CarplayDevice) null);
            this.uD.sZ.a(carplayDeviceEc, 0);
        }
    }

    @Override // com.autochips.carplay.service.q
    public final void exit() {
        super.exit();
    }

    public final synchronized boolean processMessage(Message message) {
        p pVar;
        IState iState;
        B("processMessage: " + CarplayMessage.messageString(message.what));
        if (this.uD.ec() != null) {
            Log.e(p.TAG, "ERROR: current device not null in Disconnected");
            return false;
        }
        switch (message.what) {
            case CarplayMessage.USER_STOP_VIDEO /* 260 */:
                if (!this.uD.uC) {
                    this.uD.uC = true;
                    this.uD.uB = false;
                    p.a(this.uD, message);
                }
                return true;
            case CarplayMessage.USER_CHANGE_MODE_REQUEST /* 266 */:
                if (1 == message.arg1) {
                    this.uD.ta.b((com.autochips.carplay.common.f) message.obj);
                }
                return true;
            case CarplayMessage.IAP2_OVER_USB_CONNECTING /* 1290 */:
                this.uD.sendMessageDelayed(CarplayMessage.IAP2_CONNECT_TIMEOUT, 10000L);
                return true;
            case CarplayMessage.IAP2_OVER_USB_CONNECTED /* 1291 */:
                this.uD.removeMessages(CarplayMessage.IAP2_CONNECT_TIMEOUT);
                this.uD.transitionTo(this.uD.uq);
                this.uD.sendMessageDelayed(CarplayMessage.CARPLAY_SESSION_CONNECT_TIMEOUT, 10000L);
                return true;
            case CarplayMessage.IAP2_OVER_USB_DISCONNECTED /* 1293 */:
                this.uD.removeMessages(CarplayMessage.IAP2_CONNECT_TIMEOUT);
                return true;
            case CarplayMessage.IAP2_OVER_USB_CONNECT_FAIL /* 1294 */:
            case CarplayMessage.IAP2_OVER_BLUETOOTH_CONNECT_FAIL /* 1304 */:
                p.al(4);
                return true;
            case CarplayMessage.IAP2_OVER_BLUETOOTH_CONNECTED /* 1301 */:
                pVar = this.uD;
                iState = this.uD.ur;
                pVar.transitionTo(iState);
                return true;
            case CarplayMessage.IAP2_CONNECT_TIMEOUT /* 1320 */:
                p.al(3);
                return true;
            case CarplayMessage.CARPLAY_SESSION_CONNECTED /* 1802 */:
                Log.w(p.TAG, "iap not connected");
                this.uD.removeMessages(CarplayMessage.IAP2_CONNECT_TIMEOUT);
                p.a(this.uD, (CarplayDevice) message.obj);
                this.uD.ta.a(this.uD.tu.a((CarplayDevice) message.obj), 1);
                pVar = this.uD;
                iState = this.uD.us;
                pVar.transitionTo(iState);
                return true;
            case CarplayMessage.CARPLAY_SESSION_FAILED /* 1804 */:
                p.al(message.arg1);
                return true;
            default:
                B("Unhandled message - " + CarplayMessage.messageString(message.what));
                return false;
        }
    }
}
