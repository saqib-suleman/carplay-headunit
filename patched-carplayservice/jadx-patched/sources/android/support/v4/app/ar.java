package android.support.v4.app;

import java.util.ArrayList;

/* JADX INFO: loaded from: classes.dex */
final class ar implements Runnable {
    final /* synthetic */ ArrayList jn;

    ar(ArrayList arrayList) {
        this.jn = arrayList;
    }

    @Override // java.lang.Runnable
    public final void run() {
        aq.a(this.jn, 4);
    }
}
