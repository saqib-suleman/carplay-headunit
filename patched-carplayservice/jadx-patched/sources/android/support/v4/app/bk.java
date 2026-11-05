package android.support.v4.app;

import android.view.View;
import android.view.ViewTreeObserver;

/* JADX INFO: loaded from: classes.dex */
final class bk implements View.OnAttachStateChangeListener, ViewTreeObserver.OnPreDrawListener {
    private final Runnable mRunnable;
    private final View mView;
    private ViewTreeObserver mViewTreeObserver;

    private bk(View view, Runnable runnable) {
        this.mView = view;
        this.mViewTreeObserver = view.getViewTreeObserver();
        this.mRunnable = runnable;
    }

    public static bk a(View view, Runnable runnable) {
        bk bkVar = new bk(view, runnable);
        view.getViewTreeObserver().addOnPreDrawListener(bkVar);
        view.addOnAttachStateChangeListener(bkVar);
        return bkVar;
    }

    private void removeListener() {
        (this.mViewTreeObserver.isAlive() ? this.mViewTreeObserver : this.mView.getViewTreeObserver()).removeOnPreDrawListener(this);
        this.mView.removeOnAttachStateChangeListener(this);
    }

    @Override // android.view.ViewTreeObserver.OnPreDrawListener
    public final boolean onPreDraw() {
        removeListener();
        this.mRunnable.run();
        return true;
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewAttachedToWindow(View view) {
        this.mViewTreeObserver = view.getViewTreeObserver();
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewDetachedFromWindow(View view) {
        removeListener();
    }
}
