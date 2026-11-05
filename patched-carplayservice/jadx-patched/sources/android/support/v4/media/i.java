package android.support.v4.media;

import android.net.Uri;
import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.ResultReceiver;

/* JADX INFO: loaded from: classes.dex */
public abstract class i extends Binder implements h {
    public static h b(IBinder iBinder) {
        if (iBinder == null) {
            return null;
        }
        IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("android.support.v4.media.IMediaSession2");
        return (iInterfaceQueryLocalInterface == null || !(iInterfaceQueryLocalInterface instanceof h)) ? new j(iBinder) : (h) iInterfaceQueryLocalInterface;
    }

    @Override // android.os.Binder
    public boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) {
        if (i == 1598968902) {
            parcel2.writeString("android.support.v4.media.IMediaSession2");
            return true;
        }
        switch (i) {
            case 1:
                parcel.enforceInterface("android.support.v4.media.IMediaSession2");
                a(f.a(parcel.readStrongBinder()), parcel.readString());
                return true;
            case 2:
                parcel.enforceInterface("android.support.v4.media.IMediaSession2");
                a(f.a(parcel.readStrongBinder()));
                return true;
            case 3:
                parcel.enforceInterface("android.support.v4.media.IMediaSession2");
                a(f.a(parcel.readStrongBinder()), parcel.readInt(), parcel.readInt());
                return true;
            case 4:
                parcel.enforceInterface("android.support.v4.media.IMediaSession2");
                b(f.a(parcel.readStrongBinder()), parcel.readInt(), parcel.readInt());
                return true;
            case 5:
                parcel.enforceInterface("android.support.v4.media.IMediaSession2");
                b(f.a(parcel.readStrongBinder()));
                return true;
            case 6:
                parcel.enforceInterface("android.support.v4.media.IMediaSession2");
                c(f.a(parcel.readStrongBinder()));
                return true;
            case 7:
                parcel.enforceInterface("android.support.v4.media.IMediaSession2");
                d(f.a(parcel.readStrongBinder()));
                return true;
            case 8:
                parcel.enforceInterface("android.support.v4.media.IMediaSession2");
                e(f.a(parcel.readStrongBinder()));
                return true;
            case 9:
                parcel.enforceInterface("android.support.v4.media.IMediaSession2");
                f(f.a(parcel.readStrongBinder()));
                return true;
            case 10:
                parcel.enforceInterface("android.support.v4.media.IMediaSession2");
                g(f.a(parcel.readStrongBinder()));
                return true;
            case 11:
                parcel.enforceInterface("android.support.v4.media.IMediaSession2");
                a(f.a(parcel.readStrongBinder()), parcel.readLong());
                return true;
            case 12:
                parcel.enforceInterface("android.support.v4.media.IMediaSession2");
                a(f.a(parcel.readStrongBinder()), parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel) : null, parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel) : null, parcel.readInt() != 0 ? (ResultReceiver) ResultReceiver.CREATOR.createFromParcel(parcel) : null);
                return true;
            case 13:
                parcel.enforceInterface("android.support.v4.media.IMediaSession2");
                a(f.a(parcel.readStrongBinder()), parcel.readInt() != 0 ? (Uri) Uri.CREATOR.createFromParcel(parcel) : null, parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel) : null);
                return true;
            case 14:
                parcel.enforceInterface("android.support.v4.media.IMediaSession2");
                a(f.a(parcel.readStrongBinder()), parcel.readString(), parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel) : null);
                return true;
            case 15:
                parcel.enforceInterface("android.support.v4.media.IMediaSession2");
                b(f.a(parcel.readStrongBinder()), parcel.readString(), parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel) : null);
                return true;
            case 16:
                parcel.enforceInterface("android.support.v4.media.IMediaSession2");
                b(f.a(parcel.readStrongBinder()), parcel.readInt() != 0 ? (Uri) Uri.CREATOR.createFromParcel(parcel) : null, parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel) : null);
                return true;
            case 17:
                parcel.enforceInterface("android.support.v4.media.IMediaSession2");
                c(f.a(parcel.readStrongBinder()), parcel.readString(), parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel) : null);
                return true;
            case 18:
                parcel.enforceInterface("android.support.v4.media.IMediaSession2");
                d(f.a(parcel.readStrongBinder()), parcel.readString(), parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel) : null);
                return true;
            case 19:
                parcel.enforceInterface("android.support.v4.media.IMediaSession2");
                e(f.a(parcel.readStrongBinder()), parcel.readString(), parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel) : null);
                return true;
            case 20:
                parcel.enforceInterface("android.support.v4.media.IMediaSession2");
                a(f.a(parcel.readStrongBinder()), parcel.readFloat());
                return true;
            case 21:
                parcel.enforceInterface("android.support.v4.media.IMediaSession2");
                a(f.a(parcel.readStrongBinder()), parcel.createTypedArrayList(Bundle.CREATOR), parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel) : null);
                return true;
            case 22:
                parcel.enforceInterface("android.support.v4.media.IMediaSession2");
                a(f.a(parcel.readStrongBinder()), parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel) : null);
                return true;
            case 23:
                parcel.enforceInterface("android.support.v4.media.IMediaSession2");
                a(f.a(parcel.readStrongBinder()), parcel.readInt(), parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel) : null);
                return true;
            case 24:
                parcel.enforceInterface("android.support.v4.media.IMediaSession2");
                b(f.a(parcel.readStrongBinder()), parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel) : null);
                return true;
            case 25:
                parcel.enforceInterface("android.support.v4.media.IMediaSession2");
                b(f.a(parcel.readStrongBinder()), parcel.readInt(), parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel) : null);
                return true;
            case 26:
                parcel.enforceInterface("android.support.v4.media.IMediaSession2");
                c(f.a(parcel.readStrongBinder()), parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel) : null);
                return true;
            case 27:
                parcel.enforceInterface("android.support.v4.media.IMediaSession2");
                h(f.a(parcel.readStrongBinder()));
                return true;
            case 28:
                parcel.enforceInterface("android.support.v4.media.IMediaSession2");
                i(f.a(parcel.readStrongBinder()));
                return true;
            case 29:
                parcel.enforceInterface("android.support.v4.media.IMediaSession2");
                a(f.a(parcel.readStrongBinder()), parcel.readInt());
                return true;
            case 30:
                parcel.enforceInterface("android.support.v4.media.IMediaSession2");
                b(f.a(parcel.readStrongBinder()), parcel.readInt());
                return true;
            case 31:
                parcel.enforceInterface("android.support.v4.media.IMediaSession2");
                j(f.a(parcel.readStrongBinder()));
                return true;
            case 32:
                parcel.enforceInterface("android.support.v4.media.IMediaSession2");
                k(f.a(parcel.readStrongBinder()));
                return true;
            case 33:
                parcel.enforceInterface("android.support.v4.media.IMediaSession2");
                d(f.a(parcel.readStrongBinder()), parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel) : null);
                return true;
            case 34:
                parcel.enforceInterface("android.support.v4.media.IMediaSession2");
                e(f.a(parcel.readStrongBinder()), parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel) : null);
                return true;
            case 35:
                parcel.enforceInterface("android.support.v4.media.IMediaSession2");
                b(f.a(parcel.readStrongBinder()), parcel.readString());
                return true;
            case 36:
                parcel.enforceInterface("android.support.v4.media.IMediaSession2");
                a(f.a(parcel.readStrongBinder()), parcel.readString(), parcel.readInt(), parcel.readInt(), parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel) : null);
                return true;
            case 37:
                parcel.enforceInterface("android.support.v4.media.IMediaSession2");
                f(f.a(parcel.readStrongBinder()), parcel.readString(), parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel) : null);
                return true;
            case 38:
                parcel.enforceInterface("android.support.v4.media.IMediaSession2");
                b(f.a(parcel.readStrongBinder()), parcel.readString(), parcel.readInt(), parcel.readInt(), parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel) : null);
                return true;
            case 39:
                parcel.enforceInterface("android.support.v4.media.IMediaSession2");
                g(f.a(parcel.readStrongBinder()), parcel.readString(), parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel) : null);
                return true;
            case 40:
                parcel.enforceInterface("android.support.v4.media.IMediaSession2");
                c(f.a(parcel.readStrongBinder()), parcel.readString());
                return true;
            default:
                return super.onTransact(i, parcel, parcel2, i2);
        }
    }
}
