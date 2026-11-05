package android.net.a;

import com.android.internal.util.IState;
import com.android.internal.util.State;

/* JADX INFO: loaded from: classes.dex */
final class m {
    public String fd;
    public String fe;

    private m() {
    }

    /* synthetic */ m(byte b) {
        this();
    }

    public final void a(State state, IState iState) {
        this.fd = state.getClass().getSimpleName();
        this.fe = iState.getName();
    }

    public final void reset() {
        this.fd = null;
        this.fe = null;
    }

    public final String toString() {
        return String.format("rcvd_in=%s, proc_in=%s", this.fe, this.fd);
    }
}
