package com.autochips.carplay.c;

import android.bluetooth.BluetoothA2dpSink;
import android.bluetooth.BluetoothAvrcpController;
import android.bluetooth.BluetoothHeadsetClient;
import android.bluetooth.BluetoothProfile;
import android.util.Slog;

/* JADX INFO: loaded from: classes.dex */
final class d implements BluetoothProfile.ServiceListener {
    final /* synthetic */ a vc;

    private d(a aVar) {
        this.vc = aVar;
    }

    /* synthetic */ d(a aVar, byte b) {
        this(aVar);
    }

    @Override // android.bluetooth.BluetoothProfile.ServiceListener
    public final void onServiceConnected(int i, BluetoothProfile bluetoothProfile) {
        Slog.d("CarplayBluetoothAdapter", "onServiceConnected, profile: " + i + ", proxy: " + bluetoothProfile);
        if (i == 16) {
            this.vc.uV = (BluetoothHeadsetClient) bluetoothProfile;
            return;
        }
        switch (i) {
            case 11:
                this.vc.uW = (BluetoothA2dpSink) bluetoothProfile;
                break;
            case 12:
                this.vc.uX = (BluetoothAvrcpController) bluetoothProfile;
                break;
        }
    }

    @Override // android.bluetooth.BluetoothProfile.ServiceListener
    public final void onServiceDisconnected(int i) {
        Slog.d("CarplayBluetoothAdapter", "onServiceDisconnected, profile: " + i);
        if (i == 16) {
            this.vc.uV = null;
            return;
        }
        switch (i) {
            case 11:
                this.vc.uW = null;
                break;
            case 12:
                this.vc.uX = null;
                break;
        }
    }
}
