package android.support.v4.c;

import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

/* JADX INFO: loaded from: classes.dex */
final class k implements Set {
    final /* synthetic */ h mA;

    k(h hVar) {
        this.mA = hVar;
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean add(Object obj) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean addAll(Collection collection) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Set, java.util.Collection
    public final void clear() {
        this.mA.colClear();
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean contains(Object obj) {
        return this.mA.colIndexOfKey(obj) >= 0;
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean containsAll(Collection collection) {
        Map mapColGetMap = this.mA.colGetMap();
        Iterator it = collection.iterator();
        while (it.hasNext()) {
            if (!mapColGetMap.containsKey(it.next())) {
                return false;
            }
        }
        return true;
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean equals(Object obj) {
        return h.equalsSetHelper(this, obj);
    }

    @Override // java.util.Set, java.util.Collection
    public final int hashCode() {
        int iHashCode = 0;
        for (int iColGetSize = this.mA.colGetSize() - 1; iColGetSize >= 0; iColGetSize--) {
            Object objColGetEntry = this.mA.colGetEntry(iColGetSize, 0);
            iHashCode += objColGetEntry == null ? 0 : objColGetEntry.hashCode();
        }
        return iHashCode;
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean isEmpty() {
        return this.mA.colGetSize() == 0;
    }

    @Override // java.util.Set, java.util.Collection, java.lang.Iterable
    public final Iterator iterator() {
        return new i(this.mA, 0);
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean remove(Object obj) {
        int iColIndexOfKey = this.mA.colIndexOfKey(obj);
        if (iColIndexOfKey < 0) {
            return false;
        }
        this.mA.colRemoveAt(iColIndexOfKey);
        return true;
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean removeAll(Collection collection) {
        Map mapColGetMap = this.mA.colGetMap();
        int size = mapColGetMap.size();
        Iterator it = collection.iterator();
        while (it.hasNext()) {
            mapColGetMap.remove(it.next());
        }
        return size != mapColGetMap.size();
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean retainAll(Collection collection) {
        return h.retainAllHelper(this.mA.colGetMap(), collection);
    }

    @Override // java.util.Set, java.util.Collection
    public final int size() {
        return this.mA.colGetSize();
    }

    @Override // java.util.Set, java.util.Collection
    public final Object[] toArray() {
        return this.mA.toArrayHelper(0);
    }

    @Override // java.util.Set, java.util.Collection
    public final Object[] toArray(Object[] objArr) {
        return this.mA.toArrayHelper(objArr, 0);
    }
}
