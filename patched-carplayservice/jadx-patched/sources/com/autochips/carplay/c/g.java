package com.autochips.carplay.c;

import android.net.ConnectivityManager;
import android.util.Slog;
import com.autochips.carplay.common.CarplayMessage;

/* JADX INFO: loaded from: classes.dex */
final class g extends ConnectivityManager.OnStartTetheringCallback {
    final /* synthetic */ e vh;

    g(e eVar) {
        this.vh = eVar;
    }

    public final void onTetheringFailed() {
        super.onTetheringFailed();
        Slog.d("CarplayWifiHotspotAdapter", "onTetheringFailed");
        this.vh.sendMessage(this.vh.obtainMessage(CarplayMessage.WIFI_AP_START_FAILURE));
    }

    public final void onTetheringStarted() {
        super.onTetheringStarted();
        Slog.d("CarplayWifiHotspotAdapter", "onTetheringStarted");
    }
}
