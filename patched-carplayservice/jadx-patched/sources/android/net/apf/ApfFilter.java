package android.net.apf;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.IntentFilter;
import android.net.LinkAddress;
import android.net.LinkProperties;
import android.net.NetworkUtils;
import android.net.a.i;
import android.net.metrics.ApfProgramEvent;
import android.net.metrics.ApfStats;
import android.net.metrics.IpConnectivityLog;
import android.net.metrics.RaEvent;
import android.os.SystemClock;
import android.system.ErrnoException;
import android.system.Os;
import android.system.OsConstants;
import android.system.PacketSocketAddress;
import android.util.Log;
import android.util.Pair;
import com.android.internal.annotations.GuardedBy;
import com.android.internal.annotations.VisibleForTesting;
import com.android.internal.util.BitUtils;
import com.android.internal.util.HexDump;
import com.android.internal.util.IndentingPrintWriter;
import com.autochips.carplay.common.CarplayMessage;
import java.io.FileDescriptor;
import java.io.IOException;
import java.net.Inet4Address;
import java.net.Inet6Address;
import java.net.InetAddress;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.nio.BufferUnderflowException;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.function.ToIntFunction;
import libcore.io.IoBridge;

/* JADX INFO: loaded from: classes.dex */
public final class ApfFilter {
    private static final byte[] as = {-1, -1, -1, -1, -1, -1};
    private static final byte[] at = {-1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1};
    private static final byte[] au = {0, 1, 8, 0, 6, 4};

    @GuardedBy("this")
    private boolean aA;

    @GuardedBy("this")
    private boolean aB;
    private final boolean aC;
    private final int[] aD;

    @GuardedBy("this")
    private byte[] aF;

    @GuardedBy("this")
    private int aG;

    @GuardedBy("this")
    private long aI;

    @GuardedBy("this")
    private long aJ;

    @GuardedBy("this")
    private ApfProgramEvent aK;

    @GuardedBy("this")
    private byte[] aL;

    @GuardedBy("this")
    private byte[] aM;
    private final String aq;
    private final String ar;
    private final a av;
    private final i aw;
    private final android.net.util.b ax;
    private final IpConnectivityLog ay;

    @GuardedBy("this")
    private long az;
    private final Context mContext;

    @VisibleForTesting
    byte[] mHardwareAddress;

    @VisibleForTesting
    ReceiveThread mReceiveThread;
    private final BroadcastReceiver aE = new b(this);

    @GuardedBy("this")
    private ArrayList aH = new ArrayList();

    @GuardedBy("this")
    private int aN = 0;

    @GuardedBy("this")
    private int aO = 0;

    @VisibleForTesting
    enum Counter {
        RESERVED_OOB,
        TOTAL_PACKETS,
        PASSED_ARP,
        PASSED_DHCP,
        PASSED_IPV4,
        PASSED_IPV6_NON_ICMP,
        PASSED_IPV4_UNICAST,
        PASSED_IPV6_ICMP,
        PASSED_IPV6_UNICAST_NON_ICMP,
        PASSED_ARP_NON_IPV4,
        PASSED_ARP_UNKNOWN,
        PASSED_ARP_UNICAST_REPLY,
        PASSED_NON_IP_UNICAST,
        DROPPED_ETH_BROADCAST,
        DROPPED_RA,
        DROPPED_GARP_REPLY,
        DROPPED_ARP_OTHER_HOST,
        DROPPED_IPV4_L2_BROADCAST,
        DROPPED_IPV4_BROADCAST_ADDR,
        DROPPED_IPV4_BROADCAST_NET,
        DROPPED_IPV4_MULTICAST,
        DROPPED_IPV6_ROUTER_SOLICITATION,
        DROPPED_IPV6_MULTICAST_NA,
        DROPPED_IPV6_MULTICAST,
        DROPPED_IPV6_MULTICAST_PING,
        DROPPED_IPV6_NON_ICMP_MULTICAST,
        DROPPED_802_3_FRAME,
        DROPPED_ETHERTYPE_BLACKLISTED;

        public static int v() {
            return (((Counter[]) Counter.class.getEnumConstants()).length - 1) * 4;
        }
    }

    public class InvalidRaException extends Exception {
        public InvalidRaException(String str) {
            super(str);
        }
    }

    enum ProcessRaResult {
        MATCH,
        DROPPED,
        PARSE_ERROR,
        ZERO_LIFETIME,
        UPDATE_NEW_RA,
        UPDATE_EXPIRY
    }

    @VisibleForTesting
    class Ra {
        private final ByteBuffer bF;
        long bH;
        long bI;
        private final ArrayList bG = new ArrayList();
        private final ArrayList bJ = new ArrayList();
        private final ArrayList bK = new ArrayList();
        int bL = 0;

        /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
        Ra(byte[] bArr, int i) throws InvalidRaException {
            int i2 = 70;
            if (i < 70) {
                throw new InvalidRaException("Not an ICMP6 router advertisement");
            }
            this.bF = ByteBuffer.wrap(Arrays.copyOf(bArr, i));
            this.bI = ApfFilter.this.currentTimeSeconds();
            if (BitUtils.getUint16(this.bF, 12) != OsConstants.ETH_P_IPV6 || BitUtils.getUint8(this.bF, 20) != OsConstants.IPPROTO_ICMPV6 || BitUtils.getUint8(this.bF, 54) != 134) {
                throw new InvalidRaException("Not an ICMP6 router advertisement");
            }
            RaEvent.Builder builder = new RaEvent.Builder();
            int iA = a(a(a(0, 15, 3), 56, 2), 60, 2);
            builder.updateRouterLifetime(BitUtils.getUint16(this.bF, 60));
            ByteBuffer byteBuffer = this.bF;
            while (true) {
                byteBuffer.position(i2);
                if (!this.bF.hasRemaining()) {
                    a(iA, 0, 0);
                    this.bH = b(bArr);
                    ApfFilter.this.ay.log(builder.build());
                    return;
                }
                int iPosition = this.bF.position();
                int uint8 = BitUtils.getUint8(this.bF, iPosition);
                int uint9 = BitUtils.getUint8(this.bF, iPosition + 1) * 8;
                if (uint8 == 3) {
                    int iA2 = a(iA, 4, 4);
                    builder.updatePrefixValidLifetime(BitUtils.getUint32(this.bF, iPosition + 4));
                    iA = a(iA2, 8, 4);
                    builder.updatePrefixPreferredLifetime(BitUtils.getUint32(this.bF, iPosition + 8));
                    this.bJ.add(Integer.valueOf(iPosition));
                } else if (uint8 != 31) {
                    switch (uint8) {
                        case 24:
                            iA = a(iA, 4, 4);
                            builder.updateRouteInfoLifetime(BitUtils.getUint32(this.bF, iPosition + 4));
                            break;
                        case 25:
                            this.bK.add(Integer.valueOf(iPosition));
                            iA = a(iA, 4, 4);
                            builder.updateRdnssLifetime(BitUtils.getUint32(this.bF, iPosition + 4));
                            break;
                    }
                } else {
                    iA = a(iA, 4, 4);
                    builder.updateDnsslLifetime(BitUtils.getUint32(this.bF, iPosition + 4));
                }
                if (uint9 <= 0) {
                    throw new InvalidRaException(String.format("Invalid option length opt=%d len=%d", Integer.valueOf(uint8), Integer.valueOf(uint9)));
                }
                byteBuffer = this.bF;
                i2 = iPosition + uint9;
            }
        }

        private int a(int i, int i2, int i3) {
            int iPosition = i2 + this.bF.position();
            this.bG.add(new Pair(Integer.valueOf(i), Integer.valueOf(iPosition - i)));
            return iPosition + i3;
        }

        private String a(int i) {
            int i2;
            try {
                byte[] bArrArray = this.bF.array();
                if (i >= 0 && (i2 = i + 16) <= bArrArray.length && i2 >= i) {
                    return ((Inet6Address) InetAddress.getByAddress(Arrays.copyOfRange(bArrArray, i, i2))).getHostAddress();
                }
                return "???";
            } catch (ClassCastException | UnknownHostException e) {
                return "???";
            } catch (UnsupportedOperationException e2) {
                return "???";
            }
        }

        private void a(StringBuffer stringBuffer, int i) {
            int uint8 = BitUtils.getUint8(this.bF, i + 1) * 8;
            if (uint8 < 24) {
                return;
            }
            long uint32 = BitUtils.getUint32(this.bF, i + 4);
            int i2 = (uint8 - 8) / 16;
            stringBuffer.append("DNS ");
            stringBuffer.append(uint32);
            stringBuffer.append("s");
            for (int i3 = 0; i3 < i2; i3++) {
                stringBuffer.append(" ");
                stringBuffer.append(a(i + 8 + (16 * i3)));
            }
        }

        private long x() {
            return this.bH - (ApfFilter.this.currentTimeSeconds() - this.bI);
        }

        final boolean a(byte[] bArr, int i) {
            if (i != this.bF.capacity()) {
                return false;
            }
            byte[] bArrArray = this.bF.array();
            for (Pair pair : this.bG) {
                for (int iIntValue = ((Integer) pair.first).intValue(); iIntValue < ((Integer) pair.first).intValue() + ((Integer) pair.second).intValue(); iIntValue++) {
                    if (bArr[iIntValue] != bArrArray[iIntValue]) {
                        return false;
                    }
                }
            }
            return true;
        }

        @GuardedBy("ApfFilter.this")
        final long b(ApfGenerator apfGenerator) throws ApfGenerator.IllegalInstructionException {
            String str = "Ra" + ApfFilter.e(ApfFilter.this);
            apfGenerator.e(ApfGenerator.Register.R0, 14);
            apfGenerator.b(this.bF.capacity(), str);
            int iX = (int) (x() / 6);
            apfGenerator.e(ApfGenerator.Register.R0, 15);
            apfGenerator.c(iX, str);
            int i = 0;
            while (i < this.bG.size()) {
                Pair pair = (Pair) this.bG.get(i);
                if (((Integer) pair.second).intValue() != 0) {
                    apfGenerator.d(ApfGenerator.Register.R0, ((Integer) pair.first).intValue());
                    apfGenerator.a(ApfGenerator.Register.R0, Arrays.copyOfRange(this.bF.array(), ((Integer) pair.first).intValue(), ((Integer) pair.first).intValue() + ((Integer) pair.second).intValue()), str);
                }
                i++;
                if (i < this.bG.size()) {
                    Pair pair2 = (Pair) this.bG.get(i);
                    int iIntValue = ((Integer) pair.first).intValue() + ((Integer) pair.second).intValue();
                    if (iIntValue != 15 && iIntValue != 56) {
                        int iIntValue2 = ((Integer) pair2.first).intValue() - iIntValue;
                        if (iIntValue2 == 2) {
                            apfGenerator.b(ApfGenerator.Register.R0, iIntValue);
                        } else {
                            if (iIntValue2 != 4) {
                                throw new IllegalStateException("bogus lifetime size " + iIntValue2);
                            }
                            apfGenerator.c(ApfGenerator.Register.R0, iIntValue);
                        }
                        apfGenerator.d(iX, str);
                    }
                }
            }
            ApfFilter.this.a(apfGenerator, Counter.DROPPED_RA);
            apfGenerator.d(ApfFilter.this.ar);
            apfGenerator.c(str);
            return iX;
        }

        final long b(byte[] bArr) {
            long uint16;
            ByteBuffer byteBufferWrap = ByteBuffer.wrap(bArr);
            long jMin = Long.MAX_VALUE;
            int i = 0;
            while (true) {
                int i2 = i + 1;
                if (i2 >= this.bG.size()) {
                    return jMin;
                }
                int iIntValue = ((Integer) ((Pair) this.bG.get(i)).first).intValue() + ((Integer) ((Pair) this.bG.get(i)).second).intValue();
                if (iIntValue != 15 && iIntValue != 56) {
                    int iIntValue2 = ((Integer) ((Pair) this.bG.get(i2)).first).intValue() - iIntValue;
                    if (iIntValue2 == 2) {
                        uint16 = BitUtils.getUint16(byteBufferWrap, iIntValue);
                    } else {
                        if (iIntValue2 != 4) {
                            throw new IllegalStateException("bogus lifetime size " + iIntValue2);
                        }
                        uint16 = BitUtils.getUint32(byteBufferWrap, iIntValue);
                    }
                    jMin = Math.min(jMin, uint16);
                }
                i = i2;
            }
        }

        public String toString() {
            try {
                StringBuffer stringBuffer = new StringBuffer();
                stringBuffer.append(String.format("RA %s -> %s %ds ", a(22), a(38), Integer.valueOf(BitUtils.getUint16(this.bF, 60))));
                Iterator it = this.bJ.iterator();
                while (it.hasNext()) {
                    int iIntValue = ((Integer) it.next()).intValue();
                    stringBuffer.append(String.format("%s/%d %ds/%ds ", a(iIntValue + 16), Integer.valueOf(BitUtils.getUint8(this.bF, iIntValue + 2)), Long.valueOf(BitUtils.getUint32(this.bF, iIntValue + 4)), Long.valueOf(BitUtils.getUint32(this.bF, iIntValue + 8))));
                }
                Iterator it2 = this.bK.iterator();
                while (it2.hasNext()) {
                    a(stringBuffer, ((Integer) it2.next()).intValue());
                }
                return stringBuffer.toString();
            } catch (IndexOutOfBoundsException | BufferUnderflowException e) {
                return "<Malformed RA>";
            }
        }

        final String w() {
            return HexDump.toHexString(this.bF.array(), 0, this.bF.capacity(), false);
        }

        final boolean y() {
            return x() <= 0;
        }
    }

    @VisibleForTesting
    class ReceiveThread extends Thread {
        private final FileDescriptor bN;
        private volatile boolean mStopped;
        private final byte[] bM = new byte[1514];
        private final long bO = SystemClock.elapsedRealtime();
        private final ApfStats bP = new ApfStats();

        public ReceiveThread(FileDescriptor fileDescriptor) {
            this.bN = fileDescriptor;
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            ApfStats apfStats;
            int i;
            ApfFilter.this.log("begin monitoring");
            while (!this.mStopped) {
                try {
                    ProcessRaResult processRaResultProcessRa = ApfFilter.this.processRa(this.bM, Os.read(this.bN, this.bM, 0, this.bM.length));
                    this.bP.receivedRas++;
                    switch (processRaResultProcessRa) {
                        case MATCH:
                            this.bP.matchingRas++;
                            continue;
                        case DROPPED:
                            this.bP.droppedRas++;
                            continue;
                        case PARSE_ERROR:
                            this.bP.parseErrors++;
                            continue;
                        case ZERO_LIFETIME:
                            this.bP.zeroLifetimeRas++;
                            continue;
                        case UPDATE_EXPIRY:
                            this.bP.matchingRas++;
                            apfStats = this.bP;
                            i = apfStats.programUpdates;
                            break;
                        case UPDATE_NEW_RA:
                            apfStats = this.bP;
                            i = apfStats.programUpdates;
                            break;
                        default:
                            continue;
                    }
                    apfStats.programUpdates = i + 1;
                } catch (ErrnoException | IOException e) {
                    if (!this.mStopped) {
                        Log.e("ApfFilter", "Read error", e);
                    }
                }
            }
            long jElapsedRealtime = SystemClock.elapsedRealtime();
            synchronized (this) {
                this.bP.durationMs = jElapsedRealtime - this.bO;
                this.bP.maxProgramSize = ApfFilter.this.av.ao;
                this.bP.programUpdatesAll = ApfFilter.this.aN;
                this.bP.programUpdatesAllowingMulticast = ApfFilter.this.aO;
                ApfFilter.this.ay.log(this.bP);
                ApfFilter.this.a(jElapsedRealtime / 1000);
            }
        }

        public final void z() {
            this.mStopped = true;
            try {
                IoBridge.closeAndSignalBlockedThreads(this.bN);
            } catch (IOException e) {
            }
        }
    }

    @VisibleForTesting
    ApfFilter(Context context, d dVar, android.net.util.b bVar, i iVar, IpConnectivityLog ipConnectivityLog) {
        String str;
        this.av = dVar.aR;
        this.aw = iVar;
        this.ax = bVar;
        this.aA = dVar.aS;
        this.aC = dVar.aT;
        this.mContext = context;
        if (this.av.s()) {
            this.aq = "countAndPass";
            str = "countAndDrop";
        } else {
            this.aq = "__PASS__";
            str = "__DROP__";
        }
        this.ar = str;
        this.aD = a(dVar.aU);
        this.ay = ipConnectivityLog;
        maybeStartFilter();
        this.mContext.registerReceiver(this.aE, new IntentFilter("android.os.action.DEVICE_IDLE_MODE_CHANGED"));
    }

    private static long a(byte[] bArr, Counter counter) {
        int length = (-counter.ordinal()) * 4;
        if (length < 0) {
            length += bArr.length;
        }
        long j = 0;
        for (int i = 0; i < 4; i++) {
            j = (j << 8) | ((long) (bArr[length] & 255));
            length++;
        }
        return j;
    }

    public static ApfFilter a(Context context, d dVar, android.net.util.b bVar, i iVar) {
        a aVar;
        if (context == null || bVar == null || (aVar = dVar.aR) == null || aVar.an == 0) {
            return null;
        }
        if (aVar.ao < 512) {
            Log.e("ApfFilter", "Unacceptably small APF limit: " + aVar.ao);
            return null;
        }
        if (aVar.ap != OsConstants.ARPHRD_ETHER) {
            return null;
        }
        if (aVar.an >= 2) {
            return new ApfFilter(context, dVar, bVar, iVar, new IpConnectivityLog());
        }
        Log.e("ApfFilter", "Unsupported APF version: " + aVar.an);
        return null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    @GuardedBy("this")
    public void a(long j) {
        if (this.aK == null) {
            return;
        }
        ApfProgramEvent apfProgramEvent = this.aK;
        this.aK = null;
        apfProgramEvent.actualLifetime = j - this.aI;
        if (apfProgramEvent.actualLifetime < 2) {
            return;
        }
        this.ay.log(apfProgramEvent);
    }

    @GuardedBy("this")
    private void a(ApfGenerator apfGenerator) throws ApfGenerator.IllegalInstructionException {
        if (this.av.s()) {
            a(apfGenerator, Counter.PASSED_IPV6_ICMP);
            apfGenerator.c(this.aq);
            apfGenerator.b(ApfGenerator.Register.R0);
            apfGenerator.A();
            apfGenerator.c(ApfGenerator.Register.R0);
            apfGenerator.d("__PASS__");
            apfGenerator.c(this.ar);
            apfGenerator.b(ApfGenerator.Register.R0);
            apfGenerator.A();
            apfGenerator.c(ApfGenerator.Register.R0);
            apfGenerator.d("__DROP__");
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void a(ApfGenerator apfGenerator, Counter counter) {
        if (this.av.s()) {
            apfGenerator.d(ApfGenerator.Register.R1, (-counter.ordinal()) * 4);
        }
    }

    @GuardedBy("this")
    private static int[] a(int[] iArr) {
        ArrayList arrayList = new ArrayList();
        for (int i : iArr) {
            if (i >= 1536 && i <= 65535 && !arrayList.contains(Integer.valueOf(i))) {
                if (arrayList.size() == 20) {
                    Log.w("ApfFilter", "Passed EthType Black List size too large (" + arrayList.size() + ") using top 20 protocols");
                    break;
                }
                arrayList.add(Integer.valueOf(i));
            }
        }
        return arrayList.stream().mapToInt(new ToIntFunction() { // from class: android.net.apf.-$$Lambda$ApfFilter$UV1wDVoVlbcxpr8zevj_aMFtUGw
            @Override // java.util.function.ToIntFunction
            public final int applyAsInt(Object obj) {
                return ((Integer) obj).intValue();
            }
        }).toArray();
    }

    static /* synthetic */ long e(ApfFilter apfFilter) {
        long j = apfFilter.az;
        apfFilter.az = 1 + j;
        return j;
    }

    @VisibleForTesting
    public static int ipv4BroadcastAddress(byte[] bArr, int i) {
        return BitUtils.bytesToBEInt(bArr) | ((int) (BitUtils.uint32(-1) >>> i));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void log(String str) {
        Log.d("ApfFilter", "(" + this.ax.name + "): " + str);
    }

    @GuardedBy("this")
    private ApfGenerator t() throws ApfGenerator.IllegalInstructionException {
        ApfGenerator apfGenerator = new ApfGenerator(this.av.an);
        if (this.av.s()) {
            a(apfGenerator, Counter.TOTAL_PACKETS);
            apfGenerator.b(ApfGenerator.Register.R0);
            apfGenerator.A();
            apfGenerator.c(ApfGenerator.Register.R0);
        }
        apfGenerator.b(ApfGenerator.Register.R0, 12);
        if (this.aC) {
            a(apfGenerator, Counter.DROPPED_802_3_FRAME);
            apfGenerator.d(CarplayMessage.BASE_NSD, this.ar);
        }
        a(apfGenerator, Counter.DROPPED_ETHERTYPE_BLACKLISTED);
        for (int i : this.aD) {
            apfGenerator.a(i, this.ar);
        }
        apfGenerator.b(OsConstants.ETH_P_ARP, "skipArpFilters");
        apfGenerator.d(ApfGenerator.Register.R0, 14);
        a(apfGenerator, Counter.PASSED_ARP_NON_IPV4);
        apfGenerator.a(ApfGenerator.Register.R0, au, this.aq);
        apfGenerator.b(ApfGenerator.Register.R0, 20);
        apfGenerator.a(1, "checkTargetIPv4");
        a(apfGenerator, Counter.PASSED_ARP_UNKNOWN);
        apfGenerator.b(2, this.aq);
        apfGenerator.d(ApfGenerator.Register.R0, 0);
        a(apfGenerator, Counter.PASSED_ARP_UNICAST_REPLY);
        apfGenerator.a(ApfGenerator.Register.R0, as, this.aq);
        apfGenerator.c("checkTargetIPv4");
        if (this.aF == null) {
            apfGenerator.c(ApfGenerator.Register.R0, 38);
            a(apfGenerator, Counter.DROPPED_GARP_REPLY);
            apfGenerator.a(0, this.ar);
        } else {
            apfGenerator.d(ApfGenerator.Register.R0, 38);
            a(apfGenerator, Counter.DROPPED_ARP_OTHER_HOST);
            apfGenerator.a(ApfGenerator.Register.R0, this.aF, this.ar);
        }
        a(apfGenerator, Counter.PASSED_ARP);
        apfGenerator.d(this.aq);
        apfGenerator.c("skipArpFilters");
        apfGenerator.b(OsConstants.ETH_P_IP, "skipIPv4Filters");
        if (this.aA) {
            apfGenerator.a(ApfGenerator.Register.R0, 23);
            apfGenerator.b(OsConstants.IPPROTO_UDP, "skip_dhcp_v4_filter");
            apfGenerator.b(ApfGenerator.Register.R0, 20);
            apfGenerator.e("skip_dhcp_v4_filter");
            apfGenerator.e(ApfGenerator.Register.R1, 13);
            apfGenerator.a(ApfGenerator.Register.R0);
            apfGenerator.b(68, "skip_dhcp_v4_filter");
            apfGenerator.d(ApfGenerator.Register.R0, 50);
            apfGenerator.C();
            apfGenerator.a(ApfGenerator.Register.R0, this.mHardwareAddress, "skip_dhcp_v4_filter");
            a(apfGenerator, Counter.PASSED_DHCP);
            apfGenerator.d(this.aq);
            apfGenerator.c("skip_dhcp_v4_filter");
            apfGenerator.a(ApfGenerator.Register.R0, 30);
            apfGenerator.B();
            a(apfGenerator, Counter.DROPPED_IPV4_MULTICAST);
            apfGenerator.a(224, this.ar);
            a(apfGenerator, Counter.DROPPED_IPV4_BROADCAST_ADDR);
            apfGenerator.c(ApfGenerator.Register.R0, 30);
            apfGenerator.a(-1, this.ar);
            if (this.aF != null && this.aG < 31) {
                a(apfGenerator, Counter.DROPPED_IPV4_BROADCAST_NET);
                apfGenerator.a(ipv4BroadcastAddress(this.aF, this.aG), this.ar);
            }
            a(apfGenerator, Counter.PASSED_IPV4_UNICAST);
            apfGenerator.d(ApfGenerator.Register.R0, 0);
            apfGenerator.a(ApfGenerator.Register.R0, as, this.aq);
            a(apfGenerator, Counter.DROPPED_IPV4_L2_BROADCAST);
            apfGenerator.d(this.ar);
        }
        a(apfGenerator, Counter.PASSED_IPV4);
        apfGenerator.d(this.aq);
        apfGenerator.c("skipIPv4Filters");
        apfGenerator.a(OsConstants.ETH_P_IPV6, "IPv6Filters");
        apfGenerator.d(ApfGenerator.Register.R0, 0);
        a(apfGenerator, Counter.PASSED_NON_IP_UNICAST);
        apfGenerator.a(ApfGenerator.Register.R0, as, this.aq);
        a(apfGenerator, Counter.DROPPED_ETH_BROADCAST);
        apfGenerator.d(this.ar);
        apfGenerator.c("IPv6Filters");
        apfGenerator.a(ApfGenerator.Register.R0, 20);
        if (this.aA) {
            if (this.aB) {
                apfGenerator.b(OsConstants.IPPROTO_ICMPV6, "dropAllIPv6Multicast");
                apfGenerator.a(ApfGenerator.Register.R0, 54);
                apfGenerator.b(128, "skipIPv6MulticastFilter");
            } else {
                apfGenerator.a(OsConstants.IPPROTO_ICMPV6, "skipIPv6MulticastFilter");
            }
            apfGenerator.c("dropAllIPv6Multicast");
            a(apfGenerator, Counter.DROPPED_IPV6_NON_ICMP_MULTICAST);
            apfGenerator.a(ApfGenerator.Register.R0, 38);
            apfGenerator.a(255, this.ar);
            a(apfGenerator, Counter.PASSED_IPV6_UNICAST_NON_ICMP);
            apfGenerator.d(this.aq);
            apfGenerator.c("skipIPv6MulticastFilter");
        } else {
            a(apfGenerator, Counter.PASSED_IPV6_NON_ICMP);
            apfGenerator.b(OsConstants.IPPROTO_ICMPV6, this.aq);
        }
        apfGenerator.a(ApfGenerator.Register.R0, 54);
        a(apfGenerator, Counter.DROPPED_IPV6_ROUTER_SOLICITATION);
        apfGenerator.a(133, this.ar);
        apfGenerator.b(136, "skipUnsolicitedMulticastNA");
        apfGenerator.d(ApfGenerator.Register.R0, 38);
        apfGenerator.a(ApfGenerator.Register.R0, at, "skipUnsolicitedMulticastNA");
        a(apfGenerator, Counter.DROPPED_IPV6_MULTICAST_NA);
        apfGenerator.d(this.ar);
        apfGenerator.c("skipUnsolicitedMulticastNA");
        return apfGenerator;
    }

    @GuardedBy("this")
    private void u() {
        int i = 0;
        while (i < this.aH.size()) {
            if (((Ra) this.aH.get(i)).y()) {
                log("Expiring " + this.aH.get(i));
                this.aH.remove(i);
            } else {
                i++;
            }
        }
    }

    public final synchronized void a(LinkProperties linkProperties) {
        LinkAddress linkAddress = null;
        for (LinkAddress linkAddress2 : linkProperties.getLinkAddresses()) {
            if (linkAddress2.getAddress() instanceof Inet4Address) {
                if (linkAddress != null && !linkAddress.isSameAddressAs(linkAddress2)) {
                    linkAddress = null;
                    break;
                }
                linkAddress = linkAddress2;
            }
        }
        byte[] address = linkAddress != null ? linkAddress.getAddress().getAddress() : null;
        int prefixLength = linkAddress != null ? linkAddress.getPrefixLength() : 0;
        if (prefixLength == this.aG && Arrays.equals(address, this.aF)) {
            return;
        }
        this.aF = address;
        this.aG = prefixLength;
        installNewProgramLocked();
    }

    public final synchronized void a(byte[] bArr) {
        this.aM = bArr;
    }

    public final synchronized void b(boolean z) {
        if (this.aA == z) {
            return;
        }
        this.aA = z;
        if (!z) {
            this.aO++;
        }
        installNewProgramLocked();
    }

    @VisibleForTesting
    protected final long currentTimeSeconds() {
        return SystemClock.elapsedRealtime() / 1000;
    }

    public final synchronized void dump(IndentingPrintWriter indentingPrintWriter) {
        String str;
        indentingPrintWriter.println("Capabilities: " + this.av);
        StringBuilder sb = new StringBuilder("Receive thread: ");
        sb.append(this.mReceiveThread != null ? "RUNNING" : "STOPPED");
        indentingPrintWriter.println(sb.toString());
        StringBuilder sb2 = new StringBuilder("Multicast: ");
        sb2.append(this.aA ? "DROP" : "ALLOW");
        indentingPrintWriter.println(sb2.toString());
        try {
            indentingPrintWriter.println("IPv4 address: " + InetAddress.getByAddress(this.aF).getHostAddress());
        } catch (NullPointerException | UnknownHostException e) {
        }
        if (this.aI == 0) {
            indentingPrintWriter.println("No program installed.");
            return;
        }
        indentingPrintWriter.println("Program updates: " + this.aN);
        indentingPrintWriter.println(String.format("Last program length %d, installed %ds ago, lifetime %ds", Integer.valueOf(this.aL.length), Long.valueOf(currentTimeSeconds() - this.aI), Long.valueOf(this.aJ)));
        indentingPrintWriter.println("RA filters:");
        indentingPrintWriter.increaseIndent();
        for (Ra ra : this.aH) {
            indentingPrintWriter.println(ra);
            indentingPrintWriter.increaseIndent();
            indentingPrintWriter.println(String.format("Seen: %d, last %ds ago", Integer.valueOf(ra.bL), Long.valueOf(currentTimeSeconds() - ra.bI)));
            indentingPrintWriter.println("Last match:");
            indentingPrintWriter.increaseIndent();
            indentingPrintWriter.println(ra.w());
            indentingPrintWriter.decreaseIndent();
            indentingPrintWriter.decreaseIndent();
        }
        indentingPrintWriter.decreaseIndent();
        indentingPrintWriter.println("Last program:");
        indentingPrintWriter.increaseIndent();
        indentingPrintWriter.println(HexDump.toHexString(this.aL, false));
        indentingPrintWriter.decreaseIndent();
        indentingPrintWriter.println("APF packet counters: ");
        indentingPrintWriter.increaseIndent();
        if (!this.av.s()) {
            str = "APF counters not supported";
        } else {
            if (this.aM != null) {
                try {
                    Counter[] counterArr = (Counter[]) Counter.class.getEnumConstants();
                    for (Counter counter : Arrays.asList(counterArr).subList(1, counterArr.length)) {
                        long jA = a(this.aM, counter);
                        if (jA != 0) {
                            indentingPrintWriter.println(counter.toString() + ": " + jA);
                        }
                    }
                } catch (ArrayIndexOutOfBoundsException e2) {
                    str = "Uh-oh: " + e2;
                    indentingPrintWriter.println(str);
                }
                indentingPrintWriter.decreaseIndent();
            }
            str = "No last snapshot.";
        }
        indentingPrintWriter.println(str);
        indentingPrintWriter.decreaseIndent();
    }

    @GuardedBy("this")
    @VisibleForTesting
    final void installNewProgramLocked() {
        u();
        ArrayList arrayList = new ArrayList();
        long jV = this.av.ao;
        if (this.av.s()) {
            jV -= (long) Counter.v();
        }
        try {
            ApfGenerator apfGeneratorT = t();
            a(apfGeneratorT);
            if (apfGeneratorT.E() > jV) {
                Log.e("ApfFilter", "Program exceeds maximum size " + jV);
                return;
            }
            for (Ra ra : this.aH) {
                ra.b(apfGeneratorT);
                if (apfGeneratorT.E() > jV) {
                    break;
                } else {
                    arrayList.add(ra);
                }
            }
            ApfGenerator apfGeneratorT2 = t();
            Iterator it = arrayList.iterator();
            long jMin = Long.MAX_VALUE;
            while (it.hasNext()) {
                jMin = Math.min(jMin, ((Ra) it.next()).b(apfGeneratorT2));
            }
            a(apfGeneratorT2);
            byte[] bArrF = apfGeneratorT2.F();
            long jCurrentTimeSeconds = currentTimeSeconds();
            this.aI = jCurrentTimeSeconds;
            this.aJ = jMin;
            this.aL = bArrF;
            this.aN++;
            this.aw.e(bArrF);
            a(jCurrentTimeSeconds);
            this.aK = new ApfProgramEvent();
            this.aK.lifetime = jMin;
            this.aK.filteredRas = arrayList.size();
            this.aK.currentRas = this.aH.size();
            this.aK.programLength = bArrF.length;
            this.aK.flags = ApfProgramEvent.flagsFor(this.aF != null, this.aA);
        } catch (ApfGenerator.IllegalInstructionException | IllegalStateException e) {
            Log.e("ApfFilter", "Failed to generate APF program.", e);
        }
    }

    @VisibleForTesting
    final void maybeStartFilter() {
        try {
            this.mHardwareAddress = this.ax.fx.toByteArray();
            synchronized (this) {
                if (this.av.s()) {
                    this.aw.e(new byte[this.av.ao]);
                }
                installNewProgramLocked();
            }
            FileDescriptor fileDescriptorSocket = Os.socket(OsConstants.AF_PACKET, OsConstants.SOCK_RAW, OsConstants.ETH_P_IPV6);
            Os.bind(fileDescriptorSocket, new PacketSocketAddress((short) OsConstants.ETH_P_IPV6, this.ax.index));
            NetworkUtils.attachRaFilter(fileDescriptorSocket, this.av.ap);
            this.mReceiveThread = new ReceiveThread(fileDescriptorSocket);
            this.mReceiveThread.start();
        } catch (ErrnoException | SocketException e) {
            Log.e("ApfFilter", "Error starting filter", e);
        }
    }

    @VisibleForTesting
    final synchronized ProcessRaResult processRa(byte[] bArr, int i) {
        for (int i2 = 0; i2 < this.aH.size(); i2++) {
            Ra ra = (Ra) this.aH.get(i2);
            if (ra.a(bArr, i)) {
                ra.bI = currentTimeSeconds();
                ra.bH = ra.b(bArr);
                boolean z = true;
                ra.bL++;
                this.aH.add(0, (Ra) this.aH.remove(i2));
                if (this.aI + this.aJ >= currentTimeSeconds() + 30) {
                    z = false;
                }
                if (!z) {
                    return ProcessRaResult.MATCH;
                }
                installNewProgramLocked();
                return ProcessRaResult.UPDATE_EXPIRY;
            }
        }
        u();
        if (this.aH.size() >= 10) {
            return ProcessRaResult.DROPPED;
        }
        try {
            Ra ra2 = new Ra(bArr, i);
            if (ra2.y()) {
                return ProcessRaResult.ZERO_LIFETIME;
            }
            log("Adding " + ra2);
            this.aH.add(ra2);
            installNewProgramLocked();
            return ProcessRaResult.UPDATE_NEW_RA;
        } catch (Exception e) {
            Log.e("ApfFilter", "Error parsing RA", e);
            return ProcessRaResult.PARSE_ERROR;
        }
    }

    @VisibleForTesting
    public final synchronized void setDozeMode(boolean z) {
        if (this.aB == z) {
            return;
        }
        this.aB = z;
        installNewProgramLocked();
    }

    public final synchronized void shutdown() {
        if (this.mReceiveThread != null) {
            log("shutting down");
            this.mReceiveThread.z();
            this.mReceiveThread = null;
        }
        this.aH.clear();
        this.mContext.unregisterReceiver(this.aE);
    }
}
