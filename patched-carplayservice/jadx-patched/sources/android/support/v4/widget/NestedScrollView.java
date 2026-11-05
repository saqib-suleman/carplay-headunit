package android.support.v4.widget;

import android.R;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.os.Build;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.v4.view.n;
import android.util.Log;
import android.util.TypedValue;
import android.view.FocusFinder;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.animation.AnimationUtils;
import android.widget.EdgeEffect;
import android.widget.FrameLayout;
import android.widget.OverScroller;
import java.util.ArrayList;

/* JADX INFO: loaded from: classes.dex */
public final class NestedScrollView extends FrameLayout implements android.support.v4.view.g, android.support.v4.view.j {
    private static final f pk = new f();
    private static final int[] pl = {R.attr.fillViewport};
    private int mActivePointerId;
    private final Rect mTempRect;
    private VelocityTracker mVelocityTracker;
    private int nC;
    private int nD;
    private boolean nt;
    private int nx;
    private long oV;
    private OverScroller oW;
    private EdgeEffect oX;
    private EdgeEffect oY;
    private int oZ;
    private boolean pa;
    private boolean pb;
    private View pc;
    private boolean pd;
    private boolean pe;
    private final int[] pf;
    private final int[] pg;
    private int ph;
    private int pi;
    private SavedState pj;
    private final android.support.v4.view.k pm;
    private final android.support.v4.view.h pn;
    private float po;

    class SavedState extends View.BaseSavedState {
        public static final Parcelable.Creator CREATOR = new g();
        public int scrollPosition;

        SavedState(Parcel parcel) {
            super(parcel);
            this.scrollPosition = parcel.readInt();
        }

        SavedState(Parcelable parcelable) {
            super(parcelable);
        }

        public String toString() {
            return "HorizontalScrollView.SavedState{" + Integer.toHexString(System.identityHashCode(this)) + " scrollPosition=" + this.scrollPosition + "}";
        }

        @Override // android.view.View.BaseSavedState, android.view.AbsSavedState, android.os.Parcelable
        public void writeToParcel(Parcel parcel, int i) {
            super.writeToParcel(parcel, i);
            parcel.writeInt(this.scrollPosition);
        }
    }

    private boolean A(int i) {
        return this.pn.A(i);
    }

    private void B(int i) {
        this.pn.B(i);
    }

    private boolean D(View view) {
        return !b(view, 0, getHeight());
    }

    private void E(View view) {
        view.getDrawingRect(this.mTempRect);
        offsetDescendantRectToMyCoords(view, this.mTempRect);
        int iComputeScrollDeltaToGetChildRectOnScreen = computeScrollDeltaToGetChildRectOnScreen(this.mTempRect);
        if (iComputeScrollDeltaToGetChildRectOnScreen != 0) {
            scrollBy(0, iComputeScrollDeltaToGetChildRectOnScreen);
        }
    }

    private void J(int i) {
        if (i != 0) {
            if (this.pe) {
                smoothScrollBy(0, i);
            } else {
                scrollBy(0, i);
            }
        }
    }

    private void L(int i) {
        int scrollY = getScrollY();
        boolean z = (scrollY > 0 || i > 0) && (scrollY < cB() || i < 0);
        float f = i;
        if (dispatchNestedPreFling(0.0f, f)) {
            return;
        }
        dispatchNestedFling(0.0f, f, z);
        if (getChildCount() > 0) {
            c(2, 1);
            this.oW.fling(getScrollX(), getScrollY(), 0, i, 0, 0, Integer.MIN_VALUE, Integer.MAX_VALUE, 0, 0);
            this.pi = getScrollY();
            n.d(this);
        }
    }

    private boolean a(int i, int i2, int i3, int i4) {
        boolean z;
        boolean z2;
        getOverScrollMode();
        computeHorizontalScrollRange();
        computeHorizontalScrollExtent();
        computeVerticalScrollRange();
        computeVerticalScrollExtent();
        int i5 = i2 + 0;
        int i6 = i + i3;
        int i7 = 0 + i4;
        if (i5 <= 0 && i5 >= 0) {
            z = false;
        } else {
            z = true;
            i5 = 0;
        }
        if (i6 > i7) {
            z2 = true;
        } else if (i6 < 0) {
            z2 = true;
            i7 = 0;
        } else {
            i7 = i6;
            z2 = false;
        }
        if (z2 && !A(1)) {
            this.oW.springBack(i5, i7, 0, 0, 0, cB());
        }
        onOverScrolled(i5, i7, z, z2);
        return z || z2;
    }

    private boolean a(int i, int i2, int i3, int i4, int[] iArr, int i5) {
        return this.pn.a(i, i2, i3, i4, iArr, i5);
    }

    private boolean a(int i, int i2, int[] iArr, int[] iArr2, int i3) {
        return this.pn.a(i, i2, iArr, iArr2, i3);
    }

    private boolean arrowScroll(int i) {
        View viewFindFocus = findFocus();
        if (viewFindFocus == this) {
            viewFindFocus = null;
        }
        View viewFindNextFocus = FocusFinder.getInstance().findNextFocus(this, viewFindFocus, i);
        int height = (int) (0.5f * getHeight());
        if (viewFindNextFocus == null || !b(viewFindNextFocus, height, getHeight())) {
            if (i == 33 && getScrollY() < height) {
                height = getScrollY();
            } else if (i == 130 && getChildCount() > 0) {
                View childAt = getChildAt(0);
                height = Math.min((childAt.getBottom() + ((FrameLayout.LayoutParams) childAt.getLayoutParams()).bottomMargin) - ((getScrollY() + getHeight()) - getPaddingBottom()), height);
            }
            if (height == 0) {
                return false;
            }
            if (i != 130) {
                height = -height;
            }
            J(height);
        } else {
            viewFindNextFocus.getDrawingRect(this.mTempRect);
            offsetDescendantRectToMyCoords(viewFindNextFocus, this.mTempRect);
            J(computeScrollDeltaToGetChildRectOnScreen(this.mTempRect));
            viewFindNextFocus.requestFocus(i);
        }
        if (viewFindFocus == null || !viewFindFocus.isFocused() || !D(viewFindFocus)) {
            return true;
        }
        int descendantFocusability = getDescendantFocusability();
        setDescendantFocusability(131072);
        requestFocus();
        setDescendantFocusability(descendantFocusability);
        return true;
    }

    private void b(MotionEvent motionEvent) {
        int actionIndex = motionEvent.getActionIndex();
        if (motionEvent.getPointerId(actionIndex) == this.mActivePointerId) {
            int i = actionIndex == 0 ? 1 : 0;
            this.oZ = (int) motionEvent.getY(i);
            this.mActivePointerId = motionEvent.getPointerId(i);
            if (this.mVelocityTracker != null) {
                this.mVelocityTracker.clear();
            }
        }
    }

    /* JADX WARN: Code duplicated, block: B:32:0x0069  */
    private boolean b(int i, int i2, int i3) {
        boolean z;
        int height = getHeight();
        int scrollY = getScrollY();
        int i4 = height + scrollY;
        boolean z2 = i == 33;
        ArrayList focusables = getFocusables(2);
        int size = focusables.size();
        View view = null;
        boolean z3 = false;
        for (int i5 = 0; i5 < size; i5++) {
            View view2 = (View) focusables.get(i5);
            int top = view2.getTop();
            int bottom = view2.getBottom();
            if (i2 < bottom && top < i3) {
                boolean z4 = i2 < top && bottom < i3;
                if (view == null) {
                    view = view2;
                    z3 = z4;
                } else {
                    boolean z5 = (z2 && top < view.getTop()) || (!z2 && bottom > view.getBottom());
                    if (z3) {
                        if (z4 && z5) {
                            view = view2;
                        }
                    } else if (z4) {
                        view = view2;
                        z3 = true;
                    } else if (z5) {
                        view = view2;
                    }
                }
            }
        }
        if (view == null) {
            view = this;
        }
        if (i2 < scrollY || i3 > i4) {
            J(z2 ? i2 - scrollY : i3 - i4);
            z = true;
        } else {
            z = false;
        }
        if (view != findFocus()) {
            view.requestFocus(i);
        }
        return z;
    }

    private boolean b(View view, int i, int i2) {
        view.getDrawingRect(this.mTempRect);
        offsetDescendantRectToMyCoords(view, this.mTempRect);
        return this.mTempRect.bottom + i >= getScrollY() && this.mTempRect.top - i <= getScrollY() + i2;
    }

    private static int c(int i, int i2, int i3) {
        if (i2 >= i3 || i < 0) {
            return 0;
        }
        return i2 + i > i3 ? i3 - i2 : i;
    }

    private boolean c(int i, int i2) {
        return this.pn.c(i, i2);
    }

    private void cA() {
        if (this.mVelocityTracker != null) {
            this.mVelocityTracker.recycle();
            this.mVelocityTracker = null;
        }
    }

    private void cC() {
        this.nt = false;
        cA();
        B(0);
        if (this.oX != null) {
            this.oX.onRelease();
            this.oY.onRelease();
        }
    }

    private void cD() {
        if (getOverScrollMode() == 2) {
            this.oX = null;
            this.oY = null;
        } else if (this.oX == null) {
            Context context = getContext();
            this.oX = new EdgeEffect(context);
            this.oY = new EdgeEffect(context);
        }
    }

    private int computeScrollDeltaToGetChildRectOnScreen(Rect rect) {
        if (getChildCount() == 0) {
            return 0;
        }
        int height = getHeight();
        int scrollY = getScrollY();
        int i = scrollY + height;
        int verticalFadingEdgeLength = getVerticalFadingEdgeLength();
        if (rect.top > 0) {
            scrollY += verticalFadingEdgeLength;
        }
        View childAt = getChildAt(0);
        FrameLayout.LayoutParams layoutParams = (FrameLayout.LayoutParams) childAt.getLayoutParams();
        int i2 = rect.bottom < (childAt.getHeight() + layoutParams.topMargin) + layoutParams.bottomMargin ? i - verticalFadingEdgeLength : i;
        if (rect.bottom > i2 && rect.top > scrollY) {
            return Math.min(0 + (rect.height() > height ? rect.top - scrollY : rect.bottom - i2), (childAt.getBottom() + layoutParams.bottomMargin) - i);
        }
        if (rect.top >= scrollY || rect.bottom >= i2) {
            return 0;
        }
        return Math.max(rect.height() > height ? 0 - (i2 - rect.bottom) : 0 - (scrollY - rect.top), -getScrollY());
    }

    private void cz() {
        if (this.mVelocityTracker == null) {
            this.mVelocityTracker = VelocityTracker.obtain();
        }
    }

    private boolean fullScroll(int i) {
        int childCount;
        boolean z = i == 130;
        int height = getHeight();
        this.mTempRect.top = 0;
        this.mTempRect.bottom = height;
        if (z && (childCount = getChildCount()) > 0) {
            View childAt = getChildAt(childCount - 1);
            this.mTempRect.bottom = childAt.getBottom() + ((FrameLayout.LayoutParams) childAt.getLayoutParams()).bottomMargin + getPaddingBottom();
            this.mTempRect.top = this.mTempRect.bottom - height;
        }
        return b(i, this.mTempRect.top, this.mTempRect.bottom);
    }

    private static boolean isViewDescendantOf(View view, View view2) {
        if (view == view2) {
            return true;
        }
        Object parent = view.getParent();
        return (parent instanceof ViewGroup) && isViewDescendantOf((View) parent, view2);
    }

    private void smoothScrollBy(int i, int i2) {
        if (getChildCount() == 0) {
            return;
        }
        if (AnimationUtils.currentAnimationTimeMillis() - this.oV > 250) {
            View childAt = getChildAt(0);
            FrameLayout.LayoutParams layoutParams = (FrameLayout.LayoutParams) childAt.getLayoutParams();
            int height = childAt.getHeight() + layoutParams.topMargin + layoutParams.bottomMargin;
            int height2 = (getHeight() - getPaddingTop()) - getPaddingBottom();
            int scrollY = getScrollY();
            int iMax = Math.max(0, Math.min(i2 + scrollY, Math.max(0, height - height2))) - scrollY;
            this.pi = getScrollY();
            this.oW.startScroll(getScrollX(), scrollY, 0, iMax);
            n.d(this);
        } else {
            if (!this.oW.isFinished()) {
                this.oW.abortAnimation();
            }
            scrollBy(i, i2);
        }
        this.oV = AnimationUtils.currentAnimationTimeMillis();
    }

    public final void K(int i) {
        smoothScrollBy(0 - getScrollX(), i - getScrollY());
    }

    @Override // android.support.v4.view.j
    public final void a(int i, int i2, int[] iArr, int i3) {
        a(i, i2, iArr, null, i3);
    }

    @Override // android.support.v4.view.j
    public final void a(View view, int i, int i2) {
        this.pm.D(i);
        c(2, i2);
    }

    @Override // android.support.v4.view.j
    public final boolean a(int i, int i2) {
        return (i & 2) != 0;
    }

    @Override // android.view.ViewGroup
    public final void addView(View view) {
        if (getChildCount() > 0) {
            throw new IllegalStateException("ScrollView can host only one direct child");
        }
        super.addView(view);
    }

    @Override // android.view.ViewGroup
    public final void addView(View view, int i) {
        if (getChildCount() > 0) {
            throw new IllegalStateException("ScrollView can host only one direct child");
        }
        super.addView(view, i);
    }

    @Override // android.view.ViewGroup
    public final void addView(View view, int i, ViewGroup.LayoutParams layoutParams) {
        if (getChildCount() > 0) {
            throw new IllegalStateException("ScrollView can host only one direct child");
        }
        super.addView(view, i, layoutParams);
    }

    @Override // android.view.ViewGroup, android.view.ViewManager
    public final void addView(View view, ViewGroup.LayoutParams layoutParams) {
        if (getChildCount() > 0) {
            throw new IllegalStateException("ScrollView can host only one direct child");
        }
        super.addView(view, layoutParams);
    }

    @Override // android.support.v4.view.j
    public final void b(int i, int i2) {
        int scrollY = getScrollY();
        scrollBy(0, i);
        int scrollY2 = getScrollY() - scrollY;
        a(0, scrollY2, 0, i - scrollY2, null, i2);
    }

    final int cB() {
        if (getChildCount() <= 0) {
            return 0;
        }
        View childAt = getChildAt(0);
        FrameLayout.LayoutParams layoutParams = (FrameLayout.LayoutParams) childAt.getLayoutParams();
        return Math.max(0, ((childAt.getHeight() + layoutParams.topMargin) + layoutParams.bottomMargin) - ((getHeight() - getPaddingTop()) - getPaddingBottom()));
    }

    @Override // android.view.View
    public final int computeHorizontalScrollExtent() {
        return super.computeHorizontalScrollExtent();
    }

    @Override // android.view.View
    public final int computeHorizontalScrollOffset() {
        return super.computeHorizontalScrollOffset();
    }

    @Override // android.view.View
    public final int computeHorizontalScrollRange() {
        return super.computeHorizontalScrollRange();
    }

    @Override // android.view.View
    public final void computeScroll() {
        EdgeEffect edgeEffect;
        boolean z = false;
        if (!this.oW.computeScrollOffset()) {
            if (A(1)) {
                B(1);
            }
            this.pi = 0;
            return;
        }
        this.oW.getCurrX();
        int currY = this.oW.getCurrY();
        int i = currY - this.pi;
        if (a(0, i, this.pg, null, 1)) {
            i -= this.pg[1];
        }
        if (i != 0) {
            int iCB = cB();
            int scrollY = getScrollY();
            a(i, getScrollX(), scrollY, iCB);
            int scrollY2 = getScrollY() - scrollY;
            if (!a(0, scrollY2, 0, i - scrollY2, null, 1)) {
                int overScrollMode = getOverScrollMode();
                if (overScrollMode == 0 || (overScrollMode == 1 && iCB > 0)) {
                    z = true;
                }
                if (z) {
                    cD();
                    if (currY <= 0 && scrollY > 0) {
                        edgeEffect = this.oX;
                    } else if (currY >= iCB && scrollY < iCB) {
                        edgeEffect = this.oY;
                    }
                    edgeEffect.onAbsorb((int) this.oW.getCurrVelocity());
                }
            }
        }
        this.pi = currY;
        n.d(this);
    }

    @Override // android.view.View
    public final int computeVerticalScrollExtent() {
        return super.computeVerticalScrollExtent();
    }

    @Override // android.view.View
    public final int computeVerticalScrollOffset() {
        return Math.max(0, super.computeVerticalScrollOffset());
    }

    @Override // android.view.View
    public final int computeVerticalScrollRange() {
        int childCount = getChildCount();
        int height = (getHeight() - getPaddingBottom()) - getPaddingTop();
        if (childCount == 0) {
            return height;
        }
        View childAt = getChildAt(0);
        int bottom = childAt.getBottom() + ((FrameLayout.LayoutParams) childAt.getLayoutParams()).bottomMargin;
        int scrollY = getScrollY();
        int iMax = Math.max(0, bottom - height);
        if (scrollY < 0) {
            return bottom - scrollY;
        }
        return scrollY > iMax ? bottom + (scrollY - iMax) : bottom;
    }

    /* JADX WARN: Code duplicated, block: B:25:0x0067  */
    /* JADX WARN: Code duplicated, block: B:9:0x0039  */
    @Override // android.view.ViewGroup, android.view.View
    public final boolean dispatchKeyEvent(KeyEvent keyEvent) {
        boolean z;
        boolean zArrowScroll;
        if (super.dispatchKeyEvent(keyEvent)) {
            return true;
        }
        this.mTempRect.setEmpty();
        if (getChildCount() > 0) {
            View childAt = getChildAt(0);
            FrameLayout.LayoutParams layoutParams = (FrameLayout.LayoutParams) childAt.getLayoutParams();
            if (childAt.getHeight() + layoutParams.topMargin + layoutParams.bottomMargin > (getHeight() - getPaddingTop()) - getPaddingBottom()) {
                z = true;
            } else {
                z = false;
            }
        } else {
            z = false;
        }
        if (z) {
            if (keyEvent.getAction() == 0) {
                int keyCode = keyEvent.getKeyCode();
                if (keyCode != 62) {
                    switch (keyCode) {
                        case 19:
                            zArrowScroll = !keyEvent.isAltPressed() ? arrowScroll(33) : fullScroll(33);
                            break;
                        case 20:
                            zArrowScroll = !keyEvent.isAltPressed() ? arrowScroll(130) : fullScroll(130);
                            break;
                    }
                } else {
                    int i = keyEvent.isShiftPressed() ? 33 : 130;
                    boolean z2 = i == 130;
                    int height = getHeight();
                    if (z2) {
                        this.mTempRect.top = getScrollY() + height;
                        int childCount = getChildCount();
                        if (childCount > 0) {
                            View childAt2 = getChildAt(childCount - 1);
                            int bottom = childAt2.getBottom() + ((FrameLayout.LayoutParams) childAt2.getLayoutParams()).bottomMargin + getPaddingBottom();
                            if (this.mTempRect.top + height > bottom) {
                                this.mTempRect.top = bottom - height;
                            }
                        }
                    } else {
                        this.mTempRect.top = getScrollY() - height;
                        if (this.mTempRect.top < 0) {
                            this.mTempRect.top = 0;
                        }
                    }
                    this.mTempRect.bottom = this.mTempRect.top + height;
                    b(i, this.mTempRect.top, this.mTempRect.bottom);
                }
                zArrowScroll = false;
            } else {
                zArrowScroll = false;
            }
        } else if (!isFocused() || keyEvent.getKeyCode() == 4) {
            zArrowScroll = false;
        } else {
            View viewFindFocus = findFocus();
            if (viewFindFocus == this) {
                viewFindFocus = null;
            }
            View viewFindNextFocus = FocusFinder.getInstance().findNextFocus(this, viewFindFocus, 130);
            if (viewFindNextFocus == null || viewFindNextFocus == this || !viewFindNextFocus.requestFocus(130)) {
                zArrowScroll = false;
            } else {
                zArrowScroll = true;
            }
        }
        return zArrowScroll;
    }

    @Override // android.view.View
    public final boolean dispatchNestedFling(float f, float f2, boolean z) {
        return this.pn.dispatchNestedFling(f, f2, z);
    }

    @Override // android.view.View
    public final boolean dispatchNestedPreFling(float f, float f2) {
        return this.pn.dispatchNestedPreFling(f, f2);
    }

    @Override // android.view.View
    public final boolean dispatchNestedPreScroll(int i, int i2, int[] iArr, int[] iArr2) {
        return a(i, i2, iArr, iArr2, 0);
    }

    @Override // android.view.View
    public final boolean dispatchNestedScroll(int i, int i2, int i3, int i4, int[] iArr) {
        return a(i, i2, i3, i4, iArr, 0);
    }

    @Override // android.view.View
    public final void draw(Canvas canvas) {
        int paddingLeft;
        super.draw(canvas);
        if (this.oX != null) {
            int scrollY = getScrollY();
            int paddingLeft2 = 0;
            if (!this.oX.isFinished()) {
                int iSave = canvas.save();
                int width = getWidth();
                int height = getHeight();
                int iMin = Math.min(0, scrollY);
                if (Build.VERSION.SDK_INT < 21 || getClipToPadding()) {
                    width -= getPaddingLeft() + getPaddingRight();
                    paddingLeft = getPaddingLeft() + 0;
                } else {
                    paddingLeft = 0;
                }
                if (Build.VERSION.SDK_INT >= 21 && getClipToPadding()) {
                    height -= getPaddingTop() + getPaddingBottom();
                    iMin += getPaddingTop();
                }
                canvas.translate(paddingLeft, iMin);
                this.oX.setSize(width, height);
                if (this.oX.draw(canvas)) {
                    n.d(this);
                }
                canvas.restoreToCount(iSave);
            }
            if (this.oY.isFinished()) {
                return;
            }
            int iSave2 = canvas.save();
            int width2 = getWidth();
            int height2 = getHeight();
            int iMax = Math.max(cB(), scrollY) + height2;
            if (Build.VERSION.SDK_INT < 21 || getClipToPadding()) {
                width2 -= getPaddingLeft() + getPaddingRight();
                paddingLeft2 = 0 + getPaddingLeft();
            }
            if (Build.VERSION.SDK_INT >= 21 && getClipToPadding()) {
                height2 -= getPaddingTop() + getPaddingBottom();
                iMax -= getPaddingBottom();
            }
            canvas.translate(paddingLeft2 - width2, iMax);
            canvas.rotate(180.0f, width2, 0.0f);
            this.oY.setSize(width2, height2);
            if (this.oY.draw(canvas)) {
                n.d(this);
            }
            canvas.restoreToCount(iSave2);
        }
    }

    @Override // android.view.View
    protected final float getBottomFadingEdgeStrength() {
        if (getChildCount() == 0) {
            return 0.0f;
        }
        View childAt = getChildAt(0);
        FrameLayout.LayoutParams layoutParams = (FrameLayout.LayoutParams) childAt.getLayoutParams();
        int verticalFadingEdgeLength = getVerticalFadingEdgeLength();
        int bottom = ((childAt.getBottom() + layoutParams.bottomMargin) - getScrollY()) - (getHeight() - getPaddingBottom());
        if (bottom < verticalFadingEdgeLength) {
            return bottom / verticalFadingEdgeLength;
        }
        return 1.0f;
    }

    @Override // android.view.ViewGroup
    public final int getNestedScrollAxes() {
        return this.pm.getNestedScrollAxes();
    }

    @Override // android.view.View
    protected final float getTopFadingEdgeStrength() {
        if (getChildCount() == 0) {
            return 0.0f;
        }
        int verticalFadingEdgeLength = getVerticalFadingEdgeLength();
        int scrollY = getScrollY();
        if (scrollY < verticalFadingEdgeLength) {
            return scrollY / verticalFadingEdgeLength;
        }
        return 1.0f;
    }

    @Override // android.view.View
    public final boolean hasNestedScrollingParent() {
        return A(0);
    }

    @Override // android.view.View
    public final boolean isNestedScrollingEnabled() {
        return this.pn.isNestedScrollingEnabled();
    }

    @Override // android.view.ViewGroup
    protected final void measureChild(View view, int i, int i2) {
        view.measure(getChildMeasureSpec(i, getPaddingLeft() + getPaddingRight(), view.getLayoutParams().width), View.MeasureSpec.makeMeasureSpec(0, 0));
    }

    @Override // android.view.ViewGroup
    protected final void measureChildWithMargins(View view, int i, int i2, int i3, int i4) {
        ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) view.getLayoutParams();
        view.measure(getChildMeasureSpec(i, getPaddingLeft() + getPaddingRight() + marginLayoutParams.leftMargin + marginLayoutParams.rightMargin + i2, marginLayoutParams.width), View.MeasureSpec.makeMeasureSpec(marginLayoutParams.topMargin + marginLayoutParams.bottomMargin, 0));
    }

    @Override // android.support.v4.view.j
    public final void o(int i) {
        this.pm.cd();
        B(i);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.pb = false;
    }

    @Override // android.view.View
    public final boolean onGenericMotionEvent(MotionEvent motionEvent) {
        if ((motionEvent.getSource() & 2) != 0 && motionEvent.getAction() == 8 && !this.nt) {
            float axisValue = motionEvent.getAxisValue(9);
            if (axisValue != 0.0f) {
                if (this.po == 0.0f) {
                    TypedValue typedValue = new TypedValue();
                    Context context = getContext();
                    if (!context.getTheme().resolveAttribute(R.attr.listPreferredItemHeight, typedValue, true)) {
                        throw new IllegalStateException("Expected theme to define listPreferredItemHeight.");
                    }
                    this.po = typedValue.getDimension(context.getResources().getDisplayMetrics());
                }
                int i = (int) (axisValue * this.po);
                int iCB = cB();
                int scrollY = getScrollY();
                int i2 = scrollY - i;
                if (i2 < 0) {
                    i2 = 0;
                } else if (i2 > iCB) {
                    i2 = iCB;
                }
                if (i2 != scrollY) {
                    super.scrollTo(getScrollX(), i2);
                    return true;
                }
            }
        }
        return false;
    }

    /* JADX WARN: Code duplicated, block: B:39:0x00c8  */
    @Override // android.view.ViewGroup
    public final boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        boolean z;
        int action = motionEvent.getAction();
        if (action == 2 && this.nt) {
            return true;
        }
        int i = action & 255;
        if (i != 6) {
            switch (i) {
                case 0:
                    int y = (int) motionEvent.getY();
                    int x = (int) motionEvent.getX();
                    if (getChildCount() > 0) {
                        int scrollY = getScrollY();
                        View childAt = getChildAt(0);
                        if (y < childAt.getTop() - scrollY || y >= childAt.getBottom() - scrollY || x < childAt.getLeft() || x >= childAt.getRight()) {
                            z = false;
                        } else {
                            z = true;
                        }
                    } else {
                        z = false;
                    }
                    if (!z) {
                        this.nt = false;
                        cA();
                    } else {
                        this.oZ = y;
                        this.mActivePointerId = motionEvent.getPointerId(0);
                        if (this.mVelocityTracker == null) {
                            this.mVelocityTracker = VelocityTracker.obtain();
                        } else {
                            this.mVelocityTracker.clear();
                        }
                        this.mVelocityTracker.addMovement(motionEvent);
                        this.oW.computeScrollOffset();
                        this.nt = !this.oW.isFinished();
                        c(2, 0);
                    }
                    break;
                case 1:
                case 3:
                    this.nt = false;
                    this.mActivePointerId = -1;
                    cA();
                    if (this.oW.springBack(getScrollX(), getScrollY(), 0, 0, 0, cB())) {
                        n.d(this);
                    }
                    B(0);
                    break;
                case 2:
                    int i2 = this.mActivePointerId;
                    if (i2 != -1) {
                        int iFindPointerIndex = motionEvent.findPointerIndex(i2);
                        if (iFindPointerIndex != -1) {
                            int y2 = (int) motionEvent.getY(iFindPointerIndex);
                            if (Math.abs(y2 - this.oZ) > this.nx && (2 & getNestedScrollAxes()) == 0) {
                                this.nt = true;
                                this.oZ = y2;
                                cz();
                                this.mVelocityTracker.addMovement(motionEvent);
                                this.ph = 0;
                                ViewParent parent = getParent();
                                if (parent != null) {
                                    parent.requestDisallowInterceptTouchEvent(true);
                                }
                            }
                        } else {
                            Log.e("NestedScrollView", "Invalid pointerId=" + i2 + " in onInterceptTouchEvent");
                        }
                    }
                    break;
            }
        } else {
            b(motionEvent);
        }
        return this.nt;
    }

    @Override // android.widget.FrameLayout, android.view.ViewGroup, android.view.View
    protected final void onLayout(boolean z, int i, int i2, int i3, int i4) {
        super.onLayout(z, i, i2, i3, i4);
        int measuredHeight = 0;
        this.pa = false;
        if (this.pc != null && isViewDescendantOf(this.pc, this)) {
            E(this.pc);
        }
        this.pc = null;
        if (!this.pb) {
            if (this.pj != null) {
                scrollTo(getScrollX(), this.pj.scrollPosition);
                this.pj = null;
            }
            if (getChildCount() > 0) {
                View childAt = getChildAt(0);
                FrameLayout.LayoutParams layoutParams = (FrameLayout.LayoutParams) childAt.getLayoutParams();
                measuredHeight = childAt.getMeasuredHeight() + layoutParams.topMargin + layoutParams.bottomMargin;
            }
            int paddingTop = ((i4 - i2) - getPaddingTop()) - getPaddingBottom();
            int scrollY = getScrollY();
            int iC = c(scrollY, paddingTop, measuredHeight);
            if (iC != scrollY) {
                scrollTo(getScrollX(), iC);
            }
        }
        scrollTo(getScrollX(), getScrollY());
        this.pb = true;
    }

    @Override // android.widget.FrameLayout, android.view.View
    protected final void onMeasure(int i, int i2) {
        super.onMeasure(i, i2);
        if (this.pd && View.MeasureSpec.getMode(i2) != 0 && getChildCount() > 0) {
            View childAt = getChildAt(0);
            FrameLayout.LayoutParams layoutParams = (FrameLayout.LayoutParams) childAt.getLayoutParams();
            int measuredHeight = childAt.getMeasuredHeight();
            int measuredHeight2 = (((getMeasuredHeight() - getPaddingTop()) - getPaddingBottom()) - layoutParams.topMargin) - layoutParams.bottomMargin;
            if (measuredHeight < measuredHeight2) {
                childAt.measure(getChildMeasureSpec(i, getPaddingLeft() + getPaddingRight() + layoutParams.leftMargin + layoutParams.rightMargin, layoutParams.width), View.MeasureSpec.makeMeasureSpec(measuredHeight2, 1073741824));
            }
        }
    }

    @Override // android.view.ViewGroup, android.view.ViewParent, android.support.v4.view.i
    public final boolean onNestedFling(View view, float f, float f2, boolean z) {
        if (z) {
            return false;
        }
        L((int) f2);
        return true;
    }

    @Override // android.view.ViewGroup, android.view.ViewParent, android.support.v4.view.i
    public final boolean onNestedPreFling(View view, float f, float f2) {
        return dispatchNestedPreFling(f, f2);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent, android.support.v4.view.i
    public final void onNestedPreScroll(View view, int i, int i2, int[] iArr) {
        a(i, i2, iArr, 0);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent, android.support.v4.view.i
    public final void onNestedScroll(View view, int i, int i2, int i3, int i4) {
        b(i4, 0);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent, android.support.v4.view.i
    public final void onNestedScrollAccepted(View view, View view2, int i) {
        a(view2, i, 0);
    }

    @Override // android.view.View
    protected final void onOverScrolled(int i, int i2, boolean z, boolean z2) {
        super.scrollTo(i, i2);
    }

    @Override // android.view.ViewGroup
    protected final boolean onRequestFocusInDescendants(int i, Rect rect) {
        if (i == 2) {
            i = 130;
        } else if (i == 1) {
            i = 33;
        }
        View viewFindNextFocus = rect == null ? FocusFinder.getInstance().findNextFocus(this, null, i) : FocusFinder.getInstance().findNextFocusFromRect(this, rect, i);
        if (viewFindNextFocus == null || D(viewFindNextFocus)) {
            return false;
        }
        return viewFindNextFocus.requestFocus(i, rect);
    }

    @Override // android.view.View
    protected final void onRestoreInstanceState(Parcelable parcelable) {
        if (!(parcelable instanceof SavedState)) {
            super.onRestoreInstanceState(parcelable);
            return;
        }
        SavedState savedState = (SavedState) parcelable;
        super.onRestoreInstanceState(savedState.getSuperState());
        this.pj = savedState;
        requestLayout();
    }

    @Override // android.view.View
    protected final Parcelable onSaveInstanceState() {
        SavedState savedState = new SavedState(super.onSaveInstanceState());
        savedState.scrollPosition = getScrollY();
        return savedState;
    }

    @Override // android.view.View
    protected final void onScrollChanged(int i, int i2, int i3, int i4) {
        super.onScrollChanged(i, i2, i3, i4);
    }

    @Override // android.view.View
    protected final void onSizeChanged(int i, int i2, int i3, int i4) {
        super.onSizeChanged(i, i2, i3, i4);
        View viewFindFocus = findFocus();
        if (viewFindFocus == null || this == viewFindFocus || !b(viewFindFocus, 0, i4)) {
            return;
        }
        viewFindFocus.getDrawingRect(this.mTempRect);
        offsetDescendantRectToMyCoords(viewFindFocus, this.mTempRect);
        J(computeScrollDeltaToGetChildRectOnScreen(this.mTempRect));
    }

    @Override // android.view.ViewGroup, android.view.ViewParent, android.support.v4.view.i
    public final boolean onStartNestedScroll(View view, View view2, int i) {
        return a(i, 0);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent, android.support.v4.view.i
    public final void onStopNestedScroll(View view) {
        o(0);
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Code duplicated, block: B:16:0x006a  */
    /* JADX WARN: Code duplicated, block: B:90:0x022e  */
    @Override // android.view.View
    public final boolean onTouchEvent(MotionEvent motionEvent) {
        ViewParent parent;
        EdgeEffect edgeEffect;
        cz();
        MotionEvent motionEventObtain = MotionEvent.obtain(motionEvent);
        int actionMasked = motionEvent.getActionMasked();
        if (actionMasked == 0) {
            this.ph = 0;
        }
        motionEventObtain.offsetLocation(0.0f, this.ph);
        switch (actionMasked) {
            case 0:
                if (getChildCount() == 0) {
                    return false;
                }
                boolean z = !this.oW.isFinished();
                this.nt = z;
                if (z && (parent = getParent()) != null) {
                    parent.requestDisallowInterceptTouchEvent(true);
                }
                if (!this.oW.isFinished()) {
                    this.oW.abortAnimation();
                }
                this.oZ = (int) motionEvent.getY();
                this.mActivePointerId = motionEvent.getPointerId(0);
                c(2, 0);
                if (this.mVelocityTracker != null) {
                    this.mVelocityTracker.addMovement(motionEventObtain);
                }
                motionEventObtain.recycle();
                return true;
            case 1:
                VelocityTracker velocityTracker = this.mVelocityTracker;
                velocityTracker.computeCurrentVelocity(1000, this.nD);
                int yVelocity = (int) velocityTracker.getYVelocity(this.mActivePointerId);
                if (Math.abs(yVelocity) > this.nC) {
                    L(-yVelocity);
                } else if (this.oW.springBack(getScrollX(), getScrollY(), 0, 0, 0, cB())) {
                    n.d(this);
                }
                this.mActivePointerId = -1;
                cC();
                if (this.mVelocityTracker != null) {
                    this.mVelocityTracker.addMovement(motionEventObtain);
                }
                motionEventObtain.recycle();
                return true;
            case 2:
                int iFindPointerIndex = motionEvent.findPointerIndex(this.mActivePointerId);
                if (iFindPointerIndex == -1) {
                    Log.e("NestedScrollView", "Invalid pointerId=" + this.mActivePointerId + " in onTouchEvent");
                } else {
                    int y = (int) motionEvent.getY(iFindPointerIndex);
                    int i = this.oZ - y;
                    if (a(0, i, this.pg, this.pf, 0)) {
                        i -= this.pg[1];
                        motionEventObtain.offsetLocation(0.0f, this.pf[1]);
                        this.ph += this.pf[1];
                    }
                    if (!this.nt && Math.abs(i) > this.nx) {
                        ViewParent parent2 = getParent();
                        if (parent2 != null) {
                            parent2.requestDisallowInterceptTouchEvent(true);
                        }
                        this.nt = true;
                        i = i > 0 ? i - this.nx : i + this.nx;
                    }
                    if (this.nt) {
                        this.oZ = y - this.pf[1];
                        int scrollY = getScrollY();
                        int iCB = cB();
                        int overScrollMode = getOverScrollMode();
                        boolean z2 = overScrollMode == 0 || (overScrollMode == 1 && iCB > 0);
                        if (a(i, 0, getScrollY(), iCB) && !A(0)) {
                            this.mVelocityTracker.clear();
                        }
                        int scrollY2 = getScrollY() - scrollY;
                        if (a(0, scrollY2, 0, i - scrollY2, this.pf, 0)) {
                            this.oZ -= this.pf[1];
                            motionEventObtain.offsetLocation(0.0f, this.pf[1]);
                            this.ph += this.pf[1];
                        } else if (z2) {
                            cD();
                            int i2 = scrollY + i;
                            if (i2 < 0) {
                                e.a(this.oX, i / getHeight(), motionEvent.getX(iFindPointerIndex) / getWidth());
                                if (!this.oY.isFinished()) {
                                    edgeEffect = this.oY;
                                    edgeEffect.onRelease();
                                }
                            } else if (i2 > iCB) {
                                e.a(this.oY, i / getHeight(), 1.0f - (motionEvent.getX(iFindPointerIndex) / getWidth()));
                                if (!this.oX.isFinished()) {
                                    edgeEffect = this.oX;
                                    edgeEffect.onRelease();
                                }
                            }
                            if (this.oX != null && (!this.oX.isFinished() || !this.oY.isFinished())) {
                                n.d(this);
                            }
                        }
                    }
                }
                if (this.mVelocityTracker != null) {
                    this.mVelocityTracker.addMovement(motionEventObtain);
                }
                motionEventObtain.recycle();
                return true;
            case 3:
                if (this.nt && getChildCount() > 0 && this.oW.springBack(getScrollX(), getScrollY(), 0, 0, 0, cB())) {
                    n.d(this);
                }
                this.mActivePointerId = -1;
                cC();
                if (this.mVelocityTracker != null) {
                    this.mVelocityTracker.addMovement(motionEventObtain);
                }
                motionEventObtain.recycle();
                return true;
            case 4:
            default:
                if (this.mVelocityTracker != null) {
                    this.mVelocityTracker.addMovement(motionEventObtain);
                }
                motionEventObtain.recycle();
                return true;
            case 5:
                int actionIndex = motionEvent.getActionIndex();
                this.oZ = (int) motionEvent.getY(actionIndex);
                this.mActivePointerId = motionEvent.getPointerId(actionIndex);
                if (this.mVelocityTracker != null) {
                    this.mVelocityTracker.addMovement(motionEventObtain);
                }
                motionEventObtain.recycle();
                return true;
            case 6:
                b(motionEvent);
                this.oZ = (int) motionEvent.getY(motionEvent.findPointerIndex(this.mActivePointerId));
                if (this.mVelocityTracker != null) {
                    this.mVelocityTracker.addMovement(motionEventObtain);
                }
                motionEventObtain.recycle();
                return true;
        }
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final void requestChildFocus(View view, View view2) {
        if (this.pa) {
            this.pc = view2;
        } else {
            E(view2);
        }
        super.requestChildFocus(view, view2);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final boolean requestChildRectangleOnScreen(View view, Rect rect, boolean z) {
        rect.offset(view.getLeft() - view.getScrollX(), view.getTop() - view.getScrollY());
        int iComputeScrollDeltaToGetChildRectOnScreen = computeScrollDeltaToGetChildRectOnScreen(rect);
        boolean z2 = iComputeScrollDeltaToGetChildRectOnScreen != 0;
        if (z2) {
            if (z) {
                scrollBy(0, iComputeScrollDeltaToGetChildRectOnScreen);
                return z2;
            }
            smoothScrollBy(0, iComputeScrollDeltaToGetChildRectOnScreen);
        }
        return z2;
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final void requestDisallowInterceptTouchEvent(boolean z) {
        if (z) {
            cA();
        }
        super.requestDisallowInterceptTouchEvent(z);
    }

    @Override // android.view.View, android.view.ViewParent
    public final void requestLayout() {
        this.pa = true;
        super.requestLayout();
    }

    @Override // android.view.View
    public final void scrollTo(int i, int i2) {
        if (getChildCount() > 0) {
            View childAt = getChildAt(0);
            FrameLayout.LayoutParams layoutParams = (FrameLayout.LayoutParams) childAt.getLayoutParams();
            int width = (getWidth() - getPaddingLeft()) - getPaddingRight();
            int width2 = childAt.getWidth() + layoutParams.leftMargin + layoutParams.rightMargin;
            int height = (getHeight() - getPaddingTop()) - getPaddingBottom();
            int height2 = childAt.getHeight() + layoutParams.topMargin + layoutParams.bottomMargin;
            int iC = c(i, width, width2);
            int iC2 = c(i2, height, height2);
            if (iC == getScrollX() && iC2 == getScrollY()) {
                return;
            }
            super.scrollTo(iC, iC2);
        }
    }

    @Override // android.view.View
    public final void setNestedScrollingEnabled(boolean z) {
        this.pn.setNestedScrollingEnabled(z);
    }

    @Override // android.widget.FrameLayout, android.view.ViewGroup
    public final boolean shouldDelayChildPressedState() {
        return true;
    }

    @Override // android.view.View
    public final boolean startNestedScroll(int i) {
        return c(i, 0);
    }

    @Override // android.view.View, android.support.v4.view.f
    public final void stopNestedScroll() {
        B(0);
    }
}
