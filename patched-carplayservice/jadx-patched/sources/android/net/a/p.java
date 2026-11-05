package android.net.a;

import android.os.Message;
import android.os.SystemClock;
import com.android.internal.util.State;

/* JADX INFO: loaded from: classes.dex */
final class p extends State {
    final /* synthetic */ d eX;

    p(d dVar) {
        this.eX = dVar;
    }

    private boolean al() {
        return (this.eX.eL.hasIPv4Address() || this.eX.eL.hasGlobalIPv6Address()) ? false : true;
    }

    public final void enter() {
        this.eX.eV = SystemClock.elapsedRealtime();
        if (this.eX.eM.fm > 0) {
            this.eX.eG.schedule(SystemClock.elapsedRealtime() + ((long) this.eX.eM.fm));
        }
        if (al()) {
            this.eX.transitionTo(this.eX.ez);
        } else {
            d.e(this.eX);
        }
    }

    public final void exit() {
        this.eX.eG.cancel();
    }

    public final boolean processMessage(Message message) {
        d dVar;
        State state;
        int i = message.what;
        if (i != 2) {
            if (i == 6) {
                d.a(this.eX, false);
                if (al()) {
                    dVar = this.eX;
                    state = this.eX.ez;
                }
            } else if (i != 10) {
                this.eX.deferMessage(message);
            } else {
                this.eX.ac();
            }
            this.eX.eJ.a(this, this.eX.getCurrentState());
            return true;
        }
        dVar = this.eX;
        state = this.eX.ex;
        dVar.transitionTo(state);
        this.eX.eJ.a(this, this.eX.getCurrentState());
        return true;
    }
}
