package android.net.dhcp;

import android.net.DhcpResults;
import android.net.LinkAddress;
import android.net.NetworkUtils;
import android.net.metrics.DhcpErrorEvent;
import android.os.Build;
import android.os.SystemProperties;
import android.system.OsConstants;
import android.text.TextUtils;
import com.android.internal.annotations.VisibleForTesting;
import com.autochips.carplay.common.CarplayMessage;
import java.io.UnsupportedEncodingException;
import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.nio.BufferUnderflowException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.ShortBuffer;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public abstract class DhcpPacket {
    public static final Inet4Address dH = (Inet4Address) Inet4Address.ANY;
    public static final Inet4Address dI = (Inet4Address) Inet4Address.ALL;
    public static final byte[] dJ = {-1, -1, -1, -1, -1, -1};
    static String ei = null;
    static String ej = null;
    protected Inet4Address dK;
    protected List dL;
    protected List dM;
    protected String dN;
    protected String dO;
    protected Short dP;
    protected Inet4Address dQ;
    protected String dR;
    protected Inet4Address dS;
    protected Integer dT;
    protected Inet4Address dU;
    protected byte[] dV;
    protected String dW;
    protected Short dX;
    protected Integer dY;
    protected Integer dZ;
    protected String ea;
    protected final short eb;
    protected final Inet4Address ec;
    protected final Inet4Address ed;
    private final Inet4Address ee;
    private final Inet4Address ef;
    protected boolean eg;
    protected final byte[] eh;
    protected final int mTransId;

    public class ParseException extends Exception {
        public final int errorCode;

        public ParseException(int i, String str, Object... objArr) {
            super(String.format(str, objArr));
            this.errorCode = i;
        }
    }

    protected DhcpPacket(int i, short s, Inet4Address inet4Address, Inet4Address inet4Address2, Inet4Address inet4Address3, Inet4Address inet4Address4, byte[] bArr, boolean z) {
        this.mTransId = i;
        this.eb = s;
        this.ec = inet4Address;
        this.ed = inet4Address2;
        this.ee = inet4Address3;
        this.ef = inet4Address4;
        this.eh = bArr;
        this.eg = z;
    }

    private static int a(ByteBuffer byteBuffer, int i, int i2, int i3) {
        int iPosition = byteBuffer.position();
        byteBuffer.position(i2);
        ShortBuffer shortBufferAsShortBuffer = byteBuffer.asShortBuffer();
        byteBuffer.position(iPosition);
        short[] sArr = new short[(i3 - i2) / 2];
        shortBufferAsShortBuffer.get(sArr);
        for (short s : sArr) {
            i += 65535 & s;
        }
        int length = i2 + (sArr.length * 2);
        if (i3 != length) {
            short s2 = byteBuffer.get(length);
            if (s2 < 0) {
                s2 = (short) (s2 + 256);
            }
            i += s2 * 256;
        }
        int i4 = ((i >> 16) & 65535) + (i & 65535);
        return ((short) (~((i4 + ((i4 >> 16) & 65535)) & 65535))) & 65535;
    }

    private static String a(ByteBuffer byteBuffer, int i, boolean z) {
        byte[] bArr = new byte[i];
        byteBuffer.get(bArr);
        int length = bArr.length;
        if (!z) {
            length = 0;
            while (length < bArr.length && bArr[length] != 0) {
                length++;
            }
        }
        return new String(bArr, 0, length, StandardCharsets.US_ASCII);
    }

    public static ByteBuffer a(int i, int i2, short s, Inet4Address inet4Address, byte[] bArr, Inet4Address inet4Address2, Inet4Address inet4Address3, byte[] bArr2) {
        aa aaVar = new aa(i2, s, inet4Address, bArr, false);
        aaVar.dS = inet4Address2;
        aaVar.dU = inet4Address3;
        aaVar.dN = null;
        aaVar.dV = bArr2;
        return aaVar.e(i);
    }

    public static ByteBuffer a(int i, short s, byte[] bArr, byte[] bArr2) {
        w wVar = new w(i, s, bArr, false);
        wVar.dV = bArr2;
        return wVar.e(0);
    }

    protected static void a(ByteBuffer byteBuffer, byte b) {
        byteBuffer.put((byte) 53);
        byteBuffer.put((byte) 1);
        byteBuffer.put(b);
    }

    protected static void a(ByteBuffer byteBuffer, byte b, Integer num) {
        if (num != null) {
            byteBuffer.put(b);
            byteBuffer.put((byte) 4);
            byteBuffer.putInt(num.intValue());
        }
    }

    protected static void a(ByteBuffer byteBuffer, byte b, String str) {
        try {
            a(byteBuffer, b, str.getBytes("US-ASCII"));
        } catch (UnsupportedEncodingException e) {
            throw new IllegalArgumentException("String is not US-ASCII: " + str);
        }
    }

    protected static void a(ByteBuffer byteBuffer, byte b, Inet4Address inet4Address) {
        if (inet4Address != null) {
            a(byteBuffer, b, inet4Address.getAddress());
        }
    }

    protected static void a(ByteBuffer byteBuffer, byte b, List list) {
        if (list == null || list.size() == 0) {
            return;
        }
        int size = 4 * list.size();
        if (size > 255) {
            throw new IllegalArgumentException("DHCP option too long: " + size + " vs. 255");
        }
        byteBuffer.put(b);
        byteBuffer.put((byte) size);
        Iterator it = list.iterator();
        while (it.hasNext()) {
            byteBuffer.put(((Inet4Address) it.next()).getAddress());
        }
    }

    protected static void a(ByteBuffer byteBuffer, byte b, byte[] bArr) {
        if (bArr != null) {
            if (bArr.length <= 255) {
                byteBuffer.put(b);
                byteBuffer.put((byte) bArr.length);
                byteBuffer.put(bArr);
            } else {
                throw new IllegalArgumentException("DHCP option too long: " + bArr.length + " vs. 255");
            }
        }
    }

    public static DhcpPacket b(byte[] bArr, int i) throws ParseException {
        try {
            return decodeFullPacket(ByteBuffer.wrap(bArr, 0, i).order(ByteOrder.BIG_ENDIAN), 0);
        } catch (ParseException e) {
            throw e;
        } catch (Exception e2) {
            throw new ParseException(DhcpErrorEvent.PARSING_ERROR, e2.getMessage(), new Object[0]);
        }
    }

    protected static void b(ByteBuffer byteBuffer) {
        String str;
        Short sh = (short) 1500;
        if (sh != null) {
            byteBuffer.put((byte) 57);
            byteBuffer.put((byte) 2);
            byteBuffer.putShort(sh.shortValue());
        }
        if (ei != null) {
            str = ei;
        } else {
            str = "android-dhcp-" + Build.VERSION.RELEASE;
        }
        a(byteBuffer, (byte) 60, str);
        String str2 = ej != null ? ej : SystemProperties.get("net.hostname");
        if (TextUtils.isEmpty(str2)) {
            return;
        }
        a(byteBuffer, (byte) 12, str2);
    }

    private static Inet4Address c(ByteBuffer byteBuffer) {
        byte[] bArr = new byte[4];
        byteBuffer.get(bArr);
        try {
            return (Inet4Address) Inet4Address.getByAddress(bArr);
        } catch (UnknownHostException e) {
            return null;
        }
    }

    /* JADX WARN: Code duplicated, block: B:119:0x02b7  */
    /* JADX WARN: Code duplicated, block: B:163:0x02b8 A[SYNTHETIC] */
    /* JADX WARN: Failed to find 'out' block for switch in B:86:0x020c. Please report as an issue. */
    /* JADX WARN: Failed to find 'out' block for switch in B:87:0x020f. Please report as an issue. */
    @VisibleForTesting
    static DhcpPacket decodeFullPacket(ByteBuffer byteBuffer, int i) throws ParseException {
        Inet4Address inet4AddressC;
        DhcpPacket xVar;
        int i2;
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        byteBuffer.order(ByteOrder.BIG_ENDIAN);
        byte b = 6;
        if (i == 0) {
            if (byteBuffer.remaining() < 278) {
                throw new ParseException(DhcpErrorEvent.L2_TOO_SHORT, "L2 packet too short, %d < %d", Integer.valueOf(byteBuffer.remaining()), Integer.valueOf(CarplayMessage.USER_UPDATE_MEDIA_BUTTON));
            }
            byteBuffer.get(new byte[6]);
            byteBuffer.get(new byte[6]);
            short s = byteBuffer.getShort();
            if (s != OsConstants.ETH_P_IP) {
                throw new ParseException(DhcpErrorEvent.L2_WRONG_ETH_TYPE, "Unexpected L2 type 0x%04x, expected 0x%04x", Short.valueOf(s), Integer.valueOf(OsConstants.ETH_P_IP));
            }
        }
        if (i > 1) {
            inet4AddressC = null;
        } else {
            if (byteBuffer.remaining() < 264) {
                throw new ParseException(DhcpErrorEvent.L3_TOO_SHORT, "L3 packet too short, %d < %d", Integer.valueOf(byteBuffer.remaining()), Integer.valueOf(CarplayMessage.USER_FORCE_KEY_FRAME));
            }
            byte b2 = byteBuffer.get();
            int i3 = (b2 & 240) >> 4;
            if (i3 != 4) {
                throw new ParseException(DhcpErrorEvent.L3_NOT_IPV4, "Invalid IP version %d", Integer.valueOf(i3));
            }
            byteBuffer.get();
            byteBuffer.getShort();
            byteBuffer.getShort();
            byteBuffer.get();
            byteBuffer.get();
            byteBuffer.get();
            byte b3 = byteBuffer.get();
            byteBuffer.getShort();
            inet4AddressC = c(byteBuffer);
            c(byteBuffer);
            if (b3 != 17) {
                throw new ParseException(DhcpErrorEvent.L4_NOT_UDP, "Protocol not UDP: %d", Byte.valueOf(b3));
            }
            int i4 = (b2 & 15) - 5;
            for (int i5 = 0; i5 < i4; i5++) {
                byteBuffer.getInt();
            }
            short s2 = byteBuffer.getShort();
            short s3 = byteBuffer.getShort();
            byteBuffer.getShort();
            byteBuffer.getShort();
            if (!(s2 == 68 || s3 == 68)) {
                if (!(s2 == 67 && s3 == 67)) {
                    throw new ParseException(DhcpErrorEvent.L4_WRONG_PORT, "Unexpected UDP ports %d->%d", Short.valueOf(s2), Short.valueOf(s3));
                }
            }
        }
        if (i > 2 || byteBuffer.remaining() < 236) {
            throw new ParseException(DhcpErrorEvent.BOOTP_TOO_SHORT, "Invalid type or BOOTP packet too short, %d < %d", Integer.valueOf(byteBuffer.remaining()), 236);
        }
        byteBuffer.get();
        byteBuffer.get();
        int length = byteBuffer.get() & 255;
        byteBuffer.get();
        int i6 = byteBuffer.getInt();
        short s4 = byteBuffer.getShort();
        boolean z = (byteBuffer.getShort() & Short.MIN_VALUE) != 0;
        byte[] bArr = new byte[4];
        try {
            byteBuffer.get(bArr);
            Inet4Address inet4Address = (Inet4Address) Inet4Address.getByAddress(bArr);
            byteBuffer.get(bArr);
            Inet4Address inet4Address2 = (Inet4Address) Inet4Address.getByAddress(bArr);
            byteBuffer.get(bArr);
            Inet4Address inet4Address3 = (Inet4Address) Inet4Address.getByAddress(bArr);
            byteBuffer.get(bArr);
            Inet4Address inet4Address4 = (Inet4Address) Inet4Address.getByAddress(bArr);
            if (length > 16) {
                length = dJ.length;
            }
            byte[] bArr2 = new byte[length];
            byteBuffer.get(bArr2);
            byteBuffer.position(byteBuffer.position() + (16 - length) + 64 + 128);
            if (byteBuffer.remaining() < 4) {
                throw new ParseException(DhcpErrorEvent.DHCP_NO_COOKIE, "not a DHCP message", new Object[0]);
            }
            int i7 = byteBuffer.getInt();
            if (i7 != 1669485411) {
                throw new ParseException(DhcpErrorEvent.DHCP_BAD_MAGIC_COOKIE, "Bad magic cookie 0x%08x, should be 0x%08x", Integer.valueOf(i7), 1669485411);
            }
            byte b4 = -1;
            byte b5 = -1;
            Inet4Address inet4AddressC2 = null;
            String strA = null;
            String strA2 = null;
            Integer numValueOf = null;
            String strA3 = null;
            Short shValueOf = null;
            Inet4Address inet4AddressC3 = null;
            byte[] bArr3 = null;
            Inet4Address inet4AddressC4 = null;
            Inet4Address inet4AddressC5 = null;
            Short shValueOf2 = null;
            Integer numValueOf2 = null;
            Integer numValueOf3 = null;
            String strA4 = null;
            String strA5 = null;
            boolean z2 = true;
            while (byteBuffer.position() < byteBuffer.limit() && z2) {
                byte b6 = byteBuffer.get();
                if (b6 == b4) {
                    z2 = false;
                } else {
                    if (b6 != 0) {
                        try {
                            int i8 = byteBuffer.get() & 255;
                            if (b6 != 1) {
                                if (b6 == 3) {
                                    i2 = 0;
                                    while (i2 < i8) {
                                        arrayList2.add(c(byteBuffer));
                                        i2 += 4;
                                    }
                                } else if (b6 != b) {
                                    if (b6 == 12) {
                                        strA2 = a(byteBuffer, i8, false);
                                    } else if (b6 != 15) {
                                        if (b6 == 26) {
                                            shValueOf = Short.valueOf(byteBuffer.getShort());
                                        } else if (b6 == 28) {
                                            inet4AddressC2 = c(byteBuffer);
                                        } else if (b6 != 43) {
                                            switch (b6) {
                                                case 50:
                                                    inet4AddressC3 = c(byteBuffer);
                                                    break;
                                                case 51:
                                                    numValueOf = Integer.valueOf(byteBuffer.getInt());
                                                    break;
                                                default:
                                                    switch (b6) {
                                                        case 53:
                                                            b5 = byteBuffer.get();
                                                            i2 = 1;
                                                            break;
                                                        case 54:
                                                            inet4AddressC4 = c(byteBuffer);
                                                            break;
                                                        case 55:
                                                            byte[] bArr4 = new byte[i8];
                                                            byteBuffer.get(bArr4);
                                                            bArr3 = bArr4;
                                                            break;
                                                        case 56:
                                                            strA3 = a(byteBuffer, i8, false);
                                                            break;
                                                        case 57:
                                                            shValueOf2 = Short.valueOf(byteBuffer.getShort());
                                                            break;
                                                        case 58:
                                                            numValueOf2 = Integer.valueOf(byteBuffer.getInt());
                                                            break;
                                                        case 59:
                                                            numValueOf3 = Integer.valueOf(byteBuffer.getInt());
                                                            break;
                                                        case 60:
                                                            strA4 = a(byteBuffer, i8, true);
                                                            break;
                                                        case 61:
                                                            byteBuffer.get(new byte[i8]);
                                                            break;
                                                        default:
                                                            int i9 = 0;
                                                            for (int i10 = 0; i10 < i8; i10++) {
                                                                i9++;
                                                                byteBuffer.get();
                                                            }
                                                            i2 = i9;
                                                            break;
                                                    }
                                                    break;
                                            }
                                        } else {
                                            strA5 = a(byteBuffer, i8, true);
                                        }
                                        i2 = 2;
                                    } else {
                                        strA = a(byteBuffer, i8, false);
                                    }
                                    i2 = i8;
                                } else {
                                    i2 = 0;
                                    while (i2 < i8) {
                                        arrayList.add(c(byteBuffer));
                                        i2 += 4;
                                    }
                                }
                                if (i2 == i8) {
                                    throw new ParseException(DhcpErrorEvent.errorCodeWithOption(DhcpErrorEvent.DHCP_INVALID_OPTION_LENGTH, b6), "Invalid length %d for option %d, expected %d", Integer.valueOf(i8), Byte.valueOf(b6), Integer.valueOf(i2));
                                }
                            } else {
                                inet4AddressC5 = c(byteBuffer);
                            }
                            i2 = 4;
                            if (i2 == i8) {
                                throw new ParseException(DhcpErrorEvent.errorCodeWithOption(DhcpErrorEvent.DHCP_INVALID_OPTION_LENGTH, b6), "Invalid length %d for option %d, expected %d", Integer.valueOf(i8), Byte.valueOf(b6), Integer.valueOf(i2));
                            }
                        } catch (BufferUnderflowException e) {
                            throw new ParseException(DhcpErrorEvent.errorCodeWithOption(DhcpErrorEvent.BUFFER_UNDERFLOW, b6), "BufferUnderflowException", new Object[0]);
                        }
                    }
                    b4 = -1;
                    b = 6;
                }
            }
            if (b5 == -1) {
                throw new ParseException(DhcpErrorEvent.DHCP_NO_MSG_TYPE, "No DHCP message type option", new Object[0]);
            }
            if (b5 != 8) {
                switch (b5) {
                    case 1:
                        xVar = new w(i6, s4, bArr2, z);
                        break;
                    case 2:
                        xVar = new z(i6, s4, z, inet4AddressC, inet4Address, inet4Address2, bArr2);
                        break;
                    case 3:
                        xVar = new aa(i6, s4, inet4Address, bArr2, z);
                        break;
                    case 4:
                        xVar = new v(i6, s4, inet4Address, inet4Address2, inet4Address3, inet4Address4, bArr2);
                        break;
                    case 5:
                        xVar = new a(i6, s4, z, inet4AddressC, inet4Address, inet4Address2, bArr2);
                        break;
                    case 6:
                        xVar = new y(i6, s4, inet4Address3, inet4Address4, bArr2);
                        break;
                    default:
                        throw new ParseException(DhcpErrorEvent.DHCP_UNKNOWN_MSG_TYPE, "Unimplemented DHCP type %d", Byte.valueOf(b5));
                }
            } else {
                xVar = new x(i6, s4, inet4Address, inet4Address2, inet4Address3, inet4Address4, bArr2);
            }
            xVar.dQ = inet4AddressC2;
            xVar.dM = arrayList;
            xVar.dO = strA;
            xVar.dL = arrayList2;
            xVar.dN = strA2;
            xVar.dT = numValueOf;
            xVar.dW = strA3;
            xVar.dP = shValueOf;
            xVar.dS = inet4AddressC3;
            xVar.dV = bArr3;
            xVar.dU = inet4AddressC4;
            xVar.dK = inet4AddressC5;
            xVar.dX = shValueOf2;
            xVar.dY = numValueOf2;
            xVar.dZ = numValueOf3;
            xVar.ea = strA4;
            xVar.dR = strA5;
            return xVar;
        } catch (UnknownHostException e2) {
            throw new ParseException(DhcpErrorEvent.L3_INVALID_IP, "Invalid IPv4 address: %s", Arrays.toString(bArr));
        }
    }

    public final byte[] R() {
        return this.eh;
    }

    public final byte[] S() {
        byte[] bArr = new byte[this.eh.length + 1];
        bArr[0] = 1;
        System.arraycopy(this.eh, 0, bArr, 1, this.eh.length);
        return bArr;
    }

    public final DhcpResults T() {
        int iNetmaskToPrefixLength;
        Inet4Address inet4Address = this.ed;
        if (inet4Address.equals(Inet4Address.ANY)) {
            inet4Address = this.ec;
            if (inet4Address.equals(Inet4Address.ANY)) {
                return null;
            }
        }
        if (this.dK != null) {
            try {
                iNetmaskToPrefixLength = NetworkUtils.netmaskToPrefixLength(this.dK);
            } catch (IllegalArgumentException e) {
                return null;
            }
        } else {
            iNetmaskToPrefixLength = NetworkUtils.getImplicitNetmask(inet4Address);
        }
        DhcpResults dhcpResults = new DhcpResults();
        try {
            dhcpResults.ipAddress = new LinkAddress(inet4Address, iNetmaskToPrefixLength);
            short sShortValue = 0;
            if (this.dL.size() > 0) {
                dhcpResults.gateway = (InetAddress) this.dL.get(0);
            }
            dhcpResults.dnsServers.addAll(this.dM);
            dhcpResults.domains = this.dO;
            dhcpResults.serverAddress = this.dU;
            dhcpResults.vendorInfo = this.dR;
            dhcpResults.leaseDuration = this.dT != null ? this.dT.intValue() : -1;
            if (this.dP != null && 1280 <= this.dP.shortValue() && this.dP.shortValue() <= 1500) {
                sShortValue = this.dP.shortValue();
            }
            dhcpResults.mtu = sShortValue;
            return dhcpResults;
        } catch (IllegalArgumentException e2) {
            return null;
        }
    }

    public final long U() {
        if (this.dT == null || this.dT.intValue() == -1) {
            return 0L;
        }
        if (this.dT.intValue() < 0 || this.dT.intValue() >= 60) {
            return (((long) this.dT.intValue()) & 4294967295L) * 1000;
        }
        return 60000L;
    }

    protected final void a(int i, Inet4Address inet4Address, Inet4Address inet4Address2, ByteBuffer byteBuffer, byte b, boolean z) {
        int iPosition;
        int iPosition2;
        int iPosition3;
        int iPosition4;
        int iPosition5;
        int iPosition6;
        int iPosition7;
        byte[] address = inet4Address.getAddress();
        byte[] address2 = inet4Address2.getAddress();
        byteBuffer.clear();
        byteBuffer.order(ByteOrder.BIG_ENDIAN);
        if (i == 0) {
            byteBuffer.put(dJ);
            byteBuffer.put(this.eh);
            byteBuffer.putShort((short) OsConstants.ETH_P_IP);
        }
        if (i <= 1) {
            iPosition3 = byteBuffer.position();
            byteBuffer.put((byte) 69);
            byteBuffer.put((byte) 16);
            iPosition4 = byteBuffer.position();
            byteBuffer.putShort((short) 0);
            byteBuffer.putShort((short) 0);
            byteBuffer.putShort((short) 16384);
            byteBuffer.put((byte) 64);
            byteBuffer.put((byte) 17);
            iPosition5 = byteBuffer.position();
            byteBuffer.putShort((short) 0);
            byteBuffer.put(address2);
            byteBuffer.put(address);
            iPosition = byteBuffer.position();
            iPosition2 = byteBuffer.position();
            byteBuffer.putShort((short) 68);
            byteBuffer.putShort((short) 67);
            iPosition6 = byteBuffer.position();
            byteBuffer.putShort((short) 0);
            iPosition7 = byteBuffer.position();
            byteBuffer.putShort((short) 0);
        } else {
            iPosition = 0;
            iPosition2 = 0;
            iPosition3 = 0;
            iPosition4 = 0;
            iPosition5 = 0;
            iPosition6 = 0;
            iPosition7 = 0;
        }
        byteBuffer.put(b);
        byteBuffer.put((byte) 1);
        byteBuffer.put((byte) this.eh.length);
        byteBuffer.put((byte) 0);
        byteBuffer.putInt(this.mTransId);
        byteBuffer.putShort(this.eb);
        if (z) {
            byteBuffer.putShort(Short.MIN_VALUE);
        } else {
            byteBuffer.putShort((short) 0);
        }
        byteBuffer.put(this.ec.getAddress());
        byteBuffer.put(this.ed.getAddress());
        byteBuffer.put(this.ee.getAddress());
        byteBuffer.put(this.ef.getAddress());
        byteBuffer.put(this.eh);
        byteBuffer.position(byteBuffer.position() + (16 - this.eh.length) + 64 + 128);
        byteBuffer.putInt(1669485411);
        a(byteBuffer);
        if ((byteBuffer.position() & 1) == 1) {
            byteBuffer.put((byte) 0);
        }
        if (i <= 1) {
            short sPosition = (short) (byteBuffer.position() - iPosition2);
            byteBuffer.putShort(iPosition6, sPosition);
            byteBuffer.putShort(iPosition7, (short) a(byteBuffer, (byteBuffer.getShort(iPosition5 + 2) & 65535) + 0 + (byteBuffer.getShort(iPosition5 + 4) & 65535) + (byteBuffer.getShort(iPosition5 + 6) & 65535) + (65535 & byteBuffer.getShort(iPosition5 + 8)) + 17 + sPosition, iPosition2, byteBuffer.position()));
            byteBuffer.putShort(iPosition4, (short) (byteBuffer.position() - iPosition3));
            byteBuffer.putShort(iPosition5, (short) a(byteBuffer, 0, iPosition3, iPosition));
        }
    }

    abstract void a(ByteBuffer byteBuffer);

    public abstract ByteBuffer e(int i);

    public final int getTransactionId() {
        return this.mTransId;
    }

    public String toString() {
        byte[] bArr = this.eh;
        String str = "";
        for (int i = 0; i < bArr.length; i++) {
            String str2 = "0" + Integer.toHexString(bArr[i]);
            str = str + str2.substring(str2.length() - 2);
            if (i != bArr.length - 1) {
                str = str + ":";
            }
        }
        return str;
    }
}
