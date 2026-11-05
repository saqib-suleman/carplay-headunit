package android.support.v4.app;

import android.animation.Animator;
import android.view.animation.Animation;

/* JADX INFO: loaded from: classes.dex */
final class ae {
    public final Animator animator;
    public final Animation iQ;

    private ae(Animator animator) {
        this.iQ = null;
        this.animator = animator;
        if (animator == null) {
            throw new IllegalStateException("Animator cannot be null");
        }
    }

    /* synthetic */ ae(Animator animator, byte b) {
        this(animator);
    }

    private ae(Animation animation) {
        this.iQ = animation;
        this.animator = null;
        if (animation == null) {
            throw new IllegalStateException("Animation cannot be null");
        }
    }

    /* synthetic */ ae(Animation animation, byte b) {
        this(animation);
    }
}
