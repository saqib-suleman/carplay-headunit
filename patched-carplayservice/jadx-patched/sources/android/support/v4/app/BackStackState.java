package android.support.v4.app;

import android.os.Parcel;
import android.os.Parcelable;
import android.text.TextUtils;
import android.util.Log;
import java.util.ArrayList;

/* JADX INFO: loaded from: classes.dex */
final class BackStackState implements Parcelable {
    public static final Parcelable.Creator CREATOR = new e();
    final int mBreadCrumbShortTitleRes;
    final CharSequence mBreadCrumbShortTitleText;
    final int mBreadCrumbTitleRes;
    final CharSequence mBreadCrumbTitleText;
    final int mIndex;
    final String mName;
    final int[] mOps;
    final boolean mReorderingAllowed;
    final ArrayList mSharedElementSourceNames;
    final ArrayList mSharedElementTargetNames;
    final int mTransition;
    final int mTransitionStyle;

    public BackStackState(Parcel parcel) {
        this.mOps = parcel.createIntArray();
        this.mTransition = parcel.readInt();
        this.mTransitionStyle = parcel.readInt();
        this.mName = parcel.readString();
        this.mIndex = parcel.readInt();
        this.mBreadCrumbTitleRes = parcel.readInt();
        this.mBreadCrumbTitleText = (CharSequence) TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(parcel);
        this.mBreadCrumbShortTitleRes = parcel.readInt();
        this.mBreadCrumbShortTitleText = (CharSequence) TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(parcel);
        this.mSharedElementSourceNames = parcel.createStringArrayList();
        this.mSharedElementTargetNames = parcel.createStringArrayList();
        this.mReorderingAllowed = parcel.readInt() != 0;
    }

    public BackStackState(c cVar) {
        int size = cVar.mOps.size();
        this.mOps = new int[size * 6];
        if (!cVar.mAddToBackStack) {
            throw new IllegalStateException("Not on back stack");
        }
        int i = 0;
        int i2 = 0;
        while (i < size) {
            d dVar = (d) cVar.mOps.get(i);
            int i3 = i2 + 1;
            this.mOps[i2] = dVar.cmd;
            int i4 = i3 + 1;
            this.mOps[i3] = dVar.hG != null ? dVar.hG.mIndex : -1;
            int i5 = i4 + 1;
            this.mOps[i4] = dVar.enterAnim;
            int i6 = i5 + 1;
            this.mOps[i5] = dVar.exitAnim;
            int i7 = i6 + 1;
            this.mOps[i6] = dVar.popEnterAnim;
            this.mOps[i7] = dVar.popExitAnim;
            i++;
            i2 = i7 + 1;
        }
        this.mTransition = cVar.mTransition;
        this.mTransitionStyle = cVar.mTransitionStyle;
        this.mName = cVar.mName;
        this.mIndex = cVar.mIndex;
        this.mBreadCrumbTitleRes = cVar.mBreadCrumbTitleRes;
        this.mBreadCrumbTitleText = cVar.mBreadCrumbTitleText;
        this.mBreadCrumbShortTitleRes = cVar.mBreadCrumbShortTitleRes;
        this.mBreadCrumbShortTitleText = cVar.mBreadCrumbShortTitleText;
        this.mSharedElementSourceNames = cVar.mSharedElementSourceNames;
        this.mSharedElementTargetNames = cVar.mSharedElementTargetNames;
        this.mReorderingAllowed = cVar.mReorderingAllowed;
    }

    public final c a(v vVar) {
        c cVar = new c(vVar);
        int i = 0;
        int i2 = 0;
        while (i < this.mOps.length) {
            d dVar = new d();
            int i3 = i + 1;
            dVar.cmd = this.mOps[i];
            if (v.DEBUG) {
                Log.v("FragmentManager", "Instantiate " + cVar + " op #" + i2 + " base fragment #" + this.mOps[i3]);
            }
            int i4 = i3 + 1;
            int i5 = this.mOps[i3];
            dVar.hG = i5 >= 0 ? (Fragment) vVar.mActive.get(i5) : null;
            int i6 = i4 + 1;
            dVar.enterAnim = this.mOps[i4];
            int i7 = i6 + 1;
            dVar.exitAnim = this.mOps[i6];
            int i8 = i7 + 1;
            dVar.popEnterAnim = this.mOps[i7];
            dVar.popExitAnim = this.mOps[i8];
            cVar.mEnterAnim = dVar.enterAnim;
            cVar.mExitAnim = dVar.exitAnim;
            cVar.mPopEnterAnim = dVar.popEnterAnim;
            cVar.mPopExitAnim = dVar.popExitAnim;
            cVar.a(dVar);
            i2++;
            i = i8 + 1;
        }
        cVar.mTransition = this.mTransition;
        cVar.mTransitionStyle = this.mTransitionStyle;
        cVar.mName = this.mName;
        cVar.mIndex = this.mIndex;
        cVar.mAddToBackStack = true;
        cVar.mBreadCrumbTitleRes = this.mBreadCrumbTitleRes;
        cVar.mBreadCrumbTitleText = this.mBreadCrumbTitleText;
        cVar.mBreadCrumbShortTitleRes = this.mBreadCrumbShortTitleRes;
        cVar.mBreadCrumbShortTitleText = this.mBreadCrumbShortTitleText;
        cVar.mSharedElementSourceNames = this.mSharedElementSourceNames;
        cVar.mSharedElementTargetNames = this.mSharedElementTargetNames;
        cVar.mReorderingAllowed = this.mReorderingAllowed;
        cVar.bumpBackStackNesting(1);
        return cVar;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.writeIntArray(this.mOps);
        parcel.writeInt(this.mTransition);
        parcel.writeInt(this.mTransitionStyle);
        parcel.writeString(this.mName);
        parcel.writeInt(this.mIndex);
        parcel.writeInt(this.mBreadCrumbTitleRes);
        TextUtils.writeToParcel(this.mBreadCrumbTitleText, parcel, 0);
        parcel.writeInt(this.mBreadCrumbShortTitleRes);
        TextUtils.writeToParcel(this.mBreadCrumbShortTitleText, parcel, 0);
        parcel.writeStringList(this.mSharedElementSourceNames);
        parcel.writeStringList(this.mSharedElementTargetNames);
        parcel.writeInt(this.mReorderingAllowed ? 1 : 0);
    }
}
