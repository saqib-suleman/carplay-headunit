package android.arch.lifecycle;

/* JADX INFO: loaded from: classes.dex */
class FullLifecycleObserverAdapter implements GenericLifecycleObserver {
    private final FullLifecycleObserver B;

    FullLifecycleObserverAdapter(FullLifecycleObserver fullLifecycleObserver) {
        this.B = fullLifecycleObserver;
    }

    @Override // android.arch.lifecycle.GenericLifecycleObserver
    public final void a(g gVar, Lifecycle.Event event) {
        switch (event) {
            case ON_CREATE:
            case ON_START:
            case ON_RESUME:
            case ON_PAUSE:
            case ON_STOP:
            case ON_DESTROY:
                return;
            case ON_ANY:
                throw new IllegalArgumentException("ON_ANY must not been send by anybody");
            default:
                return;
        }
    }
}
