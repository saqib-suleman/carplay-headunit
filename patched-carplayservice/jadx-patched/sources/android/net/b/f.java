package android.net.b;

import android.system.OsConstants;
import java.nio.ByteBuffer;

/* JADX INFO: loaded from: classes.dex */
public final class f {
    public static byte fM = 1;
    public static byte fN = 2;
    public static byte fO = 4;
    public static byte fP = 8;
    public static byte fQ = -128;
    public byte fR = (byte) OsConstants.AF_UNSPEC;
    public int fS;
    public short fT;
    public byte fU;
    public byte fV;

    public static String b(short s) {
        if (s == 4) {
            return "NUD_STALE";
        }
        if (s == 8) {
            return "NUD_DELAY";
        }
        if (s == 16) {
            return "NUD_PROBE";
        }
        if (s == 32) {
            return "NUD_FAILED";
        }
        if (s == 64) {
            return "NUD_NOARP";
        }
        if (s == 128) {
            return "NUD_PERMANENT";
        }
        switch (s) {
            case 0:
                return "NUD_NONE";
            case 1:
                return "NUD_INCOMPLETE";
            case 2:
                return "NUD_REACHABLE";
            default:
                return "unknown NUD state: " + String.valueOf((int) s);
        }
    }

    public static f f(ByteBuffer byteBuffer) {
        if (!(byteBuffer != null && byteBuffer.remaining() >= 12)) {
            return null;
        }
        f fVar = new f();
        fVar.fR = byteBuffer.get();
        byteBuffer.get();
        byteBuffer.getShort();
        fVar.fS = byteBuffer.getInt();
        fVar.fT = byteBuffer.getShort();
        fVar.fU = byteBuffer.get();
        fVar.fV = byteBuffer.get();
        return fVar;
    }

    public final String toString() {
        String strValueOf;
        String str = ((int) this.fT) + " (" + b(this.fT) + ")";
        StringBuilder sb = new StringBuilder();
        sb.append((int) this.fU);
        sb.append(" (");
        byte b = this.fU;
        StringBuilder sb2 = new StringBuilder();
        if ((fM & b) != 0) {
            sb2.append("NTF_USE");
        }
        if ((fN & b) != 0) {
            if (sb2.length() > 0) {
                sb2.append("|");
            }
            sb2.append("NTF_SELF");
        }
        if ((fO & b) != 0) {
            if (sb2.length() > 0) {
                sb2.append("|");
            }
            sb2.append("NTF_MASTER");
        }
        if ((fP & b) != 0) {
            if (sb2.length() > 0) {
                sb2.append("|");
            }
            sb2.append("NTF_PROXY");
        }
        if ((b & fQ) != 0) {
            if (sb2.length() > 0) {
                sb2.append("|");
            }
            sb2.append("NTF_ROUTER");
        }
        sb.append(sb2.toString());
        sb.append(")");
        String string = sb.toString();
        StringBuilder sb3 = new StringBuilder("StructNdMsg{ family{");
        byte b2 = this.fR;
        if (b2 == OsConstants.AF_INET) {
            strValueOf = "AF_INET";
        } else if (b2 == OsConstants.AF_INET6) {
            strValueOf = "AF_INET6";
        } else {
            strValueOf = b2 == OsConstants.AF_NETLINK ? "AF_NETLINK" : String.valueOf((int) b2);
        }
        sb3.append(strValueOf);
        sb3.append("}, ifindex{");
        sb3.append(this.fS);
        sb3.append("}, state{");
        sb3.append(str);
        sb3.append("}, flags{");
        sb3.append(string);
        sb3.append("}, type{");
        sb3.append((int) this.fV);
        sb3.append("} }");
        return sb3.toString();
    }
}
