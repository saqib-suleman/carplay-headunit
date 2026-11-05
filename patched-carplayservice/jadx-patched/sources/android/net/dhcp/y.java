package android.net.dhcp;

import java.net.Inet4Address;
import java.nio.ByteBuffer;

/* JADX INFO: loaded from: classes.dex */
final class y extends DhcpPacket {
    y(int i, short s, Inet4Address inet4Address, Inet4Address inet4Address2, byte[] bArr) {
        super(i, s, dH, dH, inet4Address, inet4Address2, bArr, false);
    }

    @Override // android.net.dhcp.DhcpPacket
    final void a(ByteBuffer byteBuffer) {
        a(byteBuffer, (byte) 6);
        a(byteBuffer, (byte) 54, this.dU);
        a(byteBuffer, (byte) 56, this.dW);
        byteBuffer.put((byte) -1);
    }

    @Override // android.net.dhcp.DhcpPacket
    public final ByteBuffer e(int i) {
        ByteBuffer byteBufferAllocate = ByteBuffer.allocate(1500);
        a(i, this.ec, this.ed, byteBufferAllocate, (byte) 2, this.eg);
        byteBufferAllocate.flip();
        return byteBufferAllocate;
    }

    @Override // android.net.dhcp.DhcpPacket
    public final String toString() {
        String string = super.toString();
        StringBuilder sb = new StringBuilder();
        sb.append(string);
        sb.append(" NAK, reason ");
        sb.append(this.dW == null ? "(none)" : this.dW);
        return sb.toString();
    }
}
