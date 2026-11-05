package android.support.v4.app;

import android.view.View;

/* JADX INFO: loaded from: classes.dex */
final class y implements Runnable {
    final /* synthetic */ x iL;

    y(x xVar) {
        this.iL = xVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        if (this.iL.iK.bp() != null) {
            this.iL.iK.b((View) null);
            this.iL.iI.a(this.iL.iK, this.iL.iK.getStateAfterAnimating(), 0, 0, false);
        }
    }
}
