package android.support.v4.c;

import java.util.Iterator;
import java.util.NoSuchElementException;

/* JADX INFO: loaded from: classes.dex */
final class i implements Iterator {
    final /* synthetic */ h mA;
    boolean mCanRemove = false;
    int mIndex;
    final int mOffset;
    int mSize;

    i(h hVar, int i) {
        this.mA = hVar;
        this.mOffset = i;
        this.mSize = hVar.colGetSize();
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.mIndex < this.mSize;
    }

    @Override // java.util.Iterator
    public final Object next() {
        if (!hasNext()) {
            throw new NoSuchElementException();
        }
        Object objColGetEntry = this.mA.colGetEntry(this.mIndex, this.mOffset);
        this.mIndex++;
        this.mCanRemove = true;
        return objColGetEntry;
    }

    @Override // java.util.Iterator
    public final void remove() {
        if (!this.mCanRemove) {
            throw new IllegalStateException();
        }
        this.mIndex--;
        this.mSize--;
        this.mCanRemove = false;
        this.mA.colRemoveAt(this.mIndex);
    }
}
