package android.arch.a.b;

import java.util.Iterator;

/* JADX INFO: Access modifiers changed from: package-private */
/* JADX INFO: loaded from: classes.dex */
public final class f implements h, Iterator {
    private e o;
    private boolean p;
    final /* synthetic */ b q;

    private f(b bVar) {
        this.q = bVar;
        this.p = true;
    }

    /* synthetic */ f(b bVar, byte b) {
        this(bVar);
    }

    @Override // android.arch.a.b.h
    public final void c(e eVar) {
        if (eVar == this.o) {
            this.o = this.o.n;
            this.p = this.o == null;
        }
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        if (this.p) {
            return this.q.i != null;
        }
        return (this.o == null || this.o.m == null) ? false : true;
    }

    @Override // java.util.Iterator
    public final /* synthetic */ Object next() {
        e eVar;
        if (this.p) {
            this.p = false;
            eVar = this.q.i;
        } else {
            eVar = this.o != null ? this.o.m : null;
        }
        this.o = eVar;
        return this.o;
    }
}
