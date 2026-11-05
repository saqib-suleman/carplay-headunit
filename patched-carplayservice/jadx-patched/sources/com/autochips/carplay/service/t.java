package com.autochips.carplay.service;

import android.os.Message;
import android.util.Log;
import com.android.internal.util.IState;
import com.autochips.carplay.CarplayCall;
import com.autochips.carplay.CarplayDevice;
import com.autochips.carplay.common.CarplayMessage;

/* JADX INFO: loaded from: classes.dex */
public final class t extends q {
    final /* synthetic */ p uD;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public t(p pVar) {
        super(pVar, (byte) 0);
        this.uD = pVar;
    }

    @Override // com.autochips.carplay.service.q
    public final void enter() {
        super.enter();
        p.a(this.uD, 3);
        boolean z = true;
        if (this.uD.uq == this.uD.uy || this.uD.up == this.uD.uy) {
            this.uD.transitionTo(this.uD.ut);
        } else if (this.uD.ur != this.uD.uy) {
            z = false;
        }
        if (z) {
            this.uD.sZ.a(this.uD.ec(), 2);
        }
    }

    @Override // com.autochips.carplay.service.q
    public final void exit() {
        super.exit();
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    public final synchronized boolean processMessage(Message message) {
        String str;
        String str2;
        CarplayDevice carplayDeviceEc;
        p pVar;
        IState iState;
        if (this.uD.ec() == null) {
            Log.e(p.TAG, "ERROR: mCurrentDevice is null in Connected");
            return false;
        }
        B("processMessage: " + CarplayMessage.messageString(message.what));
        switch (message.what) {
            case CarplayMessage.USER_START_VIDEO /* 259 */:
                if (this.uD.uB) {
                    str = p.TAG;
                    str2 = "ignore user_start_video";
                    Log.d(str, str2);
                } else {
                    this.uD.uB = true;
                    this.uD.uC = false;
                }
                return true;
            case CarplayMessage.USER_STOP_VIDEO /* 260 */:
                if (this.uD.uC) {
                    str = p.TAG;
                    str2 = "ignore user_stop_video";
                    Log.d(str, str2);
                } else {
                    this.uD.uC = true;
                    this.uD.uB = false;
                    if (message.arg1 == 286 && (carplayDeviceEc = this.uD.ec()) != null) {
                        ac.a(this.uD.sZ.getApplicationContext()).b(carplayDeviceEc.toString(), 0);
                    }
                }
                return true;
            case CarplayMessage.USER_SET_AUDIO_ENABLE /* 261 */:
            case CarplayMessage.USER_REQUEST_DEVICE_UI /* 262 */:
            case CarplayMessage.USER_UPDATE_TOUCH_SCREEN /* 276 */:
            case CarplayMessage.IAP2_OVER_USB_CONNECTED /* 1291 */:
            case CarplayMessage.IAP2_OVER_USB_DISCONNECTED /* 1293 */:
            case CarplayMessage.IAP2_OVER_BLUETOOTH_CONNECTED /* 1301 */:
            case CarplayMessage.IAP2_OVER_CARPLAY_DISCONNECTED /* 1313 */:
            case CarplayMessage.CARPLAY_SESSION_CONNECTED /* 1802 */:
                return true;
            case CarplayMessage.USER_CHANGE_MODE_REQUEST /* 266 */:
                this.uD.ta.b((com.autochips.carplay.common.f) message.obj);
                return true;
            case CarplayMessage.IAP2_OVER_BLUETOOTH_DISCONNECTED /* 1303 */:
                if (this.uD.ur == this.uD.uy) {
                    pVar = this.uD;
                    iState = this.uD.up;
                    pVar.transitionTo(iState);
                }
                return true;
            case CarplayMessage.IAP2_OVER_CARPLAY_CONNECTED /* 1311 */:
                if (this.uD.ur == this.uD.uy) {
                    pVar = this.uD;
                    iState = this.uD.uu;
                    pVar.transitionTo(iState);
                }
                return true;
            case CarplayMessage.IAP2_CALL_STATE_UPDATE /* 1330 */:
                synchronized (this.uD) {
                    p.a(this.uD, (CarplayCall) message.obj);
                    break;
                }
                return true;
            case CarplayMessage.CARPLAY_SESSION_DISCONNECTED /* 1803 */:
                CarplayDevice carplayDevice = (CarplayDevice) message.obj;
                if (this.uD.ec() == null || !this.uD.ec().equals(carplayDevice)) {
                    Log.e(p.TAG, "carplay session disconnect from unknown device: " + carplayDevice);
                } else {
                    if (this.uD.ur == this.uD.uy) {
                        pVar = this.uD;
                        iState = this.uD.ur;
                    } else if (this.uD.uv == this.uD.uy || this.uD.uu == this.uD.uy || this.uD.us == this.uD.uy) {
                        pVar = this.uD;
                        iState = this.uD.up;
                    }
                    pVar.transitionTo(iState);
                }
                return true;
            case CarplayMessage.CARPLAY_SESSION_FAILED /* 1804 */:
                int i = message.arg1;
                CarplayDevice carplayDevice2 = (CarplayDevice) message.obj;
                if (this.uD.ec() != null && this.uD.ec().equals(carplayDevice2)) {
                    p.al(i);
                }
                return true;
            default:
                B("Unhandled message - " + CarplayMessage.messageString(message.what));
                return false;
        }
    }
}
