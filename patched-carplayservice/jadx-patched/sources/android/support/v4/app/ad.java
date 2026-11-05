package android.support.v4.app;

import android.view.animation.Animation;

/* JADX INFO: loaded from: classes.dex */
class ad implements Animation.AnimationListener {
    private final Animation.AnimationListener iP;

    private ad(Animation.AnimationListener animationListener) {
        this.iP = animationListener;
    }

    /* synthetic */ ad(Animation.AnimationListener animationListener, byte b) {
        this(animationListener);
    }

    @Override // android.view.animation.Animation.AnimationListener
    public void onAnimationEnd(Animation animation) {
        if (this.iP != null) {
            this.iP.onAnimationEnd(animation);
        }
    }

    @Override // android.view.animation.Animation.AnimationListener
    public void onAnimationRepeat(Animation animation) {
        if (this.iP != null) {
            this.iP.onAnimationRepeat(animation);
        }
    }

    @Override // android.view.animation.Animation.AnimationListener
    public void onAnimationStart(Animation animation) {
        if (this.iP != null) {
            this.iP.onAnimationStart(animation);
        }
    }
}
