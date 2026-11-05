package android.net.b;

import com.android.internal.util.HexDump;
import java.nio.ByteBuffer;

/* JADX INFO: loaded from: classes.dex */
public final class a {
    public static String a(short s) {
        if (s == 68) {
            return "RTM_NEWNDUSEROPT";
        }
        switch (s) {
            case 1:
                return "NLMSG_NOOP";
            case 2:
                return "NLMSG_ERROR";
            case 3:
                return "NLMSG_DONE";
            case 4:
                return "NLMSG_OVERRUN";
            default:
                switch (s) {
                    case 16:
                        return "RTM_NEWLINK";
                    case 17:
                        return "RTM_DELLINK";
                    case 18:
                        return "RTM_GETLINK";
                    case 19:
                        return "RTM_SETLINK";
                    case 20:
                        return "RTM_NEWADDR";
                    case 21:
                        return "RTM_DELADDR";
                    case 22:
                        return "RTM_GETADDR";
                    default:
                        switch (s) {
                            case 24:
                                return "RTM_NEWROUTE";
                            case 25:
                                return "RTM_DELROUTE";
                            case 26:
                                return "RTM_GETROUTE";
                            default:
                                switch (s) {
                                    case 28:
                                        return "RTM_NEWNEIGH";
                                    case 29:
                                        return "RTM_DELNEIGH";
                                    case 30:
                                        return "RTM_GETNEIGH";
                                    default:
                                        switch (s) {
                                            case 32:
                                                return "RTM_NEWRULE";
                                            case 33:
                                                return "RTM_DELRULE";
                                            case 34:
                                                return "RTM_GETRULE";
                                            default:
                                                return "unknown RTM type: " + String.valueOf((int) s);
                                        }
                                }
                        }
                }
        }
    }

    public static String d(ByteBuffer byteBuffer) {
        return byteBuffer == null ? "(null)" : HexDump.toHexString(byteBuffer.array(), byteBuffer.position(), byteBuffer.remaining());
    }

    public static String g(byte[] bArr) {
        return bArr == null ? "(null)" : HexDump.toHexString(bArr);
    }

    public static final int h(int i) {
        if (i <= 0) {
            return 0;
        }
        return (((i + 4) - 1) / 4) * 4;
    }
}
