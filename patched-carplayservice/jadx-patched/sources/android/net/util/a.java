package android.net.util;

import android.net.MacAddress;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.nio.ByteBuffer;
import java.util.StringJoiner;

/* JADX INFO: loaded from: classes.dex */
public class a {
    private static final String TAG = a.class.getSimpleName();
    private final ByteBuffer bF;
    private final byte[] de;
    private final String gl;
    private final byte[] mBytes;
    private final int mLength;

    /* JADX WARN: Code duplicated, block: B:4:0x0037  */
    /* JADX WARN: Code restructure failed: missing block: B:92:0x0345, code lost:
    
        if (r9 != false) goto L79;
     */
    /* JADX WARN: Failed to find 'out' block for switch in B:28:0x0142. Please report as an issue. */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private a(android.net.MacAddress r7, byte[] r8, int r9) {
        /*
            Method dump skipped, instruction units count: 860
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: android.net.util.a.<init>(android.net.MacAddress, byte[], int):void");
    }

    public static String a(MacAddress macAddress, byte[] bArr, int i) {
        if (macAddress == null || bArr == null) {
            return null;
        }
        return new a(macAddress, bArr, Math.min(i, bArr.length)).toString();
    }

    private static String a(ByteBuffer byteBuffer, int i) {
        if (byteBuffer == null || byteBuffer.remaining() < i) {
            return "invalid";
        }
        byte[] bArr = new byte[i];
        byteBuffer.get(bArr, 0, i);
        try {
            return InetAddress.getByAddress(bArr).getHostAddress();
        } catch (UnknownHostException e) {
            return "unknown";
        }
    }

    private void a(StringJoiner stringJoiner) {
        if (this.bF.remaining() < 20) {
            stringJoiner.add("runt:").add(g.asString(this.bF.remaining()));
            return;
        }
        this.bF.position(this.bF.position() + 4);
        stringJoiner.add(a(this.bF, 16));
        b(stringJoiner);
    }

    private void b(StringJoiner stringJoiner) {
        String strAsString;
        String str;
        while (this.bF.remaining() >= 8) {
            int iA = g.a(this.bF.get());
            int iA2 = (g.a(this.bF.get()) * 8) - 2;
            if (iA2 < 0 || iA2 > this.bF.remaining()) {
                stringJoiner.add("<malformed>");
                return;
            }
            int iPosition = this.bF.position();
            if (iA != 5) {
                switch (iA) {
                    case 1:
                        str = "slla";
                        break;
                    case 2:
                        str = "tlla";
                        break;
                    default:
                        continue;
                        this.bF.position(iPosition + iA2);
                        break;
                }
                stringJoiner.add(str);
                strAsString = j(this.bF);
            } else {
                stringJoiner.add("mtu");
                this.bF.getShort();
                strAsString = g.asString(this.bF.getInt());
            }
            stringJoiner.add(strAsString);
            this.bF.position(iPosition + iA2);
        }
    }

    private static String j(ByteBuffer byteBuffer) {
        if (byteBuffer == null || byteBuffer.remaining() < 6) {
            return "invalid";
        }
        byte[] bArr = new byte[6];
        int i = 0;
        byteBuffer.get(bArr, 0, 6);
        Object[] objArr = new Object[6];
        int i2 = 0;
        while (i < 6) {
            objArr[i2] = new Byte(bArr[i]);
            i++;
            i2++;
        }
        return String.format("%02x:%02x:%02x:%02x:%02x:%02x", objArr);
    }

    public String toString() {
        return this.gl;
    }
}
