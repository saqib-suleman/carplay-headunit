package android.support.v4.media.session;

import android.media.session.MediaSession;
import android.os.Build;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.ResultReceiver;
import android.support.v4.media.MediaDescriptionCompat;
import android.support.v4.media.ba;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public final class MediaSessionCompat {

    public final class QueueItem implements Parcelable {
        public static final Parcelable.Creator CREATOR = new q();
        private final MediaDescriptionCompat kl;
        private final long mId;
        private Object ma;

        QueueItem(Parcel parcel) {
            this.kl = (MediaDescriptionCompat) MediaDescriptionCompat.CREATOR.createFromParcel(parcel);
            this.mId = parcel.readLong();
        }

        private QueueItem(Object obj, MediaDescriptionCompat mediaDescriptionCompat, long j) {
            if (mediaDescriptionCompat == null) {
                throw new IllegalArgumentException("Description cannot be null.");
            }
            if (j == -1) {
                throw new IllegalArgumentException("Id cannot be QueueItem.UNKNOWN_ID");
            }
            this.kl = mediaDescriptionCompat;
            this.mId = j;
            this.ma = obj;
        }

        public static List d(List list) {
            QueueItem queueItem;
            if (list == null || Build.VERSION.SDK_INT < 21) {
                return null;
            }
            ArrayList arrayList = new ArrayList();
            for (Object obj : list) {
                if (obj == null || Build.VERSION.SDK_INT < 21) {
                    queueItem = null;
                } else {
                    MediaSession.QueueItem queueItem2 = (MediaSession.QueueItem) obj;
                    queueItem = new QueueItem(obj, MediaDescriptionCompat.h(queueItem2.getDescription()), queueItem2.getQueueId());
                }
                arrayList.add(queueItem);
            }
            return arrayList;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final String toString() {
            return "MediaSession.QueueItem {Description=" + this.kl + ", Id=" + this.mId + " }";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i) {
            this.kl.writeToParcel(parcel, i);
            parcel.writeLong(this.mId);
        }
    }

    public final class ResultReceiverWrapper implements Parcelable {
        public static final Parcelable.Creator CREATOR = new r();
        private ResultReceiver mResultReceiver;

        ResultReceiverWrapper(Parcel parcel) {
            this.mResultReceiver = (ResultReceiver) ResultReceiver.CREATOR.createFromParcel(parcel);
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i) {
            this.mResultReceiver.writeToParcel(parcel, i);
        }
    }

    public final class Token implements Parcelable {
        public static final Parcelable.Creator CREATOR = new s();
        private final Object mb;
        private d mc;
        private ba md;

        Token(Object obj) {
            this(obj, null, null);
        }

        private Token(Object obj, d dVar, ba baVar) {
            this.mb = obj;
            this.mc = dVar;
            this.md = baVar;
        }

        public static Token q(Bundle bundle) {
            if (bundle == null) {
                return null;
            }
            d dVarD = e.d(android.support.v4.app.f.a(bundle, "android.support.v4.media.session.EXTRA_BINDER"));
            ba baVarP = ba.p(bundle.getBundle("android.support.v4.media.session.SESSION_TOKEN2"));
            Token token = (Token) bundle.getParcelable("android.support.v4.media.session.TOKEN");
            if (token == null) {
                return null;
            }
            return new Token(token.mb, dVarD, baVarP);
        }

        public final void a(ba baVar) {
            this.md = baVar;
        }

        public final void a(d dVar) {
            this.mc = dVar;
        }

        public final d bY() {
            return this.mc;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof Token)) {
                return false;
            }
            Token token = (Token) obj;
            if (this.mb == null) {
                return token.mb == null;
            }
            if (token.mb == null) {
                return false;
            }
            return this.mb.equals(token.mb);
        }

        public final int hashCode() {
            if (this.mb == null) {
                return 0;
            }
            return this.mb.hashCode();
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i) {
            if (Build.VERSION.SDK_INT >= 21) {
                parcel.writeParcelable((Parcelable) this.mb, i);
            } else {
                parcel.writeStrongBinder((IBinder) this.mb);
            }
        }
    }
}
