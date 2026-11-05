package com.autochips.carplay.service;

import android.net.LinkAddress;
import android.net.RouteInfo;
import android.util.Log;
import com.android.server.net.BaseNetworkObserver;
import com.autochips.carplay.common.CarplayMessage;

/* JADX INFO: loaded from: classes.dex */
final class l extends BaseNetworkObserver {
    final /* synthetic */ i tU;

    private l(i iVar) {
        this.tU = iVar;
    }

    /* synthetic */ l(i iVar, byte b) {
        this(iVar);
    }

    public final void addressRemoved(String str, LinkAddress linkAddress) {
        Log.d("CarplayNative", "addressRemoved, iface=" + str + ", address=" + linkAddress);
    }

    public final void addressUpdated(String str, LinkAddress linkAddress) {
        Log.d("CarplayNative", "addressUpdated, iface=" + str + ", address=" + linkAddress);
    }

    public final void interfaceAdded(String str) {
        Log.d("CarplayNative", "interfaceAdded, iface=" + str);
        synchronized (this.tU.mLock) {
            j jVarA = k.a(this.tU.tO, str);
            if (jVarA != null) {
                jVarA.tR = true;
                this.tU.mCarplayMonitor.sendMessage(CarplayMessage.NET_IFACE_ADD, str);
            } else {
                if (this.tU.tP) {
                    Log.v("CarplayNative", "Received iface add notification on an invalid iface=" + str);
                }
            }
        }
    }

    public final void interfaceLinkStateChanged(String str, boolean z) {
        Log.d("CarplayNative", "interfaceLinkStateChanged, iface=" + str + ", up=" + z);
        synchronized (this.tU.mLock) {
            j jVarA = k.a(this.tU.tO, str);
            if (jVarA != null) {
                i.a(this.tU, jVarA, this.tU.D(str));
                this.tU.mCarplayMonitor.sendMessage(CarplayMessage.NET_IFACE_LINK_STATE_CHANGED, str);
            } else {
                if (this.tU.tP) {
                    Log.v("CarplayNative", "Received iface link up/down notification on an invalid iface=" + str);
                }
            }
        }
    }

    public final void interfaceRemoved(String str) {
        Log.d("CarplayNative", "interfaceRemoved, iface=" + str);
        synchronized (this.tU.mLock) {
            j jVarA = k.a(this.tU.tO, str);
            if (jVarA != null) {
                jVarA.tR = false;
                this.tU.mCarplayMonitor.sendMessage(CarplayMessage.NET_IFACE_REMOVE, str);
            } else {
                if (this.tU.tP) {
                    Log.v("CarplayNative", "Received iface remove notification on an invalid iface=" + str);
                }
            }
        }
    }

    public final void routeRemoved(RouteInfo routeInfo) {
        Log.d("CarplayNative", "routeRemoved, route=" + routeInfo);
    }

    public final void routeUpdated(RouteInfo routeInfo) {
        Log.d("CarplayNative", "routeUpdated, route=" + routeInfo);
    }
}
