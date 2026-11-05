package android.support.v4.app;

import android.os.Parcel;
import android.os.Parcelable;

/* JADX INFO: loaded from: classes.dex */
final class FragmentManagerState implements Parcelable {
    public static final Parcelable.Creator CREATOR = new al();
    FragmentState[] iZ;
    BackStackState[] ja;
    int[] mAdded;
    int mNextFragmentIndex;
    int mPrimaryNavActiveIndex;

    public FragmentManagerState() {
        this.mPrimaryNavActiveIndex = -1;
    }

    public FragmentManagerState(Parcel parcel) {
        this.mPrimaryNavActiveIndex = -1;
        this.iZ = (FragmentState[]) parcel.createTypedArray(FragmentState.CREATOR);
        this.mAdded = parcel.createIntArray();
        this.ja = (BackStackState[]) parcel.createTypedArray(BackStackState.CREATOR);
        this.mPrimaryNavActiveIndex = parcel.readInt();
        this.mNextFragmentIndex = parcel.readInt();
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.writeTypedArray(this.iZ, i);
        parcel.writeIntArray(this.mAdded);
        parcel.writeTypedArray(this.ja, i);
        parcel.writeInt(this.mPrimaryNavActiveIndex);
        parcel.writeInt(this.mNextFragmentIndex);
    }
}
