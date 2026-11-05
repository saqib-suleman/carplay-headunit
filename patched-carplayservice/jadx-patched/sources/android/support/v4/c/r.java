package android.support.v4.c;

/* JADX INFO: loaded from: classes.dex */
public final class r {
    public static Object checkNotNull(Object obj, Object obj2) {
        if (obj != null) {
            return obj;
        }
        throw new NullPointerException(String.valueOf(obj2));
    }
}
