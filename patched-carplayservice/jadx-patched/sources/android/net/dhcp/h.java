package android.net.dhcp;

import android.net.DhcpResults;
import android.util.Log;
import java.net.Inet4Address;

/* JADX INFO: loaded from: classes.dex */
abstract class h extends p {
    final /* synthetic */ b dB;
    protected String dC;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    h(b bVar) {
        super(bVar);
        this.dB = bVar;
    }

    @Override // android.net.dhcp.p
    protected final boolean O() {
        return b.a(this.dB, (Inet4Address) this.dB.di.ipAddress.getAddress(), DhcpPacket.dH, null, P());
    }

    protected abstract Inet4Address P();

    @Override // android.net.dhcp.p
    protected final void c(DhcpPacket dhcpPacket) {
        if (this.dB.a(dhcpPacket)) {
            if (!(dhcpPacket instanceof a)) {
                if (dhcpPacket instanceof y) {
                    Log.d("DhcpClient", "Received NAK, returning to INIT");
                    this.dB.cV.sendMessage(196612, 2, 0, (Object) null);
                    this.dB.transitionTo(this.dB.dp);
                    return;
                }
                return;
            }
            DhcpResults dhcpResultsT = dhcpPacket.T();
            if (dhcpResultsT != null) {
                if (!this.dB.di.ipAddress.equals(dhcpResultsT.ipAddress)) {
                    Log.d("DhcpClient", "Renewed lease not for our current IP address!");
                    this.dB.cV.sendMessage(196612, 2, 0, (Object) null);
                    this.dB.transitionTo(this.dB.dp);
                }
                this.dB.b(dhcpPacket);
                b.a(this.dB, dhcpResultsT, this.dC);
                this.dB.transitionTo(this.dB.du);
            }
        }
    }

    @Override // android.net.dhcp.p, android.net.dhcp.o
    public void enter() {
        super.enter();
        b.p(this.dB);
    }
}
