package android.support.v4.media.session;

import android.app.PendingIntent;
import android.net.Uri;
import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.support.v4.media.MediaDescriptionCompat;
import android.support.v4.media.MediaMetadataCompat;
import android.support.v4.media.RatingCompat;
import android.text.TextUtils;
import android.view.KeyEvent;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public abstract class e extends Binder implements d {
    public static d d(IBinder iBinder) {
        if (iBinder == null) {
            return null;
        }
        IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("android.support.v4.media.session.IMediaSession");
        return (iInterfaceQueryLocalInterface == null || !(iInterfaceQueryLocalInterface instanceof d)) ? new f(iBinder) : (d) iInterfaceQueryLocalInterface;
    }

    @Override // android.os.Binder
    public boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) {
        if (i == 51) {
            parcel.enforceInterface("android.support.v4.media.session.IMediaSession");
            a(parcel.readInt() != 0 ? (RatingCompat) RatingCompat.CREATOR.createFromParcel(parcel) : null, parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel) : null);
            parcel2.writeNoException();
            return true;
        }
        if (i == 1598968902) {
            parcel2.writeString("android.support.v4.media.session.IMediaSession");
            return true;
        }
        switch (i) {
            case 1:
                parcel.enforceInterface("android.support.v4.media.session.IMediaSession");
                a(parcel.readString(), parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel) : null, parcel.readInt() != 0 ? (MediaSessionCompat.ResultReceiverWrapper) MediaSessionCompat.ResultReceiverWrapper.CREATOR.createFromParcel(parcel) : null);
                parcel2.writeNoException();
                return true;
            case 2:
                parcel.enforceInterface("android.support.v4.media.session.IMediaSession");
                boolean zA = a(parcel.readInt() != 0 ? (KeyEvent) KeyEvent.CREATOR.createFromParcel(parcel) : null);
                parcel2.writeNoException();
                parcel2.writeInt(zA ? 1 : 0);
                return true;
            case 3:
                parcel.enforceInterface("android.support.v4.media.session.IMediaSession");
                a(b.c(parcel.readStrongBinder()));
                parcel2.writeNoException();
                return true;
            case 4:
                parcel.enforceInterface("android.support.v4.media.session.IMediaSession");
                b(b.c(parcel.readStrongBinder()));
                parcel2.writeNoException();
                return true;
            case 5:
                parcel.enforceInterface("android.support.v4.media.session.IMediaSession");
                boolean zIsTransportControlEnabled = isTransportControlEnabled();
                parcel2.writeNoException();
                parcel2.writeInt(zIsTransportControlEnabled ? 1 : 0);
                return true;
            case 6:
                parcel.enforceInterface("android.support.v4.media.session.IMediaSession");
                String packageName = getPackageName();
                parcel2.writeNoException();
                parcel2.writeString(packageName);
                return true;
            case 7:
                parcel.enforceInterface("android.support.v4.media.session.IMediaSession");
                String tag = getTag();
                parcel2.writeNoException();
                parcel2.writeString(tag);
                return true;
            case 8:
                parcel.enforceInterface("android.support.v4.media.session.IMediaSession");
                PendingIntent launchPendingIntent = getLaunchPendingIntent();
                parcel2.writeNoException();
                if (launchPendingIntent == null) {
                    parcel2.writeInt(0);
                    return true;
                }
                parcel2.writeInt(1);
                launchPendingIntent.writeToParcel(parcel2, 1);
                return true;
            case 9:
                parcel.enforceInterface("android.support.v4.media.session.IMediaSession");
                long flags = getFlags();
                parcel2.writeNoException();
                parcel2.writeLong(flags);
                return true;
            case 10:
                parcel.enforceInterface("android.support.v4.media.session.IMediaSession");
                ParcelableVolumeInfo parcelableVolumeInfoBP = bP();
                parcel2.writeNoException();
                if (parcelableVolumeInfoBP == null) {
                    parcel2.writeInt(0);
                    return true;
                }
                parcel2.writeInt(1);
                parcelableVolumeInfoBP.writeToParcel(parcel2, 1);
                return true;
            case 11:
                parcel.enforceInterface("android.support.v4.media.session.IMediaSession");
                a(parcel.readInt(), parcel.readInt(), parcel.readString());
                parcel2.writeNoException();
                return true;
            case 12:
                parcel.enforceInterface("android.support.v4.media.session.IMediaSession");
                b(parcel.readInt(), parcel.readInt(), parcel.readString());
                parcel2.writeNoException();
                return true;
            case 13:
                parcel.enforceInterface("android.support.v4.media.session.IMediaSession");
                play();
                parcel2.writeNoException();
                return true;
            case 14:
                parcel.enforceInterface("android.support.v4.media.session.IMediaSession");
                playFromMediaId(parcel.readString(), parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel) : null);
                parcel2.writeNoException();
                return true;
            case 15:
                parcel.enforceInterface("android.support.v4.media.session.IMediaSession");
                playFromSearch(parcel.readString(), parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel) : null);
                parcel2.writeNoException();
                return true;
            case 16:
                parcel.enforceInterface("android.support.v4.media.session.IMediaSession");
                playFromUri(parcel.readInt() != 0 ? (Uri) Uri.CREATOR.createFromParcel(parcel) : null, parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel) : null);
                parcel2.writeNoException();
                return true;
            case 17:
                parcel.enforceInterface("android.support.v4.media.session.IMediaSession");
                skipToQueueItem(parcel.readLong());
                parcel2.writeNoException();
                return true;
            case 18:
                parcel.enforceInterface("android.support.v4.media.session.IMediaSession");
                pause();
                parcel2.writeNoException();
                return true;
            case 19:
                parcel.enforceInterface("android.support.v4.media.session.IMediaSession");
                stop();
                parcel2.writeNoException();
                return true;
            case 20:
                parcel.enforceInterface("android.support.v4.media.session.IMediaSession");
                next();
                parcel2.writeNoException();
                return true;
            case 21:
                parcel.enforceInterface("android.support.v4.media.session.IMediaSession");
                previous();
                parcel2.writeNoException();
                return true;
            case 22:
                parcel.enforceInterface("android.support.v4.media.session.IMediaSession");
                fastForward();
                parcel2.writeNoException();
                return true;
            case 23:
                parcel.enforceInterface("android.support.v4.media.session.IMediaSession");
                rewind();
                parcel2.writeNoException();
                return true;
            case 24:
                parcel.enforceInterface("android.support.v4.media.session.IMediaSession");
                seekTo(parcel.readLong());
                parcel2.writeNoException();
                return true;
            case 25:
                parcel.enforceInterface("android.support.v4.media.session.IMediaSession");
                a(parcel.readInt() != 0 ? (RatingCompat) RatingCompat.CREATOR.createFromParcel(parcel) : null);
                parcel2.writeNoException();
                return true;
            case 26:
                parcel.enforceInterface("android.support.v4.media.session.IMediaSession");
                sendCustomAction(parcel.readString(), parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel) : null);
                parcel2.writeNoException();
                return true;
            case 27:
                parcel.enforceInterface("android.support.v4.media.session.IMediaSession");
                MediaMetadataCompat mediaMetadataCompatBQ = bQ();
                parcel2.writeNoException();
                if (mediaMetadataCompatBQ == null) {
                    parcel2.writeInt(0);
                    return true;
                }
                parcel2.writeInt(1);
                mediaMetadataCompatBQ.writeToParcel(parcel2, 1);
                return true;
            case 28:
                parcel.enforceInterface("android.support.v4.media.session.IMediaSession");
                PlaybackStateCompat playbackStateCompatBR = bR();
                parcel2.writeNoException();
                if (playbackStateCompatBR == null) {
                    parcel2.writeInt(0);
                    return true;
                }
                parcel2.writeInt(1);
                playbackStateCompatBR.writeToParcel(parcel2, 1);
                return true;
            case 29:
                parcel.enforceInterface("android.support.v4.media.session.IMediaSession");
                List queue = getQueue();
                parcel2.writeNoException();
                parcel2.writeTypedList(queue);
                return true;
            case 30:
                parcel.enforceInterface("android.support.v4.media.session.IMediaSession");
                CharSequence queueTitle = getQueueTitle();
                parcel2.writeNoException();
                if (queueTitle == null) {
                    parcel2.writeInt(0);
                    return true;
                }
                parcel2.writeInt(1);
                TextUtils.writeToParcel(queueTitle, parcel2, 1);
                return true;
            case 31:
                parcel.enforceInterface("android.support.v4.media.session.IMediaSession");
                Bundle extras = getExtras();
                parcel2.writeNoException();
                if (extras == null) {
                    parcel2.writeInt(0);
                    return true;
                }
                parcel2.writeInt(1);
                extras.writeToParcel(parcel2, 1);
                return true;
            case 32:
                parcel.enforceInterface("android.support.v4.media.session.IMediaSession");
                int ratingType = getRatingType();
                parcel2.writeNoException();
                parcel2.writeInt(ratingType);
                return true;
            case 33:
                parcel.enforceInterface("android.support.v4.media.session.IMediaSession");
                prepare();
                parcel2.writeNoException();
                return true;
            case 34:
                parcel.enforceInterface("android.support.v4.media.session.IMediaSession");
                prepareFromMediaId(parcel.readString(), parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel) : null);
                parcel2.writeNoException();
                return true;
            case 35:
                parcel.enforceInterface("android.support.v4.media.session.IMediaSession");
                prepareFromSearch(parcel.readString(), parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel) : null);
                parcel2.writeNoException();
                return true;
            case 36:
                parcel.enforceInterface("android.support.v4.media.session.IMediaSession");
                prepareFromUri(parcel.readInt() != 0 ? (Uri) Uri.CREATOR.createFromParcel(parcel) : null, parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel) : null);
                parcel2.writeNoException();
                return true;
            case 37:
                parcel.enforceInterface("android.support.v4.media.session.IMediaSession");
                int repeatMode = getRepeatMode();
                parcel2.writeNoException();
                parcel2.writeInt(repeatMode);
                return true;
            case 38:
                parcel.enforceInterface("android.support.v4.media.session.IMediaSession");
                boolean zBT = bT();
                parcel2.writeNoException();
                parcel2.writeInt(zBT ? 1 : 0);
                return true;
            case 39:
                parcel.enforceInterface("android.support.v4.media.session.IMediaSession");
                setRepeatMode(parcel.readInt());
                parcel2.writeNoException();
                return true;
            case 40:
                parcel.enforceInterface("android.support.v4.media.session.IMediaSession");
                j(parcel.readInt() != 0);
                parcel2.writeNoException();
                return true;
            case 41:
                parcel.enforceInterface("android.support.v4.media.session.IMediaSession");
                a(parcel.readInt() != 0 ? (MediaDescriptionCompat) MediaDescriptionCompat.CREATOR.createFromParcel(parcel) : null);
                parcel2.writeNoException();
                return true;
            case 42:
                parcel.enforceInterface("android.support.v4.media.session.IMediaSession");
                a(parcel.readInt() != 0 ? (MediaDescriptionCompat) MediaDescriptionCompat.CREATOR.createFromParcel(parcel) : null, parcel.readInt());
                parcel2.writeNoException();
                return true;
            case 43:
                parcel.enforceInterface("android.support.v4.media.session.IMediaSession");
                b(parcel.readInt() != 0 ? (MediaDescriptionCompat) MediaDescriptionCompat.CREATOR.createFromParcel(parcel) : null);
                parcel2.writeNoException();
                return true;
            case 44:
                parcel.enforceInterface("android.support.v4.media.session.IMediaSession");
                x(parcel.readInt());
                parcel2.writeNoException();
                return true;
            case 45:
                parcel.enforceInterface("android.support.v4.media.session.IMediaSession");
                boolean zBS = bS();
                parcel2.writeNoException();
                parcel2.writeInt(zBS ? 1 : 0);
                return true;
            case 46:
                parcel.enforceInterface("android.support.v4.media.session.IMediaSession");
                i(parcel.readInt() != 0);
                parcel2.writeNoException();
                return true;
            case 47:
                parcel.enforceInterface("android.support.v4.media.session.IMediaSession");
                int shuffleMode = getShuffleMode();
                parcel2.writeNoException();
                parcel2.writeInt(shuffleMode);
                return true;
            case 48:
                parcel.enforceInterface("android.support.v4.media.session.IMediaSession");
                setShuffleMode(parcel.readInt());
                parcel2.writeNoException();
                return true;
            default:
                return super.onTransact(i, parcel, parcel2, i2);
        }
    }
}
