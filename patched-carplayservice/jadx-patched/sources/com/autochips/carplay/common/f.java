package com.autochips.carplay.common;

/* JADX INFO: loaded from: classes.dex */
public final class f {
    public g qF = new g(this);
    public g qG = new g(this);
    public int qH = 0;
    public int qI = 0;
    public int qJ = 0;

    public final boolean equals(Object obj) {
        if (obj != null && getClass() == obj.getClass() && (obj instanceof f)) {
            f fVar = (f) obj;
            if (this.qF.equals(fVar.qF) && this.qG.equals(fVar.qG) && this.qH == fVar.qH && this.qI == fVar.qI && this.qJ == fVar.qJ) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return this.qF.hashCode() + this.qG.hashCode() + this.qH + this.qI + this.qJ;
    }

    public final String toString() {
        StringBuffer stringBuffer = new StringBuffer();
        stringBuffer.append("mainScreen: ");
        stringBuffer.append(this.qF.toString());
        stringBuffer.append(", mainAuido: ");
        stringBuffer.append(this.qG.toString());
        stringBuffer.append(", phoneCall: ");
        stringBuffer.append(this.qH);
        stringBuffer.append(", speechMode: ");
        stringBuffer.append(this.qI);
        stringBuffer.append(", turnByTurn: ");
        stringBuffer.append(this.qJ);
        stringBuffer.append("\n");
        return stringBuffer.toString();
    }
}
