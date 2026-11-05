package android.support.v4.view;

import android.os.Build;
import android.util.Log;
import android.view.View;
import android.view.ViewParent;

/* JADX INFO: loaded from: classes.dex */
public final class h {
    private ViewParent mO;
    private ViewParent mP;
    private boolean mQ;
    private int[] mR;
    private final View mView;

    private ViewParent C(int i) {
        switch (i) {
            case 0:
                return this.mO;
            case 1:
                return this.mP;
            default:
                return null;
        }
    }

    private void a(int i, ViewParent viewParent) {
        switch (i) {
            case 0:
                this.mO = viewParent;
                break;
            case 1:
                this.mP = viewParent;
                break;
        }
    }

    public final boolean A(int i) {
        return C(i) != null;
    }

    public final void B(int i) {
        ViewParent viewParentC = C(i);
        if (viewParentC != null) {
            View view = this.mView;
            if (viewParentC instanceof j) {
                ((j) viewParentC).o(i);
            } else if (i == 0) {
                if (Build.VERSION.SDK_INT >= 21) {
                    try {
                        viewParentC.onStopNestedScroll(view);
                    } catch (AbstractMethodError e) {
                        Log.e("ViewParentCompat", "ViewParent " + viewParentC + " does not implement interface method onStopNestedScroll", e);
                    }
                } else if (viewParentC instanceof i) {
                    ((i) viewParentC).onStopNestedScroll(view);
                }
            }
            a(i, null);
        }
    }

    public final boolean a(int i, int i2, int i3, int i4, int[] iArr, int i5) {
        ViewParent viewParentC;
        int i6;
        int i7;
        if (!this.mQ || (viewParentC = C(i5)) == null) {
            return false;
        }
        if (i == 0 && i2 == 0 && i3 == 0 && i4 == 0) {
            if (iArr != null) {
                iArr[0] = 0;
                iArr[1] = 0;
                return false;
            }
            return false;
        }
        if (iArr != null) {
            this.mView.getLocationInWindow(iArr);
            i6 = iArr[0];
            i7 = iArr[1];
        } else {
            i6 = 0;
            i7 = 0;
        }
        View view = this.mView;
        if (viewParentC instanceof j) {
            ((j) viewParentC).b(i4, i5);
        } else if (i5 == 0) {
            if (Build.VERSION.SDK_INT >= 21) {
                try {
                    viewParentC.onNestedScroll(view, i, i2, i3, i4);
                } catch (AbstractMethodError e) {
                    Log.e("ViewParentCompat", "ViewParent " + viewParentC + " does not implement interface method onNestedScroll", e);
                }
            } else if (viewParentC instanceof i) {
                ((i) viewParentC).onNestedScroll(view, i, i2, i3, i4);
            }
        }
        if (iArr != null) {
            this.mView.getLocationInWindow(iArr);
            iArr[0] = iArr[0] - i6;
            iArr[1] = iArr[1] - i7;
        }
        return true;
    }

    public final boolean a(int i, int i2, int[] iArr, int[] iArr2, int i3) {
        ViewParent viewParentC;
        int i4;
        int i5;
        if (!this.mQ || (viewParentC = C(i3)) == null) {
            return false;
        }
        if (i == 0 && i2 == 0) {
            if (iArr2 != null) {
                iArr2[0] = 0;
                iArr2[1] = 0;
                return false;
            }
            return false;
        }
        if (iArr2 != null) {
            this.mView.getLocationInWindow(iArr2);
            i4 = iArr2[0];
            i5 = iArr2[1];
        } else {
            i4 = 0;
            i5 = 0;
        }
        if (iArr == null) {
            if (this.mR == null) {
                this.mR = new int[2];
            }
            iArr = this.mR;
        }
        iArr[0] = 0;
        iArr[1] = 0;
        View view = this.mView;
        if (viewParentC instanceof j) {
            ((j) viewParentC).a(i, i2, iArr, i3);
        } else if (i3 == 0) {
            if (Build.VERSION.SDK_INT >= 21) {
                try {
                    viewParentC.onNestedPreScroll(view, i, i2, iArr);
                } catch (AbstractMethodError e) {
                    Log.e("ViewParentCompat", "ViewParent " + viewParentC + " does not implement interface method onNestedPreScroll", e);
                }
            } else if (viewParentC instanceof i) {
                ((i) viewParentC).onNestedPreScroll(view, i, i2, iArr);
            }
        }
        if (iArr2 != null) {
            this.mView.getLocationInWindow(iArr2);
            iArr2[0] = iArr2[0] - i4;
            iArr2[1] = iArr2[1] - i5;
        }
        return (iArr[0] == 0 && iArr[1] == 0) ? false : true;
    }

    public final boolean c(int i, int i2) {
        if (A(i2)) {
            return true;
        }
        if (!this.mQ) {
            return false;
        }
        View view = this.mView;
        for (ViewParent parent = this.mView.getParent(); parent != null; parent = parent.getParent()) {
            if (w.a(parent, view, this.mView, i, i2)) {
                a(i2, parent);
                View view2 = this.mView;
                if (parent instanceof j) {
                    ((j) parent).a(view2, i, i2);
                    return true;
                }
                if (i2 == 0) {
                    if (Build.VERSION.SDK_INT >= 21) {
                        try {
                            parent.onNestedScrollAccepted(view, view2, i);
                            return true;
                        } catch (AbstractMethodError e) {
                            Log.e("ViewParentCompat", "ViewParent " + parent + " does not implement interface method onNestedScrollAccepted", e);
                            return true;
                        }
                    }
                    if (parent instanceof i) {
                        ((i) parent).onNestedScrollAccepted(view, view2, i);
                    }
                }
                return true;
            }
            if (parent instanceof View) {
                view = (View) parent;
            }
        }
        return false;
    }

    public final boolean dispatchNestedFling(float f, float f2, boolean z) {
        ViewParent viewParentC;
        if (!this.mQ || (viewParentC = C(0)) == null) {
            return false;
        }
        return w.a(viewParentC, this.mView, f, f2, z);
    }

    public final boolean dispatchNestedPreFling(float f, float f2) {
        ViewParent viewParentC;
        if (!this.mQ || (viewParentC = C(0)) == null) {
            return false;
        }
        return w.a(viewParentC, this.mView, f, f2);
    }

    public final boolean isNestedScrollingEnabled() {
        return this.mQ;
    }

    public final void setNestedScrollingEnabled(boolean z) {
        if (this.mQ) {
            n.l(this.mView);
        }
        this.mQ = z;
    }
}
