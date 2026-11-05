package android.net.util;

import android.text.TextUtils;
import android.util.LocalLog;
import android.util.Log;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.StringJoiner;

/* JADX INFO: loaded from: classes.dex */
public final class SharedLog {
    private final LocalLog gA;
    private final String gB;
    private final String mTag;

    enum Category {
        NONE,
        ERROR,
        MARK,
        WARN
    }

    private SharedLog(LocalLog localLog, String str, String str2) {
        this.gA = localLog;
        this.mTag = str;
        this.gB = str2;
    }

    public SharedLog(String str) {
        this(new LocalLog(500), str, str);
    }

    private String a(Category category, String str) {
        StringJoiner stringJoiner = new StringJoiner(" ");
        if (!aJ()) {
            stringJoiner.add("[" + this.gB + "]");
        }
        if (category != Category.NONE) {
            stringJoiner.add(category.toString());
        }
        String string = stringJoiner.add(str).toString();
        this.gA.log(string);
        return string;
    }

    private boolean aJ() {
        return TextUtils.isEmpty(this.gB) || this.gB.equals(this.mTag);
    }

    public final void dump(FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr) {
        this.gA.readOnlyLocalLog().dump(fileDescriptor, printWriter, strArr);
    }

    public final void log(String str) {
        a(Category.NONE, str);
    }

    public final SharedLog o(String str) {
        if (!aJ()) {
            str = this.gB + "." + str;
        }
        return new SharedLog(this.gA, this.mTag, str);
    }

    public final void p(String str) {
        Log.e(this.mTag, a(Category.ERROR, str));
    }

    public final void q(String str) {
        Log.i(this.mTag, a(Category.NONE, str));
    }

    public final void w(String str) {
        Log.w(this.mTag, a(Category.WARN, str));
    }
}
