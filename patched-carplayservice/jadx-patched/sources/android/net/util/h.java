package android.net.util;

import android.os.Handler;
import android.os.Looper;
import android.os.MessageQueue;
import com.autochips.carplay.common.CarplayMessage;
import java.io.FileDescriptor;
import libcore.io.IoUtils;

/* JADX INFO: loaded from: classes.dex */
public abstract class h {
    private final byte[] bM;
    private FileDescriptor gx;
    private long gy;
    private final Handler mHandler;
    private final MessageQueue mQueue;

    protected h(Handler handler, int i) {
        this.mHandler = handler;
        this.mQueue = this.mHandler.getLooper().getQueue();
        this.bM = new byte[Math.max(i, CarplayMessage.BASE_NET)];
    }

    private void aD() {
        if (this.gx != null) {
            return;
        }
        try {
            this.gx = V();
            if (this.gx != null) {
                IoUtils.setBlocking(this.gx, false);
            }
            if (this.gx == null) {
                return;
            }
            this.mQueue.addOnFileDescriptorEventListener(this.gx, 5, new i(this));
            onStart();
        } catch (Exception e) {
            logError("Failed to create socket: ", e);
            IoUtils.closeQuietly(this.gx);
            this.gx = null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Code restructure failed: missing block: B:19:0x0038, code lost:
    
        if (isRunning() != false) goto L20;
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x003a, code lost:
    
        r2 = "readPacket error: ";
        r0 = r0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x0050, code lost:
    
        if (isRunning() != false) goto L20;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public boolean aE() {
        /*
            r6 = this;
        L0:
            boolean r0 = r6.isRunning()
            r1 = 0
            if (r0 == 0) goto L53
            java.io.FileDescriptor r0 = r6.gx     // Catch: java.lang.Exception -> L33 android.system.ErrnoException -> L3d
            byte[] r2 = r6.bM     // Catch: java.lang.Exception -> L33 android.system.ErrnoException -> L3d
            int r3 = r2.length     // Catch: java.lang.Exception -> L33 android.system.ErrnoException -> L3d
            int r0 = android.system.Os.read(r0, r2, r1, r3)     // Catch: java.lang.Exception -> L33 android.system.ErrnoException -> L3d
            if (r0 > 0) goto L1f
            boolean r0 = r6.isRunning()     // Catch: java.lang.Exception -> L33 android.system.ErrnoException -> L3d
            if (r0 == 0) goto L53
            java.lang.String r0 = "Socket closed, exiting"
            r2 = 0
            r6.logError(r0, r2)     // Catch: java.lang.Exception -> L33 android.system.ErrnoException -> L3d
            return r1
        L1f:
            long r2 = r6.gy     // Catch: java.lang.Exception -> L33 android.system.ErrnoException -> L3d
            r4 = 1
            long r2 = r2 + r4
            r6.gy = r2     // Catch: java.lang.Exception -> L33 android.system.ErrnoException -> L3d
            byte[] r2 = r6.bM     // Catch: java.lang.Exception -> L2c
            r6.c(r2, r0)     // Catch: java.lang.Exception -> L2c
            goto L0
        L2c:
            r0 = move-exception
            java.lang.String r2 = "handlePacket error: "
        L2f:
            r6.logError(r2, r0)
            return r1
        L33:
            r0 = move-exception
            boolean r2 = r6.isRunning()
            if (r2 == 0) goto L53
        L3a:
            java.lang.String r2 = "readPacket error: "
            goto L2f
        L3d:
            r0 = move-exception
            int r2 = r0.errno
            int r3 = android.system.OsConstants.EAGAIN
            if (r2 != r3) goto L46
            r0 = 1
            return r0
        L46:
            int r2 = r0.errno
            int r3 = android.system.OsConstants.EINTR
            if (r2 == r3) goto L0
            boolean r2 = r6.isRunning()
            if (r2 == 0) goto L53
            goto L3a
        L53:
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: android.net.util.h.aE():boolean");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void aF() {
        if (this.gx == null) {
            return;
        }
        this.mQueue.removeOnFileDescriptorEventListener(this.gx);
        IoUtils.closeQuietly(this.gx);
        this.gx = null;
        onStop();
    }

    private boolean aG() {
        return this.mHandler.getLooper() == Looper.myLooper();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void aH() {
        logError("stop() called from off-thread", null);
        aF();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void aI() {
        logError("start() called from off-thread", null);
        aD();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean isRunning() {
        return this.gx != null && this.gx.valid();
    }

    protected abstract FileDescriptor V();

    protected void c(byte[] bArr, int i) {
    }

    public final Handler getHandler() {
        return this.mHandler;
    }

    protected void logError(String str, Exception exc) {
    }

    protected void onStart() {
    }

    protected void onStop() {
    }

    public final void start() {
        if (aG()) {
            aD();
        } else {
            this.mHandler.post(new Runnable() { // from class: android.net.util.-$$Lambda$h$bbYpT7OdnqKbcSrBMhZ0rB5lF-Y
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.aI();
                }
            });
        }
    }

    public final void stop() {
        if (aG()) {
            aF();
        } else {
            this.mHandler.post(new Runnable() { // from class: android.net.util.-$$Lambda$h$I-57N33hBKIiOhPfHVG2j7z_gWQ
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.aH();
                }
            });
        }
    }
}
