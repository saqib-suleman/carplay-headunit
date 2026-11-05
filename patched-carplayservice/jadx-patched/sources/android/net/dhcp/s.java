package android.net.dhcp;

import android.os.Message;
import com.android.internal.util.State;

/* JADX INFO: loaded from: classes.dex */
abstract class s extends o {
    final /* synthetic */ b dB;
    protected State dG;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    s(b bVar) {
        super(bVar);
        this.dB = bVar;
    }

    @Override // android.net.dhcp.o
    public void enter() {
        super.enter();
        this.dB.cV.sendMessage(196611);
    }

    @Override // android.net.dhcp.o
    public boolean processMessage(Message message) {
        super.processMessage(message);
        if (message.what != 196614) {
            return false;
        }
        this.dB.transitionTo(this.dG);
        return true;
    }
}
