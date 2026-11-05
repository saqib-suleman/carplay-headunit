package android.support.v4.app;

import android.view.LayoutInflater;
import android.view.View;
import android.view.Window;
import java.io.PrintWriter;

/* JADX INFO: loaded from: classes.dex */
final class p extends t {
    final /* synthetic */ n iv;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public p(n nVar) {
        super(nVar);
        this.iv = nVar;
    }

    @Override // android.support.v4.app.t
    public final void a(String str, PrintWriter printWriter, String[] strArr) {
        this.iv.dump(str, null, printWriter, strArr);
    }

    @Override // android.support.v4.app.t
    public final boolean br() {
        return !this.iv.isFinishing();
    }

    @Override // android.support.v4.app.t
    public final void bs() {
        this.iv.invalidateOptionsMenu();
    }

    @Override // android.support.v4.app.t, android.support.v4.app.r
    public final View onFindViewById(int i) {
        return this.iv.findViewById(i);
    }

    @Override // android.support.v4.app.t
    public final LayoutInflater onGetLayoutInflater() {
        return this.iv.getLayoutInflater().cloneInContext(this.iv);
    }

    @Override // android.support.v4.app.t
    public final int onGetWindowAnimations() {
        Window window = this.iv.getWindow();
        if (window == null) {
            return 0;
        }
        return window.getAttributes().windowAnimations;
    }

    @Override // android.support.v4.app.t, android.support.v4.app.r
    public final boolean onHasView() {
        Window window = this.iv.getWindow();
        return (window == null || window.peekDecorView() == null) ? false : true;
    }

    @Override // android.support.v4.app.t
    public final boolean onHasWindowAnimations() {
        return this.iv.getWindow() != null;
    }
}
