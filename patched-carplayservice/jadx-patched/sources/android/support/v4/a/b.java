package android.support.v4.a;

import android.support.v4.c.f;
import java.io.PrintWriter;

/* JADX INFO: loaded from: classes.dex */
public final class b {
    c ka;
    boolean mAbandoned;
    boolean mContentChanged;
    int mId;
    boolean mProcessingChange;
    boolean mReset;
    boolean mStarted;

    public static String dataToString(Object obj) {
        StringBuilder sb = new StringBuilder(64);
        f.buildShortClassTag(obj, sb);
        sb.append("}");
        return sb.toString();
    }

    public final void a(c cVar) {
        if (this.ka == null) {
            throw new IllegalStateException("No listener register");
        }
        if (this.ka != cVar) {
            throw new IllegalArgumentException("Attempting to unregister the wrong listener");
        }
        this.ka = null;
    }

    @Deprecated
    public final void a(String str, PrintWriter printWriter) {
        printWriter.print(str);
        printWriter.print("mId=");
        printWriter.print(this.mId);
        printWriter.print(" mListener=");
        printWriter.println(this.ka);
        if (this.mStarted || this.mContentChanged || this.mProcessingChange) {
            printWriter.print(str);
            printWriter.print("mStarted=");
            printWriter.print(this.mStarted);
            printWriter.print(" mContentChanged=");
            printWriter.print(this.mContentChanged);
            printWriter.print(" mProcessingChange=");
            printWriter.println(this.mProcessingChange);
        }
        if (this.mAbandoned || this.mReset) {
            printWriter.print(str);
            printWriter.print("mAbandoned=");
            printWriter.print(this.mAbandoned);
            printWriter.print(" mReset=");
            printWriter.println(this.mReset);
        }
    }

    public final void abandon() {
        this.mAbandoned = true;
    }

    public final void reset() {
        this.mReset = true;
        this.mStarted = false;
        this.mAbandoned = false;
        this.mContentChanged = false;
        this.mProcessingChange = false;
    }

    public final void startLoading() {
        this.mStarted = true;
        this.mReset = false;
        this.mAbandoned = false;
    }

    public final void stopLoading() {
        this.mStarted = false;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder(64);
        f.buildShortClassTag(this, sb);
        sb.append(" id=");
        sb.append(this.mId);
        sb.append("}");
        return sb.toString();
    }
}
