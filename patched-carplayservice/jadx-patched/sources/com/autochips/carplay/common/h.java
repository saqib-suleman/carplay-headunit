package com.autochips.carplay.common;

/* JADX INFO: loaded from: classes.dex */
public final class h {
    public boolean qP;
    public boolean qQ;
    public boolean qR;
    public int qS;
    public int x;
    public int y;

    public h(boolean z, boolean z2, boolean z3, int i, int i2, int i3) {
        this.qP = z;
        this.qQ = z2;
        this.qR = z3;
        this.x = i;
        this.y = i2;
        this.qS = i3;
    }

    public final boolean equals(Object obj) {
        if (obj != null && getClass() == obj.getClass() && (obj instanceof h)) {
            h hVar = (h) obj;
            if (this.qP == hVar.qP && this.qQ == hVar.qQ && this.qR == hVar.qR && this.x == hVar.x && this.y == hVar.y && this.qS == hVar.qS) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return (this.qP ? 1 : 0) + (this.qQ ? 1 : 0) + (this.qR ? 1 : 0) + this.x + this.y + this.qS;
    }

    public final String toString() {
        StringBuffer stringBuffer = new StringBuffer();
        stringBuffer.append("button: ");
        stringBuffer.append(this.qP);
        stringBuffer.append(", home: ");
        stringBuffer.append(this.qQ);
        stringBuffer.append(", back: ");
        stringBuffer.append(this.qR);
        stringBuffer.append(", x: ");
        stringBuffer.append(this.x);
        stringBuffer.append(", y: ");
        stringBuffer.append(this.y);
        stringBuffer.append(", wheel: ");
        stringBuffer.append(this.qS);
        stringBuffer.append("\n");
        return stringBuffer.toString();
    }
}
