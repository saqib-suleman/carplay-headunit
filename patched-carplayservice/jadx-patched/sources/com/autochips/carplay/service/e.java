package com.autochips.carplay.service;

import android.os.Message;
import android.util.Log;
import com.autochips.carplay.common.CarplayMessage;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
final class e extends b {
    final /* synthetic */ a ti;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    private e(a aVar) {
        super(aVar, (byte) 0);
        this.ti = aVar;
    }

    /* synthetic */ e(a aVar, byte b) {
        this(aVar);
    }

    private boolean du() {
        boolean zAe = this.ti.ta.ae(this.ti.tg);
        if (zAe) {
            this.ti.sendMessageDelayed(CarplayMessage.USB_NCM_STOP_TIMEOUT, 1000L);
        }
        return zAe;
    }

    private boolean dv() {
        i iVar = this.ti.ta;
        int unused = this.ti.tg;
        boolean zDQ = iVar.dQ();
        if (zDQ) {
            this.ti.sendMessageDelayed(CarplayMessage.CARPLAY_PLUGIN_STOP_TIMEOUT, 4000L);
        }
        return zDQ;
    }

    @Override // com.autochips.carplay.service.b
    final int dt() {
        return 3;
    }

    @Override // com.autochips.carplay.service.b
    public final void enter() {
        boolean z;
        super.enter();
        List connectedDevices = this.ti.sZ.getConnectedDevices();
        Log.d(a.TAG, "isNeedDisconnectAdapter, connectionDevice: " + connectedDevices);
        if (connectedDevices == null || connectedDevices.size() == 0) {
            z = false;
        } else {
            this.ti.sendMessageDelayed(71, 2000L);
            du();
            z = true;
        }
        if (z) {
            B("step: waiting for device disconnect...");
        } else {
            dv();
        }
    }

    public final void exit() {
        super.exit();
    }

    public final boolean processMessage(Message message) {
        a aVar;
        int i;
        long j;
        B(CarplayMessage.messageString(message.what));
        switch (message.what) {
            case CarplayMessage.ALL_DEVICES_DISCONNECTED /* 70 */:
                this.ti.removeMessages(71);
            case CarplayMessage.ALL_DEVICES_DISCONNECTED_TIMEOUT /* 71 */:
                B(CarplayMessage.messageString(message.what));
                dv();
                return true;
            case CarplayMessage.USB_NCM_STOPPED /* 514 */:
                this.ti.removeMessages(CarplayMessage.USB_NCM_STOP_TIMEOUT);
                if (this.ti.hasMessages(71)) {
                    B("need to for other resource disable...");
                    return true;
                }
            case CarplayMessage.USB_NCM_START_FAILURE /* 515 */:
            case CarplayMessage.USB_NCM_START_TIMEOUT /* 517 */:
            case CarplayMessage.USB_NCM_STOP_TIMEOUT /* 518 */:
                B(CarplayMessage.messageString(message.what));
                this.ti.transitionTo(this.ti.te);
                return true;
            case CarplayMessage.BLUETOOTH_STOPPED /* 770 */:
                this.ti.removeMessages(CarplayMessage.BLUETOOTH_STOP_TIMEOUT);
            case CarplayMessage.BLUETOOTH_START_TIMEOUT /* 773 */:
            case CarplayMessage.BLUETOOTH_STOP_TIMEOUT /* 774 */:
                B(CarplayMessage.messageString(message.what));
                du();
                return true;
            case CarplayMessage.WIFI_AP_STOPPED /* 1026 */:
                this.ti.removeMessages(CarplayMessage.WIFI_AP_STOP_TIMEOUT);
            case CarplayMessage.WIFI_AP_START_TIMEOUT /* 1029 */:
            case CarplayMessage.WIFI_AP_STOP_TIMEOUT /* 1030 */:
                B(CarplayMessage.messageString(message.what));
                i iVar = this.ti.ta;
                int unused = this.ti.tg;
                if (!iVar.dK()) {
                    return true;
                }
                aVar = this.ti;
                i = CarplayMessage.BLUETOOTH_STOP_TIMEOUT;
                j = 5000;
                aVar.sendMessageDelayed(i, j);
                return true;
            case CarplayMessage.IAP2_STOPPED /* 1282 */:
                this.ti.removeMessages(CarplayMessage.IAP2_STOP_TIMEOUT);
            case CarplayMessage.IAP2_START_TIMEOUT /* 1285 */:
            case CarplayMessage.IAP2_STOP_TIMEOUT /* 1286 */:
                B(CarplayMessage.messageString(message.what));
                if (a.th) {
                    i iVar2 = this.ti.ta;
                    int unused2 = this.ti.tg;
                    if (!iVar2.dM()) {
                        return true;
                    }
                    aVar = this.ti;
                    i = CarplayMessage.WIFI_AP_STOP_TIMEOUT;
                    j = 3000;
                    aVar.sendMessageDelayed(i, j);
                    return true;
                }
                du();
                return true;
            case CarplayMessage.NSD_STOPPED /* 1538 */:
                this.ti.removeMessages(CarplayMessage.NSD_STOP_TIMEOUT);
            case CarplayMessage.NSD_START_TIMEOUT /* 1541 */:
            case CarplayMessage.NSD_STOP_TIMEOUT /* 1542 */:
                B(CarplayMessage.messageString(message.what));
                i iVar3 = this.ti.ta;
                int unused3 = this.ti.tg;
                if (!iVar3.dO()) {
                    return true;
                }
                aVar = this.ti;
                i = CarplayMessage.IAP2_STOP_TIMEOUT;
                j = 1000;
                aVar.sendMessageDelayed(i, j);
                return true;
            case CarplayMessage.CARPLAY_PLUGIN_STOPPED /* 1794 */:
                this.ti.removeMessages(CarplayMessage.CARPLAY_PLUGIN_STOP_TIMEOUT);
            case CarplayMessage.CARPLAY_PLUGIN_START_TIMEOUT /* 1797 */:
            case CarplayMessage.CARPLAY_PLUGIN_STOP_TIMEOUT /* 1798 */:
                B(CarplayMessage.messageString(message.what));
                i iVar4 = this.ti.ta;
                int unused4 = this.ti.tg;
                if (!iVar4.dS()) {
                    return true;
                }
                aVar = this.ti;
                i = CarplayMessage.NSD_STOP_TIMEOUT;
                j = 500;
                aVar.sendMessageDelayed(i, j);
                return true;
            default:
                B("Unhandled message - " + CarplayMessage.messageString(message.what));
                return false;
        }
    }
}
