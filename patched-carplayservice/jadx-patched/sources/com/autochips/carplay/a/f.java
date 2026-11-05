package com.autochips.carplay.a;

import android.location.Location;
import android.location.LocationListener;
import android.os.Bundle;
import android.util.Slog;

/* JADX INFO: loaded from: classes.dex */
final class f implements LocationListener {
    final /* synthetic */ e rM;

    private f(e eVar) {
        this.rM = eVar;
    }

    /* synthetic */ f(e eVar, byte b) {
        this(eVar);
    }

    @Override // android.location.LocationListener
    public final void onLocationChanged(Location location) {
    }

    @Override // android.location.LocationListener
    public final void onProviderDisabled(String str) {
    }

    @Override // android.location.LocationListener
    public final void onProviderEnabled(String str) {
    }

    @Override // android.location.LocationListener
    public final void onStatusChanged(String str, int i, Bundle bundle) {
        Slog.d("iAPLocation", "onStatusChanged Deprecated");
    }
}
