package android.support.v4.app;

/* JADX INFO: loaded from: classes.dex */
final class ac implements Runnable {
    final /* synthetic */ ab iO;

    ac(ab abVar) {
        this.iO = abVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.iO.mView.setLayerType(0, null);
    }
}
