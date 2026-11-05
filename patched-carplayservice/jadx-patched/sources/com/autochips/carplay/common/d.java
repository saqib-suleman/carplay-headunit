package com.autochips.carplay.common;

/* JADX INFO: loaded from: classes.dex */
public final class d {
    public int qA;
    public int qB;

    d(int i, int i2) {
        this.qA = i;
        this.qB = i2;
    }

    public final boolean equals(Object obj) {
        if (obj != null && getClass() == obj.getClass() && (obj instanceof d)) {
            d dVar = (d) obj;
            if (this.qA == dVar.qA && this.qB == dVar.qB) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return this.qA + this.qB;
    }
}
