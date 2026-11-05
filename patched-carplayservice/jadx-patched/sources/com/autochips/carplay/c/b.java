package com.autochips.carplay.c;

import android.bluetooth.BluetoothDevice;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Slog;
import com.autochips.carplay.common.CarplayMessage;

/* JADX INFO: loaded from: classes.dex */
final class b extends BroadcastReceiver {
    final /* synthetic */ a vc;

    b(a aVar) {
        this.vc = aVar;
    }

    @Override // android.content.BroadcastReceiver
    public final void onReceive(Context context, Intent intent) {
        String action = intent.getAction();
        if (action.equals("android.bluetooth.headsetclient.profile.action.AG_CALL_CHANGED")) {
            Slog.d("CarplayBluetoothAdapter", "onCallStateChanged");
            com.autochips.carplay.service.h hVarDz = com.autochips.carplay.service.g.dx().dz();
            if (hVarDz != null) {
                hVarDz.sendMessage(CarplayMessage.ACCESSORY_CALL_STATE_CHANGED);
                return;
            }
            return;
        }
        if (action.equals("android.bluetooth.headsetclient.profile.action.AUDIO_STATE_CHANGED")) {
            int intExtra = intent.getIntExtra("android.bluetooth.profile.extra.STATE", 0);
            Slog.d("CarplayBluetoothAdapter", "onAudioStatusChanged, scoState: " + intExtra);
            com.autochips.carplay.service.h hVarDz2 = com.autochips.carplay.service.g.dx().dz();
            if (hVarDz2 != null) {
                hVarDz2.sendMessage(CarplayMessage.ACCESSORY_AUDIO_STATE_CHANGED, intExtra);
                return;
            }
            return;
        }
        if (action.equals("android.bluetooth.adapter.action.STATE_CHANGED")) {
            int intExtra2 = intent.getIntExtra("android.bluetooth.adapter.extra.STATE", Integer.MIN_VALUE);
            a aVar = this.vc;
            if (intExtra2 == 10) {
                aVar.sendMessage(aVar.obtainMessage(CarplayMessage.BLUETOOTH_STOPPED));
                return;
            } else {
                if (intExtra2 != 12) {
                    return;
                }
                aVar.sendMessage(aVar.obtainMessage(CarplayMessage.BLUETOOTH_STARTED));
                return;
            }
        }
        if (action.equals("android.bluetooth.headsetclient.profile.action.CONNECTION_STATE_CHANGED")) {
            int intExtra3 = intent.getIntExtra("android.bluetooth.profile.extra.STATE", -1);
            BluetoothDevice bluetoothDevice = (BluetoothDevice) intent.getExtra("android.bluetooth.device.extra.DEVICE");
            com.autochips.carplay.service.h hVarDz3 = com.autochips.carplay.service.g.dx().dz();
            if (hVarDz3 != null) {
                hVarDz3.sendMessage(CarplayMessage.BLUETOOTH_PROFILE_STATE_CHANGED, 16, intExtra3, bluetoothDevice);
            }
        }
    }
}
