package android.support.v4.app;

import android.graphics.Rect;
import android.view.View;
import java.util.ArrayList;

/* JADX INFO: loaded from: classes.dex */
final class au implements Runnable {
    final /* synthetic */ android.support.v4.c.a jA;
    final /* synthetic */ Object jB;
    final /* synthetic */ av jC;
    final /* synthetic */ ArrayList jD;
    final /* synthetic */ Rect jE;
    final /* synthetic */ Object jo;
    final /* synthetic */ bb jp;
    final /* synthetic */ View jq;
    final /* synthetic */ Fragment jr;
    final /* synthetic */ ArrayList js;
    final /* synthetic */ Fragment jv;
    final /* synthetic */ boolean jw;

    au(bb bbVar, android.support.v4.c.a aVar, Object obj, av avVar, ArrayList arrayList, View view, Fragment fragment, Fragment fragment2, boolean z, ArrayList arrayList2, Object obj2, Rect rect) {
        this.jp = bbVar;
        this.jA = aVar;
        this.jB = obj;
        this.jC = avVar;
        this.js = arrayList;
        this.jq = view;
        this.jr = fragment;
        this.jv = fragment2;
        this.jw = z;
        this.jD = arrayList2;
        this.jo = obj2;
        this.jE = rect;
    }

    @Override // java.lang.Runnable
    public final void run() {
        android.support.v4.c.a aVarB = aq.b(this.jp, this.jA, this.jB, this.jC);
        if (aVarB != null) {
            this.js.addAll(aVarB.values());
            this.js.add(this.jq);
        }
        aq.a(this.jr, this.jv, this.jw, aVarB);
        if (this.jB != null) {
            this.jp.a(this.jB, this.jD, this.js);
            View viewA = aq.a(aVarB, this.jC, this.jo, this.jw);
            if (viewA != null) {
                bb.a(viewA, this.jE);
            }
        }
    }
}
