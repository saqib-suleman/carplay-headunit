package com.autochips.carplay.c;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Slog;
import com.autochips.carplay.common.CarplayMessage;

/* JADX INFO: loaded from: classes.dex */
final class h extends BroadcastReceiver {
    final /* synthetic */ e vh;

    h(e eVar) {
        this.vh = eVar;
    }

    @Override // android.content.BroadcastReceiver
    public final void onReceive(Context context, Intent intent) {
        int i;
        if ("android.net.wifi.WIFI_AP_STATE_CHANGED".equals(intent.getAction())) {
            int intExtra = intent.getIntExtra("wifi_state", 11);
            int intExtra2 = intent.getIntExtra("wifi_ap_error_code", -1);
            String stringExtra = intent.getStringExtra("wifi_ap_interface_name");
            int intExtra3 = intent.getIntExtra("wifi_ap_mode", -1);
            e eVar = this.vh;
            Slog.d("CarplayWifiHotspotAdapter", "handleWifiApStateChanged, state=" + intExtra + ", reason=" + intExtra2 + ", ifaceName=" + stringExtra + ", mode=" + intExtra3);
            switch (intExtra) {
                case 10:
                    return;
                case 11:
                    i = CarplayMessage.WIFI_AP_STOPPED;
                    break;
                case 12:
                    return;
                case 13:
                    i = CarplayMessage.WIFI_AP_STARTED;
                    break;
                default:
                    eVar.sendMessage(eVar.obtainMessage(CarplayMessage.WIFI_AP_START_FAILURE));
                    return;
            }
            eVar.sendMessage(eVar.obtainMessage(i));
        }
    }
}
