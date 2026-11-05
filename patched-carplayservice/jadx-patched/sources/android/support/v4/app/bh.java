package android.support.v4.app;

import android.os.Bundle;
import android.util.Log;
import java.io.PrintWriter;

/* JADX INFO: loaded from: classes.dex */
public final class bh extends android.arch.lifecycle.p implements android.support.v4.a.c {
    private android.arch.lifecycle.g jR;
    private final android.support.v4.a.b jT;
    private bi jU;
    private android.support.v4.a.b jV;
    private final Bundle mArgs;
    private final int mId;

    @Override // android.arch.lifecycle.LiveData
    public final void a(android.arch.lifecycle.q qVar) {
        super.a(qVar);
        this.jR = null;
        this.jU = null;
    }

    public final void a(String str, PrintWriter printWriter) {
        printWriter.print(str);
        printWriter.print("mId=");
        printWriter.print(this.mId);
        printWriter.print(" mArgs=");
        printWriter.println(this.mArgs);
        printWriter.print(str);
        printWriter.print("mLoader=");
        printWriter.println(this.jT);
        this.jT.a(str + "  ", printWriter);
        if (this.jU != null) {
            printWriter.print(str);
            printWriter.print("mCallbacks=");
            printWriter.println(this.jU);
            this.jU.dump(str + "  ", printWriter);
        }
        printWriter.print(str);
        printWriter.print("mData=");
        printWriter.println(android.support.v4.a.b.dataToString(getValue()));
        printWriter.print(str);
        printWriter.print("mStarted=");
        printWriter.println(k());
    }

    final void bI() {
        android.arch.lifecycle.g gVar = this.jR;
        bi biVar = this.jU;
        if (gVar == null || biVar == null) {
            return;
        }
        super.a(biVar);
        a(gVar, biVar);
    }

    final android.support.v4.a.b bJ() {
        if (LoaderManagerImpl.DEBUG) {
            Log.v("LoaderManager", "  Destroying: " + this);
        }
        this.jT.abandon();
        bi biVar = this.jU;
        if (biVar != null) {
            a(biVar);
            biVar.reset();
        }
        this.jT.a(this);
        this.jT.reset();
        return this.jV;
    }

    @Override // android.arch.lifecycle.LiveData
    protected final void j() {
        if (LoaderManagerImpl.DEBUG) {
            Log.v("LoaderManager", "  Stopping: " + this);
        }
        this.jT.stopLoading();
    }

    @Override // android.arch.lifecycle.LiveData
    protected final void onActive() {
        if (LoaderManagerImpl.DEBUG) {
            Log.v("LoaderManager", "  Starting: " + this);
        }
        this.jT.startLoading();
    }

    @Override // android.arch.lifecycle.p, android.arch.lifecycle.LiveData
    public final void setValue(Object obj) {
        super.setValue(obj);
        if (this.jV != null) {
            this.jV.reset();
            this.jV = null;
        }
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder(64);
        sb.append("LoaderInfo{");
        sb.append(Integer.toHexString(System.identityHashCode(this)));
        sb.append(" #");
        sb.append(this.mId);
        sb.append(" : ");
        android.support.v4.c.f.buildShortClassTag(this.jT, sb);
        sb.append("}}");
        return sb.toString();
    }
}
