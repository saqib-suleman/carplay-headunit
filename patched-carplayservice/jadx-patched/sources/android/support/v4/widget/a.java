package android.support.v4.widget;

import android.support.v4.c.o;
import android.support.v4.c.s;
import java.util.ArrayList;
import java.util.HashSet;

/* JADX INFO: loaded from: classes.dex */
public final class a {
    private final o oa;
    private final s ob;
    private final ArrayList oc;
    private final HashSet od;

    private void a(Object obj, ArrayList arrayList, HashSet hashSet) {
        if (arrayList.contains(obj)) {
            return;
        }
        if (hashSet.contains(obj)) {
            throw new RuntimeException("This graph contains cyclic dependencies");
        }
        hashSet.add(obj);
        ArrayList arrayList2 = (ArrayList) this.ob.get(obj);
        if (arrayList2 != null) {
            int size = arrayList2.size();
            for (int i = 0; i < size; i++) {
                a(arrayList2.get(i), arrayList, hashSet);
            }
        }
        hashSet.remove(obj);
        arrayList.add(obj);
    }

    public final void b(Object obj, Object obj2) {
        if (!this.ob.containsKey(obj) || !this.ob.containsKey(obj2)) {
            throw new IllegalArgumentException("All nodes must be present in the graph before being added as an edge");
        }
        ArrayList arrayList = (ArrayList) this.ob.get(obj);
        if (arrayList == null) {
            arrayList = (ArrayList) this.oa.acquire();
            if (arrayList == null) {
                arrayList = new ArrayList();
            }
            this.ob.put(obj, arrayList);
        }
        arrayList.add(obj2);
    }

    public final void clear() {
        int size = this.ob.size();
        for (int i = 0; i < size; i++) {
            ArrayList arrayList = (ArrayList) this.ob.valueAt(i);
            if (arrayList != null) {
                arrayList.clear();
                this.oa.release(arrayList);
            }
        }
        this.ob.clear();
    }

    public final boolean contains(Object obj) {
        return this.ob.containsKey(obj);
    }

    public final ArrayList cu() {
        this.oc.clear();
        this.od.clear();
        int size = this.ob.size();
        for (int i = 0; i < size; i++) {
            a(this.ob.keyAt(i), this.oc, this.od);
        }
        return this.oc;
    }

    public final void o(Object obj) {
        if (this.ob.containsKey(obj)) {
            return;
        }
        this.ob.put(obj, null);
    }

    public final boolean p(Object obj) {
        int size = this.ob.size();
        for (int i = 0; i < size; i++) {
            ArrayList arrayList = (ArrayList) this.ob.valueAt(i);
            if (arrayList != null && arrayList.contains(obj)) {
                return true;
            }
        }
        return false;
    }
}
