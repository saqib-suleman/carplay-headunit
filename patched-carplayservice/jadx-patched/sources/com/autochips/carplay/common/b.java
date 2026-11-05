package com.autochips.carplay.common;

/* JADX INFO: loaded from: classes.dex */
public final class b {
    int qt;
    int qu;
    d qv;
    int qw;
    int qx;

    public b(int i, int i2, int i3, int i4, int i5, int i6) {
        this.qt = i;
        this.qu = i2;
        this.qv = new d(i3, i4);
        this.qw = i5;
        this.qx = i6;
    }

    public final boolean a(b bVar) {
        if (bVar == null) {
            return false;
        }
        return (this.qt == bVar.qt && this.qu == bVar.qu) ? false : true;
    }

    public final boolean b(b bVar) {
        if (bVar == null) {
            return false;
        }
        return (this.qv.equals(bVar.qv) && this.qw == bVar.qw && this.qx == bVar.qx) ? false : true;
    }

    public final int cS() {
        return this.qt;
    }

    public final d cT() {
        return this.qv;
    }

    public final int cU() {
        return this.qw;
    }

    public final int cV() {
        return this.qx;
    }

    public final boolean equals(Object obj) {
        if (obj != null && getClass() == obj.getClass() && (obj instanceof b)) {
            b bVar = (b) obj;
            if (this.qt == bVar.qt && this.qu == bVar.qu && this.qv.equals(bVar.qv) && this.qw == bVar.qw && this.qx == bVar.qx) {
                return true;
            }
        }
        return false;
    }

    public final int getMainAudio() {
        return this.qu;
    }

    public final int hashCode() {
        return this.qt + this.qu + this.qv.hashCode() + this.qw + this.qx;
    }
}
