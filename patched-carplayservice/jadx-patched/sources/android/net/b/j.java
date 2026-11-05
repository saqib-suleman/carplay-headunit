package android.net.b;

import java.nio.ByteBuffer;

/* JADX INFO: loaded from: classes.dex */
public final class j {
    public int gg = 0;
    public short gh = 0;
    public short gi = 0;
    public int gj = 0;
    public int gk = 0;

    public static j i(ByteBuffer byteBuffer) {
        if (!(byteBuffer != null && byteBuffer.remaining() >= 16)) {
            return null;
        }
        j jVar = new j();
        jVar.gg = byteBuffer.getInt();
        jVar.gh = byteBuffer.getShort();
        jVar.gi = byteBuffer.getShort();
        jVar.gj = byteBuffer.getInt();
        jVar.gk = byteBuffer.getInt();
        if (jVar.gg < 16) {
            return null;
        }
        return jVar;
    }

    public final String toString() {
        String str = ((int) this.gh) + "(" + a.a(this.gh) + ")";
        StringBuilder sb = new StringBuilder();
        sb.append((int) this.gi);
        sb.append("(");
        short s = this.gi;
        StringBuilder sb2 = new StringBuilder();
        if ((s & 1) != 0) {
            sb2.append("NLM_F_REQUEST");
        }
        if ((s & 2) != 0) {
            if (sb2.length() > 0) {
                sb2.append("|");
            }
            sb2.append("NLM_F_MULTI");
        }
        if ((s & 4) != 0) {
            if (sb2.length() > 0) {
                sb2.append("|");
            }
            sb2.append("NLM_F_ACK");
        }
        if ((s & 8) != 0) {
            if (sb2.length() > 0) {
                sb2.append("|");
            }
            sb2.append("NLM_F_ECHO");
        }
        if ((s & 256) != 0) {
            if (sb2.length() > 0) {
                sb2.append("|");
            }
            sb2.append("NLM_F_ROOT");
        }
        if ((s & 512) != 0) {
            if (sb2.length() > 0) {
                sb2.append("|");
            }
            sb2.append("NLM_F_MATCH");
        }
        sb.append(sb2.toString());
        sb.append(")");
        return "StructNlMsgHdr{ nlmsg_len{" + this.gg + "}, nlmsg_type{" + str + "}, nlmsg_flags{" + sb.toString() + ")}, nlmsg_seq{" + this.gj + "}, nlmsg_pid{" + this.gk + "} }";
    }
}
