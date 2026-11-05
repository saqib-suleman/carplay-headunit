package android.net.a;

import android.net.MacAddress;
import java.net.InetAddress;
import java.util.StringJoiner;

/* JADX INFO: loaded from: classes.dex */
public final class t {
    final long fs;
    final short ft;
    final int fu;
    final InetAddress fv;
    final short fw;
    final MacAddress fx;

    public t(long j, short s, int i, InetAddress inetAddress, short s2, MacAddress macAddress) {
        this.fs = j;
        this.ft = s;
        this.fu = i;
        this.fv = inetAddress;
        this.fw = s2;
        this.fx = macAddress;
    }

    public final String toString() {
        return new StringJoiner(",", "NeighborEvent{", "}").add("@" + this.fs).add(android.net.b.a.a(this.ft)).add("if=" + this.fu).add(this.fv.getHostAddress()).add(android.net.b.f.b(this.fw)).add("[" + this.fx + "]").toString();
    }
}
