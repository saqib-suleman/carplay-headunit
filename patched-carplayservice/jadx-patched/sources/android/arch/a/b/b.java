package android.arch.a.b;

import java.util.Iterator;
import java.util.Map;
import java.util.WeakHashMap;

/* JADX INFO: loaded from: classes.dex */
public class b implements Iterable {
    private e i;
    private e j;
    private WeakHashMap k = new WeakHashMap();
    private int mSize = 0;

    protected e a(Object obj) {
        e eVar = this.i;
        while (eVar != null && !eVar.l.equals(obj)) {
            eVar = eVar.m;
        }
        return eVar;
    }

    protected final e a(Object obj, Object obj2) {
        e eVar = new e(obj, obj2);
        this.mSize++;
        if (this.j == null) {
            this.i = eVar;
            this.j = this.i;
            return eVar;
        }
        this.j.m = eVar;
        eVar.n = this.j;
        this.j = eVar;
        return eVar;
    }

    public final f c() {
        f fVar = new f(this, (byte) 0);
        this.k.put(fVar, false);
        return fVar;
    }

    public final Map.Entry d() {
        return this.j;
    }

    public final Iterator descendingIterator() {
        d dVar = new d(this.j, this.i);
        this.k.put(dVar, false);
        return dVar;
    }

    public final Map.Entry eldest() {
        return this.i;
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof b)) {
            return false;
        }
        b bVar = (b) obj;
        if (this.mSize != bVar.mSize) {
            return false;
        }
        Iterator it = iterator();
        Iterator it2 = bVar.iterator();
        while (it.hasNext() && it2.hasNext()) {
            Map.Entry entry = (Map.Entry) it.next();
            Object next = it2.next();
            if ((entry == null && next != null) || (entry != null && !entry.equals(next))) {
                return false;
            }
        }
        return (it.hasNext() || it2.hasNext()) ? false : true;
    }

    public int hashCode() {
        Iterator it = iterator();
        int iHashCode = 0;
        while (it.hasNext()) {
            iHashCode += ((Map.Entry) it.next()).hashCode();
        }
        return iHashCode;
    }

    @Override // java.lang.Iterable
    public Iterator iterator() {
        c cVar = new c(this.i, this.j);
        this.k.put(cVar, false);
        return cVar;
    }

    public Object putIfAbsent(Object obj, Object obj2) {
        e eVarA = a(obj);
        if (eVarA != null) {
            return eVarA.mValue;
        }
        a(obj, obj2);
        return null;
    }

    public Object remove(Object obj) {
        e eVarA = a(obj);
        if (eVarA == null) {
            return null;
        }
        this.mSize--;
        if (!this.k.isEmpty()) {
            Iterator it = this.k.keySet().iterator();
            while (it.hasNext()) {
                ((h) it.next()).c(eVarA);
            }
        }
        if (eVarA.n != null) {
            eVarA.n.m = eVarA.m;
        } else {
            this.i = eVarA.m;
        }
        if (eVarA.m != null) {
            eVarA.m.n = eVarA.n;
        } else {
            this.j = eVarA.n;
        }
        eVarA.m = null;
        eVarA.n = null;
        return eVarA.mValue;
    }

    public final int size() {
        return this.mSize;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("[");
        Iterator it = iterator();
        while (it.hasNext()) {
            sb.append(((Map.Entry) it.next()).toString());
            if (it.hasNext()) {
                sb.append(", ");
            }
        }
        sb.append("]");
        return sb.toString();
    }
}
