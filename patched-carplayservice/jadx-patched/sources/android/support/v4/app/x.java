package android.support.v4.app;

import android.view.ViewGroup;
import android.view.animation.Animation;

/* JADX INFO: loaded from: classes.dex */
final class x extends ad {
    final /* synthetic */ v iI;
    final /* synthetic */ ViewGroup iJ;
    final /* synthetic */ Fragment iK;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    x(v vVar, Animation.AnimationListener animationListener, ViewGroup viewGroup, Fragment fragment) {
        super(animationListener, (byte) 0);
        this.iI = vVar;
        this.iJ = viewGroup;
        this.iK = fragment;
    }

    @Override // android.support.v4.app.ad, android.view.animation.Animation.AnimationListener
    public final void onAnimationEnd(Animation animation) {
        super.onAnimationEnd(animation);
        this.iJ.post(new y(this));
    }
}
