package android.support.v4.view;

import android.view.View;
import java.util.Comparator;

/* JADX INFO: loaded from: classes.dex */
final class v implements Comparator {
    v() {
    }

    @Override // java.util.Comparator
    public final /* synthetic */ int compare(Object obj, Object obj2) {
        ViewPager.LayoutParams layoutParams = (ViewPager.LayoutParams) ((View) obj).getLayoutParams();
        ViewPager.LayoutParams layoutParams2 = (ViewPager.LayoutParams) ((View) obj2).getLayoutParams();
        if (layoutParams.isDecor != layoutParams2.isDecor) {
            return layoutParams.isDecor ? 1 : -1;
        }
        return layoutParams.position - layoutParams2.position;
    }
}
