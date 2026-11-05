package android.arch.lifecycle;

import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
public abstract class LiveData {
    private static final Object V = new Object();
    private boolean Z;
    private boolean aa;
    private final Object U = new Object();
    private android.arch.a.b.b W = new android.arch.a.b.b();
    private int X = 0;
    private volatile Object mData = V;
    private volatile Object Y = V;
    private int mVersion = -1;
    private final Runnable ab = new m(this);

    class LifecycleBoundObserver extends n implements GenericLifecycleObserver {
        final g ad;

        LifecycleBoundObserver(g gVar, q qVar) {
            super(LiveData.this, qVar);
            this.ad = gVar;
        }

        @Override // android.arch.lifecycle.GenericLifecycleObserver
        public final void a(g gVar, Lifecycle.Event event) {
            if (this.ad.g().f() == Lifecycle.State.DESTROYED) {
                LiveData.this.a(this.ae);
            } else {
                a(m());
            }
        }

        @Override // android.arch.lifecycle.n
        final boolean b(g gVar) {
            return this.ad == gVar;
        }

        @Override // android.arch.lifecycle.n
        final boolean m() {
            return this.ad.g().f().a(Lifecycle.State.STARTED);
        }

        @Override // android.arch.lifecycle.n
        final void n() {
            this.ad.g().b(this);
        }
    }

    private void a(n nVar) {
        if (nVar.mActive) {
            if (!nVar.m()) {
                nVar.a(false);
            } else {
                if (nVar.af >= this.mVersion) {
                    return;
                }
                nVar.af = this.mVersion;
                nVar.ae.d(this.mData);
            }
        }
    }

    private static void a(String str) {
        if (android.arch.a.a.a.a().b()) {
            return;
        }
        throw new IllegalStateException("Cannot invoke " + str + " on a background thread");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void b(n nVar) {
        if (this.Z) {
            this.aa = true;
            return;
        }
        this.Z = true;
        do {
            this.aa = false;
            if (nVar != null) {
                a(nVar);
                nVar = null;
            } else {
                android.arch.a.b.f fVarC = this.W.c();
                while (fVarC.hasNext()) {
                    a((n) ((Map.Entry) fVarC.next()).getValue());
                    if (this.aa) {
                        break;
                    }
                }
            }
        } while (this.aa);
        this.Z = false;
    }

    public final void a(g gVar, q qVar) {
        a("observe");
        if (gVar.g().f() == Lifecycle.State.DESTROYED) {
            return;
        }
        LifecycleBoundObserver lifecycleBoundObserver = new LifecycleBoundObserver(gVar, qVar);
        n nVar = (n) this.W.putIfAbsent(qVar, lifecycleBoundObserver);
        if (nVar != null && !nVar.b(gVar)) {
            throw new IllegalArgumentException("Cannot add the same observer with different lifecycles");
        }
        if (nVar != null) {
            return;
        }
        gVar.g().a(lifecycleBoundObserver);
    }

    public void a(q qVar) {
        a("removeObserver");
        n nVar = (n) this.W.remove(qVar);
        if (nVar == null) {
            return;
        }
        nVar.n();
        nVar.a(false);
    }

    public final Object getValue() {
        Object obj = this.mData;
        if (obj != V) {
            return obj;
        }
        return null;
    }

    protected void j() {
    }

    public final boolean k() {
        return this.X > 0;
    }

    protected void onActive() {
    }

    protected void setValue(Object obj) {
        a("setValue");
        this.mVersion++;
        this.mData = obj;
        b((n) null);
    }
}
