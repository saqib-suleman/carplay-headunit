package android.support.v4.c;

/* JADX INFO: loaded from: classes.dex */
public class p implements o {
    private final Object[] mB = new Object[12];
    private int mC;

    @Override // android.support.v4.c.o
    public Object acquire() {
        if (this.mC <= 0) {
            return null;
        }
        int i = this.mC - 1;
        Object obj = this.mB[i];
        this.mB[i] = null;
        this.mC--;
        return obj;
    }

    @Override // android.support.v4.c.o
    public boolean release(Object obj) {
        boolean z;
        int i = 0;
        while (true) {
            if (i >= this.mC) {
                z = false;
                break;
            }
            if (this.mB[i] == obj) {
                z = true;
                break;
            }
            i++;
        }
        if (z) {
            throw new IllegalStateException("Already in the pool!");
        }
        if (this.mC >= this.mB.length) {
            return false;
        }
        this.mB[this.mC] = obj;
        this.mC++;
        return true;
    }
}
