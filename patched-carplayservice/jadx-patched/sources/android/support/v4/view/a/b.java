package android.support.v4.view.a;

import android.os.Build;

/* JADX INFO: loaded from: classes.dex */
public final class b {
    private final Object nY;

    public b() {
        this.nY = Build.VERSION.SDK_INT >= 19 ? new d(this) : Build.VERSION.SDK_INT >= 16 ? new c(this) : null;
    }

    public b(Object obj) {
        this.nY = obj;
    }

    public final Object ct() {
        return this.nY;
    }
}
