package android.support.v4.app;

import android.app.Activity;
import android.arch.lifecycle.Lifecycle;
import android.os.Bundle;

/* JADX INFO: loaded from: classes.dex */
public class bm extends Activity implements android.arch.lifecycle.g {
    private android.support.v4.c.s jZ = new android.support.v4.c.s();
    private android.arch.lifecycle.h hX = new android.arch.lifecycle.h(this);

    @Override // android.arch.lifecycle.g
    public Lifecycle g() {
        return this.hX;
    }

    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        android.arch.lifecycle.s.a(this);
    }

    @Override // android.app.Activity
    protected void onSaveInstanceState(Bundle bundle) {
        this.hX.b(Lifecycle.State.CREATED);
        super.onSaveInstanceState(bundle);
    }
}
