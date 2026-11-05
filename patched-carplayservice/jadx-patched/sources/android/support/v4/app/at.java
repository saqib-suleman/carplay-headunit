package android.support.v4.app;

import android.graphics.Rect;
import android.view.View;

/* JADX INFO: loaded from: classes.dex */
final class at implements Runnable {
    final /* synthetic */ bb jp;
    final /* synthetic */ Fragment jr;
    final /* synthetic */ Fragment jv;
    final /* synthetic */ boolean jw;
    final /* synthetic */ android.support.v4.c.a jx;
    final /* synthetic */ View jy;
    final /* synthetic */ Rect jz;

    at(Fragment fragment, Fragment fragment2, boolean z, android.support.v4.c.a aVar, View view, bb bbVar, Rect rect) {
        this.jr = fragment;
        this.jv = fragment2;
        this.jw = z;
        this.jx = aVar;
        this.jy = view;
        this.jp = bbVar;
        this.jz = rect;
    }

    @Override // java.lang.Runnable
    public final void run() {
        aq.a(this.jr, this.jv, this.jw, this.jx);
        if (this.jy != null) {
            bb.a(this.jy, this.jz);
        }
    }
}
