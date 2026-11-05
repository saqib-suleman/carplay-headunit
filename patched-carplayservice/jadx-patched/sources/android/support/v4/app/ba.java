package android.support.v4.app;

import android.graphics.Rect;
import android.transition.Transition;

/* JADX INFO: loaded from: classes.dex */
final class ba extends Transition.EpicenterCallback {
    final /* synthetic */ aw jJ;
    final /* synthetic */ Rect jz;

    ba(aw awVar, Rect rect) {
        this.jJ = awVar;
        this.jz = rect;
    }

    @Override // android.transition.Transition.EpicenterCallback
    public final Rect onGetEpicenter(Transition transition) {
        if (this.jz == null || this.jz.isEmpty()) {
            return null;
        }
        return this.jz;
    }
}
