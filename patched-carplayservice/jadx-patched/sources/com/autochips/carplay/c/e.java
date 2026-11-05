package com.autochips.carplay.c;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.IntentFilter;
import android.net.ConnectivityManager;
import android.net.wifi.WifiManager;
import android.os.Looper;
import android.os.Message;
import android.util.Slog;
import com.autochips.carplay.common.CarplayMessage;

/* JADX INFO: loaded from: classes.dex */
public class e extends com.autochips.carplay.common.a {
    private final Context mContext;
    BroadcastReceiver mReceiver;
    private int qW;
    private boolean uS;
    private final ConnectivityManager vd;
    private final WifiManager ve;
    i vf;
    ConnectivityManager.OnStartTetheringCallback vg;

    public e(Context context, Looper looper) {
        super(looper);
        this.uS = false;
        this.qW = 0;
        this.mContext = context;
        this.vd = (ConnectivityManager) context.getSystemService("connectivity");
        this.ve = (WifiManager) context.getSystemService("wifi");
        this.vf = new i(this.ve, new f(this));
        this.vg = new g(this);
        this.mReceiver = new h(this);
        this.mContext.registerReceiver(this.mReceiver, new IntentFilter("android.net.wifi.WIFI_AP_STATE_CHANGED"));
    }

    private int ep() {
        int i = this.qW;
        this.qW = i + 1;
        return i < 6 ? sendMessageDelayed(obtainMessage(3), 1000L) : false ? 0 : -1;
    }

    public final void cleanup() {
        this.mContext.unregisterReceiver(this.mReceiver);
        if (this.vf != null) {
            this.vf = null;
        }
        if (this.vg != null) {
            this.vg = null;
        }
    }

    @Override // android.os.Handler
    public void handleMessage(Message message) {
        Slog.d("CarplayWifiHotspotAdapter", "handleMessage, what:" + message.what);
        int i = message.what;
        switch (i) {
            case 1:
            case 3:
                int wifiApState = this.ve.getWifiApState();
                Slog.d("CarplayWifiHotspotAdapter", "enableWifiHotspot, currentAPState=" + wifiApState);
                if (13 == wifiApState) {
                    sendMessage(obtainMessage(CarplayMessage.WIFI_AP_STARTED));
                } else {
                    this.vd.startTethering(0, true, this.vg, getMain());
                    this.uS = true;
                }
                break;
            case 2:
                removeMessages(3);
                if (this.uS) {
                    int wifiApState2 = this.ve.getWifiApState();
                    Slog.d("CarplayWifiHotspotAdapter", "disableWifiHotspot, currentAPState=" + wifiApState2);
                    if (11 != wifiApState2) {
                        this.vd.stopTethering(0);
                    } else {
                        sendMessage(obtainMessage(CarplayMessage.WIFI_AP_STOPPED));
                    }
                }
                this.uS = false;
                break;
            default:
                switch (i) {
                    case CarplayMessage.WIFI_AP_STARTED /* 1025 */:
                        if (this.qW != 0) {
                            Slog.w("CarplayWifiHotspotAdapter", "wifi hotspot is recovered from error");
                            this.qW = 0;
                        }
                        V(message.what);
                        break;
                    case CarplayMessage.WIFI_AP_STOPPED /* 1026 */:
                        if (!this.uS || ep() != 0) {
                            V(CarplayMessage.WIFI_AP_STOPPED);
                        }
                        break;
                    case CarplayMessage.WIFI_AP_START_FAILURE /* 1027 */:
                        if (ep() != 0) {
                            V(message.what);
                        }
                        break;
                    default:
                        Slog.d("CarplayWifiHotspotAdapter", "ignoring msg=" + message);
                        break;
                }
                break;
        }
    }
}
