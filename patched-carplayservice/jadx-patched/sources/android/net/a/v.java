package android.net.a;

import android.content.Context;
import android.net.LinkProperties;
import android.net.RouteInfo;
import android.net.metrics.IpConnectivityLog;
import android.net.metrics.IpReachabilityEvent;
import android.net.util.SharedLog;
import android.os.Build;
import android.os.Handler;
import android.os.PowerManager;
import android.os.SystemClock;
import android.util.Log;
import com.android.internal.annotations.VisibleForTesting;
import com.android.internal.util.DumpUtils;
import java.io.PrintWriter;
import java.net.Inet6Address;
import java.net.InetAddress;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
public final class v {
    private static final boolean DBG = !Build.IS_USER;
    private final android.net.util.b ax;
    private final IpConnectivityLog ay;
    private LinkProperties eL;
    private final android.net.util.c eN;
    private final SharedLog et;
    private final y fA;
    private Map fB;
    private volatile long fC;
    private final s fy;
    private final x fz;

    public v(Context context, android.net.util.b bVar, Handler handler, SharedLog sharedLog, x xVar, android.net.util.c cVar) {
        this(bVar, handler, sharedLog, xVar, cVar, new z(((PowerManager) context.getSystemService("power")).newWakeLock(1, "IpReachabilityMonitor." + bVar.name)));
    }

    @VisibleForTesting
    v(android.net.util.b bVar, Handler handler, SharedLog sharedLog, x xVar, android.net.util.c cVar, y yVar) {
        this.ay = new IpConnectivityLog();
        this.eL = new LinkProperties();
        this.fB = new HashMap();
        if (bVar == null) {
            throw new IllegalArgumentException("null InterfaceParams");
        }
        this.ax = bVar;
        this.et = sharedLog.o("IpReachabilityMonitor");
        this.fz = xVar;
        this.eN = cVar;
        this.fA = yVar;
        this.fy = new s(handler, this.et, new u() { // from class: android.net.a.-$$Lambda$v$xQcrI_hNaY-ORSz9NkRFqQjM9FQ
            @Override // android.net.a.u
            public final void accept(t tVar) {
                this.f$0.a(tVar);
            }
        });
        this.fy.start();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void a(t tVar) {
        if (this.ax.index == tVar.fu && this.fB.containsKey(tVar.fv)) {
            t tVar2 = (t) this.fB.put(tVar.fv, tVar);
            if (tVar.fw == 32) {
                this.et.w("ALERT neighbor went from: " + tVar2 + " to: " + tVar);
                b(tVar);
            }
        }
    }

    private static boolean a(List list, InetAddress inetAddress) {
        Iterator it = list.iterator();
        while (it.hasNext()) {
            RouteInfo routeInfo = (RouteInfo) it.next();
            if (!routeInfo.hasGateway() && routeInfo.matches(inetAddress)) {
                return true;
            }
        }
        return false;
    }

    private String am() {
        return l(" ");
    }

    private void b(t tVar) {
        LinkProperties linkProperties = new LinkProperties(this.eL);
        Iterator it = this.fB.entrySet().iterator();
        while (true) {
            boolean z = true;
            if (!it.hasNext()) {
                break;
            }
            Map.Entry entry = (Map.Entry) it.next();
            if (((t) entry.getValue()).fw == 32) {
                InetAddress inetAddress = (InetAddress) entry.getKey();
                for (RouteInfo routeInfo : this.eL.getRoutes()) {
                    if (inetAddress.equals(routeInfo.getGateway())) {
                        linkProperties.removeRoute(routeInfo);
                    }
                }
                if (this.eN != null && !this.eN.ay()) {
                    z = false;
                }
                if (z || !(inetAddress instanceof Inet6Address)) {
                    linkProperties.removeDnsServer(inetAddress);
                }
            }
        }
        LinkProperties.ProvisioningChange provisioningChangeCompareProvisioning = LinkProperties.compareProvisioning(this.eL, linkProperties);
        if (provisioningChangeCompareProvisioning == LinkProperties.ProvisioningChange.LOST_PROVISIONING) {
            String str = "FAILURE: LOST_PROVISIONING, " + tVar;
            Log.w("IpReachabilityMonitor", str);
            if (this.fz != null) {
                this.fz.j(str);
            }
        }
        this.ay.log(this.ax.name, new IpReachabilityEvent(IpReachabilityEvent.nudFailureEventType(SystemClock.elapsedRealtime() - this.fC < 3500, provisioningChangeCompareProvisioning == LinkProperties.ProvisioningChange.LOST_PROVISIONING)));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String l(String str) {
        StringBuilder sb = new StringBuilder();
        sb.append("iface{" + this.ax + "}," + str);
        StringBuilder sb2 = new StringBuilder("ntable=[");
        sb2.append(str);
        sb.append(sb2.toString());
        String string = "";
        for (Map.Entry entry : this.fB.entrySet()) {
            sb.append(string);
            sb.append(((InetAddress) entry.getKey()).getHostAddress() + "/" + entry.getValue());
            StringBuilder sb3 = new StringBuilder(",");
            sb3.append(str);
            string = sb3.toString();
        }
        sb.append("]");
        return sb.toString();
    }

    public final void an() {
        ArrayList<InetAddress> arrayList = new ArrayList(this.fB.keySet());
        if (!arrayList.isEmpty()) {
            this.fA.ao();
        }
        for (InetAddress inetAddress : arrayList) {
            int iA = s.a(this.ax.index, inetAddress);
            this.et.log(String.format("put neighbor %s into NUD_PROBE state (rval=%d)", inetAddress.getHostAddress(), Integer.valueOf(iA)));
            this.ay.log(this.ax.name, new IpReachabilityEvent(256 | (iA & 255)));
        }
        this.fC = SystemClock.elapsedRealtime();
    }

    public final void dump(PrintWriter printWriter) {
        DumpUtils.dumpAsync(this.fy.getHandler(), new w(this), printWriter, "", 1000L);
    }

    public final void f(LinkProperties linkProperties) {
        if (!this.ax.name.equals(linkProperties.getInterfaceName())) {
            Log.wtf("IpReachabilityMonitor", "requested LinkProperties interface '" + linkProperties.getInterfaceName() + "' does not match: " + this.ax.name);
            return;
        }
        this.eL = new LinkProperties(linkProperties);
        HashMap map = new HashMap();
        List<RouteInfo> routes = this.eL.getRoutes();
        for (RouteInfo routeInfo : routes) {
            if (routeInfo.hasGateway()) {
                InetAddress gateway = routeInfo.getGateway();
                if (a(routes, gateway)) {
                    map.put(gateway, (t) this.fB.getOrDefault(gateway, null));
                }
            }
        }
        for (InetAddress inetAddress : linkProperties.getDnsServers()) {
            if (a(routes, inetAddress)) {
                map.put(inetAddress, (t) this.fB.getOrDefault(inetAddress, null));
            }
        }
        this.fB = map;
        if (DBG) {
            Log.d("IpReachabilityMonitor", "watch: " + am());
        }
    }

    public final void stop() {
        this.fy.stop();
        this.eL.clear();
        this.fB.clear();
        if (DBG) {
            Log.d("IpReachabilityMonitor", "clear: " + am());
        }
    }
}
