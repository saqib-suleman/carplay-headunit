package android.support.v4.widget;

import android.support.v4.view.n;
import android.util.Log;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Interpolator;
import android.widget.OverScroller;
import java.util.Arrays;

/* JADX INFO: loaded from: classes.dex */
public final class j {
    private static final Interpolator nb = new k();
    private int mActivePointerId;
    private VelocityTracker mVelocityTracker;
    private int nx;
    private OverScroller oW;
    private int pL;
    private float[] pM;
    private float[] pN;
    private float[] pO;
    private float[] pP;
    private int[] pQ;
    private int[] pR;
    private int[] pS;
    private int pT;
    private float pU;
    private float pV;
    private int pW;
    private int pX;
    private final l pY;
    private View pZ;
    private boolean qa;
    private final ViewGroup qb;
    private final Runnable qc;

    private void N(int i) {
        if (this.pM == null || !O(i)) {
            return;
        }
        this.pM[i] = 0.0f;
        this.pN[i] = 0.0f;
        this.pO[i] = 0.0f;
        this.pP[i] = 0.0f;
        this.pQ[i] = 0;
        this.pR[i] = 0;
        this.pS[i] = 0;
        this.pT = (~(1 << i)) & this.pT;
    }

    private boolean O(int i) {
        return ((1 << i) & this.pT) != 0;
    }

    private void P(int i) {
        this.qb.removeCallbacks(this.qc);
        if (this.pL != i) {
            this.pL = i;
            this.pY.I(i);
            if (this.pL == 0) {
                this.pZ = null;
            }
        }
    }

    private boolean Q(int i) {
        if (O(i)) {
            return true;
        }
        Log.e("ViewDragHelper", "Ignoring pointerId=" + i + " because ACTION_DOWN was not received for this pointer before ACTION_MOVE. It likely happened because  ViewDragHelper did not receive all the events in the event stream.");
        return false;
    }

    private static float a(float f, float f2, float f3) {
        float fAbs = Math.abs(f);
        if (fAbs < f2) {
            return 0.0f;
        }
        if (fAbs > f3) {
            return f > 0.0f ? f3 : -f3;
        }
        return f;
    }

    private void a(float f, float f2, int i) {
        if (this.pM == null || this.pM.length <= i) {
            int i2 = i + 1;
            float[] fArr = new float[i2];
            float[] fArr2 = new float[i2];
            float[] fArr3 = new float[i2];
            float[] fArr4 = new float[i2];
            int[] iArr = new int[i2];
            int[] iArr2 = new int[i2];
            int[] iArr3 = new int[i2];
            if (this.pM != null) {
                System.arraycopy(this.pM, 0, fArr, 0, this.pM.length);
                System.arraycopy(this.pN, 0, fArr2, 0, this.pN.length);
                System.arraycopy(this.pO, 0, fArr3, 0, this.pO.length);
                System.arraycopy(this.pP, 0, fArr4, 0, this.pP.length);
                System.arraycopy(this.pQ, 0, iArr, 0, this.pQ.length);
                System.arraycopy(this.pR, 0, iArr2, 0, this.pR.length);
                System.arraycopy(this.pS, 0, iArr3, 0, this.pS.length);
            }
            this.pM = fArr;
            this.pN = fArr2;
            this.pO = fArr3;
            this.pP = fArr4;
            this.pQ = iArr;
            this.pR = iArr2;
            this.pS = iArr3;
        }
        float[] fArr5 = this.pM;
        this.pO[i] = f;
        fArr5[i] = f;
        float[] fArr6 = this.pN;
        this.pP[i] = f2;
        fArr6[i] = f2;
        int[] iArr4 = this.pQ;
        int i3 = (int) f;
        int i4 = (int) f2;
        int i5 = i3 < this.qb.getLeft() + this.pW ? 1 : 0;
        if (i4 < this.qb.getTop() + this.pW) {
            i5 |= 4;
        }
        if (i3 > this.qb.getRight() - this.pW) {
            i5 |= 2;
        }
        if (i4 > this.qb.getBottom() - this.pW) {
            i5 |= 8;
        }
        iArr4[i] = i5;
        this.pT |= 1 << i;
    }

    private boolean a(float f, float f2, int i, int i2) {
        float fAbs = Math.abs(f);
        return ((this.pQ[i] & i2) != i2 || (this.pX & i2) == 0 || (this.pS[i] & i2) == i2 || (this.pR[i] & i2) == i2 || (fAbs <= ((float) this.nx) && Math.abs(f2) <= ((float) this.nx)) || (this.pR[i] & i2) != 0 || fAbs <= ((float) this.nx)) ? false : true;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v11 */
    /* JADX WARN: Type inference failed for: r0v12 */
    /* JADX WARN: Type inference failed for: r0v13 */
    /* JADX WARN: Type inference failed for: r0v14 */
    /* JADX WARN: Type inference failed for: r0v15 */
    /* JADX WARN: Type inference failed for: r0v16 */
    /* JADX WARN: Type inference failed for: r0v2 */
    /* JADX WARN: Type inference failed for: r0v3 */
    /* JADX WARN: Type inference failed for: r0v4, types: [int] */
    /* JADX WARN: Type inference failed for: r3v3, types: [android.support.v4.widget.l] */
    /* JADX WARN: Type inference failed for: r4v2 */
    /* JADX WARN: Type inference fix 'apply assigned field type' failed
    java.lang.UnsupportedOperationException: ArgType.getObject(), call class: class jadx.core.dex.instructions.args.ArgType$UnknownArg
    	at jadx.core.dex.instructions.args.ArgType.getObject(ArgType.java:596)
    	at jadx.core.dex.attributes.nodes.ClassTypeVarsAttr.getTypeVarsMapFor(ClassTypeVarsAttr.java:35)
    	at jadx.core.dex.nodes.utils.TypeUtils.replaceClassGenerics(TypeUtils.java:177)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.insertExplicitUseCast(FixTypesVisitor.java:397)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.tryFieldTypeWithNewCasts(FixTypesVisitor.java:359)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.applyFieldType(FixTypesVisitor.java:309)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.visit(FixTypesVisitor.java:94)
     */
    private void b(float f, float f2, int i) {
        int i2;
        boolean zA = a(f, f2, i, 1);
        ?? r0 = zA;
        if (a(f2, f, i, 4)) {
            r0 = (zA ? 1 : 0) | 4;
        }
        ?? r1 = r0;
        if (a(f, f2, i, 2)) {
            r1 = (r0 == true ? 1 : 0) | 2;
        }
        ?? r2 = r1;
        if (a(f2, f, i, 8)) {
            i2 = (r1 == true ? 1 : 0) | 8;
        }
        if (r2 == 0) {
            r2 = i2;
            return;
        }
        r2 = i2;
        int[] iArr = this.pR;
        iArr[i] = (iArr[i] | r2) == true ? 1 : 0;
        this.pY.e(r2, i);
    }

    private boolean b(int i, int i2, int i3, int i4) {
        float f;
        float f2;
        float f3;
        float f4;
        int left = this.pZ.getLeft();
        int top = this.pZ.getTop();
        int i5 = i - left;
        int i6 = i2 - top;
        if (i5 == 0 && i6 == 0) {
            this.oW.abortAnimation();
            P(0);
            return false;
        }
        View view = this.pZ;
        int iE = e(i3, (int) this.pV, (int) this.pU);
        int iE2 = e(i4, (int) this.pV, (int) this.pU);
        int iAbs = Math.abs(i5);
        int iAbs2 = Math.abs(i6);
        int iAbs3 = Math.abs(iE);
        int iAbs4 = Math.abs(iE2);
        int i7 = iAbs3 + iAbs4;
        int i8 = iAbs + iAbs2;
        if (iE != 0) {
            f = iAbs3;
            f2 = i7;
        } else {
            f = iAbs;
            f2 = i8;
        }
        float f5 = f / f2;
        if (iE2 != 0) {
            f3 = iAbs4;
            f4 = i7;
        } else {
            f3 = iAbs2;
            f4 = i8;
        }
        this.oW.startScroll(left, top, i5, i6, (int) ((d(i5, iE, this.pY.B(view)) * f5) + (d(i6, iE2, 0) * (f3 / f4))));
        P(2);
        return true;
    }

    private void c(float f) {
        this.qa = true;
        this.pY.c(this.pZ, f);
        this.qa = false;
        if (this.pL == 1) {
            P(0);
        }
    }

    private void c(MotionEvent motionEvent) {
        int pointerCount = motionEvent.getPointerCount();
        for (int i = 0; i < pointerCount; i++) {
            int pointerId = motionEvent.getPointerId(i);
            if (Q(pointerId)) {
                float x = motionEvent.getX(i);
                float y = motionEvent.getY(i);
                this.pO[pointerId] = x;
                this.pP[pointerId] = y;
            }
        }
    }

    private void cL() {
        this.mVelocityTracker.computeCurrentVelocity(1000, this.pU);
        float fA = a(this.mVelocityTracker.getXVelocity(this.mActivePointerId), this.pV, this.pU);
        a(this.mVelocityTracker.getYVelocity(this.mActivePointerId), this.pV, this.pU);
        c(fA);
    }

    private int d(int i, int i2, int i3) {
        if (i == 0) {
            return 0;
        }
        int width = this.qb.getWidth();
        float f = width / 2;
        float fSin = f + (((float) Math.sin((Math.min(1.0f, Math.abs(i) / width) - 0.5f) * 0.47123894f)) * f);
        int iAbs = Math.abs(i2);
        return Math.min(iAbs > 0 ? 4 * Math.round(1000.0f * Math.abs(fSin / iAbs)) : (int) (((Math.abs(i) / i3) + 1.0f) * 256.0f), 600);
    }

    private boolean d(View view, float f) {
        if (view == null) {
            return false;
        }
        return (this.pY.B(view) > 0) && Math.abs(f) > ((float) this.nx);
    }

    public static boolean d(View view, int i, int i2) {
        return view != null && i >= view.getLeft() && i < view.getRight() && i2 >= view.getTop() && i2 < view.getBottom();
    }

    private static int e(int i, int i2, int i3) {
        int iAbs = Math.abs(i);
        if (iAbs < i2) {
            return 0;
        }
        if (iAbs > i3) {
            return i > 0 ? i3 : -i3;
        }
        return i;
    }

    private boolean l(View view, int i) {
        if (view == this.pZ && this.mActivePointerId == i) {
            return true;
        }
        if (view == null || !this.pY.z(view)) {
            return false;
        }
        this.mActivePointerId = i;
        k(view, i);
        return true;
    }

    public final void M(int i) {
        this.pX = i;
    }

    public final void abort() {
        cancel();
        if (this.pL == 2) {
            this.oW.getCurrX();
            this.oW.getCurrY();
            this.oW.abortAnimation();
            int currX = this.oW.getCurrX();
            this.oW.getCurrY();
            this.pY.i(this.pZ, currX);
        }
        P(0);
    }

    public final boolean c(View view, int i, int i2) {
        this.pZ = view;
        this.mActivePointerId = -1;
        boolean zB = b(i, i2, 0, 0);
        if (!zB && this.pL == 0 && this.pZ != null) {
            this.pZ = null;
        }
        return zB;
    }

    public final int cG() {
        return this.pL;
    }

    public final int cH() {
        return this.pW;
    }

    public final View cI() {
        return this.pZ;
    }

    public final boolean cJ() {
        if (this.pL == 2) {
            boolean zComputeScrollOffset = this.oW.computeScrollOffset();
            int currX = this.oW.getCurrX();
            int currY = this.oW.getCurrY();
            int left = currX - this.pZ.getLeft();
            int top = currY - this.pZ.getTop();
            if (left != 0) {
                n.f(this.pZ, left);
            }
            if (top != 0) {
                n.d(this.pZ, top);
            }
            if (left != 0 || top != 0) {
                this.pY.i(this.pZ, currX);
            }
            if (zComputeScrollOffset && currX == this.oW.getFinalX() && currY == this.oW.getFinalY()) {
                this.oW.abortAnimation();
                zComputeScrollOffset = false;
            }
            if (!zComputeScrollOffset) {
                this.qb.post(this.qc);
            }
        }
        return this.pL == 2;
    }

    /* JADX WARN: Code duplicated, block: B:9:0x002f  */
    public final boolean cK() {
        boolean z;
        int length = this.pM.length;
        for (int i = 0; i < length; i++) {
            if (O(i)) {
                float f = this.pO[i] - this.pM[i];
                float f2 = this.pP[i] - this.pN[i];
                if ((f * f) + (f2 * f2) > this.nx * this.nx) {
                    z = true;
                } else {
                    z = false;
                }
            } else {
                z = false;
            }
            if (z) {
                return true;
            }
        }
        return false;
    }

    public final void cancel() {
        this.mActivePointerId = -1;
        if (this.pM != null) {
            Arrays.fill(this.pM, 0.0f);
            Arrays.fill(this.pN, 0.0f);
            Arrays.fill(this.pO, 0.0f);
            Arrays.fill(this.pP, 0.0f);
            Arrays.fill(this.pQ, 0);
            Arrays.fill(this.pR, 0);
            Arrays.fill(this.pS, 0);
            this.pT = 0;
        }
        if (this.mVelocityTracker != null) {
            this.mVelocityTracker.recycle();
            this.mVelocityTracker = null;
        }
    }

    /* JADX WARN: Code duplicated, block: B:42:0x00bf  */
    /* JADX WARN: Code duplicated, block: B:57:0x0102  */
    public final boolean d(MotionEvent motionEvent) {
        View viewG;
        int actionMasked = motionEvent.getActionMasked();
        int actionIndex = motionEvent.getActionIndex();
        if (actionMasked == 0) {
            cancel();
        }
        if (this.mVelocityTracker == null) {
            this.mVelocityTracker = VelocityTracker.obtain();
        }
        this.mVelocityTracker.addMovement(motionEvent);
        switch (actionMasked) {
            case 0:
                float x = motionEvent.getX();
                float y = motionEvent.getY();
                int pointerId = motionEvent.getPointerId(0);
                a(x, y, pointerId);
                View viewG2 = g((int) x, (int) y);
                if (viewG2 == this.pZ && this.pL == 2) {
                    l(viewG2, pointerId);
                }
                if ((this.pQ[pointerId] & this.pX) != 0) {
                    this.pY.cy();
                }
                break;
            case 1:
            case 3:
                cancel();
                break;
            case 2:
                if (this.pM != null && this.pN != null) {
                    int pointerCount = motionEvent.getPointerCount();
                    for (int i = 0; i < pointerCount; i++) {
                        int pointerId2 = motionEvent.getPointerId(i);
                        if (Q(pointerId2)) {
                            float x2 = motionEvent.getX(i);
                            float y2 = motionEvent.getY(i);
                            float f = x2 - this.pM[pointerId2];
                            float f2 = y2 - this.pN[pointerId2];
                            View viewG3 = g((int) x2, (int) y2);
                            boolean z = viewG3 != null && d(viewG3, f);
                            if (z) {
                                int left = viewG3.getLeft();
                                int iJ = this.pY.j(viewG3, ((int) f) + left);
                                viewG3.getTop();
                                this.pY.C(viewG3);
                                int iB = this.pY.B(viewG3);
                                if (iB != 0 && (iB <= 0 || iJ != left)) {
                                    b(f, f2, pointerId2);
                                    if (this.pL != 1 || (z && l(viewG3, pointerId2))) {
                                    }
                                }
                                c(motionEvent);
                            } else {
                                b(f, f2, pointerId2);
                                if (this.pL != 1) {
                                }
                                c(motionEvent);
                            }
                            break;
                        }
                    }
                    c(motionEvent);
                }
                break;
            case 5:
                int pointerId3 = motionEvent.getPointerId(actionIndex);
                float x3 = motionEvent.getX(actionIndex);
                float y3 = motionEvent.getY(actionIndex);
                a(x3, y3, pointerId3);
                if (this.pL == 0) {
                    if ((this.pQ[pointerId3] & this.pX) != 0) {
                        this.pY.cy();
                    }
                } else if (this.pL == 2 && (viewG = g((int) x3, (int) y3)) == this.pZ) {
                    l(viewG, pointerId3);
                }
                break;
            case 6:
                N(motionEvent.getPointerId(actionIndex));
                break;
        }
        return this.pL == 1;
    }

    public final void e(MotionEvent motionEvent) {
        int i;
        int actionMasked = motionEvent.getActionMasked();
        int actionIndex = motionEvent.getActionIndex();
        if (actionMasked == 0) {
            cancel();
        }
        if (this.mVelocityTracker == null) {
            this.mVelocityTracker = VelocityTracker.obtain();
        }
        this.mVelocityTracker.addMovement(motionEvent);
        int i2 = 0;
        switch (actionMasked) {
            case 0:
                float x = motionEvent.getX();
                float y = motionEvent.getY();
                int pointerId = motionEvent.getPointerId(0);
                View viewG = g((int) x, (int) y);
                a(x, y, pointerId);
                l(viewG, pointerId);
                if ((this.pQ[pointerId] & this.pX) != 0) {
                    this.pY.cy();
                }
                break;
            case 1:
                if (this.pL == 1) {
                    cL();
                }
                cancel();
                break;
            case 2:
                if (this.pL != 1) {
                    int pointerCount = motionEvent.getPointerCount();
                    while (i2 < pointerCount) {
                        int pointerId2 = motionEvent.getPointerId(i2);
                        if (Q(pointerId2)) {
                            float x2 = motionEvent.getX(i2);
                            float y2 = motionEvent.getY(i2);
                            float f = x2 - this.pM[pointerId2];
                            b(f, y2 - this.pN[pointerId2], pointerId2);
                            if (this.pL != 1) {
                                View viewG2 = g((int) x2, (int) y2);
                                if (!d(viewG2, f) || !l(viewG2, pointerId2)) {
                                }
                            }
                            c(motionEvent);
                            break;
                        }
                        i2++;
                    }
                    c(motionEvent);
                } else if (Q(this.mActivePointerId)) {
                    int iFindPointerIndex = motionEvent.findPointerIndex(this.mActivePointerId);
                    float x3 = motionEvent.getX(iFindPointerIndex);
                    float y3 = motionEvent.getY(iFindPointerIndex);
                    int i3 = (int) (x3 - this.pO[this.mActivePointerId]);
                    int i4 = (int) (y3 - this.pP[this.mActivePointerId]);
                    int left = this.pZ.getLeft() + i3;
                    this.pZ.getTop();
                    int left2 = this.pZ.getLeft();
                    int top = this.pZ.getTop();
                    if (i3 != 0) {
                        left = this.pY.j(this.pZ, left);
                        n.f(this.pZ, left - left2);
                    }
                    if (i4 != 0) {
                        n.d(this.pZ, this.pY.C(this.pZ) - top);
                    }
                    if (i3 != 0 || i4 != 0) {
                        this.pY.i(this.pZ, left);
                    }
                    c(motionEvent);
                }
                break;
            case 3:
                if (this.pL == 1) {
                    c(0.0f);
                }
                cancel();
                break;
            case 5:
                int pointerId3 = motionEvent.getPointerId(actionIndex);
                float x4 = motionEvent.getX(actionIndex);
                float y4 = motionEvent.getY(actionIndex);
                a(x4, y4, pointerId3);
                if (this.pL != 0) {
                    if (d(this.pZ, (int) x4, (int) y4)) {
                        l(this.pZ, pointerId3);
                    }
                } else {
                    l(g((int) x4, (int) y4), pointerId3);
                    if ((this.pQ[pointerId3] & this.pX) != 0) {
                        this.pY.cy();
                    }
                }
                break;
            case 6:
                int pointerId4 = motionEvent.getPointerId(actionIndex);
                if (this.pL == 1 && pointerId4 == this.mActivePointerId) {
                    int pointerCount2 = motionEvent.getPointerCount();
                    while (true) {
                        if (i2 < pointerCount2) {
                            int pointerId5 = motionEvent.getPointerId(i2);
                            if (pointerId5 != this.mActivePointerId) {
                                if (g((int) motionEvent.getX(i2), (int) motionEvent.getY(i2)) == this.pZ && l(this.pZ, pointerId5)) {
                                    i = this.mActivePointerId;
                                }
                            }
                            i2++;
                        } else {
                            i = -1;
                        }
                    }
                    if (i == -1) {
                        cL();
                    }
                }
                N(pointerId4);
                break;
        }
    }

    public final boolean f(int i, int i2) {
        if (this.qa) {
            return b(i, i2, (int) this.mVelocityTracker.getXVelocity(this.mActivePointerId), (int) this.mVelocityTracker.getYVelocity(this.mActivePointerId));
        }
        throw new IllegalStateException("Cannot settleCapturedViewAt outside of a call to Callback#onViewReleased");
    }

    public final View g(int i, int i2) {
        for (int childCount = this.qb.getChildCount() - 1; childCount >= 0; childCount--) {
            View childAt = this.qb.getChildAt(childCount);
            if (i >= childAt.getLeft() && i < childAt.getRight() && i2 >= childAt.getTop() && i2 < childAt.getBottom()) {
                return childAt;
            }
        }
        return null;
    }

    public final int getTouchSlop() {
        return this.nx;
    }

    public final void k(View view, int i) {
        if (view.getParent() != this.qb) {
            throw new IllegalArgumentException("captureChildView: parameter must be a descendant of the ViewDragHelper's tracked parent view (" + this.qb + ")");
        }
        this.pZ = view;
        this.mActivePointerId = i;
        this.pY.A(view);
        P(1);
    }
}
