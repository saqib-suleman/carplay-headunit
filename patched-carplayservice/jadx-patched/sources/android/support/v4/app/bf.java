package android.support.v4.app;

import java.io.PrintWriter;

/* JADX INFO: loaded from: classes.dex */
public abstract class bf {
    public static bf c(android.arch.lifecycle.g gVar) {
        return new LoaderManagerImpl(gVar, ((android.arch.lifecycle.y) gVar).r());
    }

    @Deprecated
    public abstract void a(String str, PrintWriter printWriter);

    public abstract void bI();
}
