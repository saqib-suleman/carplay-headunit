package android.net.a;

import android.content.Context;
import android.net.DhcpResults;
import android.net.IpPrefix;
import android.net.LinkAddress;
import android.net.LinkProperties;
import android.net.ProxyInfo;
import android.net.RouteInfo;
import android.net.apf.ApfFilter;
import android.net.metrics.IpConnectivityLog;
import android.net.metrics.IpManagerEvent;
import android.net.util.SharedLog;
import android.os.Build;
import android.os.ConditionVariable;
import android.os.INetworkManagementService;
import android.os.Message;
import android.os.RemoteException;
import android.os.ServiceManager;
import android.os.SystemClock;
import android.text.TextUtils;
import android.util.LocalLog;
import android.util.Log;
import android.util.SparseArray;
import com.android.internal.annotations.VisibleForTesting;
import com.android.internal.util.IndentingPrintWriter;
import com.android.internal.util.MessageUtils;
import com.android.internal.util.Preconditions;
import com.android.internal.util.State;
import com.android.internal.util.StateMachine;
import com.android.internal.util.WakeupMessage;
import com.android.server.net.NetlinkTracker;
import dalvik.system.PathClassLoader;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.lang.reflect.Constructor;
import java.net.InetAddress;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Objects;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CountDownLatch;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.stream.Collectors;

/* JADX INFO: loaded from: classes.dex */
public class d extends StateMachine {
    private static final SparseArray eu;
    private static final Class[] sMessageClasses;
    private android.net.util.b ax;
    private final IpConnectivityLog ay;
    private State dn;
    private final String eA;
    private final String eB;
    private final j eC;
    private final CountDownLatch eD;
    private final INetworkManagementService eE;
    private final NetlinkTracker eF;
    private final WakeupMessage eG;
    private final WakeupMessage eH;
    private final LocalLog eI;
    private final m eJ;
    private final c eK;
    private LinkProperties eL;
    private n eM;
    private android.net.util.c eN;
    private v eO;
    private android.net.dhcp.b eP;
    private DhcpResults eQ;
    private String eR;
    private ProxyInfo eS;
    private ApfFilter eT;
    private boolean eU;
    private long eV;
    private final ConditionVariable eW;
    private final SharedLog et;
    private final State ex;
    private final State ey;
    private State ez;

    @VisibleForTesting
    protected final i mCallback;
    private final Context mContext;
    private final String mTag;
    private static final boolean DBG = !Build.IS_USER;
    private static final ConcurrentHashMap ev = new ConcurrentHashMap();
    private static final ConcurrentHashMap ew = new ConcurrentHashMap();

    static {
        Class[] clsArr = {d.class, android.net.dhcp.b.class};
        sMessageClasses = clsArr;
        eu = MessageUtils.findMessageNames(clsArr);
    }

    @VisibleForTesting
    d(Context context, String str, i iVar, j jVar) {
        super(d.class.getSimpleName() + "." + str);
        this.ex = new r(this);
        this.ey = new p(this);
        this.ay = new IpConnectivityLog();
        this.eW = new ConditionVariable();
        Preconditions.checkNotNull(str);
        Preconditions.checkNotNull(iVar);
        this.mTag = getName();
        this.mContext = context;
        this.eA = str;
        this.eB = "v4-" + str;
        this.mCallback = new l(this, iVar);
        this.eC = jVar;
        this.eD = new CountDownLatch(1);
        this.eE = INetworkManagementService.Stub.asInterface(ServiceManager.getService("network_management"));
        ev.putIfAbsent(this.eA, new SharedLog(this.mTag));
        this.et = (SharedLog) ev.get(this.eA);
        ew.putIfAbsent(this.eA, new LocalLog(100));
        this.eI = (LocalLog) ew.get(this.eA);
        this.eJ = new m((byte) 0);
        this.eK = new c(this.eA, this.eE, android.net.util.f.aC(), this.et);
        this.eF = new f(this, this.eA, new e(this));
        this.eL = new LinkProperties();
        this.eL.setInterfaceName(this.eA);
        this.eG = new WakeupMessage(this.mContext, getHandler(), this.mTag + ".EVENT_PROVISIONING_TIMEOUT", 10);
        this.eH = new WakeupMessage(this.mContext, getHandler(), this.mTag + ".EVENT_DHCPACTION_TIMEOUT", 11);
        try {
            Constructor constructor = new PathClassLoader("/system/framework/mediatek-framework-net.jar", this.mContext.getClassLoader()).loadClass("com.mediatek.net.ip.MtkIpRunningState").getConstructor(Context.class, d.class, String.class, NetlinkTracker.class, State.class);
            constructor.setAccessible(true);
            this.ez = (State) constructor.newInstance(context, this, str, this.eF, new o(this));
        } catch (Throwable th) {
            a("No MtkIpRunningState! Used AOSP for instead! %s", th);
            this.ez = new o(this);
        }
        try {
            Constructor constructor2 = new PathClassLoader("/system/framework/mediatek-framework-net.jar", this.mContext.getClassLoader()).loadClass("com.mediatek.net.ip.MtkIpStoppedState").getConstructor(Context.class, d.class, String.class, State.class);
            constructor2.setAccessible(true);
            this.dn = (State) constructor2.newInstance(context, this, str, new q(this));
        } catch (Throwable th2) {
            a("No mtkStoppedClass! Used AOSP for instead! %s", th2);
            this.dn = new q(this);
        }
        addState(this.dn);
        addState(this.ey);
        addState(this.ez, this.ey);
        addState(this.ex);
        setInitialState(this.dn);
        super.start();
        try {
            this.eE.registerObserver(this.eF);
        } catch (RemoteException e) {
            a("Couldn't register NetlinkTracker: %s", e);
        }
    }

    static /* synthetic */ boolean A(d dVar) {
        if (dVar.eM.fl != null) {
            if (!dVar.eK.a(dVar.eM.fl.ipAddress)) {
                return false;
            }
            dVar.a(new DhcpResults(dVar.eM.fl));
            return true;
        }
        dVar.eP = android.net.dhcp.b.a(dVar.mContext, dVar, dVar.ax);
        dVar.eP.J();
        dVar.eP.sendMessage(196609);
        return true;
    }

    static /* synthetic */ v E(d dVar) {
        dVar.eO = null;
        return null;
    }

    static /* synthetic */ void I(d dVar) {
        dVar.eK.W();
        dVar.eQ = null;
        if (DBG) {
            Log.d(dVar.mTag, "onNewDhcpResults(null)");
        }
        dVar.mCallback.b(null);
        dVar.ac();
    }

    static String a(String str, Collection collection) {
        return (String) collection.stream().map(new Function() { // from class: android.net.a.-$$Lambda$d$JsVbJ5mpbRjwJuW_A3bDJMqYpF0
            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return obj.toString();
            }
        }).collect(Collectors.joining(str));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void a(DhcpResults dhcpResults) {
        this.eQ = new DhcpResults(dhcpResults);
        LinkProperties linkPropertiesAb = ab();
        LinkProperties.ProvisioningChange provisioningChangeB = b(linkPropertiesAb);
        if (DBG) {
            Log.d(this.mTag, "onNewDhcpResults(" + Objects.toString(dhcpResults) + ")");
        }
        this.mCallback.b(dhcpResults);
        a(provisioningChangeB, linkPropertiesAb);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void a(LinkProperties.ProvisioningChange provisioningChange, LinkProperties linkProperties) {
        switch (h.eY[provisioningChange.ordinal()]) {
            case 1:
                if (DBG) {
                    Log.d(this.mTag, "onProvisioningSuccess()");
                }
                g(1);
                this.mCallback.c(linkProperties);
                break;
            case 2:
                if (DBG) {
                    Log.d(this.mTag, "onProvisioningFailure()");
                }
                g(2);
                this.mCallback.d(linkProperties);
                break;
            default:
                if (DBG) {
                    Log.d(this.mTag, "onLinkPropertiesChange()");
                }
                this.mCallback.e(linkProperties);
                break;
        }
    }

    private static void a(LinkProperties linkProperties, Iterable iterable) {
        Iterator it = iterable.iterator();
        while (it.hasNext()) {
            InetAddress inetAddress = (InetAddress) it.next();
            if (!inetAddress.isAnyLocalAddress() && linkProperties.isReachable(inetAddress)) {
                linkProperties.addDnsServer(inetAddress);
            }
        }
    }

    static /* synthetic */ void a(d dVar, int i) {
        dVar.a("onProvisioningFailure(): %s", Integer.valueOf(i));
        dVar.g(i);
        dVar.mCallback.d(new LinkProperties(dVar.eL));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void a(String str, Object... objArr) {
        String str2 = "ERROR " + String.format(str, objArr);
        Log.e(this.mTag, str2);
        this.et.log(str2);
    }

    static /* synthetic */ boolean a(d dVar, k kVar) {
        Set set = kVar.eZ;
        for (LinkAddress linkAddress : (List) set.stream().filter(new Predicate() { // from class: android.net.a.-$$Lambda$d$GdLECAc1sQEo2Jjde3Y4ykVjDBg
            @Override // java.util.function.Predicate
            public final boolean test(Object obj) {
                return ((LinkAddress) obj).isIPv6();
            }
        }).collect(Collectors.toList())) {
            if (!dVar.eK.addAddress(linkAddress.getAddress(), linkAddress.getPrefixLength())) {
                return false;
            }
        }
        return true;
    }

    static /* synthetic */ boolean a(d dVar, boolean z) {
        LinkProperties linkPropertiesAb = dVar.ab();
        if (Objects.equals(linkPropertiesAb, dVar.eL)) {
            return true;
        }
        LinkProperties.ProvisioningChange provisioningChangeB = dVar.b(linkPropertiesAb);
        if (z) {
            dVar.a(provisioningChangeB, linkPropertiesAb);
        }
        return provisioningChangeB != LinkProperties.ProvisioningChange.LOST_PROVISIONING;
    }

    static boolean a(Iterable iterable, Predicate predicate) {
        Iterator it = iterable.iterator();
        while (it.hasNext()) {
            if (predicate.test(it.next())) {
                return true;
            }
        }
        return false;
    }

    private LinkProperties ab() {
        LinkProperties linkProperties = new LinkProperties();
        linkProperties.setInterfaceName(this.eA);
        LinkProperties linkProperties2 = this.eF.getLinkProperties();
        linkProperties.setLinkAddresses(linkProperties2.getLinkAddresses());
        Iterator<RouteInfo> it = linkProperties2.getRoutes().iterator();
        while (it.hasNext()) {
            linkProperties.addRoute(it.next());
        }
        a(linkProperties, linkProperties2.getDnsServers());
        if (this.eQ != null) {
            Iterator it2 = this.eQ.getRoutes(this.eA).iterator();
            while (it2.hasNext()) {
                linkProperties.addRoute((RouteInfo) it2.next());
            }
            a(linkProperties, this.eQ.dnsServers);
            linkProperties.setDomains(this.eQ.domains);
            if (this.eQ.mtu != 0) {
                linkProperties.setMtu(this.eQ.mtu);
            }
        }
        if (!TextUtils.isEmpty(this.eR)) {
            linkProperties.setTcpBufferSizes(this.eR);
        }
        if (this.eS != null) {
            linkProperties.setHttpProxy(this.eS);
        }
        if (this.eM != null && this.eM.fk != null) {
            k kVar = this.eM.fk;
            if (kVar.a(linkProperties.getLinkAddresses(), (List) null)) {
                Iterator it3 = kVar.fa.iterator();
                while (it3.hasNext()) {
                    linkProperties.addRoute(new RouteInfo((IpPrefix) it3.next(), null, this.eA));
                }
            }
            a(linkProperties, kVar.fb);
        }
        LinkProperties linkProperties3 = this.eL;
        if (DBG) {
            Log.d(this.mTag, String.format("Netlink-seen LPs: %s, new LPs: %s; old LPs: %s", linkProperties2, linkProperties, linkProperties3));
        }
        return linkProperties;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ac() {
        LinkProperties linkPropertiesAb = ab();
        LinkProperties.ProvisioningChange provisioningChangeB = b(linkPropertiesAb);
        if (provisioningChangeB == LinkProperties.ProvisioningChange.STILL_NOT_PROVISIONED) {
            provisioningChangeB = LinkProperties.ProvisioningChange.LOST_PROVISIONING;
        }
        a(provisioningChangeB, linkPropertiesAb);
        if (provisioningChangeB == LinkProperties.ProvisioningChange.LOST_PROVISIONING) {
            transitionTo(this.ex);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean ad() {
        try {
            this.eO = new v(this.mContext, this.ax, getHandler(), this.et, new g(this), this.eN);
        } catch (IllegalArgumentException e) {
            a("IpReachabilityMonitor failure: %s", e);
            this.eO = null;
        }
        return this.eO != null;
    }

    private LinkProperties.ProvisioningChange b(LinkProperties linkProperties) {
        LinkProperties.ProvisioningChange provisioningChange;
        if (this.eT != null) {
            this.eT.a(linkProperties);
        }
        if (this.eO != null) {
            this.eO.f(linkProperties);
        }
        LinkProperties linkProperties2 = this.eL;
        k kVar = this.eM != null ? this.eM.fk : null;
        boolean zIsProvisioned = isProvisioned(linkProperties2, kVar);
        boolean zIsProvisioned2 = isProvisioned(linkProperties, kVar);
        if (!zIsProvisioned && zIsProvisioned2) {
            provisioningChange = LinkProperties.ProvisioningChange.GAINED_PROVISIONING;
        } else if (zIsProvisioned && zIsProvisioned2) {
            provisioningChange = LinkProperties.ProvisioningChange.STILL_PROVISIONED;
        } else {
            provisioningChange = !zIsProvisioned ? LinkProperties.ProvisioningChange.STILL_NOT_PROVISIONED : LinkProperties.ProvisioningChange.LOST_PROVISIONING;
        }
        boolean z = false;
        boolean z2 = linkProperties2.isIPv6Provisioned() && !linkProperties.isIPv6Provisioned();
        boolean z3 = linkProperties2.hasIPv4Address() && !linkProperties.hasIPv4Address();
        boolean z4 = linkProperties2.hasIPv6DefaultRoute() && !linkProperties.hasIPv6DefaultRoute();
        if (this.eN != null && !this.eN.ay()) {
            z = true;
        }
        if (z3 || (z2 && !z)) {
            provisioningChange = LinkProperties.ProvisioningChange.LOST_PROVISIONING;
        }
        if (linkProperties2.hasGlobalIPv6Address() && z4 && !z) {
            provisioningChange = LinkProperties.ProvisioningChange.LOST_PROVISIONING;
        }
        this.eL = new LinkProperties(linkProperties);
        if (provisioningChange == LinkProperties.ProvisioningChange.GAINED_PROVISIONING) {
            this.eG.cancel();
        }
        return provisioningChange;
    }

    static /* synthetic */ void e(d dVar) {
        dVar.eK.Y();
        dVar.eK.aa();
    }

    static /* synthetic */ void f(d dVar) {
        dVar.eF.clearLinkProperties();
        dVar.eM = null;
        dVar.eQ = null;
        dVar.eR = "";
        dVar.eS = null;
        dVar.eL = new LinkProperties();
        dVar.eL.setInterfaceName(dVar.eA);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void g(int i) {
        this.ay.log(this.eA, new IpManagerEvent(i, this.eV > 0 ? SystemClock.elapsedRealtime() - this.eV : 0L));
    }

    static /* synthetic */ void i(d dVar) {
        try {
            dVar.eE.unregisterObserver(dVar.eF);
        } catch (RemoteException e) {
            dVar.a("Couldn't unregister NetlinkTracker: %s", e);
        }
    }

    @VisibleForTesting
    static boolean isProvisioned(LinkProperties linkProperties, k kVar) {
        if (linkProperties.hasIPv4Address() || linkProperties.isProvisioned()) {
            return true;
        }
        if (kVar == null) {
            return false;
        }
        return kVar.a(linkProperties.getLinkAddresses(), linkProperties.getRoutes());
    }

    static /* synthetic */ android.net.dhcp.b o(d dVar) {
        dVar.eP = null;
        return null;
    }

    static /* synthetic */ boolean z(d dVar) {
        return dVar.eK.Z() && dVar.eK.f(dVar.eM.fn) && dVar.eK.X();
    }

    public void dump(FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr) {
        String str;
        if (strArr != null && strArr.length > 0 && "confirm".equals(strArr[0])) {
            sendMessage(4);
            return;
        }
        ApfFilter apfFilter = this.eT;
        n nVar = this.eM;
        android.net.apf.a aVar = nVar != null ? nVar.av : null;
        PrintWriter indentingPrintWriter = new IndentingPrintWriter(printWriter, "  ");
        indentingPrintWriter.println(this.mTag + " APF dump:");
        indentingPrintWriter.increaseIndent();
        if (apfFilter != null) {
            if (aVar == null) {
                indentingPrintWriter.println("Hardware does not support APF.");
            } else if (aVar.s()) {
                this.eW.close();
                this.mCallback.ah();
                if (!this.eW.block(1000L)) {
                    indentingPrintWriter.print("TIMEOUT: DUMPING STALE APF SNAPSHOT");
                }
            }
            apfFilter.dump(indentingPrintWriter);
        } else {
            indentingPrintWriter.print("No active ApfFilter; ");
            if (nVar == null) {
                str = "IpClient not yet started.";
            } else if (aVar == null || aVar.an == 0) {
                str = "Hardware does not support APF.";
            } else {
                str = "ApfFilter not yet started, APF capabilities: " + aVar;
            }
            indentingPrintWriter.println(str);
        }
        indentingPrintWriter.decreaseIndent();
        indentingPrintWriter.println();
        indentingPrintWriter.println(this.mTag + " current ProvisioningConfiguration:");
        indentingPrintWriter.increaseIndent();
        indentingPrintWriter.println(Objects.toString(nVar, "N/A"));
        indentingPrintWriter.decreaseIndent();
        v vVar = this.eO;
        if (vVar != null) {
            indentingPrintWriter.println();
            indentingPrintWriter.println(this.mTag + " current IpReachabilityMonitor state:");
            indentingPrintWriter.increaseIndent();
            vVar.dump(indentingPrintWriter);
            indentingPrintWriter.decreaseIndent();
        }
        indentingPrintWriter.println();
        indentingPrintWriter.println(this.mTag + " StateMachine dump:");
        indentingPrintWriter.increaseIndent();
        this.et.dump(fileDescriptor, indentingPrintWriter, strArr);
        indentingPrintWriter.decreaseIndent();
        indentingPrintWriter.println();
        indentingPrintWriter.println(this.mTag + " connectivity packet log:");
        indentingPrintWriter.println();
        indentingPrintWriter.println("Debug with python and scapy via:");
        indentingPrintWriter.println("shell$ python");
        indentingPrintWriter.println(">>> from scapy import all as scapy");
        indentingPrintWriter.println(">>> scapy.Ether(\"<paste_hex_string>\".decode(\"hex\")).show2()");
        indentingPrintWriter.println();
        indentingPrintWriter.increaseIndent();
        this.eI.readOnlyLocalLog().dump(fileDescriptor, indentingPrintWriter, strArr);
        indentingPrintWriter.decreaseIndent();
    }

    protected String getLogRecString(Message message) {
        Object[] objArr = new Object[6];
        objArr[0] = this.eA;
        objArr[1] = Integer.valueOf(this.ax == null ? -1 : this.ax.index);
        objArr[2] = Integer.valueOf(message.arg1);
        objArr[3] = Integer.valueOf(message.arg2);
        objArr[4] = Objects.toString(message.obj);
        objArr[5] = this.eJ;
        String str = String.format("%s/%d %d %d %s [%s]", objArr);
        String str2 = getWhatToString(message.what) + " " + str;
        this.et.log(str2);
        if (DBG) {
            Log.d(this.mTag, str2);
        }
        this.eJ.reset();
        return str;
    }

    protected String getWhatToString(int i) {
        return (String) eu.get(i, "UNKNOWN: " + Integer.toString(i));
    }

    protected void onQuitting() {
        this.mCallback.ag();
        this.eD.countDown();
    }

    protected boolean recordLogRec(Message message) {
        boolean z = message.what != 6;
        if (!z) {
            this.eJ.reset();
        }
        return z;
    }
}
