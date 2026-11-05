package android.net.a;

import android.util.Log;
import com.android.server.net.NetlinkTracker;

/* JADX INFO: loaded from: classes.dex */
final class f extends NetlinkTracker {
    final /* synthetic */ d eX;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    f(d dVar, String str, NetlinkTracker.Callback callback) {
        super(str, callback);
        this.eX = dVar;
    }

    private void h(final String str) {
        Log.d(this.eX.mTag, str);
        this.eX.getHandler().post(new Runnable() { // from class: android.net.a.-$$Lambda$f$1dXYau8bUy8w2RRxh8ykG1LP_fw
            @Override // java.lang.Runnable
            public final void run() {
                this.f$0.i(str);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void i(String str) {
        this.eX.et.log("OBSERVED " + str);
    }

    public final void interfaceAdded(String str) {
        super.interfaceAdded(str);
        if (this.eX.eB.equals(str)) {
            this.eX.mCallback.d(false);
        } else if (!this.eX.eA.equals(str)) {
            return;
        }
        h("interfaceAdded(" + str + ")");
    }

    public final void interfaceRemoved(String str) {
        super.interfaceRemoved(str);
        if (this.eX.eB.equals(str)) {
            this.eX.mCallback.d(true);
        } else if (!this.eX.eA.equals(str)) {
            return;
        }
        h("interfaceRemoved(" + str + ")");
    }
}
