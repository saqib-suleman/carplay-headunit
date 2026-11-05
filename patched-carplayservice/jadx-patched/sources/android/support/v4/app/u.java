package android.support.v4.app;

import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public abstract class u {
    public abstract ap bx();

    public abstract void dump(String str, FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr);

    public abstract boolean executePendingTransactions();

    public abstract List getFragments();

    public abstract boolean isStateSaved();

    public abstract boolean popBackStackImmediate();

    public abstract Fragment s(String str);
}
