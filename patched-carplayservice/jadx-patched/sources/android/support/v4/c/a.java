package android.support.v4.c;

import java.util.Collection;
import java.util.Map;
import java.util.Set;

/* JADX INFO: loaded from: classes.dex */
public class a extends s implements Map {
    h mr;

    private h bZ() {
        if (this.mr == null) {
            this.mr = new b(this);
        }
        return this.mr;
    }

    @Override // java.util.Map
    public Set entrySet() {
        h hVarBZ = bZ();
        if (hVarBZ.mx == null) {
            hVarBZ.mx = new j(hVarBZ);
        }
        return hVarBZ.mx;
    }

    @Override // java.util.Map
    public Set keySet() {
        return bZ().getKeySet();
    }

    @Override // java.util.Map
    public void putAll(Map map) {
        ensureCapacity(this.mSize + map.size());
        for (Map.Entry entry : map.entrySet()) {
            put(entry.getKey(), entry.getValue());
        }
    }

    public final boolean retainAll(Collection collection) {
        return h.retainAllHelper(this, collection);
    }

    @Override // java.util.Map
    public Collection values() {
        h hVarBZ = bZ();
        if (hVarBZ.mz == null) {
            hVarBZ.mz = new m(hVarBZ);
        }
        return hVarBZ.mz;
    }
}
