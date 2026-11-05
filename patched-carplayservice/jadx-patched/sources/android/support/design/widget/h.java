package android.support.design.widget;

import android.support.v4.view.n;
import android.view.View;
import java.util.Comparator;

/* JADX INFO: loaded from: classes.dex */
final class h implements Comparator {
    h() {
    }

    @Override // java.util.Comparator
    public final /* synthetic */ int compare(Object obj, Object obj2) {
        float fN = n.n((View) obj);
        float fN2 = n.n((View) obj2);
        if (fN > fN2) {
            return -1;
        }
        return fN < fN2 ? 1 : 0;
    }
}
