package android.net.a;

import android.net.NetworkUtils;
import android.os.Handler;
import android.system.ErrnoException;
import android.system.Os;
import android.system.OsConstants;
import android.system.PacketSocketAddress;
import android.text.TextUtils;
import android.util.Log;
import java.io.FileDescriptor;
import java.io.IOException;
import libcore.io.IoUtils;
import libcore.util.HexEncoding;

/* JADX INFO: loaded from: classes.dex */
final class b extends android.net.util.h {
    private final android.net.util.b eo;
    final /* synthetic */ a ep;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    b(a aVar, Handler handler, android.net.util.b bVar) {
        super(handler, bVar.gm);
        this.ep = aVar;
        this.eo = bVar;
    }

    private void g(String str) {
        this.ep.el.log(str);
    }

    @Override // android.net.util.h
    protected final FileDescriptor V() {
        FileDescriptor fileDescriptorSocket;
        try {
            fileDescriptorSocket = Os.socket(OsConstants.AF_PACKET, OsConstants.SOCK_RAW, 0);
            try {
                NetworkUtils.attachControlPacketFilter(fileDescriptorSocket, OsConstants.ARPHRD_ETHER);
                Os.bind(fileDescriptorSocket, new PacketSocketAddress((short) OsConstants.ETH_P_ALL, this.eo.index));
                return fileDescriptorSocket;
            } catch (ErrnoException | IOException e) {
                e = e;
                logError("Failed to create packet tracking socket: ", e);
                IoUtils.closeQuietly(fileDescriptorSocket);
                return null;
            }
        } catch (ErrnoException | IOException e2) {
            e = e2;
            fileDescriptorSocket = null;
        }
    }

    @Override // android.net.util.h
    protected final void c(byte[] bArr, int i) {
        String strA = android.net.util.a.a(this.eo.fx, bArr, i);
        if (strA == null) {
            return;
        }
        g(strA + "\n[" + new String(HexEncoding.encode(bArr, 0, i)) + "]");
    }

    @Override // android.net.util.h
    protected final void logError(String str, Exception exc) {
        Log.e(this.ep.mTag, str, exc);
        g(str + exc);
    }

    @Override // android.net.util.h
    protected final void onStart() {
        this.ep.el.log(TextUtils.isEmpty(this.ep.en) ? "--- START ---" : String.format("--- START (%s) ---", this.ep.en));
    }

    @Override // android.net.util.h
    protected final void onStop() {
        String str = TextUtils.isEmpty(this.ep.en) ? "--- STOP ---" : String.format("--- STOP (%s) ---", this.ep.en);
        if (!this.ep.mRunning) {
            str = str + " (packet listener stopped unexpectedly)";
        }
        this.ep.el.log(str);
    }
}
