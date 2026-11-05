package android.support.v4.c;

/* JADX INFO: loaded from: classes.dex */
public final class q extends p {
    private final Object mLock = new Object();

    @Override // android.support.v4.c.p, android.support.v4.c.o
    public final Object acquire() {
        Object objAcquire;
        synchronized (this.mLock) {
            objAcquire = super.acquire();
        }
        return objAcquire;
    }

    @Override // android.support.v4.c.p, android.support.v4.c.o
    public final boolean release(Object obj) {
        boolean zRelease;
        synchronized (this.mLock) {
            zRelease = super.release(obj);
        }
        return zRelease;
    }
}
