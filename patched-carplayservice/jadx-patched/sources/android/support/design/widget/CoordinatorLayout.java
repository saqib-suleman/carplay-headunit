package android.support.design.widget;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.SystemClock;
import android.support.v4.c.o;
import android.support.v4.c.q;
import android.support.v4.view.AbsSavedState;
import android.support.v4.view.j;
import android.support.v4.view.k;
import android.support.v4.view.l;
import android.support.v4.view.n;
import android.support.v4.view.x;
import android.support.v4.widget.m;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.Log;
import android.util.SparseArray;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import com.autochips.carplay.common.CarplayMessage;
import java.lang.reflect.Constructor;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/* JADX INFO: loaded from: classes.dex */
public class CoordinatorLayout extends ViewGroup implements j {
    static final String gR;
    static final Class[] gS;
    static final ThreadLocal gT;
    static final Comparator gU;
    private static final o gV;
    private final List gW;
    private final android.support.v4.widget.a gX;
    private final List gY;
    private final int[] gZ;
    private boolean ha;
    private int[] hb;
    private View hc;
    private View hd;
    private f he;
    private boolean hf;
    private x hg;
    private boolean hh;
    private Drawable hi;
    private l hj;
    private final k hk;
    private boolean mIsAttachedToWindow;
    ViewGroup.OnHierarchyChangeListener mOnHierarchyChangeListener;

    public class SavedState extends AbsSavedState {
        public static final Parcelable.Creator CREATOR = new g();
        SparseArray hD;

        public SavedState(Parcel parcel, ClassLoader classLoader) {
            super(parcel, classLoader);
            int i = parcel.readInt();
            int[] iArr = new int[i];
            parcel.readIntArray(iArr);
            Parcelable[] parcelableArray = parcel.readParcelableArray(classLoader);
            this.hD = new SparseArray(i);
            for (int i2 = 0; i2 < i; i2++) {
                this.hD.append(iArr[i2], parcelableArray[i2]);
            }
        }

        public SavedState(Parcelable parcelable) {
            super(parcelable);
        }

        @Override // android.support.v4.view.AbsSavedState, android.os.Parcelable
        public void writeToParcel(Parcel parcel, int i) {
            super.writeToParcel(parcel, i);
            int size = this.hD != null ? this.hD.size() : 0;
            parcel.writeInt(size);
            int[] iArr = new int[size];
            Parcelable[] parcelableArr = new Parcelable[size];
            for (int i2 = 0; i2 < size; i2++) {
                iArr[i2] = this.hD.keyAt(i2);
                parcelableArr[i2] = (Parcelable) this.hD.valueAt(i2);
            }
            parcel.writeIntArray(iArr);
            parcel.writeParcelableArray(parcelableArr, i);
        }
    }

    static {
        Package r0 = CoordinatorLayout.class.getPackage();
        gR = r0 != null ? r0.getName() : null;
        if (Build.VERSION.SDK_INT >= 21) {
            gU = new h();
        } else {
            gU = null;
        }
        gS = new Class[]{Context.class, AttributeSet.class};
        gT = new ThreadLocal();
        gV = new q();
    }

    static c a(Context context, AttributeSet attributeSet, String str) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        if (str.startsWith(".")) {
            str = context.getPackageName() + str;
        } else if (str.indexOf(46) < 0 && !TextUtils.isEmpty(gR)) {
            str = gR + '.' + str;
        }
        try {
            Map map = (Map) gT.get();
            if (map == null) {
                map = new HashMap();
                gT.set(map);
            }
            Constructor<?> constructor = (Constructor) map.get(str);
            if (constructor == null) {
                constructor = context.getClassLoader().loadClass(str).getConstructor(gS);
                constructor.setAccessible(true);
                map.put(str, constructor);
            }
            return (c) constructor.newInstance(context, attributeSet);
        } catch (Exception e) {
            throw new RuntimeException("Could not inflate Behavior subclass " + str, e);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    private static e a(View view) {
        e eVar = (e) view.getLayoutParams();
        if (eVar.hn) {
            return eVar;
        }
        if (view instanceof b) {
            c cVarAM = ((b) view).aM();
            if (cVarAM == null) {
                Log.e("CoordinatorLayout", "Attached behavior class is null");
            }
            eVar.a(cVarAM);
        } else {
            d dVar = null;
            for (Class<?> superclass = view.getClass(); superclass != null; superclass = superclass.getSuperclass()) {
                dVar = (d) superclass.getAnnotation(d.class);
                if (dVar != null) {
                    break;
                }
            }
            if (dVar != null) {
                try {
                    eVar.a((c) dVar.value().getDeclaredConstructor(new Class[0]).newInstance(new Object[0]));
                } catch (Exception e) {
                    Log.e("CoordinatorLayout", "Default behavior class " + dVar.value().getName() + " could not be instantiated. Did you forget a default constructor?", e);
                }
            }
        }
        eVar.hn = true;
        return eVar;
    }

    private static void a(int i, Rect rect, Rect rect2, e eVar, int i2, int i3) {
        int iWidth;
        int iHeight;
        int i4 = eVar.gravity;
        if (i4 == 0) {
            i4 = 17;
        }
        int absoluteGravity = android.support.v4.view.d.getAbsoluteGravity(i4, i);
        int absoluteGravity2 = android.support.v4.view.d.getAbsoluteGravity(l(eVar.ho), i);
        int i5 = absoluteGravity & 7;
        int i6 = absoluteGravity & 112;
        int i7 = absoluteGravity2 & 7;
        int i8 = absoluteGravity2 & 112;
        if (i7 != 1) {
            iWidth = i7 != 5 ? rect.left : rect.right;
        } else {
            iWidth = rect.left + (rect.width() / 2);
        }
        if (i8 != 16) {
            iHeight = i8 != 80 ? rect.top : rect.bottom;
        } else {
            iHeight = rect.top + (rect.height() / 2);
        }
        if (i5 == 1) {
            iWidth -= i2 / 2;
        } else if (i5 != 5) {
            iWidth -= i2;
        }
        if (i6 == 16) {
            iHeight -= i3 / 2;
        } else if (i6 != 80) {
            iHeight -= i3;
        }
        rect2.set(iWidth, iHeight, i2 + iWidth, i3 + iHeight);
    }

    private static void a(Rect rect) {
        rect.setEmpty();
        gV.release(rect);
    }

    private void a(e eVar, Rect rect, int i, int i2) {
        int width = getWidth();
        int height = getHeight();
        int iMax = Math.max(getPaddingLeft() + eVar.leftMargin, Math.min(rect.left, ((width - getPaddingRight()) - i) - eVar.rightMargin));
        int iMax2 = Math.max(getPaddingTop() + eVar.topMargin, Math.min(rect.top, ((height - getPaddingBottom()) - i2) - eVar.bottomMargin));
        rect.set(iMax, iMax2, i + iMax, i2 + iMax2);
    }

    private static void a(View view, int i) {
        e eVar = (e) view.getLayoutParams();
        if (eVar.ht != i) {
            n.f(view, i - eVar.ht);
            eVar.ht = i;
        }
    }

    private void a(View view, boolean z, Rect rect) {
        if (view.isLayoutRequested() || view.getVisibility() == 8) {
            rect.setEmpty();
        } else if (z) {
            m.a(this, view, rect);
        } else {
            rect.set(view.getLeft(), view.getTop(), view.getRight(), view.getBottom());
        }
    }

    private boolean a(MotionEvent motionEvent) {
        int actionMasked = motionEvent.getActionMasked();
        List list = this.gY;
        list.clear();
        boolean zIsChildrenDrawingOrderEnabled = isChildrenDrawingOrderEnabled();
        int childCount = getChildCount();
        for (int i = childCount - 1; i >= 0; i--) {
            list.add(getChildAt(zIsChildrenDrawingOrderEnabled ? getChildDrawingOrder(childCount, i) : i));
        }
        if (gU != null) {
            Collections.sort(list, gU);
        }
        int size = list.size();
        boolean z = false;
        MotionEvent motionEventObtain = null;
        for (int i2 = 0; i2 < size; i2++) {
            e eVar = (e) ((View) list.get(i2)).getLayoutParams();
            c cVar = eVar.hm;
            if (!z || actionMasked == 0) {
                boolean zAN = eVar.aN();
                boolean zAO = eVar.aO();
                z = zAO && !zAN;
                if (zAO && !z) {
                    break;
                }
            } else if (cVar != null && motionEventObtain == null) {
                long jUptimeMillis = SystemClock.uptimeMillis();
                motionEventObtain = MotionEvent.obtain(jUptimeMillis, jUptimeMillis, 3, 0.0f, 0.0f, 0);
            }
        }
        list.clear();
        return false;
    }

    private static Rect aK() {
        Rect rect = (Rect) gV.acquire();
        return rect == null ? new Rect() : rect;
    }

    private void aL() {
        int childCount = getChildCount();
        for (int i = 0; i < childCount; i++) {
            if (((e) getChildAt(i).getLayoutParams()).hm != null) {
                long jUptimeMillis = SystemClock.uptimeMillis();
                MotionEvent.obtain(jUptimeMillis, jUptimeMillis, 3, 0.0f, 0.0f, 0).recycle();
            }
        }
        for (int i2 = 0; i2 < childCount; i2++) {
            ((e) getChildAt(i2).getLayoutParams()).aP();
        }
        this.hc = null;
        this.ha = false;
    }

    private static void b(View view, int i) {
        e eVar = (e) view.getLayoutParams();
        if (eVar.hu != i) {
            n.d(view, i - eVar.hu);
            eVar.hu = i;
        }
    }

    private int k(int i) {
        String str;
        StringBuilder sb;
        if (this.hb == null) {
            str = "CoordinatorLayout";
            sb = new StringBuilder("No keylines defined for ");
            sb.append(this);
            sb.append(" - attempted index lookup ");
            sb.append(i);
        } else {
            if (i >= 0 && i < this.hb.length) {
                return this.hb[i];
            }
            str = "CoordinatorLayout";
            sb = new StringBuilder("Keyline index ");
            sb.append(i);
            sb.append(" out of range for ");
            sb.append(this);
        }
        Log.e(str, sb.toString());
        return 0;
    }

    private static int l(int i) {
        if ((i & 7) == 0) {
            i |= 8388611;
        }
        return (i & 112) == 0 ? i | 48 : i;
    }

    private static int m(int i) {
        if (i == 0) {
            return 8388661;
        }
        return i;
    }

    final x a(x xVar) {
        x xVar2 = this.hg;
        if (!(Build.VERSION.SDK_INT >= 19 ? Objects.equals(xVar2, xVar) : xVar2 == xVar || (xVar2 != null && xVar2.equals(xVar)))) {
            this.hg = xVar;
            this.hh = xVar != null && xVar.getSystemWindowInsetTop() > 0;
            setWillNotDraw(!this.hh && getBackground() == null);
            if (!xVar.isConsumed()) {
                int childCount = getChildCount();
                for (int i = 0; i < childCount; i++) {
                    View childAt = getChildAt(i);
                    if (n.j(childAt) && ((e) childAt.getLayoutParams()).hm != null && xVar.isConsumed()) {
                        break;
                    }
                }
            }
            requestLayout();
        }
        return xVar;
    }

    @Override // android.support.v4.view.j
    public final void a(int i, int i2, int[] iArr, int i3) {
        int childCount = getChildCount();
        int iMax = 0;
        int iMax2 = 0;
        boolean z = false;
        for (int i4 = 0; i4 < childCount; i4++) {
            View childAt = getChildAt(i4);
            if (childAt.getVisibility() != 8) {
                e eVar = (e) childAt.getLayoutParams();
                if (eVar.q(i3) && eVar.hm != null) {
                    int[] iArr2 = this.gZ;
                    this.gZ[1] = 0;
                    iArr2[0] = 0;
                    iMax = i > 0 ? Math.max(iMax, this.gZ[0]) : Math.min(iMax, this.gZ[0]);
                    iMax2 = i2 > 0 ? Math.max(iMax2, this.gZ[1]) : Math.min(iMax2, this.gZ[1]);
                    z = true;
                }
            }
        }
        iArr[0] = iMax;
        iArr[1] = iMax2;
        if (z) {
            n(1);
        }
    }

    @Override // android.support.v4.view.j
    public final void a(View view, int i, int i2) {
        this.hk.D(i);
        this.hd = view;
        int childCount = getChildCount();
        for (int i3 = 0; i3 < childCount; i3++) {
            getChildAt(i3).getLayoutParams();
        }
    }

    @Override // android.support.v4.view.j
    public final boolean a(int i, int i2) {
        int childCount = getChildCount();
        for (int i3 = 0; i3 < childCount; i3++) {
            View childAt = getChildAt(i3);
            if (childAt.getVisibility() != 8) {
                ((e) childAt.getLayoutParams()).p(i2);
            }
        }
        return false;
    }

    @Override // android.support.v4.view.j
    public final void b(int i, int i2) {
        int childCount = getChildCount();
        boolean z = false;
        for (int i3 = 0; i3 < childCount; i3++) {
            View childAt = getChildAt(i3);
            if (childAt.getVisibility() != 8) {
                e eVar = (e) childAt.getLayoutParams();
                if (eVar.q(i2) && eVar.hm != null) {
                    z = true;
                }
            }
        }
        if (z) {
            n(1);
        }
    }

    @Override // android.view.ViewGroup
    protected boolean checkLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return (layoutParams instanceof e) && super.checkLayoutParams(layoutParams);
    }

    @Override // android.view.ViewGroup
    protected boolean drawChild(Canvas canvas, View view, long j) {
        view.getLayoutParams();
        return super.drawChild(canvas, view, j);
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void drawableStateChanged() {
        super.drawableStateChanged();
        int[] drawableState = getDrawableState();
        Drawable drawable = this.hi;
        boolean state = false;
        if (drawable != null && drawable.isStateful()) {
            state = false | drawable.setState(drawableState);
        }
        if (state) {
            invalidate();
        }
    }

    @Override // android.view.ViewGroup
    protected /* synthetic */ ViewGroup.LayoutParams generateDefaultLayoutParams() {
        return new e();
    }

    @Override // android.view.ViewGroup
    public /* synthetic */ ViewGroup.LayoutParams generateLayoutParams(AttributeSet attributeSet) {
        return new e(getContext(), attributeSet);
    }

    @Override // android.view.ViewGroup
    protected /* synthetic */ ViewGroup.LayoutParams generateLayoutParams(ViewGroup.LayoutParams layoutParams) {
        if (layoutParams instanceof e) {
            return new e((e) layoutParams);
        }
        return layoutParams instanceof ViewGroup.MarginLayoutParams ? new e((ViewGroup.MarginLayoutParams) layoutParams) : new e(layoutParams);
    }

    @Override // android.view.ViewGroup
    public int getNestedScrollAxes() {
        return this.hk.getNestedScrollAxes();
    }

    @Override // android.view.View
    protected int getSuggestedMinimumHeight() {
        return Math.max(super.getSuggestedMinimumHeight(), getPaddingTop() + getPaddingBottom());
    }

    @Override // android.view.View
    protected int getSuggestedMinimumWidth() {
        return Math.max(super.getSuggestedMinimumWidth(), getPaddingLeft() + getPaddingRight());
    }

    /* JADX WARN: Code duplicated, block: B:25:0x00c4  */
    /* JADX WARN: Code duplicated, block: B:82:0x0205  */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r2v28, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r6v0 */
    /* JADX WARN: Type inference failed for: r6v1, types: [int] */
    /* JADX WARN: Type inference failed for: r6v13 */
    final void n(int i) {
        int i2;
        boolean z;
        Rect rect;
        int i3;
        boolean z2;
        boolean z3;
        int width;
        int i4;
        int height;
        int i5;
        int iF = n.f(this);
        int size = this.gW.size();
        Rect rectAK = aK();
        Rect rectAK2 = aK();
        Rect rectAK3 = aK();
        boolean z4 = false;
        int i6 = 0;
        while (i6 < size) {
            View view = (View) this.gW.get(i6);
            e eVar = (e) view.getLayoutParams();
            if (i == 0 && view.getVisibility() == 8) {
                i3 = size;
                rect = rectAK3;
                z = z4;
                i2 = i6;
            } else {
                for (?? r6 = z4; r6 < i6; r6++) {
                    if (eVar.hw == ((View) this.gW.get(r6))) {
                        e eVar2 = (e) view.getLayoutParams();
                        if (eVar2.hv != null) {
                            Rect rectAK4 = aK();
                            Rect rectAK5 = aK();
                            Rect rectAK6 = aK();
                            m.a(this, eVar2.hv, rectAK4);
                            a(view, z4, rectAK5);
                            int measuredWidth = view.getMeasuredWidth();
                            int measuredHeight = view.getMeasuredHeight();
                            a(iF, rectAK4, rectAK6, eVar2, measuredWidth, measuredHeight);
                            if (rectAK6.left == rectAK5.left) {
                                int i7 = rectAK6.top;
                                int i8 = rectAK5.top;
                            }
                            a(eVar2, rectAK6, measuredWidth, measuredHeight);
                            int i9 = rectAK6.left - rectAK5.left;
                            int i10 = rectAK6.top - rectAK5.top;
                            if (i9 != 0) {
                                n.f(view, i9);
                            }
                            if (i10 != 0) {
                                n.d(view, i10);
                            }
                            a(rectAK4);
                            a(rectAK5);
                            a(rectAK6);
                        }
                    }
                    eVar = eVar;
                    size = size;
                    i6 = i6;
                    rectAK3 = rectAK3;
                    z4 = false;
                }
                int i11 = size;
                Rect rect2 = rectAK3;
                i2 = i6;
                e eVar3 = eVar;
                a(view, true, rectAK2);
                if (eVar3.hr != 0 && !rectAK2.isEmpty()) {
                    int absoluteGravity = android.support.v4.view.d.getAbsoluteGravity(eVar3.hr, iF);
                    int i12 = absoluteGravity & 112;
                    if (i12 == 48) {
                        rectAK.top = Math.max(rectAK.top, rectAK2.bottom);
                    } else if (i12 == 80) {
                        rectAK.bottom = Math.max(rectAK.bottom, getHeight() - rectAK2.top);
                    }
                    int i13 = absoluteGravity & 7;
                    if (i13 == 3) {
                        rectAK.left = Math.max(rectAK.left, rectAK2.right);
                    } else if (i13 == 5) {
                        rectAK.right = Math.max(rectAK.right, getWidth() - rectAK2.left);
                    }
                }
                if (eVar3.hs == 0 || view.getVisibility() != 0 || !n.m(view) || view.getWidth() <= 0 || view.getHeight() <= 0) {
                    z = false;
                } else {
                    e eVar4 = (e) view.getLayoutParams();
                    Rect rectAK7 = aK();
                    Rect rectAK8 = aK();
                    rectAK8.set(view.getLeft(), view.getTop(), view.getRight(), view.getBottom());
                    rectAK7.set(rectAK8);
                    a(rectAK8);
                    if (rectAK7.isEmpty()) {
                        z = false;
                    } else {
                        int absoluteGravity2 = android.support.v4.view.d.getAbsoluteGravity(eVar4.hs, iF);
                        if ((absoluteGravity2 & 48) != 48 || (i5 = (rectAK7.top - eVar4.topMargin) - eVar4.hu) >= rectAK.top) {
                            z2 = false;
                        } else {
                            b(view, rectAK.top - i5);
                            z2 = true;
                        }
                        if ((absoluteGravity2 & 80) == 80 && (height = ((getHeight() - rectAK7.bottom) - eVar4.bottomMargin) + eVar4.hu) < rectAK.bottom) {
                            b(view, height - rectAK.bottom);
                            z2 = true;
                        }
                        if (!z2) {
                            b(view, 0);
                        }
                        if ((absoluteGravity2 & 3) != 3 || (i4 = (rectAK7.left - eVar4.leftMargin) - eVar4.ht) >= rectAK.left) {
                            z3 = false;
                        } else {
                            a(view, rectAK.left - i4);
                            z3 = true;
                        }
                        if ((absoluteGravity2 & 5) == 5 && (width = ((getWidth() - rectAK7.right) - eVar4.rightMargin) + eVar4.ht) < rectAK.right) {
                            a(view, width - rectAK.right);
                            z3 = true;
                        }
                        if (z3) {
                            z = false;
                        } else {
                            z = false;
                            a(view, 0);
                        }
                    }
                    a(rectAK7);
                }
                if (i != 2) {
                    rect = rect2;
                    rect.set(((e) view.getLayoutParams()).hB);
                    if (rect.equals(rectAK2)) {
                        i3 = i11;
                    } else {
                        ((e) view.getLayoutParams()).hB.set(rectAK2);
                    }
                } else {
                    rect = rect2;
                }
                i3 = i11;
                for (int i14 = i2 + 1; i14 < i3; i14++) {
                    ((View) this.gW.get(i14)).getLayoutParams();
                }
            }
            i6 = i2 + 1;
            z4 = z;
            size = i3;
            rectAK3 = rect;
        }
        a(rectAK);
        a(rectAK2);
        a(rectAK3);
    }

    @Override // android.support.v4.view.j
    public final void o(int i) {
        this.hk.cd();
        int childCount = getChildCount();
        for (int i2 = 0; i2 < childCount; i2++) {
            e eVar = (e) getChildAt(i2).getLayoutParams();
            if (eVar.q(i)) {
                eVar.p(i);
                eVar.aQ();
            }
        }
        this.hd = null;
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        aL();
        if (this.hf) {
            if (this.he == null) {
                this.he = new f(this);
            }
            getViewTreeObserver().addOnPreDrawListener(this.he);
        }
        if (this.hg == null && n.j(this)) {
            n.i(this);
        }
        this.mIsAttachedToWindow = true;
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        aL();
        if (this.hf && this.he != null) {
            getViewTreeObserver().removeOnPreDrawListener(this.he);
        }
        if (this.hd != null) {
            onStopNestedScroll(this.hd);
        }
        this.mIsAttachedToWindow = false;
    }

    @Override // android.view.View
    public void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (!this.hh || this.hi == null) {
            return;
        }
        int systemWindowInsetTop = this.hg != null ? this.hg.getSystemWindowInsetTop() : 0;
        if (systemWindowInsetTop > 0) {
            this.hi.setBounds(0, 0, getWidth(), systemWindowInsetTop);
            this.hi.draw(canvas);
        }
    }

    @Override // android.view.ViewGroup
    public boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        int actionMasked = motionEvent.getActionMasked();
        if (actionMasked == 0) {
            aL();
        }
        a(motionEvent);
        if (actionMasked != 1 && actionMasked != 3) {
            return false;
        }
        aL();
        return false;
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onLayout(boolean z, int i, int i2, int i3, int i4) {
        Rect rectAK;
        Rect rectAK2;
        int iF = n.f(this);
        int size = this.gW.size();
        for (int i5 = 0; i5 < size; i5++) {
            View view = (View) this.gW.get(i5);
            if (view.getVisibility() != 8) {
                view.getLayoutParams();
                e eVar = (e) view.getLayoutParams();
                if (eVar.hv == null && eVar.hq != -1) {
                    throw new IllegalStateException("An anchor may not be changed after CoordinatorLayout measurement begins before layout is complete.");
                }
                if (eVar.hv != null) {
                    View view2 = eVar.hv;
                    rectAK = aK();
                    rectAK2 = aK();
                    try {
                        m.a(this, view2, rectAK);
                        e eVar2 = (e) view.getLayoutParams();
                        int measuredWidth = view.getMeasuredWidth();
                        int measuredHeight = view.getMeasuredHeight();
                        a(iF, rectAK, rectAK2, eVar2, measuredWidth, measuredHeight);
                        a(eVar2, rectAK2, measuredWidth, measuredHeight);
                        view.layout(rectAK2.left, rectAK2.top, rectAK2.right, rectAK2.bottom);
                    } catch (Throwable th) {
                        a(rectAK);
                        a(rectAK2);
                        throw th;
                    }
                } else if (eVar.hp >= 0) {
                    int i6 = eVar.hp;
                    e eVar3 = (e) view.getLayoutParams();
                    int absoluteGravity = android.support.v4.view.d.getAbsoluteGravity(m(eVar3.gravity), iF);
                    int i7 = absoluteGravity & 7;
                    int i8 = absoluteGravity & 112;
                    int width = getWidth();
                    int height = getHeight();
                    int measuredWidth2 = view.getMeasuredWidth();
                    int measuredHeight2 = view.getMeasuredHeight();
                    if (iF == 1) {
                        i6 = width - i6;
                    }
                    int iK = k(i6) - measuredWidth2;
                    if (i7 == 1) {
                        iK += measuredWidth2 / 2;
                    } else if (i7 == 5) {
                        iK += measuredWidth2;
                    }
                    int i9 = i8 != 16 ? i8 != 80 ? 0 : 0 + measuredHeight2 : (measuredHeight2 / 2) + 0;
                    int iMax = Math.max(getPaddingLeft() + eVar3.leftMargin, Math.min(iK, ((width - getPaddingRight()) - measuredWidth2) - eVar3.rightMargin));
                    int iMax2 = Math.max(getPaddingTop() + eVar3.topMargin, Math.min(i9, ((height - getPaddingBottom()) - measuredHeight2) - eVar3.bottomMargin));
                    view.layout(iMax, iMax2, measuredWidth2 + iMax, measuredHeight2 + iMax2);
                } else {
                    e eVar4 = (e) view.getLayoutParams();
                    rectAK = aK();
                    rectAK.set(getPaddingLeft() + eVar4.leftMargin, getPaddingTop() + eVar4.topMargin, (getWidth() - getPaddingRight()) - eVar4.rightMargin, (getHeight() - getPaddingBottom()) - eVar4.bottomMargin);
                    if (this.hg != null && n.j(this) && !n.j(view)) {
                        rectAK.left += this.hg.getSystemWindowInsetLeft();
                        rectAK.top += this.hg.getSystemWindowInsetTop();
                        rectAK.right -= this.hg.getSystemWindowInsetRight();
                        rectAK.bottom -= this.hg.getSystemWindowInsetBottom();
                    }
                    rectAK2 = aK();
                    int iL = l(eVar4.gravity);
                    int measuredWidth3 = view.getMeasuredWidth();
                    int measuredHeight3 = view.getMeasuredHeight();
                    if (Build.VERSION.SDK_INT >= 17) {
                        Gravity.apply(iL, measuredWidth3, measuredHeight3, rectAK, rectAK2, iF);
                    } else {
                        Gravity.apply(iL, measuredWidth3, measuredHeight3, rectAK, rectAK2);
                    }
                    view.layout(rectAK2.left, rectAK2.top, rectAK2.right, rectAK2.bottom);
                }
                a(rectAK);
                a(rectAK2);
            }
        }
    }

    /* JADX WARN: Code duplicated, block: B:140:0x0075 A[SYNTHETIC] */
    /* JADX WARN: Code duplicated, block: B:25:0x005e  */
    /* JADX WARN: Code duplicated, block: B:27:0x006a  */
    /* JADX WARN: Code duplicated, block: B:29:0x006e  */
    /* JADX WARN: Code duplicated, block: B:34:0x007d  */
    /*  JADX ERROR: JadxRuntimeException in pass: RegionMakerVisitor
        jadx.core.utils.exceptions.JadxRuntimeException: Not found exit edge by exit block: B:35:0x0085
        	at jadx.core.dex.visitors.regions.maker.LoopRegionMaker.checkLoopExits(LoopRegionMaker.java:272)
        	at jadx.core.dex.visitors.regions.maker.LoopRegionMaker.makeLoopRegion(LoopRegionMaker.java:237)
        	at jadx.core.dex.visitors.regions.maker.LoopRegionMaker.process(LoopRegionMaker.java:80)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:92)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:69)
        	at jadx.core.dex.visitors.regions.maker.IfRegionMaker.process(IfRegionMaker.java:117)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:109)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:69)
        	at jadx.core.dex.visitors.regions.maker.IfRegionMaker.process(IfRegionMaker.java:111)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:109)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:69)
        	at jadx.core.dex.visitors.regions.maker.IfRegionMaker.process(IfRegionMaker.java:111)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:109)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:69)
        	at jadx.core.dex.visitors.regions.maker.IfRegionMaker.process(IfRegionMaker.java:117)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:109)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:69)
        	at jadx.core.dex.visitors.regions.maker.IfRegionMaker.process(IfRegionMaker.java:111)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:109)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:69)
        	at jadx.core.dex.visitors.regions.maker.LoopRegionMaker.process(LoopRegionMaker.java:162)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:92)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:69)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeMthRegion(RegionMaker.java:49)
        	at jadx.core.dex.visitors.regions.RegionMakerVisitor.visit(RegionMakerVisitor.java:25)
        */
    @Override // android.view.View
    protected void onMeasure(int r30, int r31) {
        /*
            Method dump skipped, instruction units count: 748
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.design.widget.CoordinatorLayout.onMeasure(int, int):void");
    }

    @Override // android.view.ViewGroup, android.view.ViewParent, android.support.v4.view.i
    public boolean onNestedFling(View view, float f, float f2, boolean z) {
        int childCount = getChildCount();
        for (int i = 0; i < childCount; i++) {
            View childAt = getChildAt(i);
            if (childAt.getVisibility() != 8) {
                childAt.getLayoutParams();
            }
        }
        return false;
    }

    @Override // android.view.ViewGroup, android.view.ViewParent, android.support.v4.view.i
    public boolean onNestedPreFling(View view, float f, float f2) {
        int childCount = getChildCount();
        for (int i = 0; i < childCount; i++) {
            View childAt = getChildAt(i);
            if (childAt.getVisibility() != 8) {
                childAt.getLayoutParams();
            }
        }
        return false;
    }

    @Override // android.view.ViewGroup, android.view.ViewParent, android.support.v4.view.i
    public void onNestedPreScroll(View view, int i, int i2, int[] iArr) {
        a(i, i2, iArr, 0);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent, android.support.v4.view.i
    public void onNestedScroll(View view, int i, int i2, int i3, int i4) {
        b(i4, 0);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent, android.support.v4.view.i
    public void onNestedScrollAccepted(View view, View view2, int i) {
        a(view2, i, 0);
    }

    @Override // android.view.View
    protected void onRestoreInstanceState(Parcelable parcelable) {
        if (!(parcelable instanceof SavedState)) {
            super.onRestoreInstanceState(parcelable);
            return;
        }
        SavedState savedState = (SavedState) parcelable;
        super.onRestoreInstanceState(savedState.getSuperState());
        SparseArray sparseArray = savedState.hD;
        int childCount = getChildCount();
        for (int i = 0; i < childCount; i++) {
            View childAt = getChildAt(i);
            int id = childAt.getId();
            c cVar = a(childAt).hm;
            if (id != -1 && cVar != null) {
                sparseArray.get(id);
            }
        }
    }

    @Override // android.view.View
    protected Parcelable onSaveInstanceState() {
        android.view.AbsSavedState absSavedState;
        SavedState savedState = new SavedState(super.onSaveInstanceState());
        SparseArray sparseArray = new SparseArray();
        int childCount = getChildCount();
        for (int i = 0; i < childCount; i++) {
            View childAt = getChildAt(i);
            int id = childAt.getId();
            c cVar = ((e) childAt.getLayoutParams()).hm;
            if (id != -1 && cVar != null && (absSavedState = View.BaseSavedState.EMPTY_STATE) != null) {
                sparseArray.append(id, absSavedState);
            }
        }
        savedState.hD = sparseArray;
        return savedState;
    }

    @Override // android.view.ViewGroup, android.view.ViewParent, android.support.v4.view.i
    public boolean onStartNestedScroll(View view, View view2, int i) {
        return a(i, 0);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent, android.support.v4.view.i
    public void onStopNestedScroll(View view) {
        o(0);
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent motionEvent) {
        int actionMasked = motionEvent.getActionMasked();
        if (this.hc == null) {
            a(motionEvent);
        } else {
            c cVar = ((e) this.hc.getLayoutParams()).hm;
        }
        boolean zOnTouchEvent = this.hc == null ? false | super.onTouchEvent(motionEvent) : false;
        if (actionMasked == 1 || actionMasked == 3) {
            aL();
        }
        return zOnTouchEvent;
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public boolean requestChildRectangleOnScreen(View view, Rect rect, boolean z) {
        view.getLayoutParams();
        return super.requestChildRectangleOnScreen(view, rect, z);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public void requestDisallowInterceptTouchEvent(boolean z) {
        super.requestDisallowInterceptTouchEvent(z);
        if (!z || this.ha) {
            return;
        }
        aL();
        this.ha = true;
    }

    @Override // android.view.View
    public void setFitsSystemWindows(boolean z) {
        super.setFitsSystemWindows(z);
        if (Build.VERSION.SDK_INT >= 21) {
            if (!n.j(this)) {
                n.a(this, (l) null);
                return;
            }
            if (this.hj == null) {
                this.hj = new a(this);
            }
            n.a(this, this.hj);
            setSystemUiVisibility(CarplayMessage.BASE_IAP2);
        }
    }

    @Override // android.view.ViewGroup
    public void setOnHierarchyChangeListener(ViewGroup.OnHierarchyChangeListener onHierarchyChangeListener) {
        this.mOnHierarchyChangeListener = onHierarchyChangeListener;
    }

    @Override // android.view.View
    public void setVisibility(int i) {
        super.setVisibility(i);
        boolean z = i == 0;
        if (this.hi == null || this.hi.isVisible() == z) {
            return;
        }
        this.hi.setVisible(z, false);
    }

    @Override // android.view.View
    protected boolean verifyDrawable(Drawable drawable) {
        return super.verifyDrawable(drawable) || drawable == this.hi;
    }
}
