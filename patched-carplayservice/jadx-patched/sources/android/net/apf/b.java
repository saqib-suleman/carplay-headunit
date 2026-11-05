package android.net.apf;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.PowerManager;

/* JADX INFO: loaded from: classes.dex */
final class b extends BroadcastReceiver {
    final /* synthetic */ ApfFilter aP;

    b(ApfFilter apfFilter) {
        this.aP = apfFilter;
    }

    @Override // android.content.BroadcastReceiver
    public final void onReceive(Context context, Intent intent) {
        if (intent.getAction().equals("android.os.action.DEVICE_IDLE_MODE_CHANGED")) {
            this.aP.setDozeMode(((PowerManager) context.getSystemService("power")).isDeviceIdleMode());
        }
    }
}
