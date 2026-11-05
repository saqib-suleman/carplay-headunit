package android.support.v4.c;

import java.util.Iterator;
import java.util.Map;
import java.util.NoSuchElementException;

/* JADX INFO: loaded from: classes.dex */
final class l implements Iterator, Map.Entry {
    final /* synthetic */ h mA;
    int mEnd;
    boolean mEntryValid = false;
    int mIndex = -1;

    l(h hVar) {
        this.mA = hVar;
        this.mEnd = hVar.colGetSize() - 1;
    }

    @Override // java.util.Map.Entry
    public final boolean equals(Object obj) {
        if (!this.mEntryValid) {
            throw new IllegalStateException("This container does not support retaining Map.Entry objects");
        }
        if (!(obj instanceof Map.Entry)) {
            return false;
        }
        Map.Entry entry = (Map.Entry) obj;
        return e.equal(entry.getKey(), this.mA.colGetEntry(this.mIndex, 0)) && e.equal(entry.getValue(), this.mA.colGetEntry(this.mIndex, 1));
    }

    @Override // java.util.Map.Entry
    public final Object getKey() {
        if (this.mEntryValid) {
            return this.mA.colGetEntry(this.mIndex, 0);
        }
        throw new IllegalStateException("This container does not support retaining Map.Entry objects");
    }

    @Override // java.util.Map.Entry
    public final Object getValue() {
        if (this.mEntryValid) {
            return this.mA.colGetEntry(this.mIndex, 1);
        }
        throw new IllegalStateException("This container does not support retaining Map.Entry objects");
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.mIndex < this.mEnd;
    }

    @Override // java.util.Map.Entry
    public final int hashCode() {
        if (!this.mEntryValid) {
            throw new IllegalStateException("This container does not support retaining Map.Entry objects");
        }
        Object objColGetEntry = this.mA.colGetEntry(this.mIndex, 0);
        Object objColGetEntry2 = this.mA.colGetEntry(this.mIndex, 1);
        return (objColGetEntry == null ? 0 : objColGetEntry.hashCode()) ^ (objColGetEntry2 != null ? objColGetEntry2.hashCode() : 0);
    }

    @Override // java.util.Iterator
    public final /* synthetic */ Object next() {
        if (!hasNext()) {
            throw new NoSuchElementException();
        }
        this.mIndex++;
        this.mEntryValid = true;
        return this;
    }

    @Override // java.util.Iterator
    public final void remove() {
        if (!this.mEntryValid) {
            throw new IllegalStateException();
        }
        this.mA.colRemoveAt(this.mIndex);
        this.mIndex--;
        this.mEnd--;
        this.mEntryValid = false;
    }

    @Override // java.util.Map.Entry
    public final Object setValue(Object obj) {
        if (this.mEntryValid) {
            return this.mA.colSetValue(this.mIndex, obj);
        }
        throw new IllegalStateException("This container does not support retaining Map.Entry objects");
    }

    public final String toString() {
        return getKey() + "=" + getValue();
    }
}
