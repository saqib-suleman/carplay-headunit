package android.support.v4.media;

import android.app.PendingIntent;
import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.ResultReceiver;

/* JADX INFO: loaded from: classes.dex */
public abstract class f extends Binder implements e {
    public static e a(IBinder iBinder) {
        if (iBinder == null) {
            return null;
        }
        IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("android.support.v4.media.IMediaController2");
        return (iInterfaceQueryLocalInterface == null || !(iInterfaceQueryLocalInterface instanceof e)) ? new g(iBinder) : (e) iInterfaceQueryLocalInterface;
    }

    @Override // android.os.Binder
    public boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) {
        if (i == 1598968902) {
            parcel2.writeString("android.support.v4.media.IMediaController2");
            return true;
        }
        switch (i) {
            case 1:
                parcel.enforceInterface("android.support.v4.media.IMediaController2");
                c(parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel) : null);
                return true;
            case 2:
                parcel.enforceInterface("android.support.v4.media.IMediaController2");
                a(parcel.readLong(), parcel.readLong(), parcel.readInt());
                return true;
            case 3:
                parcel.enforceInterface("android.support.v4.media.IMediaController2");
                a(parcel.readLong(), parcel.readLong(), parcel.readFloat());
                return true;
            case 4:
                parcel.enforceInterface("android.support.v4.media.IMediaController2");
                a(parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel) : null, parcel.readInt(), parcel.readLong());
                return true;
            case 5:
                parcel.enforceInterface("android.support.v4.media.IMediaController2");
                a(parcel.createTypedArrayList(Bundle.CREATOR), parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel) : null);
                return true;
            case 6:
                parcel.enforceInterface("android.support.v4.media.IMediaController2");
                d(parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel) : null);
                return true;
            case 7:
                parcel.enforceInterface("android.support.v4.media.IMediaController2");
                e(parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel) : null);
                return true;
            case 8:
                parcel.enforceInterface("android.support.v4.media.IMediaController2");
                u(parcel.readInt());
                return true;
            case 9:
                parcel.enforceInterface("android.support.v4.media.IMediaController2");
                v(parcel.readInt());
                return true;
            case 10:
                parcel.enforceInterface("android.support.v4.media.IMediaController2");
                a(parcel.readLong(), parcel.readLong(), parcel.readLong());
                return true;
            case 11:
                parcel.enforceInterface("android.support.v4.media.IMediaController2");
                a(parcel.readInt(), parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel) : null);
                return true;
            case 12:
                parcel.enforceInterface("android.support.v4.media.IMediaController2");
                b(parcel.createTypedArrayList(Bundle.CREATOR));
                return true;
            case 13:
                parcel.enforceInterface("android.support.v4.media.IMediaController2");
                a(i.b(parcel.readStrongBinder()), parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel) : null, parcel.readInt(), parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel) : null, parcel.readLong(), parcel.readLong(), parcel.readFloat(), parcel.readLong(), parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel) : null, parcel.readInt(), parcel.readInt(), parcel.createTypedArrayList(Bundle.CREATOR), parcel.readInt() != 0 ? (PendingIntent) PendingIntent.CREATOR.createFromParcel(parcel) : null);
                return true;
            case 14:
                parcel.enforceInterface("android.support.v4.media.IMediaController2");
                onDisconnected();
                return true;
            case 15:
                parcel.enforceInterface("android.support.v4.media.IMediaController2");
                c(parcel.createTypedArrayList(Bundle.CREATOR));
                return true;
            case 16:
                parcel.enforceInterface("android.support.v4.media.IMediaController2");
                f(parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel) : null);
                return true;
            case 17:
                parcel.enforceInterface("android.support.v4.media.IMediaController2");
                a(parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel) : null, parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel) : null, parcel.readInt() != 0 ? (ResultReceiver) ResultReceiver.CREATOR.createFromParcel(parcel) : null);
                return true;
            case 18:
                parcel.enforceInterface("android.support.v4.media.IMediaController2");
                a(parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel) : null, parcel.readString(), parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel) : null);
                return true;
            case 19:
                parcel.enforceInterface("android.support.v4.media.IMediaController2");
                a(parcel.readString(), parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel) : null);
                return true;
            case 20:
                parcel.enforceInterface("android.support.v4.media.IMediaController2");
                a(parcel.readString(), parcel.readInt(), parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel) : null);
                return true;
            case 21:
                parcel.enforceInterface("android.support.v4.media.IMediaController2");
                a(parcel.readString(), parcel.readInt(), parcel.readInt(), parcel.createTypedArrayList(Bundle.CREATOR), parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel) : null);
                return true;
            case 22:
                parcel.enforceInterface("android.support.v4.media.IMediaController2");
                b(parcel.readString(), parcel.readInt(), parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel) : null);
                return true;
            case 23:
                parcel.enforceInterface("android.support.v4.media.IMediaController2");
                b(parcel.readString(), parcel.readInt(), parcel.readInt(), parcel.createTypedArrayList(Bundle.CREATOR), parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel) : null);
                return true;
            default:
                return super.onTransact(i, parcel, parcel2, i2);
        }
    }
}
