package android.arch.lifecycle;

/* JADX INFO: loaded from: classes.dex */
public final class v {
    private final w al;
    private final x am;

    public v(x xVar, w wVar) {
        this.al = wVar;
        this.am = xVar;
    }

    public final u g(Class cls) {
        String canonicalName = cls.getCanonicalName();
        if (canonicalName == null) {
            throw new IllegalArgumentException("Local and anonymous classes can not be ViewModels");
        }
        String str = "android.arch.lifecycle.ViewModelProvider.DefaultKey:" + canonicalName;
        u uVarB = this.am.b(str);
        if (cls.isInstance(uVarB)) {
            return uVarB;
        }
        u uVarQ = this.al.q();
        this.am.a(str, uVarQ);
        return uVarQ;
    }
}
