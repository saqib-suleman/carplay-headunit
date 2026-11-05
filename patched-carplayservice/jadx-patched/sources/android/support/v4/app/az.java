package android.support.v4.app;

import android.transition.Transition;
import java.util.ArrayList;

/* JADX INFO: loaded from: classes.dex */
final class az implements Transition.TransitionListener {
    final /* synthetic */ aw jJ;
    final /* synthetic */ Object jL;
    final /* synthetic */ ArrayList jn;
    final /* synthetic */ Object jo;
    final /* synthetic */ ArrayList js;
    final /* synthetic */ ArrayList jt;
    final /* synthetic */ Object ju;

    az(aw awVar, Object obj, ArrayList arrayList, Object obj2, ArrayList arrayList2, Object obj3, ArrayList arrayList3) {
        this.jJ = awVar;
        this.jo = obj;
        this.jt = arrayList;
        this.ju = obj2;
        this.jn = arrayList2;
        this.jL = obj3;
        this.js = arrayList3;
    }

    @Override // android.transition.Transition.TransitionListener
    public final void onTransitionCancel(Transition transition) {
    }

    @Override // android.transition.Transition.TransitionListener
    public final void onTransitionEnd(Transition transition) {
    }

    @Override // android.transition.Transition.TransitionListener
    public final void onTransitionPause(Transition transition) {
    }

    @Override // android.transition.Transition.TransitionListener
    public final void onTransitionResume(Transition transition) {
    }

    @Override // android.transition.Transition.TransitionListener
    public final void onTransitionStart(Transition transition) {
        if (this.jo != null) {
            this.jJ.b(this.jo, this.jt, (ArrayList) null);
        }
        if (this.ju != null) {
            this.jJ.b(this.ju, this.jn, (ArrayList) null);
        }
        if (this.jL != null) {
            this.jJ.b(this.jL, this.js, (ArrayList) null);
        }
    }
}
