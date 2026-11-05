package com.autochips.carplay.common;

/* JADX INFO: loaded from: classes.dex */
public final class g {
    public int qK = 0;
    public int qL = 0;
    public int qM = 0;
    public int qN = 0;
    final /* synthetic */ f qO;

    public g(f fVar) {
        this.qO = fVar;
    }

    public final boolean equals(Object obj) {
        if (obj != null && getClass() == obj.getClass() && (obj instanceof g)) {
            g gVar = (g) obj;
            if (this.qK == gVar.qK && this.qL == gVar.qL && this.qM == gVar.qM && this.qN == gVar.qN) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return this.qK + this.qL + this.qM + this.qN;
    }

    public final String toString() {
        StringBuffer stringBuffer = new StringBuffer();
        stringBuffer.append("transferType: ");
        stringBuffer.append(this.qK);
        stringBuffer.append(", transferPriority: ");
        stringBuffer.append(this.qL);
        stringBuffer.append(", takeConstraint: ");
        stringBuffer.append(this.qM);
        stringBuffer.append(", borrowOrUnborrowConstraint: ");
        stringBuffer.append(this.qN);
        stringBuffer.append("\n");
        return stringBuffer.toString();
    }
}
