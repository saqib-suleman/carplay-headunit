package android.support.v4.widget;

import android.view.View;

/* JADX INFO: loaded from: classes.dex */
final class h implements Runnable {
    final View pG;
    final /* synthetic */ SlidingPaneLayout pH;

    h(SlidingPaneLayout slidingPaneLayout, View view) {
        this.pH = slidingPaneLayout;
        this.pG = view;
    }

    @Override // java.lang.Runnable
    public final void run() {
        if (this.pG.getParent() == this.pH) {
            this.pG.setLayerType(0, null);
            this.pH.F(this.pG);
        }
        this.pH.pC.remove(this);
    }
}
