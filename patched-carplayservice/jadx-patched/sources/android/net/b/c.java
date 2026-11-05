package android.net.b;

import java.nio.ByteBuffer;

/* JADX INFO: loaded from: classes.dex */
public class c {
    protected j fG;

    public c(j jVar) {
        this.fG = jVar;
    }

    public static c e(ByteBuffer byteBuffer) {
        if (byteBuffer != null) {
            byteBuffer.position();
        }
        j jVarI = j.i(byteBuffer);
        if (jVarI == null) {
            return null;
        }
        int iH = a.h(jVarI.gg) - 16;
        if (byteBuffer == null) {
            return null;
        }
        if (iH < 0 || iH > byteBuffer.remaining()) {
            byteBuffer.position(byteBuffer.limit());
            return null;
        }
        short s = jVarI.gh;
        switch (s) {
            case 2:
                return b.a(jVarI, byteBuffer);
            case 3:
                byteBuffer.position(byteBuffer.position() + iH);
                return new c(jVarI);
            default:
                switch (s) {
                    case 28:
                    case 29:
                    case 30:
                        return e.b(jVarI, byteBuffer);
                    default:
                        if (jVarI.gh > 15) {
                            return null;
                        }
                        byteBuffer.position(byteBuffer.position() + iH);
                        return new c(jVarI);
                }
        }
    }

    public final j aq() {
        return this.fG;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder("NetlinkMessage{");
        sb.append(this.fG == null ? "" : this.fG.toString());
        sb.append("}");
        return sb.toString();
    }
}
