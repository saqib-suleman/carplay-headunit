package android.support.v4.c;

import java.util.Collection;
import java.util.Iterator;

/* JADX INFO: loaded from: classes.dex */
final class m implements Collection {
    final /* synthetic */ h mA;

    m(h hVar) {
        this.mA = hVar;
    }

    @Override // java.util.Collection
    public final boolean add(Object obj) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Collection
    public final boolean addAll(Collection collection) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Collection
    public final void clear() {
        this.mA.colClear();
    }

    @Override // java.util.Collection
    public final boolean contains(Object obj) {
        return this.mA.colIndexOfValue(obj) >= 0;
    }

    @Override // java.util.Collection
    public final boolean containsAll(Collection collection) {
        Iterator it = collection.iterator();
        while (it.hasNext()) {
            if (!contains(it.next())) {
                return false;
            }
        }
        return true;
    }

    @Override // java.util.Collection
    public final boolean isEmpty() {
        return this.mA.colGetSize() == 0;
    }

    @Override // java.util.Collection, java.lang.Iterable
    public final Iterator iterator() {
        return new i(this.mA, 1);
    }

    @Override // java.util.Collection
    public final boolean remove(Object obj) {
        int iColIndexOfValue = this.mA.colIndexOfValue(obj);
        if (iColIndexOfValue < 0) {
            return false;
        }
        this.mA.colRemoveAt(iColIndexOfValue);
        return true;
    }

    @Override // java.util.Collection
    public final boolean removeAll(Collection collection) {
        int iColGetSize = this.mA.colGetSize();
        int i = 0;
        boolean z = false;
        while (i < iColGetSize) {
            if (collection.contains(this.mA.colGetEntry(i, 1))) {
                this.mA.colRemoveAt(i);
                i--;
                iColGetSize--;
                z = true;
            }
            i++;
        }
        return z;
    }

    @Override // java.util.Collection
    public final boolean retainAll(Collection collection) {
        int iColGetSize = this.mA.colGetSize();
        int i = 0;
        boolean z = false;
        while (i < iColGetSize) {
            if (!collection.contains(this.mA.colGetEntry(i, 1))) {
                this.mA.colRemoveAt(i);
                i--;
                iColGetSize--;
                z = true;
            }
            i++;
        }
        return z;
    }

    @Override // java.util.Collection
    public final int size() {
        return this.mA.colGetSize();
    }

    @Override // java.util.Collection
    public final Object[] toArray() {
        return this.mA.toArrayHelper(1);
    }

    @Override // java.util.Collection
    public final Object[] toArray(Object[] objArr) {
        return this.mA.toArrayHelper(objArr, 1);
    }
}
