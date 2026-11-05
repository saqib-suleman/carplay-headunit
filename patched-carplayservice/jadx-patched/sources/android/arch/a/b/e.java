package android.arch.a.b;

import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
final class e implements Map.Entry {
    final Object l;
    e m;
    final Object mValue;
    e n;

    e(Object obj, Object obj2) {
        this.l = obj;
        this.mValue = obj2;
    }

    @Override // java.util.Map.Entry
    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof e)) {
            return false;
        }
        e eVar = (e) obj;
        return this.l.equals(eVar.l) && this.mValue.equals(eVar.mValue);
    }

    @Override // java.util.Map.Entry
    public final Object getKey() {
        return this.l;
    }

    @Override // java.util.Map.Entry
    public final Object getValue() {
        return this.mValue;
    }

    @Override // java.util.Map.Entry
    public final int hashCode() {
        return this.l.hashCode() ^ this.mValue.hashCode();
    }

    @Override // java.util.Map.Entry
    public final Object setValue(Object obj) {
        throw new UnsupportedOperationException("An entry modification is not supported");
    }

    public final String toString() {
        return this.l + "=" + this.mValue;
    }
}
