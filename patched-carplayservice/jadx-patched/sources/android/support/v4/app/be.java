package android.support.v4.app;

import android.view.View;
import java.util.ArrayList;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
final class be implements Runnable {
    final /* synthetic */ bb jP;
    final /* synthetic */ Map jQ;
    final /* synthetic */ ArrayList js;

    be(bb bbVar, ArrayList arrayList, Map map) {
        this.jP = bbVar;
        this.js = arrayList;
        this.jQ = map;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int size = this.js.size();
        for (int i = 0; i < size; i++) {
            View view = (View) this.js.get(i);
            android.support.v4.view.n.a(view, (String) this.jQ.get(android.support.v4.view.n.h(view)));
        }
    }
}
