package android.support.v4.media;

import android.os.Parcel;
import android.os.Parcelable;

/* JADX INFO: loaded from: classes.dex */
public final class RatingCompat implements Parcelable {
    public static final Parcelable.Creator CREATOR = new ax();
    private final int lA;
    private final float lB;

    RatingCompat(int i, float f) {
        this.lA = i;
        this.lB = f;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return this.lA;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Rating:style=");
        sb.append(this.lA);
        sb.append(" rating=");
        sb.append(this.lB < 0.0f ? "unrated" : String.valueOf(this.lB));
        return sb.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.writeInt(this.lA);
        parcel.writeFloat(this.lB);
    }
}
