package android.support.v4.app;

import android.graphics.Rect;
import android.transition.Transition;

/* JADX INFO: loaded from: classes.dex */
final class ax extends Transition.EpicenterCallback {
    final /* synthetic */ aw jJ;
    final /* synthetic */ Rect jz;

    ax(aw awVar, Rect rect) {
        this.jJ = awVar;
        this.jz = rect;
    }

    @Override // android.transition.Transition.EpicenterCallback
    public final Rect onGetEpicenter(Transition transition) {
        return this.jz;
    }
}
