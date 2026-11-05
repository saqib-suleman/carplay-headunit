package android.support.v4.view;

import android.R;
import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.AttributeSet;
import android.util.Log;
import android.view.FocusFinder;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.SoundEffectConstants;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.accessibility.AccessibilityEvent;
import android.view.animation.Interpolator;
import android.widget.EdgeEffect;
import android.widget.Scroller;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public final class ViewPager extends ViewGroup {
    private int mActivePointerId;
    private boolean mInLayout;
    private final ArrayList mItems;
    private Scroller mScroller;
    private boolean mScrollingCacheEnabled;
    private final Rect mTempRect;
    private VelocityTracker mVelocityTracker;
    private float nA;
    private float nB;
    private int nC;
    private int nD;
    private int nE;
    private int nF;
    private boolean nG;
    private EdgeEffect nH;
    private EdgeEffect nI;
    private boolean nJ;
    private boolean nK;
    private boolean nL;
    private int nM;
    private List nN;
    private t nO;
    private int nP;
    private int nQ;
    private ArrayList nR;
    private final Runnable nT;
    private int nU;
    private int na;
    private final s nc;
    m nd;
    int ne;
    private int nf;
    private Parcelable ng;
    private ClassLoader nh;
    private boolean ni;
    private int nj;
    private Drawable nk;
    private int nl;
    private int nm;
    private float nn;
    private float no;
    private int np;
    private int nq;
    private boolean nr;
    private int ns;
    private boolean nt;
    private boolean nu;
    private int nv;
    private int nw;
    private int nx;
    private float ny;
    private float nz;
    static final int[] mZ = {R.attr.layout_gravity};
    private static final Comparator COMPARATOR = new p();
    private static final Interpolator nb = new q();
    private static final v nS = new v();

    public class LayoutParams extends ViewGroup.LayoutParams {
        int childIndex;
        public int gravity;
        public boolean isDecor;
        boolean needsMeasure;
        int position;
        float widthFactor;

        public LayoutParams() {
            super(-1, -1);
            this.widthFactor = 0.0f;
        }

        public LayoutParams(Context context, AttributeSet attributeSet) {
            super(context, attributeSet);
            this.widthFactor = 0.0f;
            TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, ViewPager.mZ);
            this.gravity = typedArrayObtainStyledAttributes.getInteger(0, 48);
            typedArrayObtainStyledAttributes.recycle();
        }
    }

    public class SavedState extends AbsSavedState {
        public static final Parcelable.Creator CREATOR = new u();
        Parcelable adapterState;
        ClassLoader loader;
        int position;

        SavedState(Parcel parcel, ClassLoader classLoader) {
            super(parcel, classLoader);
            classLoader = classLoader == null ? getClass().getClassLoader() : classLoader;
            this.position = parcel.readInt();
            this.adapterState = parcel.readParcelable(classLoader);
            this.loader = classLoader;
        }

        public SavedState(Parcelable parcelable) {
            super(parcelable);
        }

        public String toString() {
            return "FragmentPager.SavedState{" + Integer.toHexString(System.identityHashCode(this)) + " position=" + this.position + "}";
        }

        @Override // android.support.v4.view.AbsSavedState, android.os.Parcelable
        public void writeToParcel(Parcel parcel, int i) {
            super.writeToParcel(parcel, i);
            parcel.writeInt(this.position);
            parcel.writeParcelable(this.adapterState, i);
        }
    }

    private void E(int i) {
        this.nr = false;
        a(i, true, false);
    }

    private static s F(int i) {
        new s().position = i;
        throw new UnsupportedOperationException("Required method instantiateItem was not overridden");
    }

    private s G(int i) {
        for (int i2 = 0; i2 < this.mItems.size(); i2++) {
            s sVar = (s) this.mItems.get(i2);
            if (sVar.position == i) {
                return sVar;
            }
        }
        return null;
    }

    private Rect a(Rect rect, View view) {
        if (rect == null) {
            rect = new Rect();
        }
        if (view == null) {
            rect.set(0, 0, 0, 0);
            return rect;
        }
        rect.left = view.getLeft();
        rect.right = view.getRight();
        rect.top = view.getTop();
        rect.bottom = view.getBottom();
        ViewParent parent = view.getParent();
        while ((parent instanceof ViewGroup) && parent != this) {
            ViewGroup viewGroup = (ViewGroup) parent;
            rect.left += viewGroup.getLeft();
            rect.right += viewGroup.getRight();
            rect.top += viewGroup.getTop();
            rect.bottom += viewGroup.getBottom();
            parent = viewGroup.getParent();
        }
        return rect;
    }

    private void a(int i, boolean z, int i2, boolean z2) {
        int scrollX;
        s sVarG = G(i);
        int iCh = sVarG != null ? (int) (ch() * Math.max(this.nn, Math.min(sVarG.offset, this.no))) : 0;
        if (!z) {
            if (z2) {
                cm();
            }
            k(false);
            scrollTo(iCh, 0);
            ck();
            return;
        }
        if (getChildCount() == 0) {
            setScrollingCacheEnabled(false);
        } else {
            if ((this.mScroller == null || this.mScroller.isFinished()) ? false : true) {
                scrollX = this.ni ? this.mScroller.getCurrX() : this.mScroller.getStartX();
                this.mScroller.abortAnimation();
                setScrollingCacheEnabled(false);
            } else {
                scrollX = getScrollX();
            }
            int i3 = scrollX;
            int scrollY = getScrollY();
            int i4 = iCh - i3;
            int i5 = 0 - scrollY;
            if (i4 == 0 && i5 == 0) {
                k(false);
                populate();
                setScrollState(0);
            } else {
                setScrollingCacheEnabled(true);
                setScrollState(2);
                int iCh2 = ch();
                int i6 = iCh2 / 2;
                float f = iCh2;
                float f2 = i6;
                float fSin = f2 + (((float) Math.sin((Math.min(1.0f, (Math.abs(i4) * 1.0f) / f) - 0.5f) * 0.47123894f)) * f2);
                int iAbs = Math.abs(i2);
                int iMin = Math.min(iAbs > 0 ? 4 * Math.round(1000.0f * Math.abs(fSin / iAbs)) : (int) (((Math.abs(i4) / ((f * 1.0f) + this.nj)) + 1.0f) * 100.0f), 600);
                this.ni = false;
                this.mScroller.startScroll(i3, scrollY, i4, i5, iMin);
                n.d(this);
            }
        }
        if (z2) {
            cm();
        }
    }

    private void a(int i, boolean z, boolean z2) {
        a(i, z, z2, 0);
    }

    private void a(int i, boolean z, boolean z2, int i2) {
        if (this.nd == null || this.nd.getCount() <= 0) {
            setScrollingCacheEnabled(false);
            return;
        }
        if (!z2 && this.ne == i && this.mItems.size() != 0) {
            setScrollingCacheEnabled(false);
            return;
        }
        if (i < 0) {
            i = 0;
        } else if (i >= this.nd.getCount()) {
            i = this.nd.getCount() - 1;
        }
        int i3 = this.ns;
        if (i > this.ne + i3 || i < this.ne - i3) {
            for (int i4 = 0; i4 < this.mItems.size(); i4++) {
                ((s) this.mItems.get(i4)).scrolling = true;
            }
        }
        boolean z3 = this.ne != i;
        if (!this.nJ) {
            populate(i);
            a(i, z, i2, z3);
        } else {
            this.ne = i;
            if (z3) {
                cm();
            }
            requestLayout();
        }
    }

    private void a(s sVar, int i, s sVar2) {
        s sVar3;
        s sVar4;
        int count = this.nd.getCount();
        int iCh = ch();
        float f = iCh > 0 ? this.nj / iCh : 0.0f;
        if (sVar2 != null) {
            int i2 = sVar2.position;
            if (i2 < sVar.position) {
                float f2 = sVar2.offset + sVar2.widthFactor + f;
                int i3 = i2 + 1;
                int i4 = 0;
                while (i3 <= sVar.position && i4 < this.mItems.size()) {
                    while (true) {
                        sVar4 = (s) this.mItems.get(i4);
                        if (i3 <= sVar4.position || i4 >= this.mItems.size() - 1) {
                            break;
                        } else {
                            i4++;
                        }
                    }
                    while (i3 < sVar4.position) {
                        f2 += 1.0f + f;
                        i3++;
                    }
                    sVar4.offset = f2;
                    f2 += sVar4.widthFactor + f;
                    i3++;
                }
            } else if (i2 > sVar.position) {
                int size = this.mItems.size() - 1;
                float f3 = sVar2.offset;
                while (true) {
                    i2--;
                    if (i2 < sVar.position || size < 0) {
                        break;
                    }
                    while (true) {
                        sVar3 = (s) this.mItems.get(size);
                        if (i2 >= sVar3.position || size <= 0) {
                            break;
                        } else {
                            size--;
                        }
                    }
                    while (i2 > sVar3.position) {
                        f3 -= 1.0f + f;
                        i2--;
                    }
                    f3 -= sVar3.widthFactor + f;
                    sVar3.offset = f3;
                }
            }
        }
        int size2 = this.mItems.size();
        float f4 = sVar.offset;
        int i5 = sVar.position - 1;
        this.nn = sVar.position == 0 ? sVar.offset : -3.4028235E38f;
        int i6 = count - 1;
        this.no = sVar.position == i6 ? (sVar.offset + sVar.widthFactor) - 1.0f : Float.MAX_VALUE;
        int i7 = i - 1;
        while (i7 >= 0) {
            s sVar5 = (s) this.mItems.get(i7);
            while (i5 > sVar5.position) {
                i5--;
                f4 -= 1.0f + f;
            }
            f4 -= sVar5.widthFactor + f;
            sVar5.offset = f4;
            if (sVar5.position == 0) {
                this.nn = f4;
            }
            i7--;
            i5--;
        }
        float f5 = sVar.offset + sVar.widthFactor + f;
        int i8 = sVar.position + 1;
        int i9 = i + 1;
        while (i9 < size2) {
            s sVar6 = (s) this.mItems.get(i9);
            while (i8 < sVar6.position) {
                i8++;
                f5 += 1.0f + f;
            }
            if (sVar6.position == i6) {
                this.no = (sVar6.widthFactor + f5) - 1.0f;
            }
            sVar6.offset = f5;
            f5 += sVar6.widthFactor + f;
            i9++;
            i8++;
        }
        this.nK = false;
    }

    private boolean a(float f) {
        boolean z;
        boolean z2;
        float f2 = this.ny - f;
        this.ny = f;
        float scrollX = getScrollX() + f2;
        float fCh = ch();
        float f3 = this.nn * fCh;
        float f4 = this.no * fCh;
        boolean z3 = false;
        s sVar = (s) this.mItems.get(0);
        s sVar2 = (s) this.mItems.get(this.mItems.size() - 1);
        if (sVar.position != 0) {
            f3 = sVar.offset * fCh;
            z = false;
        } else {
            z = true;
        }
        if (sVar2.position != this.nd.getCount() - 1) {
            f4 = sVar2.offset * fCh;
            z2 = false;
        } else {
            z2 = true;
        }
        if (scrollX < f3) {
            if (z) {
                this.nH.onPull(Math.abs(f3 - scrollX) / fCh);
                z3 = true;
            }
            scrollX = f3;
        } else if (scrollX > f4) {
            if (z2) {
                this.nI.onPull(Math.abs(scrollX - f4) / fCh);
                z3 = true;
            }
            scrollX = f4;
        }
        int i = (int) scrollX;
        this.ny += scrollX - i;
        scrollTo(i, getScrollY());
        ck();
        return z3;
    }

    /* JADX WARN: Code duplicated, block: B:19:0x0065  */
    /* JADX WARN: Code duplicated, block: B:40:0x00b3  */
    /* JADX WARN: Code duplicated, block: B:41:0x00b8  */
    private boolean arrowScroll(int i) {
        boolean z;
        View viewFindFocus = findFocus();
        boolean zPageRight = false;
        View view = null;
        if (viewFindFocus != this) {
            if (viewFindFocus != null) {
                ViewParent parent = viewFindFocus.getParent();
                while (true) {
                    if (!(parent instanceof ViewGroup)) {
                        z = false;
                        break;
                    }
                    if (parent == this) {
                        z = true;
                        break;
                    }
                    parent = parent.getParent();
                }
                if (z) {
                    view = viewFindFocus;
                } else {
                    StringBuilder sb = new StringBuilder();
                    sb.append(viewFindFocus.getClass().getSimpleName());
                    for (ViewParent parent2 = viewFindFocus.getParent(); parent2 instanceof ViewGroup; parent2 = parent2.getParent()) {
                        sb.append(" => ");
                        sb.append(parent2.getClass().getSimpleName());
                    }
                    Log.e("ViewPager", "arrowScroll tried to find focus based on non-child current focused view " + sb.toString());
                }
            } else {
                view = viewFindFocus;
            }
        }
        View viewFindNextFocus = FocusFinder.getInstance().findNextFocus(this, view, i);
        if (viewFindNextFocus != null && viewFindNextFocus != view) {
            if (i == 17) {
                int i2 = a(this.mTempRect, viewFindNextFocus).left;
                int i3 = a(this.mTempRect, view).left;
                if (view != null && i2 >= i3) {
                    zPageRight = pageLeft();
                }
            } else if (i == 66) {
                int i4 = a(this.mTempRect, viewFindNextFocus).left;
                int i5 = a(this.mTempRect, view).left;
                if (view != null && i4 <= i5) {
                    zPageRight = pageRight();
                }
            }
            zPageRight = viewFindNextFocus.requestFocus();
        } else if (i == 17 || i == 1) {
            zPageRight = pageLeft();
        } else if (i == 66 || i == 2) {
            zPageRight = pageRight();
        }
        if (zPageRight) {
            playSoundEffect(SoundEffectConstants.getContantForFocusDirection(i));
        }
        return zPageRight;
    }

    private void b(MotionEvent motionEvent) {
        int actionIndex = motionEvent.getActionIndex();
        if (motionEvent.getPointerId(actionIndex) == this.mActivePointerId) {
            int i = actionIndex == 0 ? 1 : 0;
            this.ny = motionEvent.getX(i);
            this.mActivePointerId = motionEvent.getPointerId(i);
            if (this.mVelocityTracker != null) {
                this.mVelocityTracker.clear();
            }
        }
    }

    private boolean canScroll(View view, boolean z, int i, int i2, int i3) {
        int i4;
        if (view instanceof ViewGroup) {
            ViewGroup viewGroup = (ViewGroup) view;
            int scrollX = view.getScrollX();
            int scrollY = view.getScrollY();
            for (int childCount = viewGroup.getChildCount() - 1; childCount >= 0; childCount--) {
                View childAt = viewGroup.getChildAt(childCount);
                int i5 = i2 + scrollX;
                if (i5 >= childAt.getLeft() && i5 < childAt.getRight() && (i4 = i3 + scrollY) >= childAt.getTop() && i4 < childAt.getBottom() && canScroll(childAt, true, i, i5 - childAt.getLeft(), i4 - childAt.getTop())) {
                    return true;
                }
            }
        }
        return z && view.canScrollHorizontally(-i);
    }

    private int ch() {
        return (getMeasuredWidth() - getPaddingLeft()) - getPaddingRight();
    }

    private void ci() {
        if (this.nQ != 0) {
            if (this.nR == null) {
                this.nR = new ArrayList();
            } else {
                this.nR.clear();
            }
            int childCount = getChildCount();
            for (int i = 0; i < childCount; i++) {
                this.nR.add(getChildAt(i));
            }
            Collections.sort(this.nR, nS);
        }
    }

    private s cj() {
        for (int i = 0; i < this.mItems.size(); i++) {
            s sVar = (s) this.mItems.get(i);
            if (this.nd.cf()) {
                return sVar;
            }
        }
        return null;
    }

    private boolean ck() {
        if (this.mItems.size() == 0) {
            if (this.nJ) {
                return false;
            }
            this.nL = false;
            cl();
            if (this.nL) {
                return false;
            }
            throw new IllegalStateException("onPageScrolled did not call superclass implementation");
        }
        cp();
        ch();
        this.nL = false;
        cl();
        if (this.nL) {
            return true;
        }
        throw new IllegalStateException("onPageScrolled did not call superclass implementation");
    }

    /* JADX WARN: Code duplicated, block: B:21:0x0065  */
    private void cl() {
        int iMax;
        int width;
        int left;
        if (this.nM > 0) {
            int scrollX = getScrollX();
            int paddingLeft = getPaddingLeft();
            int paddingRight = getPaddingRight();
            int width2 = getWidth();
            int childCount = getChildCount();
            int measuredWidth = paddingRight;
            int i = paddingLeft;
            for (int i2 = 0; i2 < childCount; i2++) {
                View childAt = getChildAt(i2);
                LayoutParams layoutParams = (LayoutParams) childAt.getLayoutParams();
                if (layoutParams.isDecor) {
                    int i3 = layoutParams.gravity & 7;
                    if (i3 != 1) {
                        if (i3 == 3) {
                            width = childAt.getWidth() + i;
                        } else if (i3 != 5) {
                            width = i;
                        } else {
                            iMax = (width2 - measuredWidth) - childAt.getMeasuredWidth();
                            measuredWidth += childAt.getMeasuredWidth();
                        }
                        left = (i + scrollX) - childAt.getLeft();
                        if (left != 0) {
                            childAt.offsetLeftAndRight(left);
                        }
                        i = width;
                    } else {
                        iMax = Math.max((width2 - childAt.getMeasuredWidth()) / 2, i);
                    }
                    int i4 = iMax;
                    width = i;
                    i = i4;
                    left = (i + scrollX) - childAt.getLeft();
                    if (left != 0) {
                        childAt.offsetLeftAndRight(left);
                    }
                    i = width;
                }
            }
        }
        if (this.nN != null) {
            int size = this.nN.size();
            for (int i5 = 0; i5 < size; i5++) {
                this.nN.get(i5);
            }
        }
        if (this.nO != null) {
            getScrollX();
            int childCount2 = getChildCount();
            for (int i6 = 0; i6 < childCount2; i6++) {
                View childAt2 = getChildAt(i6);
                if (!((LayoutParams) childAt2.getLayoutParams()).isDecor) {
                    childAt2.getLeft();
                    ch();
                }
            }
        }
        this.nL = true;
    }

    private void cm() {
        if (this.nN != null) {
            int size = this.nN.size();
            for (int i = 0; i < size; i++) {
                this.nN.get(i);
            }
        }
    }

    private boolean cn() {
        this.mActivePointerId = -1;
        this.nt = false;
        this.nu = false;
        if (this.mVelocityTracker != null) {
            this.mVelocityTracker.recycle();
            this.mVelocityTracker = null;
        }
        this.nH.onRelease();
        this.nI.onRelease();
        return this.nH.isFinished() || this.nI.isFinished();
    }

    private void co() {
        ViewParent parent = getParent();
        if (parent != null) {
            parent.requestDisallowInterceptTouchEvent(true);
        }
    }

    private s cp() {
        int i;
        int iCh = ch();
        float scrollX = iCh > 0 ? getScrollX() / iCh : 0.0f;
        float f = iCh > 0 ? this.nj / iCh : 0.0f;
        float f2 = 0.0f;
        float f3 = 0.0f;
        int i2 = 0;
        int i3 = -1;
        s sVar = null;
        boolean z = true;
        while (i2 < this.mItems.size()) {
            s sVar2 = (s) this.mItems.get(i2);
            if (!z && sVar2.position != (i = i3 + 1)) {
                sVar2 = this.nc;
                sVar2.offset = f2 + f3 + f;
                sVar2.position = i;
                sVar2.widthFactor = 1.0f;
                i2--;
            }
            f2 = sVar2.offset;
            float f4 = sVar2.widthFactor + f2 + f;
            if (!z && scrollX < f2) {
                return sVar;
            }
            if (scrollX < f4 || i2 == this.mItems.size() - 1) {
                return sVar2;
            }
            i3 = sVar2.position;
            f3 = sVar2.widthFactor;
            i2++;
            z = false;
            sVar = sVar2;
        }
        return sVar;
    }

    private void k(boolean z) {
        boolean z2 = this.nU == 2;
        if (z2) {
            setScrollingCacheEnabled(false);
            if (!this.mScroller.isFinished()) {
                this.mScroller.abortAnimation();
                int scrollX = getScrollX();
                int scrollY = getScrollY();
                int currX = this.mScroller.getCurrX();
                int currY = this.mScroller.getCurrY();
                if (scrollX != currX || scrollY != currY) {
                    scrollTo(currX, currY);
                    if (currX != scrollX) {
                        ck();
                    }
                }
            }
        }
        this.nr = false;
        boolean z3 = z2;
        for (int i = 0; i < this.mItems.size(); i++) {
            s sVar = (s) this.mItems.get(i);
            if (sVar.scrolling) {
                sVar.scrolling = false;
                z3 = true;
            }
        }
        if (z3) {
            if (z) {
                n.b(this, this.nT);
            } else {
                this.nT.run();
            }
        }
    }

    private boolean pageLeft() {
        if (this.ne <= 0) {
            return false;
        }
        E(this.ne - 1);
        return true;
    }

    private boolean pageRight() {
        if (this.nd == null || this.ne >= this.nd.getCount() - 1) {
            return false;
        }
        E(this.ne + 1);
        return true;
    }

    private void populate() {
        populate(this.ne);
    }

    /* JADX WARN: Code duplicated, block: B:63:0x00db A[PHI: r7 r10 r15
      0x00db: PHI (r7v14 float) = (r7v12 float), (r7v13 float), (r7v5 float) binds: [B:62:0x00d9, B:59:0x00cd, B:53:0x00bf] A[DONT_GENERATE, DONT_INLINE]
      0x00db: PHI (r10v4 int) = (r10v3 int), (r10v2 int), (r10v8 int) binds: [B:62:0x00d9, B:59:0x00cd, B:53:0x00bf] A[DONT_GENERATE, DONT_INLINE]
      0x00db: PHI (r15v6 int) = (r15v4 int), (r15v5 int), (r15v10 int) binds: [B:62:0x00d9, B:59:0x00cd, B:53:0x00bf] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Code duplicated, block: B:64:0x00e4 A[PHI: r7 r10 r15
      0x00e4: PHI (r7v17 float) = (r7v12 float), (r7v13 float), (r7v5 float) binds: [B:62:0x00d9, B:59:0x00cd, B:53:0x00bf] A[DONT_GENERATE, DONT_INLINE]
      0x00e4: PHI (r10v7 int) = (r10v3 int), (r10v2 int), (r10v8 int) binds: [B:62:0x00d9, B:59:0x00cd, B:53:0x00bf] A[DONT_GENERATE, DONT_INLINE]
      0x00e4: PHI (r15v9 int) = (r15v4 int), (r15v5 int), (r15v10 int) binds: [B:62:0x00d9, B:59:0x00cd, B:53:0x00bf] A[DONT_GENERATE, DONT_INLINE]] */
    private void populate(int i) {
        s sVarG;
        String hexString;
        s sVarF;
        s sVarCj;
        s sVar;
        if (this.ne != i) {
            sVarG = G(this.ne);
            this.ne = i;
        } else {
            sVarG = null;
        }
        if (this.nd == null) {
            ci();
            return;
        }
        if (this.nr) {
            ci();
            return;
        }
        if (getWindowToken() == null) {
            return;
        }
        int i2 = this.ns;
        int iMax = Math.max(0, this.ne - i2);
        int count = this.nd.getCount();
        int iMin = Math.min(count - 1, this.ne + i2);
        if (count != this.na) {
            try {
                hexString = getResources().getResourceName(getId());
            } catch (Resources.NotFoundException e) {
                hexString = Integer.toHexString(getId());
            }
            throw new IllegalStateException("The application's PagerAdapter changed the adapter's contents without calling PagerAdapter#notifyDataSetChanged! Expected adapter item count: " + this.na + ", found: " + count + " Pager id: " + hexString + " Pager class: " + getClass() + " Problematic adapter: " + this.nd.getClass());
        }
        int i3 = 0;
        while (true) {
            if (i3 < this.mItems.size()) {
                sVarF = (s) this.mItems.get(i3);
                if (sVarF.position >= this.ne) {
                    if (sVarF.position != this.ne) {
                        break;
                    } else {
                        break;
                    }
                }
                i3++;
            }
            sVarF = null;
            break;
        }
        if (sVarF == null && count > 0) {
            sVarF = F(this.ne);
        }
        if (sVarF != null) {
            int i4 = i3 - 1;
            s sVar2 = i4 >= 0 ? (s) this.mItems.get(i4) : null;
            int iCh = ch();
            float paddingLeft = iCh <= 0 ? 0.0f : (2.0f - sVarF.widthFactor) + (getPaddingLeft() / iCh);
            int i5 = i4;
            int i6 = i3;
            float f = 0.0f;
            for (int i7 = this.ne - 1; i7 >= 0; i7--) {
                if (f >= paddingLeft && i7 < iMax) {
                    if (sVar2 == null) {
                        break;
                    }
                    if (i7 == sVar2.position && !sVar2.scrolling) {
                        this.mItems.remove(i5);
                        m.ce();
                        i5--;
                        i6--;
                        if (i5 >= 0) {
                            sVar = (s) this.mItems.get(i5);
                        } else {
                            sVar = null;
                        }
                        sVar2 = sVar;
                    }
                } else {
                    if (sVar2 == null || i7 != sVar2.position) {
                        f += F(i7).widthFactor;
                        i6++;
                        if (i5 >= 0) {
                            sVar = (s) this.mItems.get(i5);
                        } else {
                            sVar = null;
                        }
                    } else {
                        f += sVar2.widthFactor;
                        i5--;
                        if (i5 >= 0) {
                            sVar = (s) this.mItems.get(i5);
                        } else {
                            sVar = null;
                        }
                    }
                    sVar2 = sVar;
                }
            }
            float f2 = sVarF.widthFactor;
            int i8 = i6 + 1;
            if (f2 < 2.0f) {
                s sVar3 = i8 < this.mItems.size() ? (s) this.mItems.get(i8) : null;
                float paddingRight = iCh <= 0 ? 0.0f : (getPaddingRight() / iCh) + 2.0f;
                int i9 = this.ne;
                while (true) {
                    i9++;
                    if (i9 >= count) {
                        break;
                    }
                    if (f2 >= paddingRight && i9 > iMin) {
                        if (sVar3 == null) {
                            break;
                        }
                        if (i9 == sVar3.position && !sVar3.scrolling) {
                            this.mItems.remove(i8);
                            m.ce();
                            if (i8 < this.mItems.size()) {
                            }
                        }
                    } else if (sVar3 == null || i9 != sVar3.position) {
                        i8++;
                        f2 += F(i9).widthFactor;
                        sVar3 = i8 < this.mItems.size() ? (s) this.mItems.get(i8) : null;
                    } else {
                        f2 += sVar3.widthFactor;
                        i8++;
                        if (i8 < this.mItems.size()) {
                        }
                    }
                }
            }
            a(sVarF, i6, sVarG);
        }
        int childCount = getChildCount();
        for (int i10 = 0; i10 < childCount; i10++) {
            LayoutParams layoutParams = (LayoutParams) getChildAt(i10).getLayoutParams();
            layoutParams.childIndex = i10;
            if (!layoutParams.isDecor && layoutParams.widthFactor == 0.0f && (sVarCj = cj()) != null) {
                layoutParams.widthFactor = sVarCj.widthFactor;
                layoutParams.position = sVarCj.position;
            }
        }
        ci();
        if (hasFocus()) {
            View viewFindFocus = findFocus();
            s sVarQ = viewFindFocus != null ? q(viewFindFocus) : null;
            if (sVarQ == null || sVarQ.position != this.ne) {
                for (int i11 = 0; i11 < getChildCount(); i11++) {
                    View childAt = getChildAt(i11);
                    s sVarCj2 = cj();
                    if (sVarCj2 != null && sVarCj2.position == this.ne && childAt.requestFocus(2)) {
                        return;
                    }
                }
            }
        }
    }

    private s q(View view) {
        while (true) {
            Object parent = view.getParent();
            if (parent == this) {
                return cj();
            }
            if (parent == null || !(parent instanceof View)) {
                return null;
            }
            view = (View) parent;
        }
    }

    private void setScrollState(int i) {
        if (this.nU == i) {
            return;
        }
        this.nU = i;
        if (this.nO != null) {
            boolean z = i != 0;
            int childCount = getChildCount();
            for (int i2 = 0; i2 < childCount; i2++) {
                getChildAt(i2).setLayerType(z ? this.nP : 0, null);
            }
        }
        if (this.nN != null) {
            int size = this.nN.size();
            for (int i3 = 0; i3 < size; i3++) {
                this.nN.get(i3);
            }
        }
    }

    private void setScrollingCacheEnabled(boolean z) {
        if (this.mScrollingCacheEnabled != z) {
            this.mScrollingCacheEnabled = z;
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void addFocusables(ArrayList arrayList, int i, int i2) {
        s sVarCj;
        int size = arrayList.size();
        int descendantFocusability = getDescendantFocusability();
        if (descendantFocusability != 393216) {
            for (int i3 = 0; i3 < getChildCount(); i3++) {
                View childAt = getChildAt(i3);
                if (childAt.getVisibility() == 0 && (sVarCj = cj()) != null && sVarCj.position == this.ne) {
                    childAt.addFocusables(arrayList, i, i2);
                }
            }
        }
        if ((descendantFocusability != 262144 || size == arrayList.size()) && isFocusable()) {
            if (((i2 & 1) == 1 && isInTouchMode() && !isFocusableInTouchMode()) || arrayList == null) {
                return;
            }
            arrayList.add(this);
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void addTouchables(ArrayList arrayList) {
        s sVarCj;
        for (int i = 0; i < getChildCount(); i++) {
            View childAt = getChildAt(i);
            if (childAt.getVisibility() == 0 && (sVarCj = cj()) != null && sVarCj.position == this.ne) {
                childAt.addTouchables(arrayList);
            }
        }
    }

    @Override // android.view.ViewGroup
    public final void addView(View view, int i, ViewGroup.LayoutParams layoutParams) {
        if (!checkLayoutParams(layoutParams)) {
            layoutParams = generateLayoutParams(layoutParams);
        }
        LayoutParams layoutParams2 = (LayoutParams) layoutParams;
        layoutParams2.isDecor |= view.getClass().getAnnotation(r.class) != null;
        if (!this.mInLayout) {
            super.addView(view, i, layoutParams);
        } else {
            if (layoutParams2 != null && layoutParams2.isDecor) {
                throw new IllegalStateException("Cannot add pager decor view during layout");
            }
            layoutParams2.needsMeasure = true;
            addViewInLayout(view, i, layoutParams);
        }
    }

    @Override // android.view.View
    public final boolean canScrollHorizontally(int i) {
        if (this.nd == null) {
            return false;
        }
        int iCh = ch();
        int scrollX = getScrollX();
        if (i < 0) {
            return scrollX > ((int) (((float) iCh) * this.nn));
        }
        return i > 0 && scrollX < ((int) (((float) iCh) * this.no));
    }

    @Override // android.view.ViewGroup
    protected final boolean checkLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return (layoutParams instanceof LayoutParams) && super.checkLayoutParams(layoutParams);
    }

    @Override // android.view.View
    public final void computeScroll() {
        this.ni = true;
        if (this.mScroller.isFinished() || !this.mScroller.computeScrollOffset()) {
            k(true);
            return;
        }
        int scrollX = getScrollX();
        int scrollY = getScrollY();
        int currX = this.mScroller.getCurrX();
        int currY = this.mScroller.getCurrY();
        if (scrollX != currX || scrollY != currY) {
            scrollTo(currX, currY);
            if (!ck()) {
                this.mScroller.abortAnimation();
                scrollTo(0, currY);
            }
        }
        n.d(this);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final boolean dispatchKeyEvent(KeyEvent keyEvent) {
        boolean zArrowScroll;
        int i;
        if (super.dispatchKeyEvent(keyEvent)) {
            return true;
        }
        if (keyEvent.getAction() == 0) {
            int keyCode = keyEvent.getKeyCode();
            if (keyCode != 61) {
                switch (keyCode) {
                    case 21:
                        if (!keyEvent.hasModifiers(2)) {
                            i = 17;
                            zArrowScroll = arrowScroll(i);
                        } else {
                            zArrowScroll = pageLeft();
                        }
                        break;
                    case 22:
                        if (!keyEvent.hasModifiers(2)) {
                            i = 66;
                            zArrowScroll = arrowScroll(i);
                        } else {
                            zArrowScroll = pageRight();
                        }
                        break;
                    default:
                        zArrowScroll = false;
                        break;
                }
            } else if (keyEvent.hasNoModifiers()) {
                zArrowScroll = arrowScroll(2);
            } else {
                zArrowScroll = keyEvent.hasModifiers(1) ? arrowScroll(1) : false;
            }
        } else {
            zArrowScroll = false;
        }
        return zArrowScroll;
    }

    @Override // android.view.View
    public final boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent accessibilityEvent) {
        s sVarCj;
        if (accessibilityEvent.getEventType() == 4096) {
            return super.dispatchPopulateAccessibilityEvent(accessibilityEvent);
        }
        int childCount = getChildCount();
        for (int i = 0; i < childCount; i++) {
            View childAt = getChildAt(i);
            if (childAt.getVisibility() == 0 && (sVarCj = cj()) != null && sVarCj.position == this.ne && childAt.dispatchPopulateAccessibilityEvent(accessibilityEvent)) {
                return true;
            }
        }
        return false;
    }

    @Override // android.view.View
    public final void draw(Canvas canvas) {
        super.draw(canvas);
        int overScrollMode = getOverScrollMode();
        boolean zDraw = false;
        if (overScrollMode == 0 || (overScrollMode == 1 && this.nd != null && this.nd.getCount() > 1)) {
            if (!this.nH.isFinished()) {
                int iSave = canvas.save();
                int height = (getHeight() - getPaddingTop()) - getPaddingBottom();
                int width = getWidth();
                canvas.rotate(270.0f);
                canvas.translate((-height) + getPaddingTop(), this.nn * width);
                this.nH.setSize(height, width);
                zDraw = false | this.nH.draw(canvas);
                canvas.restoreToCount(iSave);
            }
            if (!this.nI.isFinished()) {
                int iSave2 = canvas.save();
                int width2 = getWidth();
                int height2 = (getHeight() - getPaddingTop()) - getPaddingBottom();
                canvas.rotate(90.0f);
                canvas.translate(-getPaddingTop(), (-(this.no + 1.0f)) * width2);
                this.nI.setSize(height2, width2);
                zDraw |= this.nI.draw(canvas);
                canvas.restoreToCount(iSave2);
            }
        } else {
            this.nH.finish();
            this.nI.finish();
        }
        if (zDraw) {
            n.d(this);
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    protected final void drawableStateChanged() {
        super.drawableStateChanged();
        Drawable drawable = this.nk;
        if (drawable == null || !drawable.isStateful()) {
            return;
        }
        drawable.setState(getDrawableState());
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
        return generateDefaultLayoutParams();
    }

    @Override // android.view.ViewGroup
    protected final int getChildDrawingOrder(int i, int i2) {
        if (this.nQ == 2) {
            i2 = (i - 1) - i2;
        }
        return ((LayoutParams) ((View) this.nR.get(i2)).getLayoutParams()).childIndex;
    }

    @Override // android.view.ViewGroup, android.view.View
    protected final void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.nJ = true;
    }

    @Override // android.view.ViewGroup, android.view.View
    protected final void onDetachedFromWindow() {
        removeCallbacks(this.nT);
        if (this.mScroller != null && !this.mScroller.isFinished()) {
            this.mScroller.abortAnimation();
        }
        super.onDetachedFromWindow();
    }

    @Override // android.view.View
    protected final void onDraw(Canvas canvas) {
        float f;
        super.onDraw(canvas);
        if (this.nj <= 0 || this.nk == null || this.mItems.size() <= 0 || this.nd == null) {
            return;
        }
        int scrollX = getScrollX();
        int width = getWidth();
        float f2 = width;
        float f3 = this.nj / f2;
        int i = 0;
        s sVar = (s) this.mItems.get(0);
        float f4 = sVar.offset;
        int size = this.mItems.size();
        int i2 = sVar.position;
        int i3 = ((s) this.mItems.get(size - 1)).position;
        while (i2 < i3) {
            while (i2 > sVar.position && i < size) {
                i++;
                sVar = (s) this.mItems.get(i);
            }
            if (i2 == sVar.position) {
                f = (sVar.offset + sVar.widthFactor) * f2;
                f4 = sVar.offset + sVar.widthFactor + f3;
            } else {
                f = (f4 + 1.0f) * f2;
                f4 += 1.0f + f3;
            }
            if (this.nj + f > scrollX) {
                this.nk.setBounds(Math.round(f), this.nl, Math.round(this.nj + f), this.nm);
                this.nk.draw(canvas);
            }
            if (f > scrollX + width) {
                return;
            }
            i2++;
            f3 = f3;
        }
    }

    @Override // android.view.ViewGroup
    public final boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        int action = motionEvent.getAction() & 255;
        if (action == 3 || action == 1) {
            cn();
            return false;
        }
        if (action != 0) {
            if (this.nt) {
                return true;
            }
            if (this.nu) {
                return false;
            }
        }
        if (action == 0) {
            float x = motionEvent.getX();
            this.nA = x;
            this.ny = x;
            float y = motionEvent.getY();
            this.nB = y;
            this.nz = y;
            this.mActivePointerId = motionEvent.getPointerId(0);
            this.nu = false;
            this.ni = true;
            this.mScroller.computeScrollOffset();
            if (this.nU != 2 || Math.abs(this.mScroller.getFinalX() - this.mScroller.getCurrX()) <= this.nF) {
                k(false);
                this.nt = false;
            } else {
                this.mScroller.abortAnimation();
                this.nr = false;
                populate();
                this.nt = true;
                co();
                setScrollState(1);
            }
        } else if (action == 2) {
            int i = this.mActivePointerId;
            if (i != -1) {
                int iFindPointerIndex = motionEvent.findPointerIndex(i);
                float x2 = motionEvent.getX(iFindPointerIndex);
                float f = x2 - this.ny;
                float fAbs = Math.abs(f);
                float y2 = motionEvent.getY(iFindPointerIndex);
                float fAbs2 = Math.abs(y2 - this.nB);
                if (f != 0.0f) {
                    float f2 = this.ny;
                    if (!((f2 < ((float) this.nw) && f > 0.0f) || (f2 > ((float) (getWidth() - this.nw)) && f < 0.0f)) && canScroll(this, false, (int) f, (int) x2, (int) y2)) {
                        this.ny = x2;
                        this.nz = y2;
                        this.nu = true;
                        return false;
                    }
                }
                if (fAbs > this.nx && fAbs * 0.5f > fAbs2) {
                    this.nt = true;
                    co();
                    setScrollState(1);
                    this.ny = f > 0.0f ? this.nA + this.nx : this.nA - this.nx;
                    this.nz = y2;
                    setScrollingCacheEnabled(true);
                } else if (fAbs2 > this.nx) {
                    this.nu = true;
                }
                if (this.nt && a(x2)) {
                    n.d(this);
                }
            }
        } else if (action == 6) {
            b(motionEvent);
        }
        if (this.mVelocityTracker == null) {
            this.mVelocityTracker = VelocityTracker.obtain();
        }
        this.mVelocityTracker.addMovement(motionEvent);
        return this.nt;
    }

    @Override // android.view.ViewGroup, android.view.View
    protected final void onLayout(boolean z, int i, int i2, int i3, int i4) {
        boolean z2;
        s sVarCj;
        int iMax;
        int iMax2;
        int childCount = getChildCount();
        int i5 = i3 - i;
        int i6 = i4 - i2;
        int paddingLeft = getPaddingLeft();
        int paddingTop = getPaddingTop();
        int paddingRight = getPaddingRight();
        int paddingBottom = getPaddingBottom();
        int scrollX = getScrollX();
        int measuredHeight = paddingBottom;
        int i7 = 0;
        int measuredHeight2 = paddingTop;
        int measuredWidth = paddingLeft;
        for (int i8 = 0; i8 < childCount; i8++) {
            View childAt = getChildAt(i8);
            if (childAt.getVisibility() != 8) {
                LayoutParams layoutParams = (LayoutParams) childAt.getLayoutParams();
                if (layoutParams.isDecor) {
                    int i9 = layoutParams.gravity & 7;
                    int i10 = layoutParams.gravity & 112;
                    if (i9 == 1) {
                        iMax = Math.max((i5 - childAt.getMeasuredWidth()) / 2, measuredWidth);
                    } else if (i9 == 3) {
                        iMax = measuredWidth;
                        measuredWidth = childAt.getMeasuredWidth() + measuredWidth;
                    } else if (i9 != 5) {
                        iMax = measuredWidth;
                    } else {
                        iMax = (i5 - paddingRight) - childAt.getMeasuredWidth();
                        paddingRight += childAt.getMeasuredWidth();
                    }
                    if (i10 == 16) {
                        iMax2 = Math.max((i6 - childAt.getMeasuredHeight()) / 2, measuredHeight2);
                    } else if (i10 == 48) {
                        iMax2 = measuredHeight2;
                        measuredHeight2 = childAt.getMeasuredHeight() + measuredHeight2;
                    } else if (i10 != 80) {
                        iMax2 = measuredHeight2;
                    } else {
                        iMax2 = (i6 - measuredHeight) - childAt.getMeasuredHeight();
                        measuredHeight += childAt.getMeasuredHeight();
                    }
                    int i11 = iMax + scrollX;
                    childAt.layout(i11, iMax2, childAt.getMeasuredWidth() + i11, iMax2 + childAt.getMeasuredHeight());
                    i7++;
                }
            }
        }
        int i12 = (i5 - measuredWidth) - paddingRight;
        for (int i13 = 0; i13 < childCount; i13++) {
            View childAt2 = getChildAt(i13);
            if (childAt2.getVisibility() != 8) {
                LayoutParams layoutParams2 = (LayoutParams) childAt2.getLayoutParams();
                if (!layoutParams2.isDecor && (sVarCj = cj()) != null) {
                    float f = i12;
                    int i14 = ((int) (sVarCj.offset * f)) + measuredWidth;
                    if (layoutParams2.needsMeasure) {
                        layoutParams2.needsMeasure = false;
                        childAt2.measure(View.MeasureSpec.makeMeasureSpec((int) (f * layoutParams2.widthFactor), 1073741824), View.MeasureSpec.makeMeasureSpec((i6 - measuredHeight2) - measuredHeight, 1073741824));
                    }
                    childAt2.layout(i14, measuredHeight2, childAt2.getMeasuredWidth() + i14, childAt2.getMeasuredHeight() + measuredHeight2);
                }
            }
        }
        this.nl = measuredHeight2;
        this.nm = i6 - measuredHeight;
        this.nM = i7;
        if (this.nJ) {
            z2 = false;
            a(this.ne, false, 0, false);
        } else {
            z2 = false;
        }
        this.nJ = z2;
    }

    @Override // android.view.View
    protected final void onMeasure(int i, int i2) {
        LayoutParams layoutParams;
        LayoutParams layoutParams2;
        int i3;
        int i4;
        int i5;
        boolean z = false;
        setMeasuredDimension(getDefaultSize(0, i), getDefaultSize(0, i2));
        int measuredWidth = getMeasuredWidth();
        this.nw = Math.min(measuredWidth / 10, this.nv);
        int paddingLeft = (measuredWidth - getPaddingLeft()) - getPaddingRight();
        int measuredHeight = (getMeasuredHeight() - getPaddingTop()) - getPaddingBottom();
        int childCount = getChildCount();
        int measuredHeight2 = measuredHeight;
        int measuredWidth2 = paddingLeft;
        int i6 = 0;
        while (true) {
            boolean z2 = true;
            int i7 = 1073741824;
            if (i6 >= childCount) {
                break;
            }
            View childAt = getChildAt(i6);
            if (childAt.getVisibility() != 8 && (layoutParams2 = (LayoutParams) childAt.getLayoutParams()) != null && layoutParams2.isDecor) {
                int i8 = layoutParams2.gravity & 7;
                int i9 = layoutParams2.gravity & 112;
                boolean z3 = (i9 == 48 || i9 == 80) ? true : z;
                if (i8 != 3 && i8 != 5) {
                    z2 = z;
                }
                int i10 = Integer.MIN_VALUE;
                if (z3) {
                    i3 = Integer.MIN_VALUE;
                    i10 = 1073741824;
                } else {
                    i3 = z2 ? 1073741824 : Integer.MIN_VALUE;
                }
                if (layoutParams2.width != -2) {
                    i4 = layoutParams2.width != -1 ? layoutParams2.width : measuredWidth2;
                    i10 = 1073741824;
                } else {
                    i4 = measuredWidth2;
                }
                if (layoutParams2.height != -2) {
                    i5 = layoutParams2.height != -1 ? layoutParams2.height : measuredHeight2;
                } else {
                    i5 = measuredHeight2;
                    i7 = i3;
                }
                childAt.measure(View.MeasureSpec.makeMeasureSpec(i4, i10), View.MeasureSpec.makeMeasureSpec(i5, i7));
                if (z3) {
                    measuredHeight2 -= childAt.getMeasuredHeight();
                } else if (z2) {
                    measuredWidth2 -= childAt.getMeasuredWidth();
                }
            }
            i6++;
            z = false;
        }
        this.np = View.MeasureSpec.makeMeasureSpec(measuredWidth2, 1073741824);
        this.nq = View.MeasureSpec.makeMeasureSpec(measuredHeight2, 1073741824);
        this.mInLayout = true;
        populate();
        this.mInLayout = false;
        int childCount2 = getChildCount();
        for (int i11 = 0; i11 < childCount2; i11++) {
            View childAt2 = getChildAt(i11);
            if (childAt2.getVisibility() != 8 && ((layoutParams = (LayoutParams) childAt2.getLayoutParams()) == null || !layoutParams.isDecor)) {
                childAt2.measure(View.MeasureSpec.makeMeasureSpec((int) (measuredWidth2 * layoutParams.widthFactor), 1073741824), this.nq);
            }
        }
    }

    @Override // android.view.ViewGroup
    protected final boolean onRequestFocusInDescendants(int i, Rect rect) {
        int i2;
        int i3;
        s sVarCj;
        int childCount = getChildCount();
        int i4 = -1;
        if ((i & 2) != 0) {
            i4 = childCount;
            i2 = 0;
            i3 = 1;
        } else {
            i2 = childCount - 1;
            i3 = -1;
        }
        while (i2 != i4) {
            View childAt = getChildAt(i2);
            if (childAt.getVisibility() == 0 && (sVarCj = cj()) != null && sVarCj.position == this.ne && childAt.requestFocus(i, rect)) {
                return true;
            }
            i2 += i3;
        }
        return false;
    }

    @Override // android.view.View
    public final void onRestoreInstanceState(Parcelable parcelable) {
        if (!(parcelable instanceof SavedState)) {
            super.onRestoreInstanceState(parcelable);
            return;
        }
        SavedState savedState = (SavedState) parcelable;
        super.onRestoreInstanceState(savedState.getSuperState());
        if (this.nd != null) {
            Parcelable parcelable2 = savedState.adapterState;
            ClassLoader classLoader = savedState.loader;
            a(savedState.position, false, true);
        } else {
            this.nf = savedState.position;
            this.ng = savedState.adapterState;
            this.nh = savedState.loader;
        }
    }

    @Override // android.view.View
    public final Parcelable onSaveInstanceState() {
        SavedState savedState = new SavedState(super.onSaveInstanceState());
        savedState.position = this.ne;
        if (this.nd != null) {
            savedState.adapterState = null;
        }
        return savedState;
    }

    @Override // android.view.View
    protected final void onSizeChanged(int i, int i2, int i3, int i4) {
        super.onSizeChanged(i, i2, i3, i4);
        if (i != i3) {
            int i5 = this.nj;
            int i6 = this.nj;
            if (i3 > 0 && !this.mItems.isEmpty()) {
                if (!this.mScroller.isFinished()) {
                    this.mScroller.setFinalX(this.ne * ch());
                    return;
                } else {
                    scrollTo((int) ((getScrollX() / (((i3 - getPaddingLeft()) - getPaddingRight()) + i6)) * (((i - getPaddingLeft()) - getPaddingRight()) + i5)), getScrollY());
                    return;
                }
            }
            s sVarG = G(this.ne);
            int iMin = (int) ((sVarG != null ? Math.min(sVarG.offset, this.no) : 0.0f) * ((i - getPaddingLeft()) - getPaddingRight()));
            if (iMin != getScrollX()) {
                k(false);
                scrollTo(iMin, getScrollY());
            }
        }
    }

    @Override // android.view.View
    public final boolean onTouchEvent(MotionEvent motionEvent) {
        int pointerId;
        if (this.nG) {
            return true;
        }
        boolean zA = false;
        if ((motionEvent.getAction() == 0 && motionEvent.getEdgeFlags() != 0) || this.nd == null || this.nd.getCount() == 0) {
            return false;
        }
        if (this.mVelocityTracker == null) {
            this.mVelocityTracker = VelocityTracker.obtain();
        }
        this.mVelocityTracker.addMovement(motionEvent);
        switch (motionEvent.getAction() & 255) {
            case 0:
                this.mScroller.abortAnimation();
                this.nr = false;
                populate();
                float x = motionEvent.getX();
                this.nA = x;
                this.ny = x;
                float y = motionEvent.getY();
                this.nB = y;
                this.nz = y;
                pointerId = motionEvent.getPointerId(0);
                this.mActivePointerId = pointerId;
                break;
            case 1:
                if (this.nt) {
                    VelocityTracker velocityTracker = this.mVelocityTracker;
                    velocityTracker.computeCurrentVelocity(1000, this.nD);
                    int xVelocity = (int) velocityTracker.getXVelocity(this.mActivePointerId);
                    this.nr = true;
                    int iCh = ch();
                    int scrollX = getScrollX();
                    s sVarCp = cp();
                    float f = iCh;
                    float f2 = this.nj / f;
                    int iMax = sVarCp.position;
                    float f3 = ((scrollX / f) - sVarCp.offset) / (sVarCp.widthFactor + f2);
                    if (Math.abs((int) (motionEvent.getX(motionEvent.findPointerIndex(this.mActivePointerId)) - this.nA)) <= this.nE || Math.abs(xVelocity) <= this.nC) {
                        iMax += (int) (f3 + (iMax >= this.ne ? 0.4f : 0.6f));
                    } else if (xVelocity <= 0) {
                        iMax++;
                    }
                    if (this.mItems.size() > 0) {
                        iMax = Math.max(((s) this.mItems.get(0)).position, Math.min(iMax, ((s) this.mItems.get(this.mItems.size() - 1)).position));
                    }
                    a(iMax, true, true, xVelocity);
                    zA = cn();
                }
                break;
            case 2:
                if (!this.nt) {
                    int iFindPointerIndex = motionEvent.findPointerIndex(this.mActivePointerId);
                    if (iFindPointerIndex == -1) {
                        zA = cn();
                    } else {
                        float x2 = motionEvent.getX(iFindPointerIndex);
                        float fAbs = Math.abs(x2 - this.ny);
                        float y2 = motionEvent.getY(iFindPointerIndex);
                        float fAbs2 = Math.abs(y2 - this.nz);
                        if (fAbs > this.nx && fAbs > fAbs2) {
                            this.nt = true;
                            co();
                            this.ny = x2 - this.nA > 0.0f ? this.nA + this.nx : this.nA - this.nx;
                            this.nz = y2;
                            setScrollState(1);
                            setScrollingCacheEnabled(true);
                            ViewParent parent = getParent();
                            if (parent != null) {
                                parent.requestDisallowInterceptTouchEvent(true);
                            }
                        }
                    }
                }
                if (this.nt) {
                    zA = false | a(motionEvent.getX(motionEvent.findPointerIndex(this.mActivePointerId)));
                }
                break;
            case 3:
                if (this.nt) {
                    a(this.ne, true, 0, false);
                    zA = cn();
                }
                break;
            case 5:
                int actionIndex = motionEvent.getActionIndex();
                this.ny = motionEvent.getX(actionIndex);
                pointerId = motionEvent.getPointerId(actionIndex);
                this.mActivePointerId = pointerId;
                break;
            case 6:
                b(motionEvent);
                this.ny = motionEvent.getX(motionEvent.findPointerIndex(this.mActivePointerId));
                break;
        }
        if (zA) {
            n.d(this);
        }
        return true;
    }

    @Override // android.view.ViewGroup, android.view.ViewManager
    public final void removeView(View view) {
        if (this.mInLayout) {
            removeViewInLayout(view);
        } else {
            super.removeView(view);
        }
    }

    @Override // android.view.View
    protected final boolean verifyDrawable(Drawable drawable) {
        return super.verifyDrawable(drawable) || drawable == this.nk;
    }
}
