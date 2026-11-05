package android.net.dhcp;

import android.os.Message;

/* JADX INFO: loaded from: classes.dex */
final class c extends o {
    final /* synthetic */ b dB;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    c(b bVar) {
        super(bVar);
        this.dB = bVar;
    }

    @Override // android.net.dhcp.o
    public final void enter() {
        super.enter();
        this.dB.cV.sendMessage(196616, this.dB.di.ipAddress);
    }

    @Override // android.net.dhcp.o
    public final boolean processMessage(Message message) {
        super.processMessage(message);
        if (message.what != 196617) {
            return false;
        }
        this.dB.transitionTo(this.dB.du);
        return true;
    }
}
