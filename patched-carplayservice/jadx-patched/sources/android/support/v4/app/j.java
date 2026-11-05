package android.support.v4.app;

import android.arch.lifecycle.Lifecycle;

/* JADX INFO: loaded from: classes.dex */
final class j implements android.arch.lifecycle.g {
    final /* synthetic */ Fragment ib;

    j(Fragment fragment) {
        this.ib = fragment;
    }

    @Override // android.arch.lifecycle.g
    public final Lifecycle g() {
        if (this.ib.hY == null) {
            this.ib.hY = new android.arch.lifecycle.h(this.ib.hZ);
        }
        return this.ib.hY;
    }
}
