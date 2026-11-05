package android.support.v4.view.a;

import android.graphics.Rect;
import android.os.Build;
import android.view.accessibility.AccessibilityNodeInfo;
import com.autochips.carplay.common.CarplayMessage;

/* JADX INFO: loaded from: classes.dex */
public final class a {
    private final AccessibilityNodeInfo nW;
    public int nX = -1;

    private a(AccessibilityNodeInfo accessibilityNodeInfo) {
        this.nW = accessibilityNodeInfo;
    }

    public static a a(AccessibilityNodeInfo accessibilityNodeInfo) {
        return new a(accessibilityNodeInfo);
    }

    public final void addAction(int i) {
        this.nW.addAction(i);
    }

    public final AccessibilityNodeInfo cq() {
        return this.nW;
    }

    public final void cr() {
        this.nW.setParent(null);
    }

    public final void cs() {
        this.nW.setScrollable(true);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        a aVar = (a) obj;
        if (this.nW == null) {
            if (aVar.nW != null) {
                return false;
            }
        } else if (!this.nW.equals(aVar.nW)) {
            return false;
        }
        return true;
    }

    public final int hashCode() {
        if (this.nW == null) {
            return 0;
        }
        return this.nW.hashCode();
    }

    public final void setClassName(CharSequence charSequence) {
        this.nW.setClassName(charSequence);
    }

    public final String toString() {
        String str;
        StringBuilder sb = new StringBuilder();
        sb.append(super.toString());
        Rect rect = new Rect();
        this.nW.getBoundsInParent(rect);
        sb.append("; boundsInParent: " + rect);
        this.nW.getBoundsInScreen(rect);
        sb.append("; boundsInScreen: " + rect);
        sb.append("; packageName: ");
        sb.append(this.nW.getPackageName());
        sb.append("; className: ");
        sb.append(this.nW.getClassName());
        sb.append("; text: ");
        sb.append(this.nW.getText());
        sb.append("; contentDescription: ");
        sb.append(this.nW.getContentDescription());
        sb.append("; viewId: ");
        sb.append(Build.VERSION.SDK_INT >= 18 ? this.nW.getViewIdResourceName() : null);
        sb.append("; checkable: ");
        sb.append(this.nW.isCheckable());
        sb.append("; checked: ");
        sb.append(this.nW.isChecked());
        sb.append("; focusable: ");
        sb.append(this.nW.isFocusable());
        sb.append("; focused: ");
        sb.append(this.nW.isFocused());
        sb.append("; selected: ");
        sb.append(this.nW.isSelected());
        sb.append("; clickable: ");
        sb.append(this.nW.isClickable());
        sb.append("; longClickable: ");
        sb.append(this.nW.isLongClickable());
        sb.append("; enabled: ");
        sb.append(this.nW.isEnabled());
        sb.append("; password: ");
        sb.append(this.nW.isPassword());
        sb.append("; scrollable: " + this.nW.isScrollable());
        sb.append("; [");
        int actions = this.nW.getActions();
        while (actions != 0) {
            int iNumberOfTrailingZeros = 1 << Integer.numberOfTrailingZeros(actions);
            actions &= ~iNumberOfTrailingZeros;
            switch (iNumberOfTrailingZeros) {
                case 1:
                    str = "ACTION_FOCUS";
                    break;
                case 2:
                    str = "ACTION_CLEAR_FOCUS";
                    break;
                case 4:
                    str = "ACTION_SELECT";
                    break;
                case 8:
                    str = "ACTION_CLEAR_SELECTION";
                    break;
                case 16:
                    str = "ACTION_CLICK";
                    break;
                case 32:
                    str = "ACTION_LONG_CLICK";
                    break;
                case 64:
                    str = "ACTION_ACCESSIBILITY_FOCUS";
                    break;
                case 128:
                    str = "ACTION_CLEAR_ACCESSIBILITY_FOCUS";
                    break;
                case CarplayMessage.BASE_USER_CMD /* 256 */:
                    str = "ACTION_NEXT_AT_MOVEMENT_GRANULARITY";
                    break;
                case CarplayMessage.BASE_USB_NCM /* 512 */:
                    str = "ACTION_PREVIOUS_AT_MOVEMENT_GRANULARITY";
                    break;
                case CarplayMessage.BASE_WIFI_AP /* 1024 */:
                    str = "ACTION_NEXT_HTML_ELEMENT";
                    break;
                case CarplayMessage.BASE_NET /* 2048 */:
                    str = "ACTION_PREVIOUS_HTML_ELEMENT";
                    break;
                case CarplayMessage.BASE_BACKCAR_EVENT /* 4096 */:
                    str = "ACTION_SCROLL_FORWARD";
                    break;
                case 8192:
                    str = "ACTION_SCROLL_BACKWARD";
                    break;
                case 16384:
                    str = "ACTION_COPY";
                    break;
                case 32768:
                    str = "ACTION_PASTE";
                    break;
                case 65536:
                    str = "ACTION_CUT";
                    break;
                case 131072:
                    str = "ACTION_SET_SELECTION";
                    break;
                default:
                    str = "ACTION_UNKNOWN";
                    break;
            }
            sb.append(str);
            if (actions != 0) {
                sb.append(", ");
            }
        }
        sb.append("]");
        return sb.toString();
    }
}
