package android.support.v4.media;

import android.graphics.Bitmap;
import android.media.MediaDescription;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.text.TextUtils;

/* JADX INFO: loaded from: classes.dex */
public final class MediaDescriptionCompat implements Parcelable {
    public static final Parcelable.Creator CREATOR = new an();
    private final String li;
    private final CharSequence lj;
    private final Uri lk;
    private final Uri ll;
    private Object lm;
    private final CharSequence mDescription;
    private final Bundle mExtras;
    private final Bitmap mIcon;
    private final CharSequence mTitle;

    MediaDescriptionCompat(Parcel parcel) {
        this.li = parcel.readString();
        this.mTitle = (CharSequence) TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(parcel);
        this.lj = (CharSequence) TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(parcel);
        this.mDescription = (CharSequence) TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(parcel);
        this.mIcon = (Bitmap) parcel.readParcelable(null);
        this.lk = (Uri) parcel.readParcelable(null);
        this.mExtras = parcel.readBundle();
        this.ll = (Uri) parcel.readParcelable(null);
    }

    MediaDescriptionCompat(String str, CharSequence charSequence, CharSequence charSequence2, CharSequence charSequence3, Bitmap bitmap, Uri uri, Bundle bundle, Uri uri2) {
        this.li = str;
        this.mTitle = charSequence;
        this.lj = charSequence2;
        this.mDescription = charSequence3;
        this.mIcon = bitmap;
        this.lk = uri;
        this.mExtras = bundle;
        this.ll = uri2;
    }

    public static MediaDescriptionCompat h(Object obj) {
        Bundle bundle = null;
        if (obj == null || Build.VERSION.SDK_INT < 21) {
            return null;
        }
        ao aoVar = new ao();
        MediaDescription mediaDescription = (MediaDescription) obj;
        aoVar.t(mediaDescription.getMediaId());
        aoVar.a(mediaDescription.getTitle());
        aoVar.b(mediaDescription.getSubtitle());
        aoVar.c(mediaDescription.getDescription());
        aoVar.a(mediaDescription.getIconBitmap());
        aoVar.a(mediaDescription.getIconUri());
        Bundle extras = mediaDescription.getExtras();
        Uri uri = extras == null ? null : (Uri) extras.getParcelable("android.support.v4.media.description.MEDIA_URI");
        if (uri == null) {
            bundle = extras;
        } else if (!extras.containsKey("android.support.v4.media.description.NULL_BUNDLE_FLAG") || extras.size() != 2) {
            extras.remove("android.support.v4.media.description.MEDIA_URI");
            extras.remove("android.support.v4.media.description.NULL_BUNDLE_FLAG");
            bundle = extras;
        }
        aoVar.i(bundle);
        if (uri != null) {
            aoVar.b(uri);
        } else if (Build.VERSION.SDK_INT >= 23) {
            aoVar.b(mediaDescription.getMediaUri());
        }
        MediaDescriptionCompat mediaDescriptionCompatBN = aoVar.bN();
        mediaDescriptionCompatBN.lm = obj;
        return mediaDescriptionCompatBN;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final String toString() {
        return ((Object) this.mTitle) + ", " + ((Object) this.lj) + ", " + ((Object) this.mDescription);
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        if (Build.VERSION.SDK_INT < 21) {
            parcel.writeString(this.li);
            TextUtils.writeToParcel(this.mTitle, parcel, i);
            TextUtils.writeToParcel(this.lj, parcel, i);
            TextUtils.writeToParcel(this.mDescription, parcel, i);
            parcel.writeParcelable(this.mIcon, i);
            parcel.writeParcelable(this.lk, i);
            parcel.writeBundle(this.mExtras);
            parcel.writeParcelable(this.ll, i);
            return;
        }
        if (this.lm == null && Build.VERSION.SDK_INT >= 21) {
            MediaDescription.Builder builder = new MediaDescription.Builder();
            builder.setMediaId(this.li);
            builder.setTitle(this.mTitle);
            builder.setSubtitle(this.lj);
            builder.setDescription(this.mDescription);
            builder.setIconBitmap(this.mIcon);
            builder.setIconUri(this.lk);
            Bundle bundle = this.mExtras;
            if (Build.VERSION.SDK_INT < 23 && this.ll != null) {
                if (bundle == null) {
                    bundle = new Bundle();
                    bundle.putBoolean("android.support.v4.media.description.NULL_BUNDLE_FLAG", true);
                }
                bundle.putParcelable("android.support.v4.media.description.MEDIA_URI", this.ll);
            }
            builder.setExtras(bundle);
            if (Build.VERSION.SDK_INT >= 23) {
                builder.setMediaUri(this.ll);
            }
            this.lm = builder.build();
        }
        ((MediaDescription) this.lm).writeToParcel(parcel, i);
    }
}
