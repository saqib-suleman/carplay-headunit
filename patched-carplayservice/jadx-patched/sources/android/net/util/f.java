package android.net.util;

import android.net.INetd;
import android.os.ServiceManager;
import android.util.Log;

/* JADX INFO: loaded from: classes.dex */
public class f {
    private static final String TAG = f.class.getSimpleName();

    public static INetd aC() {
        INetd iNetdAsInterface = INetd.Stub.asInterface(ServiceManager.getService("netd"));
        if (iNetdAsInterface == null) {
            Log.w(TAG, "WARNING: returning null INetd instance.");
        }
        return iNetdAsInterface;
    }
}
