package android.net.a;

import android.R;
import android.net.DhcpResults;
import android.net.LinkAddress;
import android.net.LinkProperties;
import android.net.ProxyInfo;
import android.net.apf.ApfFilter;
import android.os.Message;
import android.os.SystemClock;
import android.util.Log;
import com.android.internal.util.State;

/* JADX INFO: loaded from: classes.dex */
final class o extends State {
    final /* synthetic */ d eX;
    private a fp;
    private boolean fq;

    o(d dVar) {
        this.eX = dVar;
    }

    private a ai() {
        try {
            return new a(this.eX.getHandler(), this.eX.ax, this.eX.eI);
        } catch (IllegalArgumentException e) {
            return null;
        }
    }

    private void aj() {
        this.eX.eH.cancel();
        if (this.fq) {
            this.eX.mCallback.af();
            this.fq = false;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void ak() {
        this.eX.et.log("OBSERVED AvoidBadWifi changed");
    }

    public final void enter() {
        d dVar;
        int i;
        android.net.apf.d dVar2 = new android.net.apf.d();
        dVar2.aR = this.eX.eM.av;
        dVar2.aS = this.eX.eU;
        dVar2.aT = this.eX.mContext.getResources().getBoolean(R.^attr-private.backgroundRequestDetail);
        dVar2.aU = this.eX.mContext.getResources().getIntArray(R.array.config_allowedSystemInstantAppSettings);
        this.eX.eT = ApfFilter.a(this.eX.mContext, dVar2, this.eX.ax, this.eX.mCallback);
        if (this.eX.eT == null) {
            this.eX.mCallback.c(this.eX.eU);
        }
        this.fp = ai();
        if (this.fp != null) {
            this.fp.start(this.eX.eM.en);
        }
        if (this.eX.eM.fg && !d.z(this.eX)) {
            dVar = this.eX;
            i = 5;
        } else if (!this.eX.eM.ff || d.A(this.eX)) {
            k kVar = this.eX.eM.fk;
            if (kVar == null || d.a(this.eX, kVar)) {
                if (this.eX.eM.fh) {
                    this.eX.eN = new android.net.util.c(this.eX.mContext, this.eX.getHandler(), new Runnable() { // from class: android.net.a.-$$Lambda$o$npATqXJ7wdGR7zOohQKkeKE3vyY
                        @Override // java.lang.Runnable
                        public final void run() {
                            this.f$0.ak();
                        }
                    });
                    this.eX.eN.start();
                }
                if (!this.eX.eM.fi || this.eX.ad()) {
                    return;
                }
                dVar = this.eX;
                i = 6;
            } else {
                dVar = this.eX;
                i = 7;
            }
        } else {
            dVar = this.eX;
            i = 4;
        }
        d.a(dVar, i);
        this.eX.transitionTo(this.eX.ex);
    }

    public final void exit() {
        aj();
        if (this.eX.eO != null) {
            this.eX.eO.stop();
            d.E(this.eX);
        }
        if (this.eX.eN != null) {
            this.eX.eN.shutdown();
            this.eX.eN = null;
        }
        if (this.eX.eP != null) {
            this.eX.eP.sendMessage(196610);
            android.net.dhcp.b bVar = this.eX.eP;
            Log.d("DhcpClient", "doQuit");
            bVar.quit();
        }
        if (this.fp != null) {
            this.fp.stop();
            this.fp = null;
        }
        if (this.eX.eT != null) {
            this.eX.eT.shutdown();
            this.eX.eT = null;
        }
        d.f(this.eX);
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Code duplicated, block: B:48:0x0175  */
    public final boolean processMessage(Message message) {
        android.net.dhcp.b bVar;
        int i;
        int i2 = message.what;
        switch (i2) {
            case 2:
                this.eX.transitionTo(this.eX.ex);
                this.eX.eJ.a(this, this.eX.getCurrentState());
                return true;
            case 3:
                this.eX.a("ALERT: START received in StartedState. Please fix caller.", new Object[0]);
                this.eX.eJ.a(this, this.eX.getCurrentState());
                return true;
            case 4:
                if (this.eX.eO != null) {
                    this.eX.eO.an();
                }
                this.eX.eJ.a(this, this.eX.getCurrentState());
                return true;
            case 5:
                if (this.eX.eP != null) {
                    bVar = this.eX.eP;
                    i = 196614;
                    bVar.sendMessage(i);
                }
                this.eX.eJ.a(this, this.eX.getCurrentState());
                return true;
            case 6:
                if (!d.a(this.eX, true)) {
                    this.eX.transitionTo(this.eX.ex);
                }
                this.eX.eJ.a(this, this.eX.getCurrentState());
                return true;
            case 7:
                this.eX.eR = (String) message.obj;
                d.a(this.eX, true);
                this.eX.eJ.a(this, this.eX.getCurrentState());
                return true;
            case 8:
                this.eX.eS = (ProxyInfo) message.obj;
                d.a(this.eX, true);
                this.eX.eJ.a(this, this.eX.getCurrentState());
                return true;
            case 9:
                this.eX.eU = ((Boolean) message.obj).booleanValue();
                if (this.eX.eT != null) {
                    this.eX.eT.b(this.eX.eU);
                } else {
                    this.eX.mCallback.c(this.eX.eU);
                }
                this.eX.eJ.a(this, this.eX.getCurrentState());
                return true;
            default:
                switch (i2) {
                    case 11:
                        aj();
                        this.eX.eJ.a(this, this.eX.getCurrentState());
                        return true;
                    case 12:
                        if (this.eX.eT != null) {
                            this.eX.eT.a((byte[]) message.obj);
                        }
                        this.eX.eW.open();
                        this.eX.eJ.a(this, this.eX.getCurrentState());
                        return true;
                    default:
                        switch (i2) {
                            case 196611:
                                if (this.eX.eM.fj <= 0) {
                                    this.eX.sendMessage(5);
                                } else if (!this.fq) {
                                    this.eX.mCallback.ae();
                                    this.fq = true;
                                    this.eX.eH.schedule(SystemClock.elapsedRealtime() + ((long) this.eX.eM.fj));
                                }
                                this.eX.eJ.a(this, this.eX.getCurrentState());
                                return true;
                            case 196612:
                                aj();
                                switch (message.arg1) {
                                    case 1:
                                        this.eX.a((DhcpResults) message.obj);
                                        break;
                                    case 2:
                                        d.I(this.eX);
                                        break;
                                    default:
                                        this.eX.a("Unknown CMD_POST_DHCP_ACTION status: %s", Integer.valueOf(message.arg1));
                                        break;
                                }
                                this.eX.eJ.a(this, this.eX.getCurrentState());
                                return true;
                            case 196613:
                                this.eX.a("Unexpected CMD_ON_QUIT.", new Object[0]);
                                d.o(this.eX);
                                this.eX.eJ.a(this, this.eX.getCurrentState());
                                return true;
                            default:
                                switch (i2) {
                                    case 196615:
                                        this.eX.eK.W();
                                        this.eX.eJ.a(this, this.eX.getCurrentState());
                                        return true;
                                    case 196616:
                                        if (this.eX.eK.a((LinkAddress) message.obj)) {
                                            bVar = this.eX.eP;
                                            i = 196617;
                                            bVar.sendMessage(i);
                                            this.eX.eJ.a(this, this.eX.getCurrentState());
                                            return true;
                                        }
                                        this.eX.a("Failed to set IPv4 address.", new Object[0]);
                                        this.eX.a(LinkProperties.ProvisioningChange.LOST_PROVISIONING, new LinkProperties(this.eX.eL));
                                        this.eX.transitionTo(this.eX.ex);
                                        this.eX.eJ.a(this, this.eX.getCurrentState());
                                        return true;
                                    default:
                                        return false;
                                }
                        }
                }
        }
    }
}
