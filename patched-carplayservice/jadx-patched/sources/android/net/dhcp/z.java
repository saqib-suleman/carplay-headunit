package android.net.dhcp;

import java.net.Inet4Address;
import java.nio.ByteBuffer;
import java.util.Iterator;

/* JADX INFO: loaded from: classes.dex */
final class z extends DhcpPacket {
    private final Inet4Address cO;

    z(int i, short s, boolean z, Inet4Address inet4Address, Inet4Address inet4Address2, Inet4Address inet4Address3, byte[] bArr) {
        super(i, s, inet4Address2, inet4Address3, dH, dH, bArr, z);
        this.cO = inet4Address;
    }

    @Override // android.net.dhcp.DhcpPacket
    final void a(ByteBuffer byteBuffer) {
        a(byteBuffer, (byte) 2);
        a(byteBuffer, (byte) 54, this.dU);
        a(byteBuffer, (byte) 51, this.dT);
        if (this.dT != null) {
            a(byteBuffer, (byte) 58, Integer.valueOf(this.dT.intValue() / 2));
        }
        a(byteBuffer, (byte) 1, this.dK);
        a(byteBuffer, (byte) 3, this.dL);
        a(byteBuffer, (byte) 15, this.dO);
        a(byteBuffer, (byte) 28, this.dQ);
        a(byteBuffer, (byte) 6, this.dM);
        byteBuffer.put((byte) -1);
    }

    @Override // android.net.dhcp.DhcpPacket
    public final ByteBuffer e(int i) {
        ByteBuffer byteBufferAllocate = ByteBuffer.allocate(1500);
        a(i, this.eg ? dI : this.ed, this.eg ? dH : this.cO, byteBufferAllocate, (byte) 2, this.eg);
        byteBufferAllocate.flip();
        return byteBufferAllocate;
    }

    @Override // android.net.dhcp.DhcpPacket
    public final String toString() {
        String string = super.toString();
        String str = ", DNS servers: ";
        if (this.dM != null) {
            Iterator it = this.dM.iterator();
            while (it.hasNext()) {
                str = str + ((Inet4Address) it.next()) + " ";
            }
        }
        return string + " OFFER, ip " + this.ed + ", mask " + this.dK + str + ", gateways " + this.dL + " lease time " + this.dT + ", domain " + this.dO;
    }
}
