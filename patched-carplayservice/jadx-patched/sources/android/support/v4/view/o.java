package android.support.v4.view;

import android.view.View;
import android.view.WindowInsets;

/* JADX INFO: loaded from: classes.dex */
final class o implements View.OnApplyWindowInsetsListener {
    final /* synthetic */ l mY;

    o(l lVar) {
        this.mY = lVar;
    }

    @Override // android.view.View.OnApplyWindowInsetsListener
    public final WindowInsets onApplyWindowInsets(View view, WindowInsets windowInsets) {
        return (WindowInsets) x.c(this.mY.b(x.n(windowInsets)));
    }
}
