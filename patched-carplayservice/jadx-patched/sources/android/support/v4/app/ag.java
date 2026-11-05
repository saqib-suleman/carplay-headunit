package android.support.v4.app;

import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Animation;
import android.view.animation.AnimationSet;
import android.view.animation.Transformation;

/* JADX INFO: loaded from: classes.dex */
final class ag extends AnimationSet implements Runnable {
    private final View iR;
    private boolean iS;
    private boolean mEnded;
    private final ViewGroup mParent;

    ag(Animation animation, ViewGroup viewGroup, View view) {
        super(false);
        this.mParent = viewGroup;
        this.iR = view;
        addAnimation(animation);
    }

    @Override // android.view.animation.AnimationSet, android.view.animation.Animation
    public final boolean getTransformation(long j, Transformation transformation) {
        if (this.mEnded) {
            return !this.iS;
        }
        if (!super.getTransformation(j, transformation)) {
            this.mEnded = true;
            bk.a(this.mParent, this);
        }
        return true;
    }

    @Override // android.view.animation.Animation
    public final boolean getTransformation(long j, Transformation transformation, float f) {
        if (this.mEnded) {
            return !this.iS;
        }
        if (!super.getTransformation(j, transformation, f)) {
            this.mEnded = true;
            bk.a(this.mParent, this);
        }
        return true;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.mParent.endViewTransition(this.iR);
        this.iS = true;
    }
}
