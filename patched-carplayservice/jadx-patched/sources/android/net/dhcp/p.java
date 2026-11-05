package android.net.dhcp;

import android.os.Message;
import android.os.SystemClock;

/* JADX INFO: loaded from: classes.dex */
abstract class p extends o {
    final /* synthetic */ b dB;
    private int dE;
    protected int dF;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    p(b bVar) {
        super(bVar);
        this.dB = bVar;
        this.dF = 0;
    }

    protected abstract boolean O();

    protected void Q() {
    }

    protected abstract void c(DhcpPacket dhcpPacket);

    @Override // android.net.dhcp.o
    public void enter() {
        super.enter();
        this.dE = 2000;
        if (this.dF > 0) {
            this.dB.cX.schedule(SystemClock.elapsedRealtime() + ((long) this.dF));
        }
        this.dB.sendMessage(196709);
    }

    @Override // android.net.dhcp.o
    public void exit() {
        super.exit();
        this.dB.cW.cancel();
        this.dB.cX.cancel();
    }

    @Override // android.net.dhcp.o
    public boolean processMessage(Message message) {
        super.processMessage(message);
        switch (message.what) {
            case 196709:
                O();
                long jElapsedRealtime = SystemClock.elapsedRealtime();
                int i = this.dE;
                int i2 = i / 10;
                this.dB.cW.schedule(jElapsedRealtime + ((long) (i + (this.dB.cR.nextInt(2 * i2) - i2))));
                this.dE *= 2;
                if (this.dE > 128000) {
                    this.dE = 128000;
                }
                return true;
            case 196710:
                c((DhcpPacket) message.obj);
                return true;
            case 196711:
                Q();
                return true;
            default:
                return false;
        }
    }
}
