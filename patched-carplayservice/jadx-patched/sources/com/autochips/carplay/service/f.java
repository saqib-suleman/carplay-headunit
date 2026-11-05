package com.autochips.carplay.service;

import android.os.Message;
import android.util.Log;
import com.autochips.carplay.common.CarplayMessage;

/* JADX INFO: loaded from: classes.dex */
final class f extends b {
    final /* synthetic */ a ti;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    private f(a aVar) {
        super(aVar, (byte) 0);
        this.ti = aVar;
    }

    /* synthetic */ f(a aVar, byte b) {
        this(aVar);
    }

    private boolean dw() {
        i iVar = this.ti.ta;
        int unused = this.ti.tg;
        boolean zDN = iVar.dN();
        if (zDN) {
            this.ti.sendMessageDelayed(CarplayMessage.IAP2_START_TIMEOUT, 2000L);
        }
        return zDN;
    }

    @Override // com.autochips.carplay.service.b
    final int dt() {
        return 1;
    }

    @Override // com.autochips.carplay.service.b
    public final void enter() {
        super.enter();
        boolean zAd = this.ti.ta.ad(this.ti.tg);
        if (zAd) {
            this.ti.sendMessageDelayed(CarplayMessage.USB_NCM_START_TIMEOUT, 1000L);
        }
        if (zAd) {
            return;
        }
        Log.w(a.TAG, "enableUsbNcm fail");
        a.a(this.ti, this.ti.obtainMessage(CarplayMessage.USB_NCM_START_FAILURE));
    }

    public final void exit() {
        super.exit();
    }

    public final boolean processMessage(Message message) {
        a aVar;
        a aVar2;
        B(CarplayMessage.messageString(message.what));
        int i = message.what;
        int i2 = CarplayMessage.IAP2_START_FAILURE;
        switch (i) {
            case CarplayMessage.USB_NCM_STARTED /* 513 */:
                this.ti.removeMessages(CarplayMessage.USB_NCM_START_TIMEOUT);
                if (a.th) {
                    i iVar = this.ti.ta;
                    int unused = this.ti.tg;
                    boolean zDJ = iVar.dJ();
                    if (zDJ) {
                        this.ti.sendMessageDelayed(CarplayMessage.BLUETOOTH_START_TIMEOUT, 9000L);
                    }
                    if (!zDJ) {
                        aVar = this.ti;
                        aVar2 = this.ti;
                        i2 = CarplayMessage.BLUETOOTH_START_FAILURE;
                    }
                    a.a(aVar, aVar2.obtainMessage(i2));
                    return true;
                }
                if (a.th || dw()) {
                    return true;
                }
                aVar = this.ti;
                aVar2 = this.ti;
                a.a(aVar, aVar2.obtainMessage(i2));
                return true;
            case CarplayMessage.USB_NCM_START_TIMEOUT /* 517 */:
            case CarplayMessage.BLUETOOTH_START_TIMEOUT /* 773 */:
            case CarplayMessage.WIFI_AP_START_TIMEOUT /* 1029 */:
            case CarplayMessage.IAP2_START_TIMEOUT /* 1285 */:
            case CarplayMessage.NSD_START_TIMEOUT /* 1541 */:
            case CarplayMessage.CARPLAY_PLUGIN_START_TIMEOUT /* 1797 */:
                C(CarplayMessage.messageString(message.what));
                a.a(this.ti, message);
                return true;
            case CarplayMessage.BLUETOOTH_STARTED /* 769 */:
                this.ti.removeMessages(CarplayMessage.BLUETOOTH_START_TIMEOUT);
                if (!a.th) {
                    return true;
                }
                i iVar2 = this.ti.ta;
                int unused2 = this.ti.tg;
                boolean zDL = iVar2.dL();
                if (zDL) {
                    this.ti.sendMessageDelayed(CarplayMessage.WIFI_AP_START_TIMEOUT, 5000L);
                }
                if (zDL) {
                    return true;
                }
                aVar = this.ti;
                aVar2 = this.ti;
                i2 = CarplayMessage.WIFI_AP_START_FAILURE;
                a.a(aVar, aVar2.obtainMessage(i2));
                return true;
            case CarplayMessage.WIFI_AP_STARTED /* 1025 */:
                this.ti.removeMessages(CarplayMessage.WIFI_AP_START_TIMEOUT);
                if (dw()) {
                    return true;
                }
                aVar = this.ti;
                aVar2 = this.ti;
                a.a(aVar, aVar2.obtainMessage(i2));
                return true;
            case CarplayMessage.IAP2_STARTED /* 1281 */:
                this.ti.removeMessages(CarplayMessage.IAP2_START_TIMEOUT);
                i iVar3 = this.ti.ta;
                int unused3 = this.ti.tg;
                boolean zDR = iVar3.dR();
                if (zDR) {
                    this.ti.sendMessageDelayed(CarplayMessage.NSD_START_TIMEOUT, 2000L);
                }
                if (zDR) {
                    return true;
                }
                aVar = this.ti;
                aVar2 = this.ti;
                i2 = CarplayMessage.NSD_START_FAILURE;
                a.a(aVar, aVar2.obtainMessage(i2));
                return true;
            case CarplayMessage.NSD_STARTED /* 1537 */:
                this.ti.removeMessages(CarplayMessage.NSD_START_TIMEOUT);
                if (this.ti.ta.dH()) {
                    i iVar4 = this.ti.ta;
                    int unused4 = this.ti.tg;
                    boolean zDP = iVar4.dP();
                    if (zDP) {
                        this.ti.sendMessageDelayed(CarplayMessage.CARPLAY_PLUGIN_START_TIMEOUT, 10000L);
                    }
                    if (zDP) {
                        return true;
                    }
                    aVar = this.ti;
                    aVar2 = this.ti;
                    i2 = CarplayMessage.CARPLAY_PLUGIN_START_FAILURE;
                    a.a(aVar, aVar2.obtainMessage(i2));
                    return true;
                }
                this.ti.transitionTo(this.ti.td);
                return true;
            case CarplayMessage.CARPLAY_PLUGIN_STARTED /* 1793 */:
                this.ti.removeMessages(CarplayMessage.CARPLAY_PLUGIN_START_TIMEOUT);
                this.ti.transitionTo(this.ti.td);
                return true;
            default:
                B("Unhandled message - " + CarplayMessage.messageString(message.what));
                return false;
        }
    }
}
