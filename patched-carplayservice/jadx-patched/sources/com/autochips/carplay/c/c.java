package com.autochips.carplay.c;

import android.telephony.PhoneStateListener;
import android.util.Slog;
import com.autochips.carplay.common.CarplayMessage;

/* JADX INFO: loaded from: classes.dex */
final class c extends PhoneStateListener {
    final /* synthetic */ a vc;

    c(a aVar) {
        this.vc = aVar;
    }

    @Override // android.telephony.PhoneStateListener
    public final void onCallStateChanged(int i, String str) {
        Slog.d("CarplayBluetoothAdapter", "PhoneStateListener.onCallStateChanged: state=" + i + ", phoneNumber=" + str);
        com.autochips.carplay.service.h hVarDz = com.autochips.carplay.service.g.dx().dz();
        if (hVarDz != null) {
            hVarDz.sendMessage(CarplayMessage.ACCESSORY_CALL_STATE_CHANGED, 1);
        }
    }
}
