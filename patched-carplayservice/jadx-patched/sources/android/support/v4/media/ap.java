package android.support.v4.media;

import android.os.Bundle;
import android.text.TextUtils;
import java.util.UUID;

/* JADX INFO: loaded from: classes.dex */
public final class ap {
    private final UUID ln;
    private aq lo;
    private d lp;
    private final int mFlags;
    private final String mId;

    private ap(String str, aq aqVar, int i, UUID uuid) {
        if (str == null) {
            throw new IllegalArgumentException("mediaId shouldn't be null");
        }
        if (aqVar != null) {
            CharSequence charSequence = aqVar.lu.getCharSequence("android.media.metadata.MEDIA_ID");
            if (!TextUtils.equals(str, charSequence != null ? charSequence.toString() : null)) {
                throw new IllegalArgumentException("metadata's id should be matched with the mediaid");
            }
        }
        this.mId = str;
        this.lp = null;
        this.lo = aqVar;
        this.mFlags = i;
        this.ln = uuid == null ? UUID.randomUUID() : uuid;
    }

    public static ap j(Bundle bundle) {
        if (bundle == null) {
            return null;
        }
        UUID uuidFromString = UUID.fromString(bundle.getString("android.media.mediaitem2.uuid"));
        if (bundle == null) {
            return null;
        }
        String string = bundle.getString("android.media.mediaitem2.id");
        Bundle bundle2 = bundle.getBundle("android.media.mediaitem2.metadata");
        return new ap(string, bundle2 != null ? aq.k(bundle2) : null, bundle.getInt("android.media.mediaitem2.flags"), uuidFromString);
    }

    public final boolean equals(Object obj) {
        if (obj instanceof ap) {
            return this.ln.equals(((ap) obj).ln);
        }
        return false;
    }

    public final int hashCode() {
        return this.ln.hashCode();
    }

    public final String toString() {
        return "MediaItem2{mFlags=" + this.mFlags + ", mMetadata=" + this.lo + '}';
    }
}
