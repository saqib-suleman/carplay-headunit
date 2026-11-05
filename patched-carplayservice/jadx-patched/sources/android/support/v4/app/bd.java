package android.support.v4.app;

import android.view.View;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
final class bd implements Runnable {
    final /* synthetic */ bb jP;
    final /* synthetic */ Map jQ;
    final /* synthetic */ ArrayList js;

    bd(bb bbVar, ArrayList arrayList, Map map) {
        this.jP = bbVar;
        this.js = arrayList;
        this.jQ = map;
    }

    @Override // java.lang.Runnable
    public final void run() {
        String str;
        int size = this.js.size();
        for (int i = 0; i < size; i++) {
            View view = (View) this.js.get(i);
            String strH = android.support.v4.view.n.h(view);
            if (strH != null) {
                Iterator it = this.jQ.entrySet().iterator();
                while (true) {
                    if (!it.hasNext()) {
                        str = null;
                        break;
                    }
                    Map.Entry entry = (Map.Entry) it.next();
                    if (strH.equals(entry.getValue())) {
                        str = (String) entry.getKey();
                        break;
                    }
                }
                android.support.v4.view.n.a(view, str);
            }
        }
    }
}
