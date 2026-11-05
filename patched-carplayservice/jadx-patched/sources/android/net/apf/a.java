package android.net.apf;

/* JADX INFO: loaded from: classes.dex */
public final class a {
    public final int an;
    public final int ao;
    public final int ap;

    public final boolean s() {
        return this.an >= 4;
    }

    public final String toString() {
        return String.format("%s{version: %d, maxSize: %d, format: %d}", getClass().getSimpleName(), Integer.valueOf(this.an), Integer.valueOf(this.ao), Integer.valueOf(this.ap));
    }
}
