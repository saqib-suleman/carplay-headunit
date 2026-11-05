package android.net.dhcp;

import java.net.Inet4Address;
import java.nio.ByteBuffer;

/* JADX INFO: loaded from: classes.dex */
final class v extends DhcpPacket {
    v(int i, short s, Inet4Address inet4Address, Inet4Address inet4Address2, Inet4Address inet4Address3, Inet4Address inet4Address4, byte[] bArr) {
        super(i, s, inet4Address, inet4Address2, inet4Address3, inet4Address4, bArr, false);
    }

    @Override // android.net.dhcp.DhcpPacket
    final void a(ByteBuffer byteBuffer) {
        a(byteBuffer, (byte) 4);
        a(byteBuffer, (byte) 61, S());
        byteBuffer.put((byte) -1);
    }

    @Override // android.net.dhcp.DhcpPacket
    public final ByteBuffer e(int i) {
        ByteBuffer byteBufferAllocate = ByteBuffer.allocate(1500);
        a(i, this.ec, this.ed, byteBufferAllocate, (byte) 1, false);
        byteBufferAllocate.flip();
        return byteBufferAllocate;
    }

    @Override // android.net.dhcp.DhcpPacket
    public final String toString() {
        return super.toString() + " DECLINE";
    }
}
