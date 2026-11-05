package android.support.v4.app;

/* JADX INFO: loaded from: classes.dex */
final class aj implements l {
    private final boolean iT;
    private final c iU;
    private int iV;

    aj(c cVar, boolean z) {
        this.iT = z;
        this.iU = cVar;
    }

    public final void cancelTransaction() {
        v.a(this.iU.hF, this.iU, this.iT, false, false);
    }

    public final void completeTransaction() {
        boolean z = this.iV > 0;
        v vVar = this.iU.hF;
        int size = vVar.mAdded.size();
        for (int i = 0; i < size; i++) {
            Fragment fragment = (Fragment) vVar.mAdded.get(i);
            fragment.b((l) null);
            if (z && fragment.isPostponed()) {
                fragment.startPostponedEnterTransition();
            }
        }
        v.a(this.iU.hF, this.iU, this.iT, !z, true);
    }

    public final boolean isReady() {
        return this.iV == 0;
    }

    @Override // android.support.v4.app.l
    public final void onStartEnterTransition() {
        this.iV--;
        if (this.iV != 0) {
            return;
        }
        this.iU.hF.bA();
    }

    @Override // android.support.v4.app.l
    public final void startListening() {
        this.iV++;
    }
}
