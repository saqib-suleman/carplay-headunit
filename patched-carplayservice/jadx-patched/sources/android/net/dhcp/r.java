package android.net.dhcp;

import android.os.Message;
import com.android.internal.util.State;

/* JADX INFO: loaded from: classes.dex */
final class r extends State {
    final /* synthetic */ b dB;

    r(b bVar) {
        this.dB = bVar;
    }

    public final boolean processMessage(Message message) {
        b bVar;
        State state;
        if (message.what != 196609) {
            return false;
        }
        if (this.dB.dc) {
            bVar = this.dB;
            state = this.dB.dz;
        } else {
            bVar = this.dB;
            state = this.dB.dp;
        }
        bVar.transitionTo(state);
        return true;
    }
}
