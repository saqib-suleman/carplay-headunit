package com.autochips.carplay.service;

import android.util.Log;
import com.autochips.carplay.common.CarplayMessage;

/* JADX INFO: loaded from: classes.dex */
public final class ad {
    private static final String[] uM = {"Last Resort Watchdog", "Hal Crash", "Usbdaemon Crash", "Connect Timeout", "Connect Fail", "Client Death"};
    private final a tm;

    public ad(a aVar) {
        this.tm = aVar;
    }

    public final void an(int i) {
        if (i == 0) {
            Log.e("CarplaySelfRecovery", "Invalid trigger reason. Ignoring...");
            return;
        }
        Log.e("CarplaySelfRecovery", "Triggering recovery for reason: " + i);
        this.tm.sendMessage(CarplayMessage.USER_TURN_OFF);
    }
}
