package android.net.dhcp;

import android.util.Log;
import java.net.Inet4Address;
import libcore.io.IoBridge;

/* JADX INFO: loaded from: classes.dex */
final class i extends h {
    final /* synthetic */ b dB;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i(b bVar) {
        super(bVar);
        this.dB = bVar;
        this.dC = "Rebound";
    }

    @Override // android.net.dhcp.h
    protected final Inet4Address P() {
        return DhcpPacket.dI;
    }

    @Override // android.net.dhcp.h, android.net.dhcp.p, android.net.dhcp.o
    public final void enter() {
        super.enter();
        IoBridge.closeAndSignalBlockedThreads(this.dB.cT);
        if (this.dB.L()) {
            return;
        }
        Log.e("DhcpClient", "Failed to recreate UDP socket");
        this.dB.transitionTo(this.dB.dp);
    }
}
