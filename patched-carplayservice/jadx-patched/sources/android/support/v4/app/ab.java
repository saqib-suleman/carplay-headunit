package android.support.v4.app;

import android.os.Build;
import android.view.View;
import android.view.animation.Animation;

/* JADX INFO: loaded from: classes.dex */
final class ab extends ad {
    View mView;

    ab(View view, Animation.AnimationListener animationListener) {
        super(animationListener, (byte) 0);
        this.mView = view;
    }

    @Override // android.support.v4.app.ad, android.view.animation.Animation.AnimationListener
    public final void onAnimationEnd(Animation animation) {
        if (android.support.v4.view.n.p(this.mView) || Build.VERSION.SDK_INT >= 24) {
            this.mView.post(new ac(this));
        } else {
            this.mView.setLayerType(0, null);
        }
        super.onAnimationEnd(animation);
    }
}
