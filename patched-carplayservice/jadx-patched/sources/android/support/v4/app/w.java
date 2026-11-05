package android.support.v4.app;

/* JADX INFO: loaded from: classes.dex */
final class w implements Runnable {
    final /* synthetic */ v iI;

    w(v vVar) {
        this.iI = vVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.iI.execPendingActions();
    }
}
