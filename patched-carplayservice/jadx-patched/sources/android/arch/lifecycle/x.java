package android.arch.lifecycle;

import java.util.HashMap;
import java.util.Iterator;

/* JADX INFO: loaded from: classes.dex */
public final class x {
    private final HashMap mMap = new HashMap();

    final void a(String str, u uVar) {
        u uVar2 = (u) this.mMap.put(str, uVar);
        if (uVar2 != null) {
            uVar2.p();
        }
    }

    final u b(String str) {
        return (u) this.mMap.get(str);
    }

    public final void clear() {
        Iterator it = this.mMap.values().iterator();
        while (it.hasNext()) {
            ((u) it.next()).p();
        }
        this.mMap.clear();
    }
}
