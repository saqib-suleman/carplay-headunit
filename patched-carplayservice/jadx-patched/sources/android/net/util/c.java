package android.net.util;

import android.R;
import android.content.BroadcastReceiver;
import android.content.ContentResolver;
import android.content.Context;
import android.content.IntentFilter;
import android.net.Uri;
import android.os.Handler;
import android.os.UserHandle;
import android.provider.Settings;
import com.android.internal.annotations.VisibleForTesting;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class c {
    private static String TAG = c.class.getSimpleName();
    private final Runnable gn;
    private final ContentResolver gp;
    private volatile int gt;
    private final Context mContext;
    private final Handler mHandler;
    private volatile boolean gs = true;
    private final List go = Arrays.asList(Settings.Global.getUriFor("network_avoid_bad_wifi"), Settings.Global.getUriFor("network_metered_multipath_preference"));
    private final e gq = new e(this);
    private final BroadcastReceiver gr = new d(this);

    public c(Context context, Handler handler, final Runnable runnable) {
        this.mContext = context;
        this.mHandler = handler;
        this.gn = new Runnable() { // from class: android.net.util.-$$Lambda$c$pf5lAh682b8zL7WCiMaKMpWCRjc
            @Override // java.lang.Runnable
            public final void run() {
                this.f$0.c(runnable);
            }
        };
        this.gp = this.mContext.getContentResolver();
        az();
        aA();
    }

    private void aA() {
        try {
            this.gt = Integer.parseInt(Settings.Global.getString(this.gp, "network_metered_multipath_preference"));
        } catch (NumberFormatException e) {
            this.gt = this.mContext.getResources().getInteger(R.integer.config_defaultUiModeType);
        }
    }

    /* JADX WARN: Code duplicated, block: B:11:0x002b  */
    private boolean az() {
        boolean z;
        boolean zEquals = "1".equals(Settings.Global.getString(this.gp, "network_avoid_bad_wifi"));
        boolean z2 = this.gs;
        if (zEquals) {
            z = true;
        } else {
            if (this.mContext.getResources().getInteger(R.integer.config_defaultRefreshRateInZone) == 0) {
                z = false;
            } else {
                z = true;
            }
        }
        this.gs = z;
        return this.gs != z2;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void c(Runnable runnable) {
        if (az() && runnable != null) {
            runnable.run();
        }
        aA();
    }

    public final boolean ay() {
        return this.gs;
    }

    @VisibleForTesting
    public void reevaluate() {
        this.mHandler.post(this.gn);
    }

    public final void shutdown() {
        this.gp.unregisterContentObserver(this.gq);
        this.mContext.unregisterReceiver(this.gr);
    }

    public final void start() {
        Iterator it = this.go.iterator();
        while (it.hasNext()) {
            this.gp.registerContentObserver((Uri) it.next(), false, this.gq);
        }
        IntentFilter intentFilter = new IntentFilter();
        intentFilter.addAction("android.intent.action.CONFIGURATION_CHANGED");
        this.mContext.registerReceiverAsUser(this.gr, UserHandle.ALL, intentFilter, null, null);
        reevaluate();
    }
}
