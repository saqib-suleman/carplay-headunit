package com.autochips.carplay.a;

import android.os.RemoteException;
import android.util.Log;
import vendor.autochips.hardware.iap.V1_0.IAPDev;

/* JADX INFO: loaded from: classes.dex */
final class d implements h {
    final /* synthetic */ a rc;

    private d(a aVar) {
        this.rc = aVar;
    }

    /* synthetic */ d(a aVar, byte b) {
        this(aVar);
    }

    @Override // com.autochips.carplay.a.h
    public final void a(String str, String str2) {
        if (a.a(this.rc) == 0 && !str2.isEmpty()) {
            IAPDev iAPDev = new IAPDev();
            iAPDev.id = str2;
            iAPDev.clientType = 0;
            iAPDev.transportType = 0;
            try {
                this.rc.qV.updateLocationInfo(iAPDev, str);
            } catch (RemoteException e) {
                Log.e("CarplayIAP2Adapter", "", e);
            }
        }
    }
}
