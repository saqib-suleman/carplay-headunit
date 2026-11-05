package android.support.v4.view;

import android.os.Build;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeProvider;

/* JADX INFO: loaded from: classes.dex */
public class b {
    private static final View.AccessibilityDelegate mJ = new View.AccessibilityDelegate();
    private final View.AccessibilityDelegate mK = new c(this);

    public static android.support.v4.view.a.b c(View view) {
        AccessibilityNodeProvider accessibilityNodeProvider;
        if (Build.VERSION.SDK_INT < 16 || (accessibilityNodeProvider = mJ.getAccessibilityNodeProvider(view)) == null) {
            return null;
        }
        return new android.support.v4.view.a.b(accessibilityNodeProvider);
    }

    public static boolean dispatchPopulateAccessibilityEvent(View view, AccessibilityEvent accessibilityEvent) {
        return mJ.dispatchPopulateAccessibilityEvent(view, accessibilityEvent);
    }

    public static void onPopulateAccessibilityEvent(View view, AccessibilityEvent accessibilityEvent) {
        mJ.onPopulateAccessibilityEvent(view, accessibilityEvent);
    }

    public static boolean onRequestSendAccessibilityEvent(ViewGroup viewGroup, View view, AccessibilityEvent accessibilityEvent) {
        return mJ.onRequestSendAccessibilityEvent(viewGroup, view, accessibilityEvent);
    }

    public static void sendAccessibilityEvent(View view, int i) {
        mJ.sendAccessibilityEvent(view, i);
    }

    public static void sendAccessibilityEventUnchecked(View view, AccessibilityEvent accessibilityEvent) {
        mJ.sendAccessibilityEventUnchecked(view, accessibilityEvent);
    }

    public void a(View view, android.support.v4.view.a.a aVar) {
        mJ.onInitializeAccessibilityNodeInfo(view, aVar.cq());
    }

    final View.AccessibilityDelegate cc() {
        return this.mK;
    }

    public void onInitializeAccessibilityEvent(View view, AccessibilityEvent accessibilityEvent) {
        mJ.onInitializeAccessibilityEvent(view, accessibilityEvent);
    }

    public boolean performAccessibilityAction(View view, int i, Bundle bundle) {
        if (Build.VERSION.SDK_INT >= 16) {
            return mJ.performAccessibilityAction(view, i, bundle);
        }
        return false;
    }
}
