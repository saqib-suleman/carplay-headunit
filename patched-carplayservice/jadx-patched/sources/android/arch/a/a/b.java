package android.arch.a.a;

import java.util.concurrent.Executor;

/* JADX INFO: loaded from: classes.dex */
final class b implements Executor {
    b() {
    }

    @Override // java.util.concurrent.Executor
    public final void execute(Runnable runnable) {
        a.a().b(runnable);
    }
}
