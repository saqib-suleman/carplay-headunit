package android.net.b;

import android.system.ErrnoException;
import android.system.Os;
import android.system.OsConstants;
import android.system.StructTimeval;
import android.util.Log;
import java.io.FileDescriptor;
import java.io.InterruptedIOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;

/* JADX INFO: loaded from: classes.dex */
public final class d {
    public static int a(FileDescriptor fileDescriptor, byte[] bArr, int i) throws ErrnoException {
        ar();
        Os.setsockoptTimeval(fileDescriptor, OsConstants.SOL_SOCKET, OsConstants.SO_SNDTIMEO, StructTimeval.fromMillis(300L));
        return Os.write(fileDescriptor, bArr, 0, i);
    }

    private static void ar() {
    }

    public static ByteBuffer b(FileDescriptor fileDescriptor) throws ErrnoException, InterruptedIOException {
        ar();
        Os.setsockoptTimeval(fileDescriptor, OsConstants.SOL_SOCKET, OsConstants.SO_RCVTIMEO, StructTimeval.fromMillis(300L));
        ByteBuffer byteBufferAllocate = ByteBuffer.allocate(8192);
        int i = Os.read(fileDescriptor, byteBufferAllocate);
        if (i == 8192) {
            Log.w("NetlinkSocket", "maximum read");
        }
        byteBufferAllocate.position(0);
        byteBufferAllocate.limit(i);
        byteBufferAllocate.order(ByteOrder.nativeOrder());
        return byteBufferAllocate;
    }

    public static FileDescriptor i(int i) throws ErrnoException {
        FileDescriptor fileDescriptorSocket = Os.socket(OsConstants.AF_NETLINK, OsConstants.SOCK_DGRAM, i);
        Os.setsockoptInt(fileDescriptorSocket, OsConstants.SOL_SOCKET, OsConstants.SO_RCVBUF, 65536);
        return fileDescriptorSocket;
    }
}
