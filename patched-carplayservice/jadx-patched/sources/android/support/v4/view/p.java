package android.support.v4.view;

import java.util.Comparator;

/* JADX INFO: loaded from: classes.dex */
final class p implements Comparator {
    p() {
    }

    @Override // java.util.Comparator
    public final /* bridge */ /* synthetic */ int compare(Object obj, Object obj2) {
        return ((s) obj).position - ((s) obj2).position;
    }
}
