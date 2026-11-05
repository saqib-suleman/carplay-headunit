package android.support.v4.c;

/* JADX INFO: loaded from: classes.dex */
public final class t implements Cloneable {
    private static final Object mD = new Object();
    private boolean mE;
    private int[] mF;
    private Object[] mG;
    private int mSize;

    public t() {
        this(10);
    }

    public t(int i) {
        Object[] objArr;
        this.mE = false;
        if (i == 0) {
            this.mF = e.mu;
            objArr = e.mw;
        } else {
            int iZ = e.z(i);
            this.mF = new int[iZ];
            objArr = new Object[iZ];
        }
        this.mG = objArr;
        this.mSize = 0;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX INFO: renamed from: cb, reason: merged with bridge method [inline-methods] */
    public t clone() {
        try {
            t tVar = (t) super.clone();
            try {
                tVar.mF = (int[]) this.mF.clone();
                tVar.mG = (Object[]) this.mG.clone();
                return tVar;
            } catch (CloneNotSupportedException e) {
                return tVar;
            }
        } catch (CloneNotSupportedException e2) {
            return null;
        }
    }

    private void gc() {
        int i = this.mSize;
        int[] iArr = this.mF;
        Object[] objArr = this.mG;
        int i2 = 0;
        for (int i3 = 0; i3 < i; i3++) {
            Object obj = objArr[i3];
            if (obj != mD) {
                if (i3 != i2) {
                    iArr[i2] = iArr[i3];
                    objArr[i2] = obj;
                    objArr[i3] = null;
                }
                i2++;
            }
        }
        this.mE = false;
        this.mSize = i2;
    }

    public final void clear() {
        int i = this.mSize;
        Object[] objArr = this.mG;
        for (int i2 = 0; i2 < i; i2++) {
            objArr[i2] = null;
        }
        this.mSize = 0;
        this.mE = false;
    }

    public final Object get(int i) {
        int iBinarySearch = e.binarySearch(this.mF, this.mSize, i);
        if (iBinarySearch < 0 || this.mG[iBinarySearch] == mD) {
            return null;
        }
        return this.mG[iBinarySearch];
    }

    public final int keyAt(int i) {
        if (this.mE) {
            gc();
        }
        return this.mF[i];
    }

    public final void put(int i, Object obj) {
        int iBinarySearch = e.binarySearch(this.mF, this.mSize, i);
        if (iBinarySearch >= 0) {
            this.mG[iBinarySearch] = obj;
            return;
        }
        int i2 = ~iBinarySearch;
        if (i2 < this.mSize && this.mG[i2] == mD) {
            this.mF[i2] = i;
            this.mG[i2] = obj;
            return;
        }
        if (this.mE && this.mSize >= this.mF.length) {
            gc();
            i2 = ~e.binarySearch(this.mF, this.mSize, i);
        }
        if (this.mSize >= this.mF.length) {
            int iZ = e.z(this.mSize + 1);
            int[] iArr = new int[iZ];
            Object[] objArr = new Object[iZ];
            System.arraycopy(this.mF, 0, iArr, 0, this.mF.length);
            System.arraycopy(this.mG, 0, objArr, 0, this.mG.length);
            this.mF = iArr;
            this.mG = objArr;
        }
        if (this.mSize - i2 != 0) {
            int i3 = i2 + 1;
            System.arraycopy(this.mF, i2, this.mF, i3, this.mSize - i2);
            System.arraycopy(this.mG, i2, this.mG, i3, this.mSize - i2);
        }
        this.mF[i2] = i;
        this.mG[i2] = obj;
        this.mSize++;
    }

    public final void remove(int i) {
        int iBinarySearch = e.binarySearch(this.mF, this.mSize, i);
        if (iBinarySearch < 0 || this.mG[iBinarySearch] == mD) {
            return;
        }
        this.mG[iBinarySearch] = mD;
        this.mE = true;
    }

    public final int size() {
        if (this.mE) {
            gc();
        }
        return this.mSize;
    }

    public final String toString() {
        if (size() <= 0) {
            return "{}";
        }
        StringBuilder sb = new StringBuilder(this.mSize * 28);
        sb.append('{');
        for (int i = 0; i < this.mSize; i++) {
            if (i > 0) {
                sb.append(", ");
            }
            sb.append(keyAt(i));
            sb.append('=');
            Object objValueAt = valueAt(i);
            if (objValueAt != this) {
                sb.append(objValueAt);
            } else {
                sb.append("(this Map)");
            }
        }
        sb.append('}');
        return sb.toString();
    }

    public final Object valueAt(int i) {
        if (this.mE) {
            gc();
        }
        return this.mG[i];
    }
}
