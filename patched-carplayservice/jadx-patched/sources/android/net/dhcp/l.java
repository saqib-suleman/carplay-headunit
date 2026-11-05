package android.net.dhcp;

import android.net.DhcpResults;
import android.util.Log;
import java.net.Inet4Address;

/* JADX INFO: loaded from: classes.dex */
final class l extends p {
    final /* synthetic */ b dB;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public l(b bVar) {
        super(bVar);
        this.dB = bVar;
        this.dF = 18000;
    }

    @Override // android.net.dhcp.p
    protected final boolean O() {
        return b.a(this.dB, DhcpPacket.dH, (Inet4Address) this.dB.dk.ipAddress.getAddress(), this.dB.dk.serverAddress, DhcpPacket.dI);
    }

    @Override // android.net.dhcp.p
    protected final void Q() {
        this.dB.transitionTo(this.dB.dp);
    }

    @Override // android.net.dhcp.p
    protected final void c(DhcpPacket dhcpPacket) {
        if (this.dB.a(dhcpPacket)) {
            if (!(dhcpPacket instanceof a)) {
                if (dhcpPacket instanceof y) {
                    Log.d("DhcpClient", "Received NAK, returning to INIT");
                    this.dB.dk = null;
                    this.dB.transitionTo(this.dB.dp);
                    return;
                }
                return;
            }
            DhcpResults dhcpResultsT = dhcpPacket.T();
            if (dhcpResultsT != null) {
                this.dB.b(dhcpPacket);
                b.a(this.dB, dhcpResultsT, "Confirmed");
                this.dB.transitionTo(this.dB.dt);
            }
        }
    }
}
