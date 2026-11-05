package android.arch.lifecycle;

/* JADX INFO: loaded from: classes.dex */
class ReflectiveGenericLifecycleObserver implements GenericLifecycleObserver {
    private final Object ah;
    private final b ai;

    ReflectiveGenericLifecycleObserver(Object obj) {
        this.ah = obj;
        this.ai = a.s.c(this.ah.getClass());
    }

    @Override // android.arch.lifecycle.GenericLifecycleObserver
    public final void a(g gVar, Lifecycle.Event event) {
        this.ai.a(gVar, event, this.ah);
    }
}
