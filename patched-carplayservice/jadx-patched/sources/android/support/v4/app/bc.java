package android.support.v4.app;

import android.view.View;
import java.util.ArrayList;

/* JADX INFO: loaded from: classes.dex */
final class bc implements Runnable {
    final /* synthetic */ ArrayList jD;
    final /* synthetic */ int jM;
    final /* synthetic */ ArrayList jN;
    final /* synthetic */ ArrayList jO;
    final /* synthetic */ bb jP;
    final /* synthetic */ ArrayList js;

    bc(bb bbVar, int i, ArrayList arrayList, ArrayList arrayList2, ArrayList arrayList3, ArrayList arrayList4) {
        this.jP = bbVar;
        this.jM = i;
        this.js = arrayList;
        this.jN = arrayList2;
        this.jD = arrayList3;
        this.jO = arrayList4;
    }

    @Override // java.lang.Runnable
    public final void run() {
        for (int i = 0; i < this.jM; i++) {
            android.support.v4.view.n.a((View) this.js.get(i), (String) this.jN.get(i));
            android.support.v4.view.n.a((View) this.jD.get(i), (String) this.jO.get(i));
        }
    }
}
