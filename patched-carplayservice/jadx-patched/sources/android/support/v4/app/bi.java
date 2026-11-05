package android.support.v4.app;

import android.util.Log;
import java.io.PrintWriter;

/* JADX INFO: loaded from: classes.dex */
final class bi implements android.arch.lifecycle.q {
    private final android.support.v4.a.b jT;
    private final bg jW;
    private boolean mDeliveredData;

    @Override // android.arch.lifecycle.q
    public final void d(Object obj) {
        if (LoaderManagerImpl.DEBUG) {
            Log.v("LoaderManager", "  onLoadFinished in " + this.jT + ": " + android.support.v4.a.b.dataToString(obj));
        }
        this.mDeliveredData = true;
    }

    public final void dump(String str, PrintWriter printWriter) {
        printWriter.print(str);
        printWriter.print("mDeliveredData=");
        printWriter.println(this.mDeliveredData);
    }

    final void reset() {
        if (this.mDeliveredData && LoaderManagerImpl.DEBUG) {
            Log.v("LoaderManager", "  Resetting: " + this.jT);
        }
    }

    public final String toString() {
        return this.jW.toString();
    }
}
