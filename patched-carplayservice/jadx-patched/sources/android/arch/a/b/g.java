package android.arch.a.b;

import java.util.Iterator;

/* JADX INFO: loaded from: classes.dex */
abstract class g implements h, Iterator {
    e m;
    e r;

    g(e eVar, e eVar2) {
        this.r = eVar2;
        this.m = eVar;
    }

    private e e() {
        if (this.m == this.r || this.r == null) {
            return null;
        }
        return a(this.m);
    }

    abstract e a(e eVar);

    abstract e b(e eVar);

    @Override // android.arch.a.b.h
    public final void c(e eVar) {
        if (this.r == eVar && eVar == this.m) {
            this.m = null;
            this.r = null;
        }
        if (this.r == eVar) {
            this.r = b(this.r);
        }
        if (this.m == eVar) {
            this.m = e();
        }
    }

    @Override // java.util.Iterator
    public boolean hasNext() {
        return this.m != null;
    }

    @Override // java.util.Iterator
    public /* synthetic */ Object next() {
        e eVar = this.m;
        this.m = e();
        return eVar;
    }
}
