package android.net.util;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

/* JADX INFO: loaded from: classes.dex */
final class d extends BroadcastReceiver {
    final /* synthetic */ c gu;

    d(c cVar) {
        this.gu = cVar;
    }

    @Override // android.content.BroadcastReceiver
    public final void onReceive(Context context, Intent intent) {
        this.gu.reevaluate();
    }
}
