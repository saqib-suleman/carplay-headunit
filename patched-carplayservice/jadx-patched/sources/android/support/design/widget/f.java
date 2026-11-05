package android.support.design.widget;

import android.view.ViewTreeObserver;

/* JADX INFO: loaded from: classes.dex */
final class f implements ViewTreeObserver.OnPreDrawListener {
    final /* synthetic */ CoordinatorLayout hl;

    f(CoordinatorLayout coordinatorLayout) {
        this.hl = coordinatorLayout;
    }

    @Override // android.view.ViewTreeObserver.OnPreDrawListener
    public final boolean onPreDraw() {
        this.hl.n(0);
        return true;
    }
}
