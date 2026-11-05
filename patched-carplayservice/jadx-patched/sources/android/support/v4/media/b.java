package android.support.v4.media;

import android.media.AudioAttributes;
import android.util.Log;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/* JADX INFO: loaded from: classes.dex */
final class b {
    private static Method kh;

    public static int a(c cVar) {
        AudioAttributes audioAttributesBL = cVar.bL();
        try {
            if (kh == null) {
                kh = AudioAttributes.class.getMethod("toLegacyStreamType", AudioAttributes.class);
            }
            return ((Integer) kh.invoke(null, audioAttributesBL)).intValue();
        } catch (ClassCastException | IllegalAccessException | NoSuchMethodException | InvocationTargetException e) {
            Log.w("AudioAttributesCompat", "getLegacyStreamType() failed on API21+", e);
            return -1;
        }
    }
}
