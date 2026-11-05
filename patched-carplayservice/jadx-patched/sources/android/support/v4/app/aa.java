package android.support.v4.app;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.view.View;
import android.view.ViewGroup;

/* JADX INFO: loaded from: classes.dex */
final class aa extends AnimatorListenerAdapter {
    final /* synthetic */ v iI;
    final /* synthetic */ ViewGroup iJ;
    final /* synthetic */ Fragment iK;
    final /* synthetic */ View iN;

    aa(v vVar, ViewGroup viewGroup, View view, Fragment fragment) {
        this.iI = vVar;
        this.iJ = viewGroup;
        this.iN = view;
        this.iK = fragment;
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationEnd(Animator animator) {
        this.iJ.endViewTransition(this.iN);
        animator.removeListener(this);
        if (this.iK.mView != null) {
            this.iK.mView.setVisibility(8);
        }
    }
}
