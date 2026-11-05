package android.net.a;

import android.net.IpPrefix;
import android.net.LinkAddress;
import android.net.RouteInfo;
import java.net.Inet4Address;
import java.util.List;
import java.util.Set;
import java.util.function.Predicate;

/* JADX INFO: loaded from: classes.dex */
public final class k {
    public final Set eZ;
    public final Set fa;
    public final Set fb;
    public Inet4Address fc;

    /* JADX INFO: Access modifiers changed from: private */
    public static /* synthetic */ boolean a(IpPrefix ipPrefix, RouteInfo routeInfo) {
        return !routeInfo.hasGateway() && ipPrefix.equals(routeInfo.getDestination());
    }

    public final boolean a(List list, List list2) {
        if (this.eZ.isEmpty()) {
            return false;
        }
        for (final LinkAddress linkAddress : this.eZ) {
            if (!d.a(list, new Predicate() { // from class: android.net.a.-$$Lambda$k$BhaJuFrxUOete_TdBnypmhIv79k
                @Override // java.util.function.Predicate
                public final boolean test(Object obj) {
                    return linkAddress.isSameAddressAs((LinkAddress) obj);
                }
            })) {
                return false;
            }
        }
        if (list2 == null) {
            return true;
        }
        for (final IpPrefix ipPrefix : this.fa) {
            if (!d.a(list2, new Predicate() { // from class: android.net.a.-$$Lambda$k$qOdN75L8_JOUAWZEkoEGp1TateI
                @Override // java.util.function.Predicate
                public final boolean test(Object obj) {
                    return k.a(ipPrefix, (RouteInfo) obj);
                }
            })) {
                return false;
            }
        }
        return true;
    }

    public final String toString() {
        return String.format("InitialConfiguration(IPs: {%s}, prefixes: {%s}, DNS: {%s}, v4 gateway: %s)", d.a(", ", this.eZ), d.a(", ", this.fa), d.a(", ", this.fb), this.fc);
    }
}
