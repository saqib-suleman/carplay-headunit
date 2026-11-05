package android.net.a;

import android.net.Network;
import android.net.StaticIpConfiguration;
import java.util.StringJoiner;

/* JADX INFO: loaded from: classes.dex */
public final class n {
    android.net.apf.a av;
    int fj;
    k fk;
    StaticIpConfiguration fl;
    boolean ff = true;
    boolean fg = true;
    boolean fh = true;
    boolean fi = true;
    int fm = 36000;
    int fn = 2;
    Network fo = null;
    String en = null;

    public final String toString() {
        StringJoiner stringJoiner = new StringJoiner(", ", getClass().getSimpleName() + "{", "}");
        StringBuilder sb = new StringBuilder("mEnableIPv4: ");
        sb.append(this.ff);
        return stringJoiner.add(sb.toString()).add("mEnableIPv6: " + this.fg).add("mUsingMultinetworkPolicyTracker: " + this.fh).add("mUsingIpReachabilityMonitor: " + this.fi).add("mRequestedPreDhcpActionMs: " + this.fj).add("mInitialConfig: " + this.fk).add("mStaticIpConfig: " + this.fl).add("mApfCapabilities: " + this.av).add("mProvisioningTimeoutMs: " + this.fm).add("mIPv6AddrGenMode: " + this.fn).add("mNetwork: " + this.fo).add("mDisplayName: " + this.en).toString();
    }
}
