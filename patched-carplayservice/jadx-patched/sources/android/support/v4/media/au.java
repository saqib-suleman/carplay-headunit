package android.support.v4.media;

import android.os.Bundle;

/* JADX INFO: loaded from: classes.dex */
public final class au {
    private String en;
    private ay lx;
    private int ly;
    private boolean mEnabled;
    private Bundle mExtras;

    public final au a(ay ayVar) {
        this.lx = ayVar;
        return this;
    }

    public final at bO() {
        return new at(this.lx, this.ly, this.en, this.mExtras, this.mEnabled, (byte) 0);
    }

    public final au f(boolean z) {
        this.mEnabled = z;
        return this;
    }

    public final au m(Bundle bundle) {
        this.mExtras = bundle;
        return this;
    }

    public final au u(String str) {
        this.en = str;
        return this;
    }

    public final au w(int i) {
        this.ly = i;
        return this;
    }
}
