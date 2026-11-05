package android.arch.lifecycle;

import android.util.Log;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
public final class h extends Lifecycle {
    private final WeakReference L;
    private android.arch.a.b.a J = new android.arch.a.b.a();
    private int M = 0;
    private boolean N = false;
    private boolean O = false;
    private ArrayList P = new ArrayList();
    private Lifecycle.State K = Lifecycle.State.INITIALIZED;

    public h(g gVar) {
        this.L = new WeakReference(gVar);
    }

    static Lifecycle.State a(Lifecycle.State state, Lifecycle.State state2) {
        return (state2 == null || state2.compareTo(state) >= 0) ? state : state2;
    }

    private void a(g gVar) {
        android.arch.a.b.f fVarC = this.J.c();
        while (fVarC.hasNext() && !this.O) {
            Map.Entry entry = (Map.Entry) fVarC.next();
            j jVar = (j) entry.getValue();
            while (jVar.K.compareTo(this.K) < 0 && !this.O && this.J.contains(entry.getKey())) {
                d(jVar.K);
                jVar.b(gVar, e(jVar.K));
                h();
            }
        }
    }

    static Lifecycle.State b(Lifecycle.Event event) {
        switch (event) {
            case ON_CREATE:
            case ON_STOP:
                return Lifecycle.State.CREATED;
            case ON_START:
            case ON_PAUSE:
                return Lifecycle.State.STARTED;
            case ON_RESUME:
                return Lifecycle.State.RESUMED;
            case ON_DESTROY:
                return Lifecycle.State.DESTROYED;
            default:
                throw new IllegalArgumentException("Unexpected event value " + event);
        }
    }

    private Lifecycle.State c(f fVar) {
        Map.Entry entryB = this.J.b(fVar);
        return a(a(this.K, entryB != null ? ((j) entryB.getValue()).K : null), this.P.isEmpty() ? null : (Lifecycle.State) this.P.get(this.P.size() - 1));
    }

    private void c(Lifecycle.State state) {
        if (this.K == state) {
            return;
        }
        this.K = state;
        if (this.N || this.M != 0) {
            this.O = true;
            return;
        }
        this.N = true;
        sync();
        this.N = false;
    }

    private void d(Lifecycle.State state) {
        this.P.add(state);
    }

    private static Lifecycle.Event e(Lifecycle.State state) {
        switch (state) {
            case INITIALIZED:
            case DESTROYED:
                return Lifecycle.Event.ON_CREATE;
            case CREATED:
                return Lifecycle.Event.ON_START;
            case STARTED:
                return Lifecycle.Event.ON_RESUME;
            case RESUMED:
                throw new IllegalArgumentException();
            default:
                throw new IllegalArgumentException("Unexpected state value " + state);
        }
    }

    private void h() {
        this.P.remove(this.P.size() - 1);
    }

    private void sync() {
        Lifecycle.Event event;
        g gVar = (g) this.L.get();
        if (gVar == null) {
            Log.w("LifecycleRegistry", "LifecycleOwner is garbage collected, you shouldn't try dispatch new events from it.");
            return;
        }
        while (true) {
            boolean z = true;
            if (this.J.size() != 0) {
                Lifecycle.State state = ((j) this.J.eldest().getValue()).K;
                Lifecycle.State state2 = ((j) this.J.d().getValue()).K;
                if (state != state2 || this.K != state2) {
                    z = false;
                }
            }
            if (z) {
                this.O = false;
                return;
            }
            this.O = false;
            if (this.K.compareTo(((j) this.J.eldest().getValue()).K) < 0) {
                Iterator itDescendingIterator = this.J.descendingIterator();
                while (itDescendingIterator.hasNext() && !this.O) {
                    Map.Entry entry = (Map.Entry) itDescendingIterator.next();
                    j jVar = (j) entry.getValue();
                    while (jVar.K.compareTo(this.K) > 0 && !this.O && this.J.contains(entry.getKey())) {
                        Lifecycle.State state3 = jVar.K;
                        switch (state3) {
                            case INITIALIZED:
                                throw new IllegalArgumentException();
                            case CREATED:
                                event = Lifecycle.Event.ON_DESTROY;
                                break;
                            case STARTED:
                                event = Lifecycle.Event.ON_STOP;
                                break;
                            case RESUMED:
                                event = Lifecycle.Event.ON_PAUSE;
                                break;
                            case DESTROYED:
                                throw new IllegalArgumentException();
                            default:
                                throw new IllegalArgumentException("Unexpected state value " + state3);
                        }
                        d(b(event));
                        jVar.b(gVar, event);
                        h();
                    }
                }
            }
            Map.Entry entryD = this.J.d();
            if (!this.O && entryD != null && this.K.compareTo(((j) entryD.getValue()).K) > 0) {
                a(gVar);
            }
        }
    }

    public final void a(Lifecycle.Event event) {
        c(b(event));
    }

    @Override // android.arch.lifecycle.Lifecycle
    public final void a(f fVar) {
        g gVar;
        j jVar = new j(fVar, this.K == Lifecycle.State.DESTROYED ? Lifecycle.State.DESTROYED : Lifecycle.State.INITIALIZED);
        if (((j) this.J.putIfAbsent(fVar, jVar)) == null && (gVar = (g) this.L.get()) != null) {
            boolean z = this.M != 0 || this.N;
            Lifecycle.State stateC = c(fVar);
            this.M++;
            while (jVar.K.compareTo(stateC) < 0 && this.J.contains(fVar)) {
                d(jVar.K);
                jVar.b(gVar, e(jVar.K));
                h();
                stateC = c(fVar);
            }
            if (!z) {
                sync();
            }
            this.M--;
        }
    }

    public final void b(Lifecycle.State state) {
        c(state);
    }

    @Override // android.arch.lifecycle.Lifecycle
    public final void b(f fVar) {
        this.J.remove(fVar);
    }

    @Override // android.arch.lifecycle.Lifecycle
    public final Lifecycle.State f() {
        return this.K;
    }
}
