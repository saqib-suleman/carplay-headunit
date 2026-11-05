package android.support.v4.media;

import android.os.Bundle;
import android.text.TextUtils;

/* JADX INFO: loaded from: classes.dex */
public final class ay {
    private final int lC;
    private final String lD;
    private final Bundle mExtras;

    private ay(int i) {
        if (i == 0) {
            throw new IllegalArgumentException("commandCode shouldn't be COMMAND_CODE_CUSTOM");
        }
        this.lC = i;
        this.lD = null;
        this.mExtras = null;
    }

    private ay(String str, Bundle bundle) {
        if (str == null) {
            throw new IllegalArgumentException("action shouldn't be null");
        }
        this.lC = 0;
        this.lD = str;
        this.mExtras = bundle;
    }

    public static ay n(Bundle bundle) {
        if (bundle == null) {
            throw new IllegalArgumentException("command shouldn't be null");
        }
        int i = bundle.getInt("android.media.media_session2.command.command_code");
        if (i != 0) {
            return new ay(i);
        }
        String string = bundle.getString("android.media.media_session2.command.custom_command");
        if (string == null) {
            return null;
        }
        return new ay(string, bundle.getBundle("android.media.media_session2.command.extras"));
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof ay)) {
            return false;
        }
        ay ayVar = (ay) obj;
        return this.lC == ayVar.lC && TextUtils.equals(this.lD, ayVar.lD);
    }

    public final int hashCode() {
        return ((this.lD != null ? this.lD.hashCode() : 0) * 31) + this.lC;
    }
}
