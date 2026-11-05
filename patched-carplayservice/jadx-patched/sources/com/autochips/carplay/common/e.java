package com.autochips.carplay.common;

/* JADX INFO: loaded from: classes.dex */
public final class e {
    public boolean qC;
    public int qD;
    public int qE;

    public e(boolean z, int i, int i2) {
        this.qC = z;
        this.qD = i;
        this.qE = i2;
    }

    public final boolean equals(Object obj) {
        if (obj != null && getClass() == obj.getClass() && (obj instanceof e)) {
            e eVar = (e) obj;
            if (this.qC == eVar.qC && this.qD == eVar.qD && this.qE == eVar.qE) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        boolean z = this.qC;
        return (z ? 1 : 0) + this.qD + this.qE;
    }

    public final String toString() {
        StringBuffer stringBuffer = new StringBuffer();
        stringBuffer.append("press: ");
        stringBuffer.append(this.qC);
        stringBuffer.append(", x: ");
        stringBuffer.append(this.qD);
        stringBuffer.append(", y: ");
        stringBuffer.append(this.qE);
        stringBuffer.append("\n");
        return stringBuffer.toString();
    }
}
