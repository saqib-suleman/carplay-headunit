package android.net.dhcp;

import android.os.Message;
import android.util.Log;
import com.android.internal.util.State;

/* JADX INFO: loaded from: classes.dex */
final class e extends State {
    final /* synthetic */ b dB;

    e(b bVar) {
        this.dB = bVar;
    }

    public final void exit() {
        this.dB.cY.cancel();
        this.dB.cZ.cancel();
        this.dB.da.cancel();
        b.g(this.dB);
        this.dB.cV.sendMessage(196615);
    }

    public final boolean processMessage(Message message) {
        if (message.what != 196714) {
            return false;
        }
        Log.d("DhcpClient", "Lease expired!");
        this.dB.cV.sendMessage(196612, 2, 0, (Object) null);
        this.dB.transitionTo(this.dB.dp);
        return true;
    }
}
