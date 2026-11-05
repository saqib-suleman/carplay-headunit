package android.support.v4.widget;

import android.R;
import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.v4.view.AbsSavedState;
import android.support.v4.view.n;
import android.util.AttributeSet;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public final class DrawerLayout extends ViewGroup {
    static final boolean of;
    private static final boolean og;
    private boolean hh;
    private Drawable hi;
    private boolean mInLayout;
    private float nA;
    private float nB;
    private boolean nJ;
    private Drawable oA;
    private Object oB;
    private Drawable oC;
    private Drawable oD;
    private Drawable oE;
    private Drawable oF;
    private final ArrayList oG;
    private Rect oH;
    private Matrix oI;
    private final b oh;
    private float oi;
    private int oj;
    private int ok;
    private float ol;
    private Paint om;
    private final j on;
    private final j oo;
    private final d op;
    private final d oq;
    private int or;
    private int os;
    private int ot;
    private int ou;
    private int ov;
    private boolean ow;
    private boolean ox;
    private List oy;
    private Drawable oz;
    private static final int[] oe = {R.attr.colorPrimaryDark};
    static final int[] mZ = {R.attr.layout_gravity};

    public class LayoutParams extends ViewGroup.MarginLayoutParams {
        public int gravity;
        float oJ;
        boolean oK;
        int oL;

        public LayoutParams() {
            super(-1, -1);
            this.gravity = 0;
        }

        public LayoutParams(Context context, AttributeSet attributeSet) {
            super(context, attributeSet);
            this.gravity = 0;
            TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, DrawerLayout.mZ);
            this.gravity = typedArrayObtainStyledAttributes.getInt(0, 0);
            typedArrayObtainStyledAttributes.recycle();
        }

        public LayoutParams(LayoutParams layoutParams) {
            super((ViewGroup.MarginLayoutParams) layoutParams);
            this.gravity = 0;
            this.gravity = layoutParams.gravity;
        }

        public LayoutParams(ViewGroup.LayoutParams layoutParams) {
            super(layoutParams);
            this.gravity = 0;
        }

        public LayoutParams(ViewGroup.MarginLayoutParams marginLayoutParams) {
            super(marginLayoutParams);
            this.gravity = 0;
        }
    }

    public class SavedState extends AbsSavedState {
        public static final Parcelable.Creator CREATOR = new c();
        int oM;
        int oN;
        int oO;
        int oP;
        int oQ;

        public SavedState(Parcel parcel, ClassLoader classLoader) {
            super(parcel, classLoader);
            this.oM = 0;
            this.oM = parcel.readInt();
            this.oN = parcel.readInt();
            this.oO = parcel.readInt();
            this.oP = parcel.readInt();
            this.oQ = parcel.readInt();
        }

        public SavedState(Parcelable parcelable) {
            super(parcelable);
            this.oM = 0;
        }

        @Override // android.support.v4.view.AbsSavedState, android.os.Parcelable
        public void writeToParcel(Parcel parcel, int i) {
            super.writeToParcel(parcel, i);
            parcel.writeInt(this.oM);
            parcel.writeInt(this.oN);
            parcel.writeInt(this.oO);
            parcel.writeInt(this.oP);
            parcel.writeInt(this.oQ);
        }
    }

    static {
        of = Build.VERSION.SDK_INT >= 19;
        og = Build.VERSION.SDK_INT >= 21;
    }

    private void a(View view, boolean z) {
        int childCount = getChildCount();
        for (int i = 0; i < childCount; i++) {
            View childAt = getChildAt(i);
            n.c(childAt, ((z || v(childAt)) && !(z && childAt == view)) ? 4 : 1);
        }
    }

    private static boolean b(Drawable drawable, int i) {
        if (drawable == null) {
            return false;
        }
        if (!(Build.VERSION.SDK_INT >= 19 ? drawable.isAutoMirrored() : false)) {
            return false;
        }
        android.support.v4.b.a.a.a(drawable, i);
        return true;
    }

    private View cv() {
        int childCount = getChildCount();
        for (int i = 0; i < childCount; i++) {
            View childAt = getChildAt(i);
            if ((((LayoutParams) childAt.getLayoutParams()).oL & 1) == 1) {
                return childAt;
            }
        }
        return null;
    }

    private View cw() {
        int childCount = getChildCount();
        for (int i = 0; i < childCount; i++) {
            View childAt = getChildAt(i);
            if (v(childAt)) {
                if (!v(childAt)) {
                    throw new IllegalArgumentException("View " + childAt + " is not a drawer");
                }
                if (((LayoutParams) childAt.getLayoutParams()).oJ > 0.0f) {
                    return childAt;
                }
            }
        }
        return null;
    }

    private void d(int i, int i2) {
        int absoluteGravity = android.support.v4.view.d.getAbsoluteGravity(i2, n.f(this));
        if (i2 == 3) {
            this.os = i;
        } else if (i2 == 5) {
            this.ot = i;
        } else if (i2 == 8388611) {
            this.ou = i;
        } else if (i2 == 8388613) {
            this.ov = i;
        }
        if (i != 0) {
            (absoluteGravity == 3 ? this.on : this.oo).cancel();
        }
        switch (i) {
            case 1:
                View viewH = H(absoluteGravity);
                if (viewH != null) {
                    x(viewH);
                }
                break;
            case 2:
                View viewH2 = H(absoluteGravity);
                if (viewH2 != null) {
                    w(viewH2);
                }
                break;
        }
    }

    private void l(boolean z) {
        int childCount = getChildCount();
        boolean zC = false;
        for (int i = 0; i < childCount; i++) {
            View childAt = getChildAt(i);
            LayoutParams layoutParams = (LayoutParams) childAt.getLayoutParams();
            if (v(childAt) && (!z || layoutParams.oK)) {
                zC |= h(childAt, 3) ? this.on.c(childAt, -childAt.getWidth(), childAt.getTop()) : this.oo.c(childAt, getWidth(), childAt.getTop());
                layoutParams.oK = false;
            }
        }
        this.op.cx();
        this.oq.cx();
        if (zC) {
            invalidate();
        }
    }

    static float s(View view) {
        return ((LayoutParams) view.getLayoutParams()).oJ;
    }

    private int t(View view) {
        return android.support.v4.view.d.getAbsoluteGravity(((LayoutParams) view.getLayoutParams()).gravity, n.f(this));
    }

    private static boolean u(View view) {
        return ((LayoutParams) view.getLayoutParams()).gravity == 0;
    }

    static boolean v(View view) {
        int absoluteGravity = android.support.v4.view.d.getAbsoluteGravity(((LayoutParams) view.getLayoutParams()).gravity, n.f(view));
        return ((absoluteGravity & 3) == 0 && (absoluteGravity & 5) == 0) ? false : true;
    }

    private void w(View view) {
        j jVar;
        int width;
        if (!v(view)) {
            throw new IllegalArgumentException("View " + view + " is not a sliding drawer");
        }
        LayoutParams layoutParams = (LayoutParams) view.getLayoutParams();
        if (this.nJ) {
            layoutParams.oJ = 1.0f;
            layoutParams.oL = 1;
            a(view, true);
        } else {
            layoutParams.oL |= 2;
            if (h(view, 3)) {
                jVar = this.on;
                width = 0;
            } else {
                jVar = this.oo;
                width = getWidth() - view.getWidth();
            }
            jVar.c(view, width, view.getTop());
        }
        invalidate();
    }

    static boolean y(View view) {
        return (n.e(view) == 4 || n.e(view) == 2) ? false : true;
    }

    final View H(int i) {
        int absoluteGravity = android.support.v4.view.d.getAbsoluteGravity(i, n.f(this)) & 7;
        int childCount = getChildCount();
        for (int i2 = 0; i2 < childCount; i2++) {
            View childAt = getChildAt(i2);
            if ((t(childAt) & 7) == absoluteGravity) {
                return childAt;
            }
        }
        return null;
    }

    final void a(int i, View view) {
        View rootView;
        int iCG = this.on.cG();
        int iCG2 = this.oo.cG();
        int i2 = 2;
        if (iCG == 1 || iCG2 == 1) {
            i2 = 1;
        } else if (iCG != 2 && iCG2 != 2) {
            i2 = 0;
        }
        if (view != null && i == 0) {
            LayoutParams layoutParams = (LayoutParams) view.getLayoutParams();
            if (layoutParams.oJ == 0.0f) {
                LayoutParams layoutParams2 = (LayoutParams) view.getLayoutParams();
                if ((layoutParams2.oL & 1) == 1) {
                    layoutParams2.oL = 0;
                    if (this.oy != null) {
                        for (int size = this.oy.size() - 1; size >= 0; size--) {
                            this.oy.get(size);
                        }
                    }
                    a(view, false);
                    if (hasWindowFocus() && (rootView = getRootView()) != null) {
                        rootView.sendAccessibilityEvent(32);
                    }
                }
            } else if (layoutParams.oJ == 1.0f) {
                LayoutParams layoutParams3 = (LayoutParams) view.getLayoutParams();
                if ((layoutParams3.oL & 1) == 0) {
                    layoutParams3.oL = 1;
                    if (this.oy != null) {
                        for (int size2 = this.oy.size() - 1; size2 >= 0; size2--) {
                            this.oy.get(size2);
                        }
                    }
                    a(view, true);
                    if (hasWindowFocus()) {
                        sendAccessibilityEvent(32);
                    }
                }
            }
        }
        if (i2 != this.or) {
            this.or = i2;
            if (this.oy != null) {
                for (int size3 = this.oy.size() - 1; size3 >= 0; size3--) {
                    this.oy.get(size3);
                }
            }
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void addFocusables(ArrayList arrayList, int i, int i2) {
        if (getDescendantFocusability() == 393216) {
            return;
        }
        int childCount = getChildCount();
        boolean z = false;
        for (int i3 = 0; i3 < childCount; i3++) {
            View childAt = getChildAt(i3);
            if (!v(childAt)) {
                this.oG.add(childAt);
            } else {
                if (!v(childAt)) {
                    throw new IllegalArgumentException("View " + childAt + " is not a drawer");
                }
                if ((((LayoutParams) childAt.getLayoutParams()).oL & 1) == 1) {
                    childAt.addFocusables(arrayList, i, i2);
                    z = true;
                }
            }
        }
        if (!z) {
            int size = this.oG.size();
            for (int i4 = 0; i4 < size; i4++) {
                View view = (View) this.oG.get(i4);
                if (view.getVisibility() == 0) {
                    view.addFocusables(arrayList, i, i2);
                }
            }
        }
        this.oG.clear();
    }

    @Override // android.view.ViewGroup
    public final void addView(View view, int i, ViewGroup.LayoutParams layoutParams) {
        super.addView(view, i, layoutParams);
        n.c(view, (cv() != null || v(view)) ? 4 : 1);
        if (of) {
            return;
        }
        n.a(view, this.oh);
    }

    final void b(View view, float f) {
        LayoutParams layoutParams = (LayoutParams) view.getLayoutParams();
        if (f == layoutParams.oJ) {
            return;
        }
        layoutParams.oJ = f;
        if (this.oy != null) {
            for (int size = this.oy.size() - 1; size >= 0; size--) {
                this.oy.get(size);
            }
        }
    }

    @Override // android.view.ViewGroup
    protected final boolean checkLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return (layoutParams instanceof LayoutParams) && super.checkLayoutParams(layoutParams);
    }

    @Override // android.view.View
    public final void computeScroll() {
        int childCount = getChildCount();
        float fMax = 0.0f;
        for (int i = 0; i < childCount; i++) {
            fMax = Math.max(fMax, ((LayoutParams) getChildAt(i).getLayoutParams()).oJ);
        }
        this.ol = fMax;
        boolean zCJ = this.on.cJ();
        boolean zCJ2 = this.oo.cJ();
        if (zCJ || zCJ2) {
            n.d(this);
        }
    }

    @Override // android.view.View
    public final boolean dispatchGenericMotionEvent(MotionEvent motionEvent) {
        boolean zDispatchGenericMotionEvent;
        if ((motionEvent.getSource() & 2) == 0 || motionEvent.getAction() == 10 || this.ol <= 0.0f) {
            return super.dispatchGenericMotionEvent(motionEvent);
        }
        int childCount = getChildCount();
        if (childCount == 0) {
            return false;
        }
        float x = motionEvent.getX();
        float y = motionEvent.getY();
        for (int i = childCount - 1; i >= 0; i--) {
            View childAt = getChildAt(i);
            if (this.oH == null) {
                this.oH = new Rect();
            }
            childAt.getHitRect(this.oH);
            if (this.oH.contains((int) x, (int) y) && !u(childAt)) {
                if (childAt.getMatrix().isIdentity()) {
                    float scrollX = getScrollX() - childAt.getLeft();
                    float scrollY = getScrollY() - childAt.getTop();
                    motionEvent.offsetLocation(scrollX, scrollY);
                    zDispatchGenericMotionEvent = childAt.dispatchGenericMotionEvent(motionEvent);
                    motionEvent.offsetLocation(-scrollX, -scrollY);
                } else {
                    float scrollX2 = getScrollX() - childAt.getLeft();
                    float scrollY2 = getScrollY() - childAt.getTop();
                    MotionEvent motionEventObtain = MotionEvent.obtain(motionEvent);
                    motionEventObtain.offsetLocation(scrollX2, scrollY2);
                    Matrix matrix = childAt.getMatrix();
                    if (!matrix.isIdentity()) {
                        if (this.oI == null) {
                            this.oI = new Matrix();
                        }
                        matrix.invert(this.oI);
                        motionEventObtain.transform(this.oI);
                    }
                    zDispatchGenericMotionEvent = childAt.dispatchGenericMotionEvent(motionEventObtain);
                    motionEventObtain.recycle();
                }
                if (zDispatchGenericMotionEvent) {
                    return true;
                }
            }
        }
        return false;
    }

    @Override // android.view.ViewGroup
    protected final boolean drawChild(Canvas canvas, View view, long j) {
        int i;
        int i2;
        Drawable drawable;
        int height = getHeight();
        boolean zU = u(view);
        int width = getWidth();
        int iSave = canvas.save();
        if (zU) {
            int childCount = getChildCount();
            i = width;
            i2 = 0;
            for (int i3 = 0; i3 < childCount; i3++) {
                View childAt = getChildAt(i3);
                if (childAt != view && childAt.getVisibility() == 0) {
                    Drawable background = childAt.getBackground();
                    if ((background != null && background.getOpacity() == -1) && v(childAt) && childAt.getHeight() >= height) {
                        if (h(childAt, 3)) {
                            int right = childAt.getRight();
                            if (right > i2) {
                                i2 = right;
                            }
                        } else {
                            int left = childAt.getLeft();
                            if (left < i) {
                                i = left;
                            }
                        }
                    }
                }
            }
            canvas.clipRect(i2, 0, i, getHeight());
        } else {
            i = width;
            i2 = 0;
        }
        boolean zDrawChild = super.drawChild(canvas, view, j);
        canvas.restoreToCount(iSave);
        if (this.ol > 0.0f && zU) {
            this.om.setColor((((int) (((this.ok & (-16777216)) >>> 24) * this.ol)) << 24) | (this.ok & 16777215));
            canvas.drawRect(i2, 0.0f, i, getHeight(), this.om);
            return zDrawChild;
        }
        if (this.oz != null && h(view, 3)) {
            int intrinsicWidth = this.oz.getIntrinsicWidth();
            int right2 = view.getRight();
            float fMax = Math.max(0.0f, Math.min(right2 / this.on.cH(), 1.0f));
            this.oz.setBounds(right2, view.getTop(), intrinsicWidth + right2, view.getBottom());
            this.oz.setAlpha((int) (255.0f * fMax));
            drawable = this.oz;
        } else {
            if (this.oA == null || !h(view, 5)) {
                return zDrawChild;
            }
            int intrinsicWidth2 = this.oA.getIntrinsicWidth();
            int left2 = view.getLeft();
            float fMax2 = Math.max(0.0f, Math.min((getWidth() - left2) / this.oo.cH(), 1.0f));
            this.oA.setBounds(left2 - intrinsicWidth2, view.getTop(), left2, view.getBottom());
            this.oA.setAlpha((int) (255.0f * fMax2));
            drawable = this.oA;
        }
        drawable.draw(canvas);
        return zDrawChild;
    }

    @Override // android.view.ViewGroup
    protected final ViewGroup.LayoutParams generateDefaultLayoutParams() {
        return new LayoutParams();
    }

    @Override // android.view.ViewGroup
    public final ViewGroup.LayoutParams generateLayoutParams(AttributeSet attributeSet) {
        return new LayoutParams(getContext(), attributeSet);
    }

    @Override // android.view.ViewGroup
    protected final ViewGroup.LayoutParams generateLayoutParams(ViewGroup.LayoutParams layoutParams) {
        if (layoutParams instanceof LayoutParams) {
            return new LayoutParams((LayoutParams) layoutParams);
        }
        return layoutParams instanceof ViewGroup.MarginLayoutParams ? new LayoutParams((ViewGroup.MarginLayoutParams) layoutParams) : new LayoutParams(layoutParams);
    }

    final boolean h(View view, int i) {
        return (t(view) & i) == i;
    }

    @Override // android.view.ViewGroup, android.view.View
    protected final void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.nJ = true;
    }

    @Override // android.view.ViewGroup, android.view.View
    protected final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        this.nJ = true;
    }

    @Override // android.view.View
    public final void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (!this.hh || this.hi == null) {
            return;
        }
        int systemWindowInsetTop = (Build.VERSION.SDK_INT < 21 || this.oB == null) ? 0 : ((WindowInsets) this.oB).getSystemWindowInsetTop();
        if (systemWindowInsetTop > 0) {
            this.hi.setBounds(0, 0, getWidth(), systemWindowInsetTop);
            this.hi.draw(canvas);
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    @Override // android.view.ViewGroup
    public final boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        boolean z;
        boolean z2;
        View viewG;
        int actionMasked = motionEvent.getActionMasked();
        boolean zD = this.on.d(motionEvent) | this.oo.d(motionEvent);
        switch (actionMasked) {
            case 0:
                float x = motionEvent.getX();
                float y = motionEvent.getY();
                this.nA = x;
                this.nB = y;
                z = this.ol > 0.0f && (viewG = this.on.g((int) x, (int) y)) != null && u(viewG);
                this.ow = false;
                this.ox = false;
                break;
            case 1:
            case 3:
                l(true);
                this.ow = false;
                this.ox = false;
                z = false;
                break;
            case 2:
                if (this.on.cK()) {
                    this.op.cx();
                    this.oq.cx();
                }
                z = false;
                break;
            default:
                z = false;
                break;
        }
        if (!zD && !z) {
            int childCount = getChildCount();
            int i = 0;
            while (true) {
                if (i >= childCount) {
                    z2 = false;
                } else if (((LayoutParams) getChildAt(i).getLayoutParams()).oK) {
                    z2 = true;
                } else {
                    i++;
                }
            }
            return z2 || this.ox;
        }
        return true;
    }

    @Override // android.view.View, android.view.KeyEvent.Callback
    public final boolean onKeyDown(int i, KeyEvent keyEvent) {
        if (i == 4) {
            if (cw() != null) {
                keyEvent.startTracking();
                return true;
            }
        }
        return super.onKeyDown(i, keyEvent);
    }

    @Override // android.view.View, android.view.KeyEvent.Callback
    public final boolean onKeyUp(int i, KeyEvent keyEvent) {
        if (i != 4) {
            return super.onKeyUp(i, keyEvent);
        }
        View viewCw = cw();
        if (viewCw != null && r(viewCw) == 0) {
            l(false);
        }
        return viewCw != null;
    }

    @Override // android.view.ViewGroup, android.view.View
    protected final void onLayout(boolean z, int i, int i2, int i3, int i4) {
        float f;
        int i5;
        boolean z2 = true;
        this.mInLayout = true;
        int i6 = i3 - i;
        int childCount = getChildCount();
        int i7 = 0;
        while (i7 < childCount) {
            View childAt = getChildAt(i7);
            if (childAt.getVisibility() != 8) {
                LayoutParams layoutParams = (LayoutParams) childAt.getLayoutParams();
                if (u(childAt)) {
                    childAt.layout(layoutParams.leftMargin, layoutParams.topMargin, layoutParams.leftMargin + childAt.getMeasuredWidth(), layoutParams.topMargin + childAt.getMeasuredHeight());
                } else {
                    int measuredWidth = childAt.getMeasuredWidth();
                    int measuredHeight = childAt.getMeasuredHeight();
                    if (h(childAt, 3)) {
                        float f2 = measuredWidth;
                        i5 = (-measuredWidth) + ((int) (layoutParams.oJ * f2));
                        f = (measuredWidth + i5) / f2;
                    } else {
                        float f3 = measuredWidth;
                        int i8 = i6 - ((int) (layoutParams.oJ * f3));
                        f = (i6 - i8) / f3;
                        i5 = i8;
                    }
                    boolean z3 = f != layoutParams.oJ ? z2 : false;
                    int i9 = layoutParams.gravity & 112;
                    if (i9 == 16) {
                        int i10 = i4 - i2;
                        int i11 = (i10 - measuredHeight) / 2;
                        if (i11 < layoutParams.topMargin) {
                            i11 = layoutParams.topMargin;
                        } else if (i11 + measuredHeight > i10 - layoutParams.bottomMargin) {
                            i11 = (i10 - layoutParams.bottomMargin) - measuredHeight;
                        }
                        childAt.layout(i5, i11, measuredWidth + i5, measuredHeight + i11);
                    } else if (i9 != 80) {
                        childAt.layout(i5, layoutParams.topMargin, measuredWidth + i5, layoutParams.topMargin + measuredHeight);
                    } else {
                        int i12 = i4 - i2;
                        childAt.layout(i5, (i12 - layoutParams.bottomMargin) - childAt.getMeasuredHeight(), measuredWidth + i5, i12 - layoutParams.bottomMargin);
                    }
                    if (z3) {
                        b(childAt, f);
                    }
                    int i13 = layoutParams.oJ > 0.0f ? 0 : 4;
                    if (childAt.getVisibility() != i13) {
                        childAt.setVisibility(i13);
                    }
                }
            }
            i7++;
            z2 = true;
        }
        this.mInLayout = false;
        this.nJ = false;
    }

    @Override // android.view.View
    @SuppressLint({"WrongConstant"})
    protected final void onMeasure(int i, int i2) {
        String hexString;
        int mode = View.MeasureSpec.getMode(i);
        int mode2 = View.MeasureSpec.getMode(i2);
        int size = View.MeasureSpec.getSize(i);
        int size2 = View.MeasureSpec.getSize(i2);
        if (mode != 1073741824 || mode2 != 1073741824) {
            if (!isInEditMode()) {
                throw new IllegalArgumentException("DrawerLayout must be measured with MeasureSpec.EXACTLY.");
            }
            if (mode != Integer.MIN_VALUE && mode == 0) {
                size = 300;
            }
            if (mode2 != Integer.MIN_VALUE && mode2 == 0) {
                size2 = 300;
            }
        }
        setMeasuredDimension(size, size2);
        int i3 = 0;
        boolean z = this.oB != null && n.j(this);
        int iF = n.f(this);
        int childCount = getChildCount();
        int i4 = 0;
        boolean z2 = false;
        boolean z3 = false;
        while (i4 < childCount) {
            View childAt = getChildAt(i4);
            if (childAt.getVisibility() != 8) {
                LayoutParams layoutParams = (LayoutParams) childAt.getLayoutParams();
                if (z) {
                    int absoluteGravity = android.support.v4.view.d.getAbsoluteGravity(layoutParams.gravity, iF);
                    if (n.j(childAt)) {
                        if (Build.VERSION.SDK_INT >= 21) {
                            WindowInsets windowInsetsReplaceSystemWindowInsets = (WindowInsets) this.oB;
                            if (absoluteGravity == 3) {
                                windowInsetsReplaceSystemWindowInsets = windowInsetsReplaceSystemWindowInsets.replaceSystemWindowInsets(windowInsetsReplaceSystemWindowInsets.getSystemWindowInsetLeft(), windowInsetsReplaceSystemWindowInsets.getSystemWindowInsetTop(), i3, windowInsetsReplaceSystemWindowInsets.getSystemWindowInsetBottom());
                            } else if (absoluteGravity == 5) {
                                windowInsetsReplaceSystemWindowInsets = windowInsetsReplaceSystemWindowInsets.replaceSystemWindowInsets(i3, windowInsetsReplaceSystemWindowInsets.getSystemWindowInsetTop(), windowInsetsReplaceSystemWindowInsets.getSystemWindowInsetRight(), windowInsetsReplaceSystemWindowInsets.getSystemWindowInsetBottom());
                            }
                            childAt.dispatchApplyWindowInsets(windowInsetsReplaceSystemWindowInsets);
                        }
                    } else if (Build.VERSION.SDK_INT >= 21) {
                        WindowInsets windowInsetsReplaceSystemWindowInsets2 = (WindowInsets) this.oB;
                        if (absoluteGravity == 3) {
                            windowInsetsReplaceSystemWindowInsets2 = windowInsetsReplaceSystemWindowInsets2.replaceSystemWindowInsets(windowInsetsReplaceSystemWindowInsets2.getSystemWindowInsetLeft(), windowInsetsReplaceSystemWindowInsets2.getSystemWindowInsetTop(), i3, windowInsetsReplaceSystemWindowInsets2.getSystemWindowInsetBottom());
                        } else if (absoluteGravity == 5) {
                            windowInsetsReplaceSystemWindowInsets2 = windowInsetsReplaceSystemWindowInsets2.replaceSystemWindowInsets(i3, windowInsetsReplaceSystemWindowInsets2.getSystemWindowInsetTop(), windowInsetsReplaceSystemWindowInsets2.getSystemWindowInsetRight(), windowInsetsReplaceSystemWindowInsets2.getSystemWindowInsetBottom());
                        }
                        layoutParams.leftMargin = windowInsetsReplaceSystemWindowInsets2.getSystemWindowInsetLeft();
                        layoutParams.topMargin = windowInsetsReplaceSystemWindowInsets2.getSystemWindowInsetTop();
                        layoutParams.rightMargin = windowInsetsReplaceSystemWindowInsets2.getSystemWindowInsetRight();
                        layoutParams.bottomMargin = windowInsetsReplaceSystemWindowInsets2.getSystemWindowInsetBottom();
                    }
                }
                if (u(childAt)) {
                    childAt.measure(View.MeasureSpec.makeMeasureSpec((size - layoutParams.leftMargin) - layoutParams.rightMargin, 1073741824), View.MeasureSpec.makeMeasureSpec((size2 - layoutParams.topMargin) - layoutParams.bottomMargin, 1073741824));
                } else {
                    if (!v(childAt)) {
                        throw new IllegalStateException("Child " + childAt + " at index " + i4 + " does not have a valid layout_gravity - must be Gravity.LEFT, Gravity.RIGHT or Gravity.NO_GRAVITY");
                    }
                    if (og && n.g(childAt) != this.oi) {
                        n.a(childAt, this.oi);
                    }
                    int iT = t(childAt) & 7;
                    int i5 = iT == 3 ? 1 : i3;
                    if ((i5 != 0 && z2) || (i5 == 0 && z3)) {
                        StringBuilder sb = new StringBuilder("Child drawer has absolute gravity ");
                        if ((iT & 3) != 3) {
                            hexString = (iT & 5) == 5 ? "RIGHT" : Integer.toHexString(iT);
                        } else {
                            hexString = "LEFT";
                        }
                        sb.append(hexString);
                        sb.append(" but this DrawerLayout already has a drawer view along that edge");
                        throw new IllegalStateException(sb.toString());
                    }
                    if (i5 != 0) {
                        z2 = true;
                    } else {
                        z3 = true;
                    }
                    childAt.measure(getChildMeasureSpec(i, this.oj + layoutParams.leftMargin + layoutParams.rightMargin, layoutParams.width), getChildMeasureSpec(i2, layoutParams.topMargin + layoutParams.bottomMargin, layoutParams.height));
                }
            }
            i4++;
            i3 = 0;
        }
    }

    @Override // android.view.View
    protected final void onRestoreInstanceState(Parcelable parcelable) {
        View viewH;
        if (!(parcelable instanceof SavedState)) {
            super.onRestoreInstanceState(parcelable);
            return;
        }
        SavedState savedState = (SavedState) parcelable;
        super.onRestoreInstanceState(savedState.getSuperState());
        if (savedState.oM != 0 && (viewH = H(savedState.oM)) != null) {
            w(viewH);
        }
        if (savedState.oN != 3) {
            d(savedState.oN, 3);
        }
        if (savedState.oO != 3) {
            d(savedState.oO, 5);
        }
        if (savedState.oP != 3) {
            d(savedState.oP, 8388611);
        }
        if (savedState.oQ != 3) {
            d(savedState.oQ, 8388613);
        }
    }

    /* JADX WARN: Code duplicated, block: B:12:0x0022  */
    /* JADX WARN: Code duplicated, block: B:21:0x0044  */
    @Override // android.view.View
    public final void onRtlPropertiesChanged(int i) {
        Drawable drawable;
        Drawable drawable2;
        if (og) {
            return;
        }
        int iF = n.f(this);
        if (iF == 0) {
            if (this.oC != null) {
                b(this.oC, iF);
                drawable = this.oC;
            } else {
                drawable = this.oE;
            }
        } else if (this.oD != null) {
            b(this.oD, iF);
            drawable = this.oD;
        } else {
            drawable = this.oE;
        }
        this.oz = drawable;
        int iF2 = n.f(this);
        if (iF2 == 0) {
            if (this.oD != null) {
                b(this.oD, iF2);
                drawable2 = this.oD;
            } else {
                drawable2 = this.oF;
            }
        } else if (this.oC != null) {
            b(this.oC, iF2);
            drawable2 = this.oC;
        } else {
            drawable2 = this.oF;
        }
        this.oA = drawable2;
    }

    @Override // android.view.View
    protected final Parcelable onSaveInstanceState() {
        SavedState savedState = new SavedState(super.onSaveInstanceState());
        int childCount = getChildCount();
        for (int i = 0; i < childCount; i++) {
            LayoutParams layoutParams = (LayoutParams) getChildAt(i).getLayoutParams();
            boolean z = layoutParams.oL == 1;
            boolean z2 = layoutParams.oL == 2;
            if (z || z2) {
                savedState.oM = layoutParams.gravity;
                break;
            }
        }
        savedState.oN = this.os;
        savedState.oO = this.ot;
        savedState.oP = this.ou;
        savedState.oQ = this.ov;
        return savedState;
    }

    /* JADX WARN: Code duplicated, block: B:18:0x0056  */
    /* JADX WARN: Unreachable blocks removed: 1, instructions: 1 */
    @Override // android.view.View
    public final boolean onTouchEvent(MotionEvent motionEvent) {
        boolean z;
        View viewCv;
        this.on.e(motionEvent);
        this.oo.e(motionEvent);
        int action = motionEvent.getAction() & 255;
        if (action != 3) {
            switch (action) {
                case 0:
                    float x = motionEvent.getX();
                    float y = motionEvent.getY();
                    this.nA = x;
                    this.nB = y;
                    break;
                case 1:
                    float x2 = motionEvent.getX();
                    float y2 = motionEvent.getY();
                    View viewG = this.on.g((int) x2, (int) y2);
                    if (viewG == null || !u(viewG)) {
                        z = true;
                    } else {
                        float f = x2 - this.nA;
                        float f2 = y2 - this.nB;
                        int touchSlop = this.on.getTouchSlop();
                        if ((f * f) + (f2 * f2) >= touchSlop * touchSlop || (viewCv = cv()) == null || r(viewCv) == 2) {
                            z = true;
                        } else {
                            z = false;
                        }
                    }
                    l(z);
                    this.ow = false;
                    return true;
                default:
                    return true;
            }
        } else {
            l(true);
        }
        this.ow = false;
        this.ox = false;
        return true;
    }

    public final int r(View view) {
        if (!v(view)) {
            throw new IllegalArgumentException("View " + view + " is not a drawer");
        }
        int i = ((LayoutParams) view.getLayoutParams()).gravity;
        int iF = n.f(this);
        if (i == 3) {
            if (this.os != 3) {
                return this.os;
            }
            int i2 = iF == 0 ? this.ou : this.ov;
            if (i2 != 3) {
                return i2;
            }
            return 0;
        }
        if (i == 5) {
            if (this.ot != 3) {
                return this.ot;
            }
            int i3 = iF == 0 ? this.ov : this.ou;
            if (i3 != 3) {
                return i3;
            }
            return 0;
        }
        if (i == 8388611) {
            if (this.ou != 3) {
                return this.ou;
            }
            int i4 = iF == 0 ? this.os : this.ot;
            if (i4 != 3) {
                return i4;
            }
            return 0;
        }
        if (i != 8388613) {
            return 0;
        }
        if (this.ov != 3) {
            return this.ov;
        }
        int i5 = iF == 0 ? this.ot : this.os;
        if (i5 != 3) {
            return i5;
        }
        return 0;
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final void requestDisallowInterceptTouchEvent(boolean z) {
        super.requestDisallowInterceptTouchEvent(z);
        this.ow = z;
        if (z) {
            l(true);
        }
    }

    @Override // android.view.View, android.view.ViewParent
    public final void requestLayout() {
        if (this.mInLayout) {
            return;
        }
        super.requestLayout();
    }

    public final void x(View view) {
        j jVar;
        int width;
        if (!v(view)) {
            throw new IllegalArgumentException("View " + view + " is not a sliding drawer");
        }
        LayoutParams layoutParams = (LayoutParams) view.getLayoutParams();
        if (this.nJ) {
            layoutParams.oJ = 0.0f;
            layoutParams.oL = 0;
        } else {
            layoutParams.oL |= 4;
            if (h(view, 3)) {
                jVar = this.on;
                width = -view.getWidth();
            } else {
                jVar = this.oo;
                width = getWidth();
            }
            jVar.c(view, width, view.getTop());
        }
        invalidate();
    }
}
