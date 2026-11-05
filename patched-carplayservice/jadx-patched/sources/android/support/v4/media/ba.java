package android.support.v4.media;

import android.os.Bundle;
import android.support.v4.media.session.MediaSessionCompat;
import android.text.TextUtils;

/* JADX INFO: loaded from: classes.dex */
public final class ba {
    private final bb lF;

    private ba(bb bbVar) {
        this.lF = bbVar;
    }

    public static ba p(Bundle bundle) {
        bc bcVar;
        if (bundle == null) {
            return null;
        }
        if (bundle.getInt("android.media.token.type", -1) == 100) {
            return new ba(new bd(MediaSessionCompat.Token.q(bundle.getBundle("android.media.token.LEGACY"))));
        }
        if (bundle == null) {
            bcVar = null;
        } else {
            int i = bundle.getInt("android.media.token.uid");
            int i2 = bundle.getInt("android.media.token.type", -1);
            String string = bundle.getString("android.media.token.package_name");
            String string2 = bundle.getString("android.media.token.service_name");
            String string3 = bundle.getString("android.media.token.session_id");
            h hVarB = i.b(android.support.v4.app.f.a(bundle, "android.media.token.session_binder"));
            switch (i2) {
                case 0:
                    if (hVarB == null) {
                        throw new IllegalArgumentException("Unexpected token for session, binder=" + hVarB);
                    }
                    break;
                case 1:
                case 2:
                    if (TextUtils.isEmpty(string2)) {
                        throw new IllegalArgumentException("Session service needs service name");
                    }
                    break;
                default:
                    throw new IllegalArgumentException("Invalid type");
            }
            if (TextUtils.isEmpty(string) || string3 == null) {
                throw new IllegalArgumentException("Package name nor ID cannot be null.");
            }
            bcVar = new bc(i, i2, string, string2, string3, hVarB);
        }
        return new ba(bcVar);
    }

    public final boolean equals(Object obj) {
        if (obj instanceof ba) {
            return this.lF.equals(((ba) obj).lF);
        }
        return false;
    }

    public final int hashCode() {
        return this.lF.hashCode();
    }

    public final String toString() {
        return this.lF.toString();
    }
}
