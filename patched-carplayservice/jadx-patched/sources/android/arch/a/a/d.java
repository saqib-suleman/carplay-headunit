package android.arch.a.a;

import android.os.Handler;
import android.os.Looper;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/* JADX INFO: loaded from: classes.dex */
public final class d extends e {
    private volatile Handler g;
    private final Object mLock = new Object();
    private ExecutorService f = Executors.newFixedThreadPool(2);

    @Override // android.arch.a.a.e
    public final void a(Runnable runnable) {
        this.f.execute(runnable);
    }

    @Override // android.arch.a.a.e
    public final void b(Runnable runnable) {
        if (this.g == null) {
            synchronized (this.mLock) {
                if (this.g == null) {
                    this.g = new Handler(Looper.getMainLooper());
                }
            }
        }
        this.g.post(runnable);
    }

    @Override // android.arch.a.a.e
    public final boolean b() {
        return Looper.getMainLooper().getThread() == Thread.currentThread();
    }
}
