package android.support.v4.media;

import android.net.Uri;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import android.os.ResultReceiver;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
final class j implements h {
    private IBinder kj;

    j(IBinder iBinder) {
        this.kj = iBinder;
    }

    @Override // android.support.v4.media.h
    public final void a(e eVar) {
        Parcel parcelObtain = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("android.support.v4.media.IMediaSession2");
            parcelObtain.writeStrongBinder(eVar != null ? eVar.asBinder() : null);
            this.kj.transact(2, parcelObtain, null, 1);
        } finally {
            parcelObtain.recycle();
        }
    }

    @Override // android.support.v4.media.h
    public final void a(e eVar, float f) {
        Parcel parcelObtain = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("android.support.v4.media.IMediaSession2");
            parcelObtain.writeStrongBinder(eVar != null ? eVar.asBinder() : null);
            parcelObtain.writeFloat(f);
            this.kj.transact(20, parcelObtain, null, 1);
        } finally {
            parcelObtain.recycle();
        }
    }

    @Override // android.support.v4.media.h
    public final void a(e eVar, int i) {
        Parcel parcelObtain = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("android.support.v4.media.IMediaSession2");
            parcelObtain.writeStrongBinder(eVar != null ? eVar.asBinder() : null);
            parcelObtain.writeInt(i);
            this.kj.transact(29, parcelObtain, null, 1);
        } finally {
            parcelObtain.recycle();
        }
    }

    @Override // android.support.v4.media.h
    public final void a(e eVar, int i, int i2) {
        Parcel parcelObtain = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("android.support.v4.media.IMediaSession2");
            parcelObtain.writeStrongBinder(eVar != null ? eVar.asBinder() : null);
            parcelObtain.writeInt(i);
            parcelObtain.writeInt(i2);
            this.kj.transact(3, parcelObtain, null, 1);
        } finally {
            parcelObtain.recycle();
        }
    }

    @Override // android.support.v4.media.h
    public final void a(e eVar, int i, Bundle bundle) {
        Parcel parcelObtain = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("android.support.v4.media.IMediaSession2");
            parcelObtain.writeStrongBinder(eVar != null ? eVar.asBinder() : null);
            parcelObtain.writeInt(i);
            if (bundle != null) {
                parcelObtain.writeInt(1);
                bundle.writeToParcel(parcelObtain, 0);
            } else {
                parcelObtain.writeInt(0);
            }
            this.kj.transact(23, parcelObtain, null, 1);
        } finally {
            parcelObtain.recycle();
        }
    }

    @Override // android.support.v4.media.h
    public final void a(e eVar, long j) {
        Parcel parcelObtain = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("android.support.v4.media.IMediaSession2");
            parcelObtain.writeStrongBinder(eVar != null ? eVar.asBinder() : null);
            parcelObtain.writeLong(j);
            this.kj.transact(11, parcelObtain, null, 1);
        } finally {
            parcelObtain.recycle();
        }
    }

    @Override // android.support.v4.media.h
    public final void a(e eVar, Uri uri, Bundle bundle) {
        Parcel parcelObtain = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("android.support.v4.media.IMediaSession2");
            parcelObtain.writeStrongBinder(eVar != null ? eVar.asBinder() : null);
            if (uri != null) {
                parcelObtain.writeInt(1);
                uri.writeToParcel(parcelObtain, 0);
            } else {
                parcelObtain.writeInt(0);
            }
            if (bundle != null) {
                parcelObtain.writeInt(1);
                bundle.writeToParcel(parcelObtain, 0);
            } else {
                parcelObtain.writeInt(0);
            }
            this.kj.transact(13, parcelObtain, null, 1);
        } finally {
            parcelObtain.recycle();
        }
    }

    @Override // android.support.v4.media.h
    public final void a(e eVar, Bundle bundle) {
        Parcel parcelObtain = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("android.support.v4.media.IMediaSession2");
            parcelObtain.writeStrongBinder(eVar != null ? eVar.asBinder() : null);
            if (bundle != null) {
                parcelObtain.writeInt(1);
                bundle.writeToParcel(parcelObtain, 0);
            } else {
                parcelObtain.writeInt(0);
            }
            this.kj.transact(22, parcelObtain, null, 1);
        } finally {
            parcelObtain.recycle();
        }
    }

    @Override // android.support.v4.media.h
    public final void a(e eVar, Bundle bundle, Bundle bundle2, ResultReceiver resultReceiver) {
        Parcel parcelObtain = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("android.support.v4.media.IMediaSession2");
            parcelObtain.writeStrongBinder(eVar != null ? eVar.asBinder() : null);
            if (bundle != null) {
                parcelObtain.writeInt(1);
                bundle.writeToParcel(parcelObtain, 0);
            } else {
                parcelObtain.writeInt(0);
            }
            if (bundle2 != null) {
                parcelObtain.writeInt(1);
                bundle2.writeToParcel(parcelObtain, 0);
            } else {
                parcelObtain.writeInt(0);
            }
            if (resultReceiver != null) {
                parcelObtain.writeInt(1);
                resultReceiver.writeToParcel(parcelObtain, 0);
            } else {
                parcelObtain.writeInt(0);
            }
            this.kj.transact(12, parcelObtain, null, 1);
        } finally {
            parcelObtain.recycle();
        }
    }

    @Override // android.support.v4.media.h
    public final void a(e eVar, String str) {
        Parcel parcelObtain = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("android.support.v4.media.IMediaSession2");
            parcelObtain.writeStrongBinder(eVar != null ? eVar.asBinder() : null);
            parcelObtain.writeString(str);
            this.kj.transact(1, parcelObtain, null, 1);
        } finally {
            parcelObtain.recycle();
        }
    }

    @Override // android.support.v4.media.h
    public final void a(e eVar, String str, int i, int i2, Bundle bundle) {
        Parcel parcelObtain = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("android.support.v4.media.IMediaSession2");
            parcelObtain.writeStrongBinder(eVar != null ? eVar.asBinder() : null);
            parcelObtain.writeString(str);
            parcelObtain.writeInt(i);
            parcelObtain.writeInt(i2);
            if (bundle != null) {
                parcelObtain.writeInt(1);
                bundle.writeToParcel(parcelObtain, 0);
            } else {
                parcelObtain.writeInt(0);
            }
            this.kj.transact(36, parcelObtain, null, 1);
        } finally {
            parcelObtain.recycle();
        }
    }

    @Override // android.support.v4.media.h
    public final void a(e eVar, String str, Bundle bundle) {
        Parcel parcelObtain = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("android.support.v4.media.IMediaSession2");
            parcelObtain.writeStrongBinder(eVar != null ? eVar.asBinder() : null);
            parcelObtain.writeString(str);
            if (bundle != null) {
                parcelObtain.writeInt(1);
                bundle.writeToParcel(parcelObtain, 0);
            } else {
                parcelObtain.writeInt(0);
            }
            this.kj.transact(14, parcelObtain, null, 1);
        } finally {
            parcelObtain.recycle();
        }
    }

    @Override // android.support.v4.media.h
    public final void a(e eVar, List list, Bundle bundle) {
        Parcel parcelObtain = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("android.support.v4.media.IMediaSession2");
            parcelObtain.writeStrongBinder(eVar != null ? eVar.asBinder() : null);
            parcelObtain.writeTypedList(list);
            if (bundle != null) {
                parcelObtain.writeInt(1);
                bundle.writeToParcel(parcelObtain, 0);
            } else {
                parcelObtain.writeInt(0);
            }
            this.kj.transact(21, parcelObtain, null, 1);
        } finally {
            parcelObtain.recycle();
        }
    }

    @Override // android.os.IInterface
    public final IBinder asBinder() {
        return this.kj;
    }

    @Override // android.support.v4.media.h
    public final void b(e eVar) {
        Parcel parcelObtain = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("android.support.v4.media.IMediaSession2");
            parcelObtain.writeStrongBinder(eVar != null ? eVar.asBinder() : null);
            this.kj.transact(5, parcelObtain, null, 1);
        } finally {
            parcelObtain.recycle();
        }
    }

    @Override // android.support.v4.media.h
    public final void b(e eVar, int i) {
        Parcel parcelObtain = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("android.support.v4.media.IMediaSession2");
            parcelObtain.writeStrongBinder(eVar != null ? eVar.asBinder() : null);
            parcelObtain.writeInt(i);
            this.kj.transact(30, parcelObtain, null, 1);
        } finally {
            parcelObtain.recycle();
        }
    }

    @Override // android.support.v4.media.h
    public final void b(e eVar, int i, int i2) {
        Parcel parcelObtain = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("android.support.v4.media.IMediaSession2");
            parcelObtain.writeStrongBinder(eVar != null ? eVar.asBinder() : null);
            parcelObtain.writeInt(i);
            parcelObtain.writeInt(i2);
            this.kj.transact(4, parcelObtain, null, 1);
        } finally {
            parcelObtain.recycle();
        }
    }

    @Override // android.support.v4.media.h
    public final void b(e eVar, int i, Bundle bundle) {
        Parcel parcelObtain = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("android.support.v4.media.IMediaSession2");
            parcelObtain.writeStrongBinder(eVar != null ? eVar.asBinder() : null);
            parcelObtain.writeInt(i);
            if (bundle != null) {
                parcelObtain.writeInt(1);
                bundle.writeToParcel(parcelObtain, 0);
            } else {
                parcelObtain.writeInt(0);
            }
            this.kj.transact(25, parcelObtain, null, 1);
        } finally {
            parcelObtain.recycle();
        }
    }

    @Override // android.support.v4.media.h
    public final void b(e eVar, Uri uri, Bundle bundle) {
        Parcel parcelObtain = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("android.support.v4.media.IMediaSession2");
            parcelObtain.writeStrongBinder(eVar != null ? eVar.asBinder() : null);
            if (uri != null) {
                parcelObtain.writeInt(1);
                uri.writeToParcel(parcelObtain, 0);
            } else {
                parcelObtain.writeInt(0);
            }
            if (bundle != null) {
                parcelObtain.writeInt(1);
                bundle.writeToParcel(parcelObtain, 0);
            } else {
                parcelObtain.writeInt(0);
            }
            this.kj.transact(16, parcelObtain, null, 1);
        } finally {
            parcelObtain.recycle();
        }
    }

    @Override // android.support.v4.media.h
    public final void b(e eVar, Bundle bundle) {
        Parcel parcelObtain = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("android.support.v4.media.IMediaSession2");
            parcelObtain.writeStrongBinder(eVar != null ? eVar.asBinder() : null);
            if (bundle != null) {
                parcelObtain.writeInt(1);
                bundle.writeToParcel(parcelObtain, 0);
            } else {
                parcelObtain.writeInt(0);
            }
            this.kj.transact(24, parcelObtain, null, 1);
        } finally {
            parcelObtain.recycle();
        }
    }

    @Override // android.support.v4.media.h
    public final void b(e eVar, String str) {
        Parcel parcelObtain = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("android.support.v4.media.IMediaSession2");
            parcelObtain.writeStrongBinder(eVar != null ? eVar.asBinder() : null);
            parcelObtain.writeString(str);
            this.kj.transact(35, parcelObtain, null, 1);
        } finally {
            parcelObtain.recycle();
        }
    }

    @Override // android.support.v4.media.h
    public final void b(e eVar, String str, int i, int i2, Bundle bundle) {
        Parcel parcelObtain = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("android.support.v4.media.IMediaSession2");
            parcelObtain.writeStrongBinder(eVar != null ? eVar.asBinder() : null);
            parcelObtain.writeString(str);
            parcelObtain.writeInt(i);
            parcelObtain.writeInt(i2);
            if (bundle != null) {
                parcelObtain.writeInt(1);
                bundle.writeToParcel(parcelObtain, 0);
            } else {
                parcelObtain.writeInt(0);
            }
            this.kj.transact(38, parcelObtain, null, 1);
        } finally {
            parcelObtain.recycle();
        }
    }

    @Override // android.support.v4.media.h
    public final void b(e eVar, String str, Bundle bundle) {
        Parcel parcelObtain = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("android.support.v4.media.IMediaSession2");
            parcelObtain.writeStrongBinder(eVar != null ? eVar.asBinder() : null);
            parcelObtain.writeString(str);
            if (bundle != null) {
                parcelObtain.writeInt(1);
                bundle.writeToParcel(parcelObtain, 0);
            } else {
                parcelObtain.writeInt(0);
            }
            this.kj.transact(15, parcelObtain, null, 1);
        } finally {
            parcelObtain.recycle();
        }
    }

    @Override // android.support.v4.media.h
    public final void c(e eVar) {
        Parcel parcelObtain = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("android.support.v4.media.IMediaSession2");
            parcelObtain.writeStrongBinder(eVar != null ? eVar.asBinder() : null);
            this.kj.transact(6, parcelObtain, null, 1);
        } finally {
            parcelObtain.recycle();
        }
    }

    @Override // android.support.v4.media.h
    public final void c(e eVar, Bundle bundle) {
        Parcel parcelObtain = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("android.support.v4.media.IMediaSession2");
            parcelObtain.writeStrongBinder(eVar != null ? eVar.asBinder() : null);
            if (bundle != null) {
                parcelObtain.writeInt(1);
                bundle.writeToParcel(parcelObtain, 0);
            } else {
                parcelObtain.writeInt(0);
            }
            this.kj.transact(26, parcelObtain, null, 1);
        } finally {
            parcelObtain.recycle();
        }
    }

    @Override // android.support.v4.media.h
    public final void c(e eVar, String str) {
        Parcel parcelObtain = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("android.support.v4.media.IMediaSession2");
            parcelObtain.writeStrongBinder(eVar != null ? eVar.asBinder() : null);
            parcelObtain.writeString(str);
            this.kj.transact(40, parcelObtain, null, 1);
        } finally {
            parcelObtain.recycle();
        }
    }

    @Override // android.support.v4.media.h
    public final void c(e eVar, String str, Bundle bundle) {
        Parcel parcelObtain = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("android.support.v4.media.IMediaSession2");
            parcelObtain.writeStrongBinder(eVar != null ? eVar.asBinder() : null);
            parcelObtain.writeString(str);
            if (bundle != null) {
                parcelObtain.writeInt(1);
                bundle.writeToParcel(parcelObtain, 0);
            } else {
                parcelObtain.writeInt(0);
            }
            this.kj.transact(17, parcelObtain, null, 1);
        } finally {
            parcelObtain.recycle();
        }
    }

    @Override // android.support.v4.media.h
    public final void d(e eVar) {
        Parcel parcelObtain = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("android.support.v4.media.IMediaSession2");
            parcelObtain.writeStrongBinder(eVar != null ? eVar.asBinder() : null);
            this.kj.transact(7, parcelObtain, null, 1);
        } finally {
            parcelObtain.recycle();
        }
    }

    @Override // android.support.v4.media.h
    public final void d(e eVar, Bundle bundle) {
        Parcel parcelObtain = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("android.support.v4.media.IMediaSession2");
            parcelObtain.writeStrongBinder(eVar != null ? eVar.asBinder() : null);
            if (bundle != null) {
                parcelObtain.writeInt(1);
                bundle.writeToParcel(parcelObtain, 0);
            } else {
                parcelObtain.writeInt(0);
            }
            this.kj.transact(33, parcelObtain, null, 1);
        } finally {
            parcelObtain.recycle();
        }
    }

    @Override // android.support.v4.media.h
    public final void d(e eVar, String str, Bundle bundle) {
        Parcel parcelObtain = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("android.support.v4.media.IMediaSession2");
            parcelObtain.writeStrongBinder(eVar != null ? eVar.asBinder() : null);
            parcelObtain.writeString(str);
            if (bundle != null) {
                parcelObtain.writeInt(1);
                bundle.writeToParcel(parcelObtain, 0);
            } else {
                parcelObtain.writeInt(0);
            }
            this.kj.transact(18, parcelObtain, null, 1);
        } finally {
            parcelObtain.recycle();
        }
    }

    @Override // android.support.v4.media.h
    public final void e(e eVar) {
        Parcel parcelObtain = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("android.support.v4.media.IMediaSession2");
            parcelObtain.writeStrongBinder(eVar != null ? eVar.asBinder() : null);
            this.kj.transact(8, parcelObtain, null, 1);
        } finally {
            parcelObtain.recycle();
        }
    }

    @Override // android.support.v4.media.h
    public final void e(e eVar, Bundle bundle) {
        Parcel parcelObtain = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("android.support.v4.media.IMediaSession2");
            parcelObtain.writeStrongBinder(eVar != null ? eVar.asBinder() : null);
            if (bundle != null) {
                parcelObtain.writeInt(1);
                bundle.writeToParcel(parcelObtain, 0);
            } else {
                parcelObtain.writeInt(0);
            }
            this.kj.transact(34, parcelObtain, null, 1);
        } finally {
            parcelObtain.recycle();
        }
    }

    @Override // android.support.v4.media.h
    public final void e(e eVar, String str, Bundle bundle) {
        Parcel parcelObtain = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("android.support.v4.media.IMediaSession2");
            parcelObtain.writeStrongBinder(eVar != null ? eVar.asBinder() : null);
            parcelObtain.writeString(str);
            if (bundle != null) {
                parcelObtain.writeInt(1);
                bundle.writeToParcel(parcelObtain, 0);
            } else {
                parcelObtain.writeInt(0);
            }
            this.kj.transact(19, parcelObtain, null, 1);
        } finally {
            parcelObtain.recycle();
        }
    }

    @Override // android.support.v4.media.h
    public final void f(e eVar) {
        Parcel parcelObtain = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("android.support.v4.media.IMediaSession2");
            parcelObtain.writeStrongBinder(eVar != null ? eVar.asBinder() : null);
            this.kj.transact(9, parcelObtain, null, 1);
        } finally {
            parcelObtain.recycle();
        }
    }

    @Override // android.support.v4.media.h
    public final void f(e eVar, String str, Bundle bundle) {
        Parcel parcelObtain = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("android.support.v4.media.IMediaSession2");
            parcelObtain.writeStrongBinder(eVar != null ? eVar.asBinder() : null);
            parcelObtain.writeString(str);
            if (bundle != null) {
                parcelObtain.writeInt(1);
                bundle.writeToParcel(parcelObtain, 0);
            } else {
                parcelObtain.writeInt(0);
            }
            this.kj.transact(37, parcelObtain, null, 1);
        } finally {
            parcelObtain.recycle();
        }
    }

    @Override // android.support.v4.media.h
    public final void g(e eVar) {
        Parcel parcelObtain = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("android.support.v4.media.IMediaSession2");
            parcelObtain.writeStrongBinder(eVar != null ? eVar.asBinder() : null);
            this.kj.transact(10, parcelObtain, null, 1);
        } finally {
            parcelObtain.recycle();
        }
    }

    @Override // android.support.v4.media.h
    public final void g(e eVar, String str, Bundle bundle) {
        Parcel parcelObtain = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("android.support.v4.media.IMediaSession2");
            parcelObtain.writeStrongBinder(eVar != null ? eVar.asBinder() : null);
            parcelObtain.writeString(str);
            if (bundle != null) {
                parcelObtain.writeInt(1);
                bundle.writeToParcel(parcelObtain, 0);
            } else {
                parcelObtain.writeInt(0);
            }
            this.kj.transact(39, parcelObtain, null, 1);
        } finally {
            parcelObtain.recycle();
        }
    }

    @Override // android.support.v4.media.h
    public final void h(e eVar) {
        Parcel parcelObtain = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("android.support.v4.media.IMediaSession2");
            parcelObtain.writeStrongBinder(eVar != null ? eVar.asBinder() : null);
            this.kj.transact(27, parcelObtain, null, 1);
        } finally {
            parcelObtain.recycle();
        }
    }

    @Override // android.support.v4.media.h
    public final void i(e eVar) {
        Parcel parcelObtain = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("android.support.v4.media.IMediaSession2");
            parcelObtain.writeStrongBinder(eVar != null ? eVar.asBinder() : null);
            this.kj.transact(28, parcelObtain, null, 1);
        } finally {
            parcelObtain.recycle();
        }
    }

    @Override // android.support.v4.media.h
    public final void j(e eVar) {
        Parcel parcelObtain = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("android.support.v4.media.IMediaSession2");
            parcelObtain.writeStrongBinder(eVar != null ? eVar.asBinder() : null);
            this.kj.transact(31, parcelObtain, null, 1);
        } finally {
            parcelObtain.recycle();
        }
    }

    @Override // android.support.v4.media.h
    public final void k(e eVar) {
        Parcel parcelObtain = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("android.support.v4.media.IMediaSession2");
            parcelObtain.writeStrongBinder(eVar != null ? eVar.asBinder() : null);
            this.kj.transact(32, parcelObtain, null, 1);
        } finally {
            parcelObtain.recycle();
        }
    }
}
