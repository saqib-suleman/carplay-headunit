package android.support.v4.c;

import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
final class d extends h {
    final /* synthetic */ c mt;

    d(c cVar) {
        this.mt = cVar;
    }

    @Override // android.support.v4.c.h
    protected final void colClear() {
        this.mt.clear();
    }

    @Override // android.support.v4.c.h
    protected final Object colGetEntry(int i, int i2) {
        return this.mt.mArray[i];
    }

    @Override // android.support.v4.c.h
    protected final Map colGetMap() {
        throw new UnsupportedOperationException("not a map");
    }

    @Override // android.support.v4.c.h
    protected final int colGetSize() {
        return this.mt.mSize;
    }

    @Override // android.support.v4.c.h
    protected final int colIndexOfKey(Object obj) {
        return this.mt.indexOf(obj);
    }

    @Override // android.support.v4.c.h
    protected final int colIndexOfValue(Object obj) {
        return this.mt.indexOf(obj);
    }

    @Override // android.support.v4.c.h
    protected final void colPut(Object obj, Object obj2) {
        this.mt.add(obj);
    }

    @Override // android.support.v4.c.h
    protected final void colRemoveAt(int i) {
        this.mt.removeAt(i);
    }

    @Override // android.support.v4.c.h
    protected final Object colSetValue(int i, Object obj) {
        throw new UnsupportedOperationException("not a map");
    }
}
