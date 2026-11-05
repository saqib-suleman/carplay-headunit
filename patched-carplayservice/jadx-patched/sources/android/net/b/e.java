package android.net.b;

import android.system.OsConstants;
import java.net.Inet6Address;
import java.net.InetAddress;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;

/* JADX INFO: loaded from: classes.dex */
public final class e extends c {
    private f fH;
    private InetAddress fI;
    private byte[] fJ;
    private int fK;
    private g fL;

    private e(j jVar) {
        super(jVar);
        this.fH = null;
        this.fI = null;
        this.fJ = null;
        this.fK = 0;
        this.fL = null;
    }

    private static h a(short s, ByteBuffer byteBuffer) {
        h hVarH;
        while (byteBuffer != null && byteBuffer.remaining() > 0 && (hVarH = h.h(byteBuffer)) != null) {
            if (hVarH.gc != s) {
                if (byteBuffer.remaining() < hVarH.av()) {
                    break;
                }
                byteBuffer.position(byteBuffer.position() + hVarH.av());
            } else {
                h hVarH2 = h.h(byteBuffer);
                if (hVarH2 == null || byteBuffer.remaining() < hVarH2.av()) {
                    return null;
                }
                int iPosition = byteBuffer.position();
                byteBuffer.position(iPosition + 4);
                int i = (hVarH2.gb & 65535) - 4;
                if (i > 0) {
                    hVarH2.gd = new byte[i];
                    byteBuffer.get(hVarH2.gd, 0, i);
                    byteBuffer.position(iPosition + hVarH2.av());
                }
                return hVarH2;
            }
        }
        return null;
    }

    private static void a(short s, byte[] bArr, ByteBuffer byteBuffer) {
        h hVar = new h();
        hVar.gc = s;
        hVar.gd = bArr;
        hVar.gb = (short) (4 + hVar.gd.length);
        ByteOrder byteOrderOrder = byteBuffer.order();
        int iPosition = byteBuffer.position();
        byteBuffer.order(ByteOrder.nativeOrder());
        try {
            byteBuffer.putShort(hVar.gb);
            byteBuffer.putShort(hVar.gc);
            if (hVar.gd != null) {
                byteBuffer.put(hVar.gd);
            }
            byteBuffer.order(byteOrderOrder);
            byteBuffer.position(iPosition + hVar.av());
        } catch (Throwable th) {
            byteBuffer.order(byteOrderOrder);
            throw th;
        }
    }

    public static byte[] a(InetAddress inetAddress, int i) {
        j jVar = new j();
        jVar.gh = (short) 28;
        jVar.gi = (short) 261;
        jVar.gj = 1;
        e eVar = new e(jVar);
        eVar.fH = new f();
        eVar.fH.fR = (byte) (inetAddress instanceof Inet6Address ? OsConstants.AF_INET6 : OsConstants.AF_INET);
        eVar.fH.fS = i;
        eVar.fH.fT = (short) 16;
        eVar.fI = inetAddress;
        eVar.fJ = null;
        int iH = eVar.fI != null ? 28 + a.h(eVar.fI.getAddress().length + 4) : 28;
        if (eVar.fJ != null) {
            iH += a.h(4 + eVar.fJ.length);
        }
        byte[] bArr = new byte[iH];
        jVar.gg = bArr.length;
        ByteBuffer byteBufferWrap = ByteBuffer.wrap(bArr);
        byteBufferWrap.order(ByteOrder.nativeOrder());
        j jVarAq = eVar.aq();
        byteBufferWrap.putInt(jVarAq.gg);
        byteBufferWrap.putShort(jVarAq.gh);
        byteBufferWrap.putShort(jVarAq.gi);
        byteBufferWrap.putInt(jVarAq.gj);
        byteBufferWrap.putInt(jVarAq.gk);
        f fVar = eVar.fH;
        byteBufferWrap.put(fVar.fR);
        byteBufferWrap.put((byte) 0);
        byteBufferWrap.putShort((short) 0);
        byteBufferWrap.putInt(fVar.fS);
        byteBufferWrap.putShort(fVar.fT);
        byteBufferWrap.put(fVar.fU);
        byteBufferWrap.put(fVar.fV);
        if (eVar.fI != null) {
            a((short) 1, eVar.fI.getAddress(), byteBufferWrap);
        }
        if (eVar.fJ != null) {
            a((short) 2, eVar.fJ, byteBufferWrap);
        }
        return bArr;
    }

    /* JADX WARN: Unreachable blocks removed: 1, instructions: 1 */
    public static e b(j jVar, ByteBuffer byteBuffer) {
        e eVar = new e(jVar);
        eVar.fH = f.f(byteBuffer);
        if (eVar.fH == null) {
            return null;
        }
        int iPosition = byteBuffer.position();
        h hVarA = a((short) 1, byteBuffer);
        if (hVarA != null) {
            eVar.fI = hVarA.ax();
        }
        byteBuffer.position(iPosition);
        h hVarA2 = a((short) 2, byteBuffer);
        if (hVarA2 != null) {
            eVar.fJ = hVarA2.gd;
        }
        byteBuffer.position(iPosition);
        h hVarA3 = a((short) 4, byteBuffer);
        if (hVarA3 != null) {
            ByteBuffer byteBufferAw = hVarA3.aw();
            eVar.fK = (byteBufferAw == null || byteBufferAw.remaining() != 4) ? 0 : hVarA3.aw().getInt();
        }
        byteBuffer.position(iPosition);
        h hVarA4 = a((short) 3, byteBuffer);
        if (hVarA4 != null) {
            eVar.fL = g.g(hVarA4.aw());
        }
        int iH = a.h(eVar.fG.gg - 28);
        byteBuffer.position(byteBuffer.remaining() < iH ? byteBuffer.limit() : iPosition + iH);
        return eVar;
    }

    public final f as() {
        return this.fH;
    }

    public final InetAddress at() {
        return this.fI;
    }

    public final byte[] au() {
        return this.fJ;
    }

    @Override // android.net.b.c
    public final String toString() {
        String hostAddress = this.fI == null ? "" : this.fI.getHostAddress();
        StringBuilder sb = new StringBuilder("RtNetlinkNeighborMessage{ nlmsghdr{");
        sb.append(this.fG == null ? "" : this.fG.toString());
        sb.append("}, ndmsg{");
        sb.append(this.fH == null ? "" : this.fH.toString());
        sb.append("}, destination{");
        sb.append(hostAddress);
        sb.append("} linklayeraddr{");
        sb.append(a.g(this.fJ));
        sb.append("} probes{");
        sb.append(this.fK);
        sb.append("} cacheinfo{");
        sb.append(this.fL == null ? "" : this.fL.toString());
        sb.append("} }");
        return sb.toString();
    }
}
