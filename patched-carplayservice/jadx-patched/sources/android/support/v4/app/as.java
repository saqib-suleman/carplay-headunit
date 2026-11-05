package android.support.v4.app;

import android.view.View;
import java.util.ArrayList;

/* JADX INFO: loaded from: classes.dex */
final class as implements Runnable {
    final /* synthetic */ ArrayList jn;
    final /* synthetic */ Object jo;
    final /* synthetic */ bb jp;
    final /* synthetic */ View jq;
    final /* synthetic */ Fragment jr;
    final /* synthetic */ ArrayList js;
    final /* synthetic */ ArrayList jt;
    final /* synthetic */ Object ju;

    as(Object obj, bb bbVar, View view, Fragment fragment, ArrayList arrayList, ArrayList arrayList2, ArrayList arrayList3, Object obj2) {
        this.jo = obj;
        this.jp = bbVar;
        this.jq = view;
        this.jr = fragment;
        this.js = arrayList;
        this.jt = arrayList2;
        this.jn = arrayList3;
        this.ju = obj2;
    }

    @Override // java.lang.Runnable
    public final void run() {
        if (this.jo != null) {
            this.jp.c(this.jo, this.jq);
            this.jt.addAll(aq.a(this.jp, this.jo, this.jr, this.js, this.jq));
        }
        if (this.jn != null) {
            if (this.ju != null) {
                ArrayList arrayList = new ArrayList();
                arrayList.add(this.jq);
                this.jp.b(this.ju, this.jn, arrayList);
            }
            this.jn.clear();
            this.jn.add(this.jq);
        }
    }
}
