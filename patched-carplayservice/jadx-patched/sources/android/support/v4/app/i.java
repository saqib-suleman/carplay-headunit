package android.support.v4.app;

import android.content.Context;
import android.os.Bundle;
import android.view.View;

/* JADX INFO: loaded from: classes.dex */
final class i extends r {
    final /* synthetic */ Fragment ib;

    i(Fragment fragment) {
        this.ib = fragment;
    }

    @Override // android.support.v4.app.r
    public final Fragment a(Context context, String str, Bundle bundle) {
        return this.ib.hQ.a(context, str, bundle);
    }

    @Override // android.support.v4.app.r
    public final View onFindViewById(int i) {
        if (this.ib.mView != null) {
            return this.ib.mView.findViewById(i);
        }
        throw new IllegalStateException("Fragment does not have a view");
    }

    @Override // android.support.v4.app.r
    public final boolean onHasView() {
        return this.ib.mView != null;
    }
}
