package android.support.v4.app;

import android.app.Activity;
import android.content.Context;
import android.os.Handler;
import android.view.LayoutInflater;
import android.view.View;
import java.io.PrintWriter;

/* JADX INFO: loaded from: classes.dex */
public abstract class t extends r {
    final v hP;
    private final Activity mActivity;
    private final Context mContext;
    private final Handler mHandler;
    private final int mWindowAnimations;

    private t(Activity activity, Context context, Handler handler) {
        this.hP = new v();
        this.mActivity = activity;
        this.mContext = (Context) android.support.v4.c.r.checkNotNull(context, "context == null");
        this.mHandler = (Handler) android.support.v4.c.r.checkNotNull(handler, "handler == null");
        this.mWindowAnimations = 0;
    }

    t(n nVar) {
        this(nVar, nVar, nVar.mHandler);
    }

    public void a(String str, PrintWriter printWriter, String[] strArr) {
    }

    public boolean br() {
        return true;
    }

    public void bs() {
    }

    final Activity getActivity() {
        return this.mActivity;
    }

    final Context getContext() {
        return this.mContext;
    }

    final Handler getHandler() {
        return this.mHandler;
    }

    @Override // android.support.v4.app.r
    public View onFindViewById(int i) {
        return null;
    }

    public LayoutInflater onGetLayoutInflater() {
        return LayoutInflater.from(this.mContext);
    }

    public int onGetWindowAnimations() {
        return this.mWindowAnimations;
    }

    @Override // android.support.v4.app.r
    public boolean onHasView() {
        return true;
    }

    public boolean onHasWindowAnimations() {
        return true;
    }
}
