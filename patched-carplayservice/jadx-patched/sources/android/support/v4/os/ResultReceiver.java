package android.support.v4.os;

import android.os.Bundle;
import android.os.Handler;
import android.os.Parcel;
import android.os.Parcelable;

/* JADX INFO: loaded from: classes.dex */
public class ResultReceiver implements Parcelable {
    public static final Parcelable.Creator CREATOR = new d();
    a mp;
    final boolean mLocal = false;
    final Handler mHandler = null;

    ResultReceiver(Parcel parcel) {
        this.mp = b.e(parcel.readStrongBinder());
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    protected void onReceiveResult(int i, Bundle bundle) {
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        synchronized (this) {
            if (this.mp == null) {
                this.mp = new e(this);
            }
            parcel.writeStrongBinder(this.mp.asBinder());
        }
    }
}
