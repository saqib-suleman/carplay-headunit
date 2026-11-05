package android.support.v4.app;

import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public final class ak {
    private final List iW;
    private final List iX;
    private final List iY;

    ak(List list, List list2, List list3) {
        this.iW = list;
        this.iX = list2;
        this.iY = list3;
    }

    final List bG() {
        return this.iY;
    }

    final List getChildNonConfigs() {
        return this.iX;
    }

    final List getFragments() {
        return this.iW;
    }
}
