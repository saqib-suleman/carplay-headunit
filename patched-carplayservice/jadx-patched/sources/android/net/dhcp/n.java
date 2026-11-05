package android.net.dhcp;

import android.os.Message;
import com.android.internal.util.State;

/* JADX INFO: loaded from: classes.dex */
final class n extends State {
    final /* synthetic */ b dB;

    n(b bVar) {
        this.dB = bVar;
    }

    public final void enter() {
        b.g(this.dB);
        if (!b.h(this.dB) || !b.i(this.dB)) {
            this.dB.cV.sendMessage(196612, 2, 0, (Object) null);
            this.dB.transitionTo(this.dB.dn);
        } else {
            this.dB.cU = new q(this.dB);
            this.dB.cU.start();
        }
    }

    public final void exit() {
        if (this.dB.cU != null) {
            this.dB.cU.z();
            this.dB.cU = null;
        }
        b.g(this.dB);
    }

    public final boolean processMessage(Message message) {
        super.processMessage(message);
        if (message.what != 196610) {
            return false;
        }
        this.dB.transitionTo(this.dB.dn);
        return true;
    }
}
