package androidx.versionedparcelable;

import android.os.Parcel;
import android.util.SparseIntArray;

/* JADX INFO: loaded from: classes.dex */
final class c extends b {
    private final int mEnd;
    private final int mOffset;
    private final Parcel mParcel;
    private final SparseIntArray qg;
    private final String qh;
    private int qi;
    private int qj;

    c(Parcel parcel) {
        this(parcel, parcel.dataPosition(), parcel.dataSize(), "");
    }

    private c(Parcel parcel, int i, int i2, String str) {
        this.qg = new SparseIntArray();
        this.qi = -1;
        this.qj = 0;
        this.mParcel = parcel;
        this.mOffset = i;
        this.mEnd = i2;
        this.qj = this.mOffset;
        this.qh = str;
    }

    @Override // androidx.versionedparcelable.b
    public final void cM() {
        if (this.qi >= 0) {
            int i = this.qg.get(this.qi);
            int iDataPosition = this.mParcel.dataPosition();
            this.mParcel.setDataPosition(i);
            this.mParcel.writeInt(iDataPosition - i);
            this.mParcel.setDataPosition(iDataPosition);
        }
    }

    @Override // androidx.versionedparcelable.b
    protected final b cN() {
        return new c(this.mParcel, this.mParcel.dataPosition(), this.qj == this.mOffset ? this.mEnd : this.qj, this.qh + "  ");
    }

    @Override // androidx.versionedparcelable.b
    public final String readString() {
        return this.mParcel.readString();
    }

    @Override // androidx.versionedparcelable.b
    public final void writeString(String str) {
        this.mParcel.writeString(str);
    }
}
