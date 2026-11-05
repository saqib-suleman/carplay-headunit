package android.support.v4.app;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.view.View;
import android.view.ViewGroup;

/* JADX INFO: loaded from: classes.dex */
final class z extends AnimatorListenerAdapter {
    final /* synthetic */ v iI;
    final /* synthetic */ ViewGroup iJ;
    final /* synthetic */ Fragment iK;
    final /* synthetic */ View iM;

    z(v vVar, ViewGroup viewGroup, View view, Fragment fragment) {
        this.iI = vVar;
        this.iJ = viewGroup;
        this.iM = view;
        this.iK = fragment;
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationEnd(Animator animator) {
        this.iJ.endViewTransition(this.iM);
        Animator animator2 = this.iK.getAnimator();
        this.iK.a((Animator) null);
        if (animator2 == null || this.iJ.indexOfChild(this.iM) >= 0) {
            return;
        }
        this.iI.a(this.iK, this.iK.getStateAfterAnimating(), 0, 0, false);
    }
}
