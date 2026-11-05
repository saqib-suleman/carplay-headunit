package android.net.b;

import java.nio.ByteBuffer;

/* JADX INFO: loaded from: classes.dex */
public final class b extends c {
    private i fF;

    private b(j jVar) {
        super(jVar);
        this.fF = null;
    }

    public static b a(j jVar, ByteBuffer byteBuffer) {
        i iVar;
        b bVar = new b(jVar);
        if (byteBuffer != null && byteBuffer.remaining() >= 20) {
            iVar = new i();
            iVar.error = byteBuffer.getInt();
            iVar.gf = j.i(byteBuffer);
        } else {
            iVar = null;
        }
        bVar.fF = iVar;
        if (bVar.fF == null) {
            return null;
        }
        return bVar;
    }

    public final i ap() {
        return this.fF;
    }

    @Override // android.net.b.c
    public final String toString() {
        StringBuilder sb = new StringBuilder("NetlinkErrorMessage{ nlmsghdr{");
        sb.append(this.fG == null ? "" : this.fG.toString());
        sb.append("}, nlmsgerr{");
        sb.append(this.fF == null ? "" : this.fF.toString());
        sb.append("} }");
        return sb.toString();
    }
}
