package android.net.dhcp;

import android.net.metrics.DhcpClientEvent;
import android.os.Message;
import android.os.SystemClock;
import com.android.internal.util.State;

/* JADX INFO: loaded from: classes.dex */
final class d extends o {
    final /* synthetic */ b dB;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    d(b bVar) {
        super(bVar);
        this.dB = bVar;
    }

    @Override // android.net.dhcp.o
    public final void enter() {
        b bVar;
        String str;
        long j;
        super.enter();
        if (this.dB.di.serverAddress != null && !this.dB.a(this.dB.di.serverAddress)) {
            this.dB.cV.sendMessage(196612, 2, 0, (Object) null);
            this.dB.transitionTo(this.dB.dn);
        }
        b.z(this.dB);
        long jElapsedRealtime = SystemClock.elapsedRealtime();
        if (this.dB.dm > this.dB.dl) {
            bVar = this.dB;
            str = "RenewingBoundState";
            j = this.dB.dm;
        } else {
            bVar = this.dB;
            str = "InitialBoundState";
            j = this.dB.dl;
        }
        bVar.ay.log(bVar.db, new DhcpClientEvent(str, (int) (jElapsedRealtime - j)));
    }

    @Override // android.net.dhcp.o
    public final void exit() {
        super.exit();
        this.dB.dm = SystemClock.elapsedRealtime();
    }

    @Override // android.net.dhcp.o
    public final boolean processMessage(Message message) {
        b bVar;
        State state;
        super.processMessage(message);
        if (message.what != 196712) {
            return false;
        }
        if (this.dB.dc) {
            bVar = this.dB;
            state = this.dB.dA;
        } else {
            bVar = this.dB;
            state = this.dB.dv;
        }
        bVar.transitionTo(state);
        return true;
    }
}
