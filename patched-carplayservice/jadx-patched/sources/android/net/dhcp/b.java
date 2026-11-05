package android.net.dhcp;

import android.content.Context;
import android.net.DhcpResults;
import android.net.NetworkUtils;
import android.net.TrafficStats;
import android.net.metrics.IpConnectivityLog;
import android.os.SystemClock;
import android.system.ErrnoException;
import android.system.Os;
import android.system.OsConstants;
import android.system.PacketSocketAddress;
import android.util.Log;
import android.util.SparseArray;
import com.android.internal.util.HexDump;
import com.android.internal.util.MessageUtils;
import com.android.internal.util.State;
import com.android.internal.util.StateMachine;
import com.android.internal.util.WakeupMessage;
import dalvik.system.PathClassLoader;
import java.io.FileDescriptor;
import java.io.IOException;
import java.lang.reflect.Method;
import java.net.Inet4Address;
import java.net.SocketException;
import java.nio.ByteBuffer;
import java.util.Arrays;
import java.util.Random;
import libcore.io.IoBridge;

/* JADX INFO: loaded from: classes.dex */
public class b extends StateMachine {
    private static final SparseArray cP;
    static final byte[] cQ = {1, 3, 6, 15, 26, 28, 51, 58, 59, 43};
    private static final Class[] sMessageClasses;
    private final IpConnectivityLog ay;
    private final Random cR;
    private FileDescriptor cS;
    private FileDescriptor cT;
    private q cU;
    private final StateMachine cV;
    private final WakeupMessage cW;
    private final WakeupMessage cX;
    private final WakeupMessage cY;
    private final WakeupMessage cZ;
    private State dA;
    private final WakeupMessage da;
    private final String db;
    private boolean dc;
    private android.net.util.b dd;
    private byte[] de;
    private PacketSocketAddress df;
    private int dg;
    private long dh;
    private DhcpResults di;
    private long dj;
    private DhcpResults dk;
    private long dl;
    private long dm;
    private State dn;

    /* JADX INFO: renamed from: do, reason: not valid java name */
    private State f0do;
    private State dp;
    private State dq;
    private State dr;
    private State ds;
    private State dt;
    private State du;
    private State dv;
    private State dw;
    private State dx;
    private State dy;
    private State dz;
    private final Context mContext;

    static {
        Class[] clsArr = {b.class};
        sMessageClasses = clsArr;
        cP = MessageUtils.findMessageNames(clsArr);
    }

    private b(Context context, StateMachine stateMachine, String str) {
        super("DhcpClient", stateMachine.getHandler());
        this.ay = new IpConnectivityLog();
        this.dn = new r(this);
        this.f0do = new n(this);
        this.dp = new g(this);
        this.dq = new m(this);
        this.dr = new l(this);
        this.ds = new e(this);
        this.dt = new c(this);
        this.du = new d(this);
        this.dv = new k(this);
        this.dw = new i(this);
        this.dx = new f(this);
        this.dy = new j(this);
        this.dz = new u(this, this.dp);
        this.dA = new t(this, this.dv);
        this.mContext = context;
        this.cV = stateMachine;
        this.db = str;
        addState(this.dn);
        addState(this.f0do);
        addState(this.dp, this.f0do);
        addState(this.dz, this.f0do);
        addState(this.dq, this.f0do);
        addState(this.dr, this.f0do);
        addState(this.ds, this.f0do);
        addState(this.dt, this.ds);
        addState(this.du, this.ds);
        addState(this.dA, this.ds);
        addState(this.dv, this.ds);
        addState(this.dw, this.ds);
        addState(this.dx, this.f0do);
        addState(this.dy, this.f0do);
        setInitialState(this.dn);
        this.cR = new Random();
        this.cW = a("KICK", 196709);
        this.cX = a("TIMEOUT", 196711);
        this.cY = a("RENEW", 196712);
        this.cZ = a("REBIND", 196713);
        this.da = a("EXPIRY", 196714);
    }

    private boolean K() {
        try {
            this.cS = Os.socket(OsConstants.AF_PACKET, OsConstants.SOCK_RAW, OsConstants.ETH_P_IP);
            Os.bind(this.cS, new PacketSocketAddress((short) OsConstants.ETH_P_IP, this.dd.index));
            NetworkUtils.attachDhcpFilter(this.cS);
            return true;
        } catch (ErrnoException | SocketException e) {
            Log.e("DhcpClient", "Error creating packet socket", e);
            return false;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean L() {
        int andSetThreadStatsTag = TrafficStats.getAndSetThreadStatsTag(-192);
        try {
            this.cT = Os.socket(OsConstants.AF_INET, OsConstants.SOCK_DGRAM, OsConstants.IPPROTO_UDP);
            Os.setsockoptInt(this.cT, OsConstants.SOL_SOCKET, OsConstants.SO_REUSEADDR, 1);
            Os.setsockoptIfreq(this.cT, OsConstants.SOL_SOCKET, OsConstants.SO_BINDTODEVICE, this.db);
            Os.setsockoptInt(this.cT, OsConstants.SOL_SOCKET, OsConstants.SO_BROADCAST, 1);
            Os.setsockoptInt(this.cT, OsConstants.SOL_SOCKET, OsConstants.SO_RCVBUF, 0);
            Os.bind(this.cT, Inet4Address.ANY, 68);
            NetworkUtils.protectFromVpn(this.cT);
            return true;
        } catch (ErrnoException | SocketException e) {
            Log.e("DhcpClient", "Error creating UDP socket", e);
            return false;
        } finally {
            TrafficStats.setThreadStatsTag(andSetThreadStatsTag);
        }
    }

    private short M() {
        return (short) ((SystemClock.elapsedRealtime() - this.dh) / 1000);
    }

    public static b a(Context context, StateMachine stateMachine, android.net.util.b bVar) {
        try {
            Class clsLoadClass = new PathClassLoader("/system/framework/mediatek-framework-net.jar", context.getClassLoader()).loadClass("com.mediatek.net.dhcp.MtkDhcpClient");
            Method declaredMethod = clsLoadClass.getDeclaredMethod("makeDhcpClient", Context.class, StateMachine.class, android.net.util.b.class);
            declaredMethod.setAccessible(true);
            return (b) declaredMethod.invoke(clsLoadClass, context, stateMachine, bVar);
        } catch (Exception e) {
            Log.e("DhcpClient", "No MtkDhcpClient! Used AOSP for instead! %s", e);
            b bVar2 = new b(context, stateMachine, bVar.name);
            bVar2.dd = bVar;
            bVar2.start();
            return bVar2;
        }
    }

    private WakeupMessage a(String str, int i) {
        return new WakeupMessage(this.mContext, getHandler(), b.class.getSimpleName() + "." + this.db + "." + str, i);
    }

    static /* synthetic */ void a(b bVar) {
        try {
            IoBridge.closeAndSignalBlockedThreads(bVar.cT);
        } catch (IOException e) {
        }
        try {
            IoBridge.closeAndSignalBlockedThreads(bVar.cS);
        } catch (IOException e2) {
        }
    }

    static /* synthetic */ void a(b bVar, DhcpResults dhcpResults, String str) {
        bVar.di = dhcpResults;
        bVar.dk = null;
        Log.d("DhcpClient", str + " lease: " + bVar.di);
        bVar.cV.sendMessage(196612, 1, 0, new DhcpResults(bVar.di));
    }

    static /* synthetic */ boolean a(b bVar, Inet4Address inet4Address, Inet4Address inet4Address2, Inet4Address inet4Address3, Inet4Address inet4Address4) {
        int i = DhcpPacket.dH.equals(inet4Address) ? 0 : 2;
        return bVar.a(DhcpPacket.a(i, bVar.dg, bVar.M(), inet4Address, bVar.de, inet4Address2, inet4Address3, cQ), "DHCPREQUEST ciaddr=" + inet4Address.getHostAddress() + " request=" + inet4Address2.getHostAddress() + " serverid=" + (inet4Address3 != null ? inet4Address3.getHostAddress() : null), i, inet4Address4);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean a(Inet4Address inet4Address) {
        try {
            Os.connect(this.cT, inet4Address, 67);
            return true;
        } catch (ErrnoException | SocketException e) {
            Log.e("DhcpClient", "Error connecting UDP socket", e);
            return false;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean a(ByteBuffer byteBuffer, String str, int i, Inet4Address inet4Address) {
        try {
            if (i == 0) {
                Log.d("DhcpClient", "Broadcasting " + str);
                Os.sendto(this.cS, byteBuffer.array(), 0, byteBuffer.limit(), 0, this.df);
                return true;
            }
            if (i != 2 || !inet4Address.equals(DhcpPacket.dI)) {
                Log.d("DhcpClient", String.format("Unicasting %s to %s", str, Os.getpeername(this.cT)));
                Os.write(this.cT, byteBuffer);
                return true;
            }
            Log.d("DhcpClient", "Broadcasting " + str);
            Os.sendto(this.cT, byteBuffer, 0, inet4Address, 67);
            return true;
        } catch (ErrnoException | IOException e) {
            Log.e("DhcpClient", "Can't send packet: ", e);
            return false;
        }
    }

    static /* synthetic */ void g(b bVar) {
        bVar.di = null;
        bVar.dj = 0L;
        bVar.dk = null;
    }

    static /* synthetic */ boolean h(b bVar) {
        if (bVar.dd == null) {
            bVar.dd = android.net.util.b.m(bVar.db);
        }
        if (bVar.dd != null) {
            bVar.de = bVar.dd.fx.toByteArray();
            bVar.df = new PacketSocketAddress(bVar.dd.index, DhcpPacket.dJ);
            return true;
        }
        Log.e("DhcpClient", "Can't determine InterfaceParams for " + bVar.db);
        return false;
    }

    static /* synthetic */ boolean i(b bVar) {
        return bVar.K() && bVar.L();
    }

    static /* synthetic */ void p(b bVar) {
        bVar.dg = bVar.cR.nextInt();
        bVar.dh = SystemClock.elapsedRealtime();
    }

    static /* synthetic */ void z(b bVar) {
        String str;
        String str2;
        if (bVar.dj == 0) {
            str = "DhcpClient";
            str2 = "Infinite lease, no timer scheduling needed";
        } else {
            long jElapsedRealtime = SystemClock.elapsedRealtime();
            long j = bVar.dj - jElapsedRealtime;
            long j2 = j / 2;
            long j3 = (7 * j) / 8;
            bVar.cY.schedule(jElapsedRealtime + j2);
            bVar.cZ.schedule(jElapsedRealtime + j3);
            bVar.da.schedule(jElapsedRealtime + j);
            Log.d("DhcpClient", "Scheduling renewal in " + (j2 / 1000) + "s");
            Log.d("DhcpClient", "Scheduling rebind in " + (j3 / 1000) + "s");
            str = "DhcpClient";
            str2 = "Scheduling expiry in " + (j / 1000) + "s";
        }
        Log.d(str, str2);
    }

    public final void J() {
        this.dc = true;
    }

    public final boolean a(DhcpPacket dhcpPacket) {
        int transactionId = dhcpPacket.getTransactionId();
        if (transactionId != this.dg) {
            Log.d("DhcpClient", "Unexpected transaction ID " + transactionId + ", expected " + this.dg);
            return false;
        }
        if (Arrays.equals(dhcpPacket.R(), this.de)) {
            return true;
        }
        Log.d("DhcpClient", "MAC addr mismatch: got " + HexDump.toHexString(dhcpPacket.R()) + ", expected " + HexDump.toHexString(dhcpPacket.R()));
        return false;
    }

    public final void b(DhcpPacket dhcpPacket) {
        long jU = dhcpPacket.U();
        this.dj = jU > 0 ? SystemClock.elapsedRealtime() + jU : 0L;
    }

    protected void onQuitting() {
        Log.d("DhcpClient", "onQuitting");
        this.cV.sendMessage(196613);
    }
}
