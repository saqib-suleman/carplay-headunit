package android.net.b;

import android.system.Os;
import android.system.OsConstants;
import java.nio.ByteBuffer;

/* JADX INFO: loaded from: classes.dex */
public final class g {
    private static final long fW = Os.sysconf(OsConstants._SC_CLK_TCK);
    public int fX;
    public int fY;
    public int fZ;
    public int ga;

    public static g g(ByteBuffer byteBuffer) {
        if (!(byteBuffer != null && byteBuffer.remaining() >= 16)) {
            return null;
        }
        g gVar = new g();
        gVar.fX = byteBuffer.getInt();
        gVar.fY = byteBuffer.getInt();
        gVar.fZ = byteBuffer.getInt();
        gVar.ga = byteBuffer.getInt();
        return gVar;
    }

    private static long j(int i) {
        return ((((long) i) & (-1)) * 1000) / fW;
    }

    public final String toString() {
        return "NdaCacheInfo{ ndm_used{" + j(this.fX) + "}, ndm_confirmed{" + j(this.fY) + "}, ndm_updated{" + j(this.fZ) + "}, ndm_refcnt{" + this.ga + "} }";
    }
}
