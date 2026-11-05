package android.net.a;

import android.net.ProxyInfo;
import android.os.Message;
import com.android.internal.util.State;

/* JADX INFO: loaded from: classes.dex */
final class q extends State {
    final /* synthetic */ d eX;

    q(d dVar) {
        this.eX = dVar;
    }

    public final void enter() {
        d.e(this.eX);
        d.f(this.eX);
        if (this.eX.eV > 0) {
            this.eX.g(3);
            this.eX.eV = 0L;
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    public final boolean processMessage(Message message) {
        int i = message.what;
        if (i != 196613) {
            switch (i) {
                case 1:
                    d.i(this.eX);
                    this.eX.quit();
                    break;
                case 2:
                    break;
                case 3:
                    this.eX.eM = (n) message.obj;
                    this.eX.transitionTo(this.eX.ey);
                    break;
                default:
                    switch (i) {
                        case 6:
                            d.a(this.eX, false);
                            break;
                        case 7:
                            this.eX.eR = (String) message.obj;
                            d.a(this.eX, false);
                            break;
                        case 8:
                            this.eX.eS = (ProxyInfo) message.obj;
                            d.a(this.eX, false);
                            break;
                        case 9:
                            this.eX.eU = ((Boolean) message.obj).booleanValue();
                            break;
                        default:
                            return false;
                    }
                    break;
            }
        } else {
            this.eX.a("Unexpected CMD_ON_QUIT (already stopped).", new Object[0]);
        }
        this.eX.eJ.a(this, this.eX.getCurrentState());
        return true;
    }
}
