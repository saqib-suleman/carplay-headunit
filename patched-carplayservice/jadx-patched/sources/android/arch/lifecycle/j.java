package android.arch.lifecycle;

/* JADX INFO: loaded from: classes.dex */
final class j {
    Lifecycle.State K;
    GenericLifecycleObserver R;

    j(f fVar, Lifecycle.State state) {
        this.R = l.c(fVar);
        this.K = state;
    }

    final void b(g gVar, Lifecycle.Event event) {
        Lifecycle.State stateB = h.b(event);
        this.K = h.a(this.K, stateB);
        this.R.a(gVar, event);
        this.K = stateB;
    }
}
