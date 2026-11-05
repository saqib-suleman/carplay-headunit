package android.arch.lifecycle;

import java.lang.reflect.Method;

/* JADX INFO: loaded from: classes.dex */
final class c {
    final int mCallType;
    final Method z;

    c(int i, Method method) {
        this.mCallType = i;
        this.z = method;
        this.z.setAccessible(true);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        c cVar = (c) obj;
        return this.mCallType == cVar.mCallType && this.z.getName().equals(cVar.z.getName());
    }

    public final int hashCode() {
        return (31 * this.mCallType) + this.z.getName().hashCode();
    }
}
