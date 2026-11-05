package android.arch.lifecycle;

/* JADX INFO: loaded from: classes.dex */
abstract class n {
    final /* synthetic */ LiveData ac;
    final q ae;
    int af = -1;
    boolean mActive;

    n(LiveData liveData, q qVar) {
        this.ac = liveData;
        this.ae = qVar;
    }

    final void a(boolean z) {
        if (z == this.mActive) {
            return;
        }
        this.mActive = z;
        boolean z2 = this.ac.X == 0;
        this.ac.X += this.mActive ? 1 : -1;
        if (z2 && this.mActive) {
            this.ac.onActive();
        }
        if (this.ac.X == 0 && !this.mActive) {
            this.ac.j();
        }
        if (this.mActive) {
            this.ac.b(this);
        }
    }

    boolean b(g gVar) {
        return false;
    }

    abstract boolean m();

    void n() {
    }
}
