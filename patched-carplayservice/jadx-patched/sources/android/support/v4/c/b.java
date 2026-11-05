package android.support.v4.c;

import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
final class b extends h {
    final /* synthetic */ a ms;

    b(a aVar) {
        this.ms = aVar;
    }

    @Override // android.support.v4.c.h
    protected final void colClear() {
        this.ms.clear();
    }

    @Override // android.support.v4.c.h
    protected final Object colGetEntry(int i, int i2) {
        return this.ms.mArray[(i << 1) + i2];
    }

    @Override // android.support.v4.c.h
    protected final Map colGetMap() {
        return this.ms;
    }

    @Override // android.support.v4.c.h
    protected final int colGetSize() {
        return this.ms.mSize;
    }

    @Override // android.support.v4.c.h
    protected final int colIndexOfKey(Object obj) {
        return this.ms.indexOfKey(obj);
    }

    @Override // android.support.v4.c.h
    protected final int colIndexOfValue(Object obj) {
        return this.ms.indexOfValue(obj);
    }

    @Override // android.support.v4.c.h
    protected final void colPut(Object obj, Object obj2) {
        this.ms.put(obj, obj2);
    }

    @Override // android.support.v4.c.h
    protected final void colRemoveAt(int i) {
        this.ms.removeAt(i);
    }

    @Override // android.support.v4.c.h
    protected final Object colSetValue(int i, Object obj) {
        a aVar = this.ms;
        int i2 = (i << 1) + 1;
        Object obj2 = aVar.mArray[i2];
        aVar.mArray[i2] = obj;
        return obj2;
    }
}
