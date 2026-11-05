package android.arch.a.b;

import java.util.HashMap;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
public final class a extends b {
    private HashMap h = new HashMap();

    @Override // android.arch.a.b.b
    protected final e a(Object obj) {
        return (e) this.h.get(obj);
    }

    public final Map.Entry b(Object obj) {
        if (contains(obj)) {
            return ((e) this.h.get(obj)).n;
        }
        return null;
    }

    public final boolean contains(Object obj) {
        return this.h.containsKey(obj);
    }

    @Override // android.arch.a.b.b
    public final Object putIfAbsent(Object obj, Object obj2) {
        e eVarA = a(obj);
        if (eVarA != null) {
            return eVarA.mValue;
        }
        this.h.put(obj, a(obj, obj2));
        return null;
    }

    @Override // android.arch.a.b.b
    public final Object remove(Object obj) {
        Object objRemove = super.remove(obj);
        this.h.remove(obj);
        return objRemove;
    }
}
