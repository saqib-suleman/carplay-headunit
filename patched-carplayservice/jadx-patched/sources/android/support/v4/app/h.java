package android.support.v4.app;

/* JADX INFO: loaded from: classes.dex */
final class h implements Runnable {
    final /* synthetic */ Fragment ib;

    h(Fragment fragment) {
        this.ib = fragment;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.ib.bj();
    }
}
