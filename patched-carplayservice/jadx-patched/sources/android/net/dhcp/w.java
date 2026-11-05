package android.net.dhcp;

import java.nio.ByteBuffer;

/* JADX INFO: loaded from: classes.dex */
final class w extends DhcpPacket {
    w(int i, short s, byte[] bArr, boolean z) {
        super(i, s, dH, dH, dH, dH, bArr, z);
    }

    @Override // android.net.dhcp.DhcpPacket
    final void a(ByteBuffer byteBuffer) {
        a(byteBuffer, (byte) 1);
        a(byteBuffer, (byte) 61, S());
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
        sb.append(" DISCOVER ");
        sb.append(this.eg ? "broadcast " : "unicast ");
        return sb.toString();
    }
}
