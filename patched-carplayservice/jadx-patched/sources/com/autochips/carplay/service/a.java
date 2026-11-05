package com.autochips.carplay.service;

import android.os.Message;
import android.os.SystemProperties;
import android.util.Log;
import com.android.internal.util.StateMachine;
import com.autochips.carplay.common.CarplayMessage;

/* JADX INFO: loaded from: classes.dex */
public final class a extends StateMachine {
    private static final String TAG = a.class.getSimpleName();
    private static final boolean th;
    private h mCarplayMonitor;
    private CarplayService sZ;
    private i ta;
    private f tb;
    private e tc;
    private d td;
    private c te;
    private int tf;
    private int tg;

    static {
        th = 1 == SystemProperties.getInt("persist.carplay.wireless.enable", 0);
    }

    private a(CarplayService carplayService) {
        super(TAG);
        byte b = 0;
        this.tb = new f(this, b);
        this.tc = new e(this, b);
        this.td = new d(this, b);
        this.te = new c(this, b);
        this.tf = 0;
        this.tg = 0;
        addState(this.td);
        addState(this.te);
        addState(this.tb);
        addState(this.tc);
        this.sZ = carplayService;
        setInitialState(this.te);
    }

    public static a a(CarplayService carplayService) {
        Log.d(TAG, "make() - Creating CarplayEnableStateMachine");
        return new a(carplayService);
    }

    static /* synthetic */ void a(a aVar, Message message) {
        aVar.deferMessage(message);
        aVar.transitionTo(aVar.tc);
    }

    public final void a(i iVar, h hVar) {
        this.ta = iVar;
        this.mCarplayMonitor = hVar;
        Log.d(TAG, "registerForMonitorEvents");
        this.mCarplayMonitor.a(CarplayMessage.USB_NCM_STARTED, getHandler());
        this.mCarplayMonitor.a(CarplayMessage.USB_NCM_STOPPED, getHandler());
        this.mCarplayMonitor.a(CarplayMessage.USB_NCM_START_FAILURE, getHandler());
        this.mCarplayMonitor.a(CarplayMessage.USB_NCM_STOP_FAILURE, getHandler());
        this.mCarplayMonitor.a(CarplayMessage.BLUETOOTH_STARTED, getHandler());
        this.mCarplayMonitor.a(CarplayMessage.BLUETOOTH_STOPPED, getHandler());
        this.mCarplayMonitor.a(CarplayMessage.BLUETOOTH_START_FAILURE, getHandler());
        this.mCarplayMonitor.a(CarplayMessage.BLUETOOTH_STOP_FAILURE, getHandler());
        this.mCarplayMonitor.a(CarplayMessage.WIFI_AP_STARTED, getHandler());
        this.mCarplayMonitor.a(CarplayMessage.WIFI_AP_STOPPED, getHandler());
        this.mCarplayMonitor.a(CarplayMessage.WIFI_AP_START_FAILURE, getHandler());
        this.mCarplayMonitor.a(CarplayMessage.WIFI_AP_STOP_FAILURE, getHandler());
        this.mCarplayMonitor.a(CarplayMessage.IAP2_STARTED, getHandler());
        this.mCarplayMonitor.a(CarplayMessage.IAP2_STOPPED, getHandler());
        this.mCarplayMonitor.a(CarplayMessage.IAP2_START_FAILURE, getHandler());
        this.mCarplayMonitor.a(CarplayMessage.IAP2_STOP_FAILURE, getHandler());
        this.mCarplayMonitor.a(CarplayMessage.CARPLAY_PLUGIN_STARTED, getHandler());
        this.mCarplayMonitor.a(CarplayMessage.CARPLAY_PLUGIN_STOPPED, getHandler());
        this.mCarplayMonitor.a(CarplayMessage.CARPLAY_PLUGIN_START_FAILURE, getHandler());
        this.mCarplayMonitor.a(CarplayMessage.CARPLAY_PLUGIN_STOP_FAILURE, getHandler());
        this.mCarplayMonitor.a(CarplayMessage.NSD_STARTED, getHandler());
        this.mCarplayMonitor.a(CarplayMessage.NSD_STOPPED, getHandler());
        this.mCarplayMonitor.a(CarplayMessage.NSD_START_FAILURE, getHandler());
        this.mCarplayMonitor.a(CarplayMessage.NSD_STOP_FAILURE, getHandler());
        this.mCarplayMonitor.a(CarplayMessage.NET_IFACE_ADD, getHandler());
        this.mCarplayMonitor.a(CarplayMessage.NET_IFACE_REMOVE, getHandler());
        this.mCarplayMonitor.a(CarplayMessage.NET_IFACE_LINK_STATE_CHANGED, getHandler());
    }

    public final synchronized int getEnableState() {
        int i;
        c currentState = getCurrentState();
        i = 0;
        if (currentState != this.te) {
            if (currentState == this.tb) {
                i = 1;
            } else if (currentState == this.td) {
                i = 2;
            } else if (currentState == this.tc) {
                i = 3;
            }
        }
        return i;
    }

    protected final String getLogRecString(Message message) {
        return CarplayMessage.messageString(message.what);
    }

    protected final void onQuitting() {
        if (this.mCarplayMonitor != null) {
            this.mCarplayMonitor = null;
        }
        if (this.ta != null) {
            this.ta = null;
        }
        if (this.sZ != null) {
            this.sZ = null;
        }
    }
}
