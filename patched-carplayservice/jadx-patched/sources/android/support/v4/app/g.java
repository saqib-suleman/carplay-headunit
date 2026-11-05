package android.support.v4.app;

import android.os.Bundle;
import android.os.IBinder;
import android.util.Log;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/* JADX INFO: loaded from: classes.dex */
final class g {
    private static Method hH;
    private static boolean hI;
    private static Method hJ;
    private static boolean hK;

    public static IBinder a(Bundle bundle, String str) {
        if (!hI) {
            try {
                Method method = Bundle.class.getMethod("getIBinder", String.class);
                hH = method;
                method.setAccessible(true);
            } catch (NoSuchMethodException e) {
                Log.i("BundleCompatBaseImpl", "Failed to retrieve getIBinder method", e);
            }
            hI = true;
        }
        if (hH != null) {
            try {
                return (IBinder) hH.invoke(bundle, str);
            } catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException e2) {
                Log.i("BundleCompatBaseImpl", "Failed to invoke getIBinder via reflection", e2);
                hH = null;
            }
        }
        return null;
    }

    public static void a(Bundle bundle, String str, IBinder iBinder) {
        if (!hK) {
            try {
                Method method = Bundle.class.getMethod("putIBinder", String.class, IBinder.class);
                hJ = method;
                method.setAccessible(true);
            } catch (NoSuchMethodException e) {
                Log.i("BundleCompatBaseImpl", "Failed to retrieve putIBinder method", e);
            }
            hK = true;
        }
        if (hJ != null) {
            try {
                hJ.invoke(bundle, str, iBinder);
            } catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException e2) {
                Log.i("BundleCompatBaseImpl", "Failed to invoke putIBinder via reflection", e2);
                hJ = null;
            }
        }
    }
}
