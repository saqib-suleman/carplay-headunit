package android.support.v4.media;

import android.support.v4.media.session.MediaSessionCompat;

/* JADX INFO: loaded from: classes.dex */
final class bd implements bb {
    private final MediaSessionCompat.Token lK;

    bd(MediaSessionCompat.Token token) {
        this.lK = token;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof bd) {
            return this.lK.equals(((bd) obj).lK);
        }
        return false;
    }

    public final int hashCode() {
        return this.lK.hashCode();
    }

    public final String toString() {
        return "SessionToken2 {legacyToken=" + this.lK + "}";
    }
}
