package android.support.v4.widget;

import android.R;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.v4.view.AbsSavedState;
import android.support.v4.view.n;
import android.util.AttributeSet;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;

/* JADX INFO: loaded from: classes.dex */
public final class SlidingPaneLayout extends ViewGroup {
    private final Rect mTmpRect;
    private float nA;
    private float nB;
    private boolean nJ;
    boolean nu;
    final j pA;
    boolean pB;
    final ArrayList pC;
    private Method pD;
    private Field pE;
    private boolean pF;
    private int pp;
    private int pq;
    private Drawable pr;
    private Drawable ps;
    private final int pt;
    private boolean pu;
    View pv;
    float pw;
    private float px;
    int py;
    private int pz;

    public class LayoutParams extends ViewGroup.MarginLayoutParams {
        private static final int[] ATTRS = {R.attr.layout_weight};
        boolean pI;
        boolean pJ;
        Paint pK;
        public float weight;

        public LayoutParams() {
            super(-1, -1);
            this.weight = 0.0f;
        }

        public LayoutParams(Context context, AttributeSet attributeSet) {
            super(context, attributeSet);
            this.weight = 0.0f;
            TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, ATTRS);
            this.weight = typedArrayObtainStyledAttributes.getFloat(0, 0.0f);
            typedArrayObtainStyledAttributes.recycle();
        }

        public LayoutParams(ViewGroup.LayoutParams layoutParams) {
            super(layoutParams);
            this.weight = 0.0f;
        }

        public LayoutParams(ViewGroup.MarginLayoutParams marginLayoutParams) {
            super(marginLayoutParams);
            this.weight = 0.0f;
        }
    }

    class SavedState extends AbsSavedState {
        public static final Parcelable.Creator CREATOR = new i();
        boolean isOpen;

        SavedState(Parcel parcel) {
            super(parcel, null);
            this.isOpen = parcel.readInt() != 0;
        }

        SavedState(Parcelable parcelable) {
            super(parcelable);
        }

        @Override // android.support.v4.view.AbsSavedState, android.os.Parcelable
        public void writeToParcel(Parcel parcel, int i) {
            super.writeToParcel(parcel, i);
            parcel.writeInt(this.isOpen ? 1 : 0);
        }
    }

    private boolean G(View view) {
        if (view == null) {
            return false;
        }
        return this.pu && ((LayoutParams) view.getLayoutParams()).pJ && this.pw > 0.0f;
    }

    private void a(View view, float f, int i) {
        LayoutParams layoutParams = (LayoutParams) view.getLayoutParams();
        if (f <= 0.0f || i == 0) {
            if (view.getLayerType() != 0) {
                if (layoutParams.pK != null) {
                    layoutParams.pK.setColorFilter(null);
                }
                h hVar = new h(this, view);
                this.pC.add(hVar);
                n.b(this, hVar);
                return;
            }
            return;
        }
        int i2 = (((int) ((((-16777216) & i) >>> 24) * f)) << 24) | (i & 16777215);
        if (layoutParams.pK == null) {
            layoutParams.pK = new Paint();
        }
        layoutParams.pK.setColorFilter(new PorterDuffColorFilter(i2, PorterDuff.Mode.SRC_OVER));
        if (view.getLayerType() != 2) {
            view.setLayerType(2, layoutParams.pK);
        }
        F(view);
    }

    private boolean b(float f) {
        if (!this.pu) {
            return false;
        }
        boolean zCF = cF();
        LayoutParams layoutParams = (LayoutParams) this.pv.getLayoutParams();
        if (!this.pA.c(this.pv, zCF ? (int) (getWidth() - (((getPaddingRight() + layoutParams.rightMargin) + (f * this.py)) + this.pv.getWidth())) : (int) (getPaddingLeft() + layoutParams.leftMargin + (f * this.py)), this.pv.getTop())) {
            return false;
        }
        int childCount = getChildCount();
        for (int i = 0; i < childCount; i++) {
            View childAt = getChildAt(i);
            if (childAt.getVisibility() == 4) {
                childAt.setVisibility(0);
            }
        }
        n.d(this);
        return true;
    }

    private boolean cE() {
        if (!this.nJ && !b(0.0f)) {
            return false;
        }
        this.pB = false;
        return true;
    }

    private boolean cF() {
        return n.f(this) == 1;
    }

    final void F(View view) {
        if (Build.VERSION.SDK_INT >= 17) {
            n.a(view, ((LayoutParams) view.getLayoutParams()).pK);
            return;
        }
        if (Build.VERSION.SDK_INT >= 16) {
            if (!this.pF) {
                try {
                    this.pD = View.class.getDeclaredMethod("getDisplayList", null);
                } catch (NoSuchMethodException e) {
                    Log.e("SlidingPaneLayout", "Couldn't fetch getDisplayList method; dimming won't work right.", e);
                }
                try {
                    this.pE = View.class.getDeclaredField("mRecreateDisplayList");
                    this.pE.setAccessible(true);
                } catch (NoSuchFieldException e2) {
                    Log.e("SlidingPaneLayout", "Couldn't fetch mRecreateDisplayList field; dimming will be slow.", e2);
                }
                this.pF = true;
            }
            if (this.pD == null || this.pE == null) {
                view.invalidate();
                return;
            }
            try {
                this.pE.setBoolean(view, true);
                this.pD.invoke(view, null);
            } catch (Exception e3) {
                Log.e("SlidingPaneLayout", "Error refreshing display list state", e3);
            }
        }
        n.a(this, view.getLeft(), view.getTop(), view.getRight(), view.getBottom());
    }

    @Override // android.view.ViewGroup
    protected final boolean checkLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return (layoutParams instanceof LayoutParams) && super.checkLayoutParams(layoutParams);
    }

    @Override // android.view.View
    public final void computeScroll() {
        if (this.pA.cJ()) {
            if (this.pu) {
                n.d(this);
            } else {
                this.pA.abort();
            }
        }
    }

    @Override // android.view.View
    public final void draw(Canvas canvas) {
        int i;
        int right;
        super.draw(canvas);
        Drawable drawable = cF() ? this.ps : this.pr;
        View childAt = getChildCount() > 1 ? getChildAt(1) : null;
        if (childAt == null || drawable == null) {
            return;
        }
        int top = childAt.getTop();
        int bottom = childAt.getBottom();
        int intrinsicWidth = drawable.getIntrinsicWidth();
        if (cF()) {
            right = childAt.getRight();
            i = intrinsicWidth + right;
        } else {
            int left = childAt.getLeft();
            int i2 = left - intrinsicWidth;
            i = left;
            right = i2;
        }
        drawable.setBounds(right, top, i, bottom);
        drawable.draw(canvas);
    }

    @Override // android.view.ViewGroup
    protected final boolean drawChild(Canvas canvas, View view, long j) {
        LayoutParams layoutParams = (LayoutParams) view.getLayoutParams();
        int iSave = canvas.save();
        if (this.pu && !layoutParams.pI && this.pv != null) {
            canvas.getClipBounds(this.mTmpRect);
            if (cF()) {
                this.mTmpRect.left = Math.max(this.mTmpRect.left, this.pv.getRight());
            } else {
                this.mTmpRect.right = Math.min(this.mTmpRect.right, this.pv.getLeft());
            }
            canvas.clipRect(this.mTmpRect);
        }
        boolean zDrawChild = super.drawChild(canvas, view, j);
        canvas.restoreToCount(iSave);
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
        return layoutParams instanceof ViewGroup.MarginLayoutParams ? new LayoutParams((ViewGroup.MarginLayoutParams) layoutParams) : new LayoutParams(layoutParams);
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
        int size = this.pC.size();
        for (int i = 0; i < size; i++) {
            ((h) this.pC.get(i)).run();
        }
        this.pC.clear();
    }

    @Override // android.view.ViewGroup
    public final boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        boolean z;
        View childAt;
        int actionMasked = motionEvent.getActionMasked();
        if (!this.pu && actionMasked == 0 && getChildCount() > 1 && (childAt = getChildAt(1)) != null) {
            this.pB = !j.d(childAt, (int) motionEvent.getX(), (int) motionEvent.getY());
        }
        if (!this.pu || (this.nu && actionMasked != 0)) {
            this.pA.cancel();
            return super.onInterceptTouchEvent(motionEvent);
        }
        if (actionMasked == 3 || actionMasked == 1) {
            this.pA.cancel();
            return false;
        }
        if (actionMasked == 0) {
            this.nu = false;
            float x = motionEvent.getX();
            float y = motionEvent.getY();
            this.nA = x;
            this.nB = y;
            if (j.d(this.pv, (int) x, (int) y) && G(this.pv)) {
                z = true;
            }
            return this.pA.d(motionEvent) || z;
        }
        if (actionMasked == 2) {
            float x2 = motionEvent.getX();
            float y2 = motionEvent.getY();
            float fAbs = Math.abs(x2 - this.nA);
            float fAbs2 = Math.abs(y2 - this.nB);
            if (fAbs > this.pA.getTouchSlop() && fAbs2 > fAbs) {
                this.pA.cancel();
                this.nu = true;
                return false;
            }
        }
        z = false;
        if (this.pA.d(motionEvent)) {
            return true;
        }
    }

    /* JADX WARN: Code duplicated, block: B:107:0x01d0  */
    /* JADX WARN: Code duplicated, block: B:63:0x00fd  */
    /* JADX WARN: Code duplicated, block: B:77:0x013e  */
    @Override // android.view.ViewGroup, android.view.View
    protected final void onLayout(boolean z, int i, int i2, int i3, int i4) {
        int i5;
        int right;
        int left;
        int top;
        int bottom;
        Drawable background;
        boolean z2;
        int i6;
        int i7;
        int i8;
        int i9;
        boolean zCF = cF();
        if (zCF) {
            this.pA.M(2);
        } else {
            this.pA.M(1);
        }
        int i10 = i3 - i;
        int paddingRight = zCF ? getPaddingRight() : getPaddingLeft();
        int paddingLeft = zCF ? getPaddingLeft() : getPaddingRight();
        int paddingTop = getPaddingTop();
        int childCount = getChildCount();
        if (this.nJ) {
            this.pw = (this.pu && this.pB) ? 1.0f : 0.0f;
        }
        int width = paddingRight;
        int i11 = width;
        int i12 = 0;
        while (true) {
            i5 = 8;
            if (i12 >= childCount) {
                break;
            }
            View childAt = getChildAt(i12);
            if (childAt.getVisibility() != 8) {
                LayoutParams layoutParams = (LayoutParams) childAt.getLayoutParams();
                int measuredWidth = childAt.getMeasuredWidth();
                if (layoutParams.pI) {
                    int i13 = i10 - paddingLeft;
                    int iMin = (Math.min(width, i13 - this.pt) - i11) - (layoutParams.leftMargin + layoutParams.rightMargin);
                    this.py = iMin;
                    int i14 = zCF ? layoutParams.rightMargin : layoutParams.leftMargin;
                    layoutParams.pJ = ((i11 + i14) + iMin) + (measuredWidth / 2) > i13;
                    int i15 = (int) (iMin * this.pw);
                    i7 = i14 + i15 + i11;
                    this.pw = i15 / this.py;
                    i6 = 0;
                } else {
                    i6 = (!this.pu || this.pz == 0) ? 0 : (int) ((1.0f - this.pw) * this.pz);
                    i7 = width;
                }
                if (zCF) {
                    i9 = (i10 - i7) + i6;
                    i8 = i9 - measuredWidth;
                } else {
                    i8 = i7 - i6;
                    i9 = i8 + measuredWidth;
                }
                childAt.layout(i8, paddingTop, i9, childAt.getMeasuredHeight() + paddingTop);
                width += childAt.getWidth();
                i11 = i7;
            }
            i12++;
        }
        if (this.nJ) {
            if (this.pu) {
                if (this.pz != 0) {
                    float f = this.pw;
                    boolean zCF2 = cF();
                    LayoutParams layoutParams2 = (LayoutParams) this.pv.getLayoutParams();
                    if (!layoutParams2.pJ) {
                        z2 = false;
                    } else if ((zCF2 ? layoutParams2.rightMargin : layoutParams2.leftMargin) <= 0) {
                        z2 = true;
                    } else {
                        z2 = false;
                    }
                    int childCount2 = getChildCount();
                    for (int i16 = 0; i16 < childCount2; i16++) {
                        View childAt2 = getChildAt(i16);
                        if (childAt2 != this.pv) {
                            int i17 = (int) ((1.0f - this.px) * this.pz);
                            this.px = f;
                            int i18 = i17 - ((int) ((1.0f - f) * this.pz));
                            if (zCF2) {
                                i18 = -i18;
                            }
                            childAt2.offsetLeftAndRight(i18);
                            if (z2) {
                                a(childAt2, zCF2 ? this.px - 1.0f : 1.0f - this.px, this.pq);
                            }
                        }
                    }
                }
                if (((LayoutParams) this.pv.getLayoutParams()).pJ) {
                    a(this.pv, this.pw, this.pp);
                }
            } else {
                for (int i19 = 0; i19 < childCount; i19++) {
                    a(getChildAt(i19), 0.0f, this.pp);
                }
            }
            View view = this.pv;
            boolean zCF3 = cF();
            int width2 = zCF3 ? getWidth() - getPaddingRight() : getPaddingLeft();
            int paddingLeft2 = zCF3 ? getPaddingLeft() : getWidth() - getPaddingRight();
            int paddingTop2 = getPaddingTop();
            int height = getHeight() - getPaddingBottom();
            if (view == null) {
                right = 0;
                left = 0;
                top = 0;
                bottom = 0;
            } else if (view.isOpaque() || (Build.VERSION.SDK_INT < 18 && (background = view.getBackground()) != null && background.getOpacity() == -1)) {
                left = view.getLeft();
                right = view.getRight();
                top = view.getTop();
                bottom = view.getBottom();
            } else {
                right = 0;
                left = 0;
                top = 0;
                bottom = 0;
            }
            int childCount3 = getChildCount();
            int i20 = 0;
            while (i20 < childCount3) {
                View childAt3 = getChildAt(i20);
                if (childAt3 == view) {
                    break;
                }
                if (childAt3.getVisibility() != i5) {
                    childAt3.setVisibility((Math.max(zCF3 ? paddingLeft2 : width2, childAt3.getLeft()) < left || Math.max(paddingTop2, childAt3.getTop()) < top || Math.min(zCF3 ? width2 : paddingLeft2, childAt3.getRight()) > right || Math.min(height, childAt3.getBottom()) > bottom) ? 0 : 4);
                } else {
                    view = view;
                    zCF3 = zCF3;
                }
                i20++;
                view = view;
                zCF3 = zCF3;
                i5 = 8;
            }
        }
        this.nJ = false;
    }

    /* JADX WARN: Code duplicated, block: B:119:0x01db  */
    /* JADX WARN: Code duplicated, block: B:121:0x01ec  */
    /* JADX WARN: Code duplicated, block: B:122:0x01f0  */
    /* JADX WARN: Code duplicated, block: B:123:0x0208  */
    /* JADX WARN: Code duplicated, block: B:38:0x00ad A[PHI: r12
      0x00ad: PHI (r12v2 float) = (r12v1 float), (r12v3 float) binds: [B:35:0x00a4, B:37:0x00ab] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Code duplicated, block: B:40:0x00b7  */
    /* JADX WARN: Code duplicated, block: B:41:0x00c2  */
    /* JADX WARN: Code duplicated, block: B:43:0x00c7  */
    /* JADX WARN: Code duplicated, block: B:45:0x00d0  */
    /* JADX WARN: Code duplicated, block: B:48:0x00da  */
    /* JADX WARN: Code duplicated, block: B:50:0x00e1  */
    /* JADX WARN: Code duplicated, block: B:52:0x00e6  */
    /* JADX WARN: Code duplicated, block: B:53:0x00e9  */
    /* JADX WARN: Code duplicated, block: B:56:0x0100 A[ADDED_TO_REGION] */
    /* JADX WARN: Code duplicated, block: B:60:0x0109  */
    /* JADX WARN: Code duplicated, block: B:61:0x010c  */
    /* JADX WARN: Code duplicated, block: B:64:0x0114  */
    @Override // android.view.View
    protected final void onMeasure(int i, int i2) {
        int paddingTop;
        int paddingTop2;
        int i3;
        int i4;
        int i5;
        int measuredHeight;
        int iMakeMeasureSpec;
        int iMakeMeasureSpec2;
        int i6;
        int iMakeMeasureSpec3;
        int i7;
        int measuredHeight2;
        int iMakeMeasureSpec4;
        int i8;
        int i9;
        int i10;
        int iMakeMeasureSpec5;
        int iMakeMeasureSpec6;
        int i11;
        int measuredHeight3;
        boolean z;
        int mode = View.MeasureSpec.getMode(i);
        int size = View.MeasureSpec.getSize(i);
        int mode2 = View.MeasureSpec.getMode(i2);
        int size2 = View.MeasureSpec.getSize(i2);
        if (mode != 1073741824) {
            if (!isInEditMode()) {
                throw new IllegalStateException("Width must have an exact value or MATCH_PARENT");
            }
            if (mode != Integer.MIN_VALUE && mode == 0) {
                size = 300;
            }
        } else if (mode2 == 0) {
            if (!isInEditMode()) {
                throw new IllegalStateException("Height must not be UNSPECIFIED");
            }
            if (mode2 == 0) {
                size2 = 300;
                mode2 = Integer.MIN_VALUE;
            }
        }
        boolean z2 = false;
        if (mode2 != Integer.MIN_VALUE) {
            paddingTop2 = mode2 != 1073741824 ? 0 : (size2 - getPaddingTop()) - getPaddingBottom();
            paddingTop = paddingTop2;
        } else {
            paddingTop = (size2 - getPaddingTop()) - getPaddingBottom();
            paddingTop2 = 0;
        }
        int paddingLeft = (size - getPaddingLeft()) - getPaddingRight();
        int childCount = getChildCount();
        if (childCount > 2) {
            Log.e("SlidingPaneLayout", "onMeasure: More than two child views are not supported.");
        }
        this.pv = null;
        boolean z3 = false;
        int iMin = paddingTop2;
        int i12 = paddingLeft;
        float f = 0.0f;
        int i13 = 0;
        while (true) {
            i3 = 8;
            if (i13 >= childCount) {
                break;
            }
            View childAt = getChildAt(i13);
            LayoutParams layoutParams = (LayoutParams) childAt.getLayoutParams();
            if (childAt.getVisibility() == 8) {
                layoutParams.pJ = z2;
            } else if (layoutParams.weight > 0.0f) {
                f += layoutParams.weight;
                if (layoutParams.width != 0) {
                    i8 = layoutParams.leftMargin + layoutParams.rightMargin;
                    if (layoutParams.width == -2) {
                        iMakeMeasureSpec5 = View.MeasureSpec.makeMeasureSpec(paddingLeft - i8, Integer.MIN_VALUE);
                    } else {
                        if (layoutParams.width == -1) {
                            i10 = paddingLeft - i8;
                            i9 = 1073741824;
                        } else {
                            i9 = 1073741824;
                            i10 = layoutParams.width;
                        }
                        iMakeMeasureSpec5 = View.MeasureSpec.makeMeasureSpec(i10, i9);
                    }
                    if (layoutParams.height == -2) {
                        i11 = Integer.MIN_VALUE;
                    } else {
                        if (layoutParams.height == -1) {
                            i11 = 1073741824;
                        } else {
                            iMakeMeasureSpec6 = View.MeasureSpec.makeMeasureSpec(layoutParams.height, 1073741824);
                        }
                        childAt.measure(iMakeMeasureSpec5, iMakeMeasureSpec6);
                        int measuredWidth = childAt.getMeasuredWidth();
                        measuredHeight3 = childAt.getMeasuredHeight();
                        if (mode2 == Integer.MIN_VALUE && measuredHeight3 > iMin) {
                            iMin = Math.min(measuredHeight3, paddingTop);
                        }
                        i12 -= measuredWidth;
                        if (i12 < 0) {
                            z = true;
                        } else {
                            z = false;
                        }
                        layoutParams.pI = z;
                        boolean z4 = z | z3;
                        if (layoutParams.pI) {
                            this.pv = childAt;
                        }
                        z3 = z4;
                    }
                    iMakeMeasureSpec6 = View.MeasureSpec.makeMeasureSpec(paddingTop, i11);
                    childAt.measure(iMakeMeasureSpec5, iMakeMeasureSpec6);
                    int measuredWidth2 = childAt.getMeasuredWidth();
                    measuredHeight3 = childAt.getMeasuredHeight();
                    if (mode2 == Integer.MIN_VALUE) {
                        iMin = Math.min(measuredHeight3, paddingTop);
                    }
                    i12 -= measuredWidth2;
                    if (i12 < 0) {
                        z = true;
                    } else {
                        z = false;
                    }
                    layoutParams.pI = z;
                    boolean z5 = z | z3;
                    if (layoutParams.pI) {
                        this.pv = childAt;
                    }
                    z3 = z5;
                }
            } else {
                i8 = layoutParams.leftMargin + layoutParams.rightMargin;
                if (layoutParams.width == -2) {
                    iMakeMeasureSpec5 = View.MeasureSpec.makeMeasureSpec(paddingLeft - i8, Integer.MIN_VALUE);
                } else {
                    if (layoutParams.width == -1) {
                        i10 = paddingLeft - i8;
                        i9 = 1073741824;
                    } else {
                        i9 = 1073741824;
                        i10 = layoutParams.width;
                    }
                    iMakeMeasureSpec5 = View.MeasureSpec.makeMeasureSpec(i10, i9);
                }
                if (layoutParams.height == -2) {
                    i11 = Integer.MIN_VALUE;
                } else {
                    if (layoutParams.height == -1) {
                        i11 = 1073741824;
                    } else {
                        iMakeMeasureSpec6 = View.MeasureSpec.makeMeasureSpec(layoutParams.height, 1073741824);
                    }
                    childAt.measure(iMakeMeasureSpec5, iMakeMeasureSpec6);
                    int measuredWidth3 = childAt.getMeasuredWidth();
                    measuredHeight3 = childAt.getMeasuredHeight();
                    if (mode2 == Integer.MIN_VALUE) {
                        iMin = Math.min(measuredHeight3, paddingTop);
                    }
                    i12 -= measuredWidth3;
                    if (i12 < 0) {
                        z = true;
                    } else {
                        z = false;
                    }
                    layoutParams.pI = z;
                    boolean z6 = z | z3;
                    if (layoutParams.pI) {
                        this.pv = childAt;
                    }
                    z3 = z6;
                }
                iMakeMeasureSpec6 = View.MeasureSpec.makeMeasureSpec(paddingTop, i11);
                childAt.measure(iMakeMeasureSpec5, iMakeMeasureSpec6);
                int measuredWidth4 = childAt.getMeasuredWidth();
                measuredHeight3 = childAt.getMeasuredHeight();
                if (mode2 == Integer.MIN_VALUE) {
                    iMin = Math.min(measuredHeight3, paddingTop);
                }
                i12 -= measuredWidth4;
                if (i12 < 0) {
                    z = true;
                } else {
                    z = false;
                }
                layoutParams.pI = z;
                boolean z7 = z | z3;
                if (layoutParams.pI) {
                    this.pv = childAt;
                }
                z3 = z7;
            }
            i13++;
            z2 = false;
        }
        if (z3 || f > 0.0f) {
            int i14 = paddingLeft - this.pt;
            int i15 = 0;
            while (i15 < childCount) {
                View childAt2 = getChildAt(i15);
                if (childAt2.getVisibility() != i3) {
                    LayoutParams layoutParams2 = (LayoutParams) childAt2.getLayoutParams();
                    if (childAt2.getVisibility() == i3) {
                        i4 = i14;
                    } else {
                        boolean z8 = layoutParams2.width == 0 && layoutParams2.weight > 0.0f;
                        int measuredWidth5 = z8 ? 0 : childAt2.getMeasuredWidth();
                        if (!z3 || childAt2 == this.pv) {
                            if (layoutParams2.weight > 0.0f) {
                                if (layoutParams2.width == 0) {
                                    if (layoutParams2.height == -2) {
                                        iMakeMeasureSpec2 = View.MeasureSpec.makeMeasureSpec(paddingTop, Integer.MIN_VALUE);
                                    } else {
                                        if (layoutParams2.height == -1) {
                                            iMakeMeasureSpec = View.MeasureSpec.makeMeasureSpec(paddingTop, 1073741824);
                                        } else {
                                            i5 = 1073741824;
                                            measuredHeight = layoutParams2.height;
                                        }
                                        iMakeMeasureSpec2 = iMakeMeasureSpec;
                                    }
                                    if (z3) {
                                        i6 = paddingLeft - (layoutParams2.leftMargin + layoutParams2.rightMargin);
                                        i4 = i14;
                                        iMakeMeasureSpec3 = View.MeasureSpec.makeMeasureSpec(i6, 1073741824);
                                        if (measuredWidth5 != i6) {
                                            childAt2.measure(iMakeMeasureSpec3, iMakeMeasureSpec2);
                                        }
                                    } else {
                                        i4 = i14;
                                        childAt2.measure(View.MeasureSpec.makeMeasureSpec(measuredWidth5 + ((int) ((layoutParams2.weight * Math.max(0, i12)) / f)), 1073741824), iMakeMeasureSpec2);
                                    }
                                } else {
                                    i5 = 1073741824;
                                    measuredHeight = childAt2.getMeasuredHeight();
                                }
                                iMakeMeasureSpec = View.MeasureSpec.makeMeasureSpec(measuredHeight, i5);
                                iMakeMeasureSpec2 = iMakeMeasureSpec;
                                if (z3) {
                                    i6 = paddingLeft - (layoutParams2.leftMargin + layoutParams2.rightMargin);
                                    i4 = i14;
                                    iMakeMeasureSpec3 = View.MeasureSpec.makeMeasureSpec(i6, 1073741824);
                                    if (measuredWidth5 != i6) {
                                        childAt2.measure(iMakeMeasureSpec3, iMakeMeasureSpec2);
                                    }
                                } else {
                                    i4 = i14;
                                    childAt2.measure(View.MeasureSpec.makeMeasureSpec(measuredWidth5 + ((int) ((layoutParams2.weight * Math.max(0, i12)) / f)), 1073741824), iMakeMeasureSpec2);
                                }
                            }
                        } else if (layoutParams2.width < 0 && (measuredWidth5 > i14 || layoutParams2.weight > 0.0f)) {
                            if (z8) {
                                if (layoutParams2.height == -2) {
                                    iMakeMeasureSpec4 = View.MeasureSpec.makeMeasureSpec(paddingTop, Integer.MIN_VALUE);
                                    i7 = 1073741824;
                                } else if (layoutParams2.height == -1) {
                                    i7 = 1073741824;
                                    iMakeMeasureSpec4 = View.MeasureSpec.makeMeasureSpec(paddingTop, 1073741824);
                                } else {
                                    i7 = 1073741824;
                                    measuredHeight2 = layoutParams2.height;
                                }
                                childAt2.measure(View.MeasureSpec.makeMeasureSpec(i14, i7), iMakeMeasureSpec4);
                            } else {
                                i7 = 1073741824;
                                measuredHeight2 = childAt2.getMeasuredHeight();
                            }
                            iMakeMeasureSpec4 = View.MeasureSpec.makeMeasureSpec(measuredHeight2, i7);
                            childAt2.measure(View.MeasureSpec.makeMeasureSpec(i14, i7), iMakeMeasureSpec4);
                        }
                        i4 = i14;
                    }
                } else {
                    i4 = i14;
                }
                i15++;
                i14 = i4;
                i3 = 8;
            }
        }
        setMeasuredDimension(size, iMin + getPaddingTop() + getPaddingBottom());
        this.pu = z3;
        if (this.pA.cG() == 0 || z3) {
            return;
        }
        this.pA.abort();
    }

    @Override // android.view.View
    protected final void onRestoreInstanceState(Parcelable parcelable) {
        if (!(parcelable instanceof SavedState)) {
            super.onRestoreInstanceState(parcelable);
            return;
        }
        SavedState savedState = (SavedState) parcelable;
        super.onRestoreInstanceState(savedState.getSuperState());
        if (!savedState.isOpen) {
            cE();
        } else if (this.nJ || b(1.0f)) {
            this.pB = true;
        }
        this.pB = savedState.isOpen;
    }

    @Override // android.view.View
    protected final Parcelable onSaveInstanceState() {
        boolean z;
        SavedState savedState = new SavedState(super.onSaveInstanceState());
        if (this.pu) {
            z = !this.pu || this.pw == 1.0f;
        } else {
            z = this.pB;
        }
        savedState.isOpen = z;
        return savedState;
    }

    @Override // android.view.View
    protected final void onSizeChanged(int i, int i2, int i3, int i4) {
        super.onSizeChanged(i, i2, i3, i4);
        if (i != i3) {
            this.nJ = true;
        }
    }

    @Override // android.view.View
    public final boolean onTouchEvent(MotionEvent motionEvent) {
        if (!this.pu) {
            return super.onTouchEvent(motionEvent);
        }
        this.pA.e(motionEvent);
        switch (motionEvent.getActionMasked()) {
            case 0:
                float x = motionEvent.getX();
                float y = motionEvent.getY();
                this.nA = x;
                this.nB = y;
                return true;
            case 1:
                if (!G(this.pv)) {
                    return true;
                }
                float x2 = motionEvent.getX();
                float y2 = motionEvent.getY();
                float f = x2 - this.nA;
                float f2 = y2 - this.nB;
                int touchSlop = this.pA.getTouchSlop();
                if ((f * f) + (f2 * f2) >= touchSlop * touchSlop || !j.d(this.pv, (int) x2, (int) y2)) {
                    return true;
                }
                cE();
                return true;
            default:
                return true;
        }
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final void requestChildFocus(View view, View view2) {
        super.requestChildFocus(view, view2);
        if (isInTouchMode() || this.pu) {
            return;
        }
        this.pB = view == this.pv;
    }
}
