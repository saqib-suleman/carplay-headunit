package android.support.v4.widget;

import android.os.Build;
import android.os.Bundle;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import android.widget.ScrollView;
import com.autochips.carplay.common.CarplayMessage;

/* JADX INFO: loaded from: classes.dex */
final class f extends android.support.v4.view.b {
    f() {
    }

    @Override // android.support.v4.view.b
    public final void a(View view, android.support.v4.view.a.a aVar) {
        int iCB;
        super.a(view, aVar);
        NestedScrollView nestedScrollView = (NestedScrollView) view;
        aVar.setClassName(ScrollView.class.getName());
        if (!nestedScrollView.isEnabled() || (iCB = nestedScrollView.cB()) <= 0) {
            return;
        }
        aVar.cs();
        if (nestedScrollView.getScrollY() > 0) {
            aVar.addAction(8192);
        }
        if (nestedScrollView.getScrollY() < iCB) {
            aVar.addAction(CarplayMessage.BASE_BACKCAR_EVENT);
        }
    }

    @Override // android.support.v4.view.b
    public final void onInitializeAccessibilityEvent(View view, AccessibilityEvent accessibilityEvent) {
        super.onInitializeAccessibilityEvent(view, accessibilityEvent);
        NestedScrollView nestedScrollView = (NestedScrollView) view;
        accessibilityEvent.setClassName(ScrollView.class.getName());
        accessibilityEvent.setScrollable(nestedScrollView.cB() > 0);
        accessibilityEvent.setScrollX(nestedScrollView.getScrollX());
        accessibilityEvent.setScrollY(nestedScrollView.getScrollY());
        int scrollX = nestedScrollView.getScrollX();
        if (Build.VERSION.SDK_INT >= 15) {
            accessibilityEvent.setMaxScrollX(scrollX);
        }
        int iCB = nestedScrollView.cB();
        if (Build.VERSION.SDK_INT >= 15) {
            accessibilityEvent.setMaxScrollY(iCB);
        }
    }

    @Override // android.support.v4.view.b
    public final boolean performAccessibilityAction(View view, int i, Bundle bundle) {
        if (super.performAccessibilityAction(view, i, bundle)) {
            return true;
        }
        NestedScrollView nestedScrollView = (NestedScrollView) view;
        if (!nestedScrollView.isEnabled()) {
            return false;
        }
        if (i == 4096) {
            int iMin = Math.min(nestedScrollView.getScrollY() + ((nestedScrollView.getHeight() - nestedScrollView.getPaddingBottom()) - nestedScrollView.getPaddingTop()), nestedScrollView.cB());
            if (iMin == nestedScrollView.getScrollY()) {
                return false;
            }
            nestedScrollView.K(iMin);
            return true;
        }
        if (i != 8192) {
            return false;
        }
        int iMax = Math.max(nestedScrollView.getScrollY() - ((nestedScrollView.getHeight() - nestedScrollView.getPaddingBottom()) - nestedScrollView.getPaddingTop()), 0);
        if (iMax == nestedScrollView.getScrollY()) {
            return false;
        }
        nestedScrollView.K(iMax);
        return true;
    }
}
