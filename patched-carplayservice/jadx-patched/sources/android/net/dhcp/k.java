package android.net.dhcp;

import android.os.Message;
import java.net.Inet4Address;

/* JADX INFO: loaded from: classes.dex */
final class k extends h {
    final /* synthetic */ b dB;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k(b bVar) {
        super(bVar);
        this.dB = bVar;
        this.dC = "Renewed";
    }

    @Override // android.net.dhcp.h
    protected final Inet4Address P() {
        return this.dB.di.serverAddress != null ? this.dB.di.serverAddress : DhcpPacket.dI;
    }

    @Override // android.net.dhcp.p, android.net.dhcp.o
    public final boolean processMessage(Message message) {
        if (super.processMessage(message)) {
            return true;
        }
        if (message.what != 196713) {
            return false;
        }
        this.dB.transitionTo(this.dB.dw);
        return true;
    }
}
