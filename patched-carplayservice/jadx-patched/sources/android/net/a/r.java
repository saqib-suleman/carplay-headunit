package android.net.a;

import android.os.Message;
import com.android.internal.util.State;

/* JADX INFO: loaded from: classes.dex */
final class r extends State {
    final /* synthetic */ d eX;

    r(d dVar) {
        this.eX = dVar;
    }

    public final void enter() {
        if (this.eX.eP == null) {
            this.eX.transitionTo(this.eX.dn);
        }
    }

    public final boolean processMessage(Message message) {
        int i = message.what;
        if (i != 2) {
            if (i == 196613) {
                d.o(this.eX);
                this.eX.transitionTo(this.eX.dn);
            } else if (i != 196615) {
                this.eX.deferMessage(message);
            } else {
                this.eX.eK.W();
            }
        }
        this.eX.eJ.a(this, this.eX.getCurrentState());
        return true;
    }
}
