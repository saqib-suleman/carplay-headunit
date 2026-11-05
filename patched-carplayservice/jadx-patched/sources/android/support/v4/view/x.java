package android.support.v4.view;

import android.os.Build;
import android.view.WindowInsets;

/* JADX INFO: loaded from: classes.dex */
public final class x {
    private final Object nV;

    private x(Object obj) {
        this.nV = obj;
    }

    static Object c(x xVar) {
        if (xVar == null) {
            return null;
        }
        return xVar.nV;
    }

    static x n(Object obj) {
        if (obj == null) {
            return null;
        }
        return new x(obj);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        x xVar = (x) obj;
        if (this.nV == null) {
            return xVar.nV == null;
        }
        return this.nV.equals(xVar.nV);
    }

    public final int getSystemWindowInsetBottom() {
        if (Build.VERSION.SDK_INT >= 20) {
            return ((WindowInsets) this.nV).getSystemWindowInsetBottom();
        }
        return 0;
    }

    public final int getSystemWindowInsetLeft() {
        if (Build.VERSION.SDK_INT >= 20) {
            return ((WindowInsets) this.nV).getSystemWindowInsetLeft();
        }
        return 0;
    }

    public final int getSystemWindowInsetRight() {
        if (Build.VERSION.SDK_INT >= 20) {
            return ((WindowInsets) this.nV).getSystemWindowInsetRight();
        }
        return 0;
    }

    public final int getSystemWindowInsetTop() {
        if (Build.VERSION.SDK_INT >= 20) {
            return ((WindowInsets) this.nV).getSystemWindowInsetTop();
        }
        return 0;
    }

    public final int hashCode() {
        if (this.nV == null) {
            return 0;
        }
        return this.nV.hashCode();
    }

    public final boolean isConsumed() {
        if (Build.VERSION.SDK_INT >= 21) {
            return ((WindowInsets) this.nV).isConsumed();
        }
        return false;
    }
}
