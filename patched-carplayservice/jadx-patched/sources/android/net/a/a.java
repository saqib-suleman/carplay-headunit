package android.net.a;

import android.os.Handler;
import android.util.LocalLog;

/* JADX INFO: loaded from: classes.dex */
public class a {
    private static final String TAG = a.class.getSimpleName();
    private final LocalLog el;
    private final android.net.util.h em;
    private String en;
    private boolean mRunning;
    private final String mTag;

    public a(Handler handler, android.net.util.b bVar, LocalLog localLog) {
        if (bVar == null) {
            throw new IllegalArgumentException("null InterfaceParams");
        }
        this.mTag = TAG + "." + bVar.name;
        this.el = localLog;
        this.em = new b(this, handler, bVar);
    }

    public final void start(String str) {
        this.mRunning = true;
        this.en = str;
        this.em.start();
    }

    public final void stop() {
        this.em.stop();
        this.mRunning = false;
        this.en = null;
    }
}
