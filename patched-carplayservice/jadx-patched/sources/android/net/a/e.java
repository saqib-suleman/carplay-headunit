package android.net.a;

import com.android.server.net.NetlinkTracker;

/* JADX INFO: loaded from: classes.dex */
final class e implements NetlinkTracker.Callback {
    final /* synthetic */ d eX;

    e(d dVar) {
        this.eX = dVar;
    }

    public final void update() {
        this.eX.sendMessage(6);
    }
}
