package android.support.v4.app;

import android.content.Context;
import android.os.Bundle;
import android.view.View;

/* JADX INFO: loaded from: classes.dex */
public abstract class r {
    public Fragment a(Context context, String str, Bundle bundle) {
        return Fragment.a(context, str, bundle);
    }

    public abstract View onFindViewById(int i);

    public abstract boolean onHasView();
}
