package android.arch.a.a;

import java.util.concurrent.Executor;

/* JADX INFO: loaded from: classes.dex */
public class a extends e {
    private static volatile a a;
    private static final Executor d = new b();
    private static final Executor e = new c();
    private e c = new d();
    private e b = this.c;

    private a() {
    }

    public static a a() {
        if (a != null) {
            return a;
        }
        synchronized (a.class) {
            if (a == null) {
                a = new a();
            }
        }
        return a;
    }

    @Override // android.arch.a.a.e
    public final void a(Runnable runnable) {
        this.b.a(runnable);
    }

    @Override // android.arch.a.a.e
    public final void b(Runnable runnable) {
        this.b.b(runnable);
    }

    @Override // android.arch.a.a.e
    public final boolean b() {
        return this.b.b();
    }
}
