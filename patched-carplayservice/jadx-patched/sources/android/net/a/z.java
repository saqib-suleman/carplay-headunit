package android.net.a;

import android.os.PowerManager;

/* JADX INFO: loaded from: classes.dex */
final class z implements y {
    final /* synthetic */ PowerManager.WakeLock fE;

    z(PowerManager.WakeLock wakeLock) {
        this.fE = wakeLock;
    }

    @Override // android.net.a.y
    public final void ao() {
        this.fE.acquire(3500L);
    }
}
