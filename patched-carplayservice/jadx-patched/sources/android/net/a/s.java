package android.net.a;

import android.net.MacAddress;
import android.net.util.SharedLog;
import android.os.Build;
import android.os.Handler;
import android.os.SystemClock;
import android.system.ErrnoException;
import android.system.NetlinkSocketAddress;
import android.system.Os;
import android.system.OsConstants;
import android.util.Log;
import com.android.internal.util.BitUtils;
import java.io.FileDescriptor;
import java.io.InterruptedIOException;
import java.net.InetAddress;
import java.net.SocketException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import libcore.io.IoUtils;

/* JADX INFO: loaded from: classes.dex */
public class s extends android.net.util.h {
    private final SharedLog et;
    private final u fr;
    private static final String TAG = s.class.getSimpleName();
    private static final boolean DBG = !Build.IS_USER;

    public s(Handler handler, SharedLog sharedLog, u uVar) {
        super(handler, 8192);
        this.et = sharedLog.o(TAG);
        this.fr = uVar == null ? new u() { // from class: android.net.a.-$$Lambda$s$xQq0W9fV4hjUSHiwgukPARYFLyU
            @Override // android.net.a.u
            public final void accept(t tVar) {
                s.a(tVar);
            }
        } : uVar;
    }

    public static int a(int i, InetAddress inetAddress) {
        String string;
        String str = "probing ip=" + inetAddress.getHostAddress() + "%" + i;
        if (DBG) {
            Log.d(TAG, str);
        }
        byte[] bArrA = android.net.b.e.a(inetAddress, i);
        try {
            try {
                try {
                    FileDescriptor fileDescriptorI = android.net.b.d.i(OsConstants.NETLINK_ROUTE);
                    Os.connect(fileDescriptorI, new NetlinkSocketAddress(0, 0));
                    android.net.b.d.a(fileDescriptorI, bArrA, bArrA.length);
                    ByteBuffer byteBufferB = android.net.b.d.b(fileDescriptorI);
                    android.net.b.c cVarE = android.net.b.c.e(byteBufferB);
                    if (cVarE != null && (cVarE instanceof android.net.b.b) && ((android.net.b.b) cVarE).ap() != null) {
                        int i2 = ((android.net.b.b) cVarE).ap().error;
                        if (i2 == 0) {
                            IoUtils.closeQuietly(fileDescriptorI);
                            return 0;
                        }
                        Log.e("NetlinkSocket", "Error in NetlinkSocket.sendOneShotKernelMessage, errmsg=" + cVarE.toString());
                        throw new ErrnoException(cVarE.toString(), Math.abs(i2));
                    }
                    if (cVarE == null) {
                        byteBufferB.position(0);
                        string = "raw bytes: " + android.net.b.a.d(byteBufferB);
                    } else {
                        string = cVarE.toString();
                    }
                    Log.e("NetlinkSocket", "Error in NetlinkSocket.sendOneShotKernelMessage, errmsg=" + string);
                    throw new ErrnoException(string, OsConstants.EPROTO);
                } catch (SocketException e) {
                    Log.e("NetlinkSocket", "Error in NetlinkSocket.sendOneShotKernelMessage", e);
                    throw new ErrnoException("Error in NetlinkSocket.sendOneShotKernelMessage", OsConstants.EIO, e);
                }
            } catch (InterruptedIOException e2) {
                Log.e("NetlinkSocket", "Error in NetlinkSocket.sendOneShotKernelMessage", e2);
                throw new ErrnoException("Error in NetlinkSocket.sendOneShotKernelMessage", OsConstants.ETIMEDOUT, e2);
            }
        } catch (ErrnoException e3) {
            Log.e(TAG, "Error " + str + ": " + e3);
            return -e3.errno;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static /* synthetic */ void a(t tVar) {
    }

    private static MacAddress f(byte[] bArr) {
        if (bArr == null) {
            return null;
        }
        try {
            return MacAddress.fromBytes(bArr);
        } catch (IllegalArgumentException e) {
            Log.e(TAG, "Failed to parse link-layer address: " + android.net.b.a.g(bArr));
            return null;
        }
    }

    @Override // android.net.util.h
    protected final FileDescriptor V() {
        FileDescriptor fileDescriptorI;
        try {
            fileDescriptorI = android.net.b.d.i(OsConstants.NETLINK_ROUTE);
            try {
                Os.bind(fileDescriptorI, new NetlinkSocketAddress(0, OsConstants.RTMGRP_NEIGH));
                Os.connect(fileDescriptorI, new NetlinkSocketAddress(0, 0));
                return fileDescriptorI;
            } catch (ErrnoException | SocketException e) {
                e = e;
                logError("Failed to create rtnetlink socket", e);
                IoUtils.closeQuietly(fileDescriptorI);
                return null;
            }
        } catch (ErrnoException | SocketException e2) {
            e = e2;
            fileDescriptorI = null;
        }
    }

    @Override // android.net.util.h
    protected final void c(byte[] bArr, int i) {
        SharedLog sharedLog;
        String str;
        long jElapsedRealtime = SystemClock.elapsedRealtime();
        ByteBuffer byteBufferWrap = ByteBuffer.wrap(bArr, 0, i);
        byteBufferWrap.order(ByteOrder.nativeOrder());
        while (byteBufferWrap.remaining() > 0) {
            int iPosition = byteBufferWrap.position();
            android.net.b.c cVarE = android.net.b.c.e(byteBufferWrap);
            if (cVarE == null || cVarE.aq() == null) {
                byteBufferWrap.position(iPosition);
                this.et.p("unparsable netlink msg: " + android.net.b.a.d(byteBufferWrap));
                return;
            }
            int i2 = cVarE.aq().gk;
            if (i2 != 0) {
                this.et.p("non-kernel source portId: " + BitUtils.uint32(i2));
                return;
            }
            if (cVarE instanceof android.net.b.b) {
                sharedLog = this.et;
                str = "netlink error: " + cVarE;
            } else if (cVarE instanceof android.net.b.e) {
                android.net.b.e eVar = (android.net.b.e) cVarE;
                short s = eVar.aq().gh;
                android.net.b.f fVarAs = eVar.as();
                if (fVarAs == null) {
                    sharedLog = this.et;
                    str = "RtNetlinkNeighborMessage without ND message header!";
                } else {
                    t tVar = new t(jElapsedRealtime, s, fVarAs.fS, eVar.at(), s == 29 ? (short) 0 : fVarAs.fT, f(eVar.au()));
                    if (DBG) {
                        Log.d(TAG, tVar.toString());
                    }
                    this.fr.accept(tVar);
                }
            } else {
                this.et.q("non-rtnetlink neighbor msg: " + cVarE);
            }
            sharedLog.p(str);
        }
    }
}
