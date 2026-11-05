package android.net.dhcp;

import android.os.SystemClock;
import android.util.Log;

/* JADX INFO: loaded from: classes.dex */
final class g extends p {
    final /* synthetic */ b dB;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g(b bVar) {
        super(bVar);
        this.dB = bVar;
    }

    @Override // android.net.dhcp.p
    protected final boolean O() {
        b bVar = this.dB;
        return bVar.a(DhcpPacket.a(bVar.dg, bVar.M(), bVar.de, b.cQ), "DHCPDISCOVER", 0, DhcpPacket.dI);
    }

    @Override // android.net.dhcp.p
    protected final void c(DhcpPacket dhcpPacket) {
        if (this.dB.a(dhcpPacket) && (dhcpPacket instanceof z)) {
            this.dB.dk = dhcpPacket.T();
            if (this.dB.dk != null) {
                Log.d("DhcpClient", "Got pending lease: " + this.dB.dk);
                this.dB.transitionTo(this.dB.dr);
            }
        }
    }

    @Override // android.net.dhcp.p, android.net.dhcp.o
    public final void enter() {
        super.enter();
        b.p(this.dB);
        this.dB.dl = SystemClock.elapsedRealtime();
    }
}
