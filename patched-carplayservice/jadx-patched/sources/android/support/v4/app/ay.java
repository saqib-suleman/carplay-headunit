package android.support.v4.app;

import android.transition.Transition;
import android.view.View;
import java.util.ArrayList;

/* JADX INFO: loaded from: classes.dex */
final class ay implements Transition.TransitionListener {
    final /* synthetic */ aw jJ;
    final /* synthetic */ View jK;
    final /* synthetic */ ArrayList jn;

    ay(aw awVar, View view, ArrayList arrayList) {
        this.jJ = awVar;
        this.jK = view;
        this.jn = arrayList;
    }

    @Override // android.transition.Transition.TransitionListener
    public final void onTransitionCancel(Transition transition) {
    }

    @Override // android.transition.Transition.TransitionListener
    public final void onTransitionEnd(Transition transition) {
        transition.removeListener(this);
        this.jK.setVisibility(8);
        int size = this.jn.size();
        for (int i = 0; i < size; i++) {
            ((View) this.jn.get(i)).setVisibility(0);
        }
    }

    @Override // android.transition.Transition.TransitionListener
    public final void onTransitionPause(Transition transition) {
    }

    @Override // android.transition.Transition.TransitionListener
    public final void onTransitionResume(Transition transition) {
    }

    @Override // android.transition.Transition.TransitionListener
    public final void onTransitionStart(Transition transition) {
    }
}
