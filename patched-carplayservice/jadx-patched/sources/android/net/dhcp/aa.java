package android.net.dhcp;

import java.net.Inet4Address;
import java.nio.ByteBuffer;

/* JADX INFO: loaded from: classes.dex */
final class aa extends DhcpPacket {
    aa(int i, short s, Inet4Address inet4Address, byte[] bArr, boolean z) {
        super(i, s, inet4Address, dH, dH, dH, bArr, z);
    }

    @Override // android.net.dhcp.DhcpPacket
    final void a(ByteBuffer byteBuffer) {
        a(byteBuffer, (byte) 3);
        a(byteBuffer, (byte) 61, S());
        if (!dH.equals(this.dS)) {
            a(byteBuffer, (byte) 50, this.dS);
        }
        if (!dH.equals(this.dU)) {
            a(byteBuffer, (byte) 54, this.dU);
        }
        b(byteBuffer);
        a(byteBuffer, (byte) 55, this.dV);
        byteBuffer.put((byte) -1);
    }

    @Override // android.net.dhcp.DhcpPacket
    public final ByteBuffer e(int i) {
        ByteBuffer byteBufferAllocate = ByteBuffer.allocate(1500);
        a(i, dI, dH, byteBufferAllocate, (byte) 1, this.eg);
        byteBufferAllocate.flip();
        return byteBufferAllocate;
    }

    @Override // android.net.dhcp.DhcpPacket
    public final String toString() {
        String string = super.toString();
        StringBuilder sb = new StringBuilder();
        sb.append(string);
        sb.append(" REQUEST, desired IP ");
        sb.append(this.dS);
        sb.append(" from host '");
        sb.append(this.dN);
        sb.append("', param list length ");
        sb.append(this.dV == null ? 0 : this.dV.length);
        return sb.toString();
    }
}
