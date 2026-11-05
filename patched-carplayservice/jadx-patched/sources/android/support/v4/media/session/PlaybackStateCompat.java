package android.support.v4.media.session;

import android.media.session.PlaybackState;
import android.os.Build;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.text.TextUtils;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public final class PlaybackStateCompat implements Parcelable {
    public static final Parcelable.Creator CREATOR = new u();
    final Bundle mExtras;
    final float mSpeed;
    final int mState;
    final long mUpdateTime;
    final long mf;
    final long mg;
    final long mh;
    final int mi;
    final CharSequence mj;
    List mk;
    final long ml;
    private Object mm;

    public final class CustomAction implements Parcelable {
        public static final Parcelable.Creator CREATOR = new v();
        private final String mAction;
        private final Bundle mExtras;
        private final CharSequence mName;
        private final int mn;
        private Object mo;

        CustomAction(Parcel parcel) {
            this.mAction = parcel.readString();
            this.mName = (CharSequence) TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(parcel);
            this.mn = parcel.readInt();
            this.mExtras = parcel.readBundle();
        }

        private CustomAction(String str, CharSequence charSequence, int i, Bundle bundle) {
            this.mAction = str;
            this.mName = charSequence;
            this.mn = i;
            this.mExtras = bundle;
        }

        public static CustomAction m(Object obj) {
            if (obj == null || Build.VERSION.SDK_INT < 21) {
                return null;
            }
            PlaybackState.CustomAction customAction = (PlaybackState.CustomAction) obj;
            CustomAction customAction2 = new CustomAction(customAction.getAction(), customAction.getName(), customAction.getIcon(), customAction.getExtras());
            customAction2.mo = obj;
            return customAction2;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final String toString() {
            return "Action:mName='" + ((Object) this.mName) + ", mIcon=" + this.mn + ", mExtras=" + this.mExtras;
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i) {
            parcel.writeString(this.mAction);
            TextUtils.writeToParcel(this.mName, parcel, i);
            parcel.writeInt(this.mn);
            parcel.writeBundle(this.mExtras);
        }
    }

    private PlaybackStateCompat(int i, long j, long j2, float f, long j3, CharSequence charSequence, long j4, List list, long j5, Bundle bundle) {
        this.mState = i;
        this.mf = j;
        this.mg = j2;
        this.mSpeed = f;
        this.mh = j3;
        this.mi = 0;
        this.mj = charSequence;
        this.mUpdateTime = j4;
        this.mk = new ArrayList(list);
        this.ml = j5;
        this.mExtras = bundle;
    }

    PlaybackStateCompat(Parcel parcel) {
        this.mState = parcel.readInt();
        this.mf = parcel.readLong();
        this.mSpeed = parcel.readFloat();
        this.mUpdateTime = parcel.readLong();
        this.mg = parcel.readLong();
        this.mh = parcel.readLong();
        this.mj = (CharSequence) TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(parcel);
        this.mk = parcel.createTypedArrayList(CustomAction.CREATOR);
        this.ml = parcel.readLong();
        this.mExtras = parcel.readBundle();
        this.mi = parcel.readInt();
    }

    public static PlaybackStateCompat l(Object obj) {
        ArrayList arrayList;
        if (obj == null || Build.VERSION.SDK_INT < 21) {
            return null;
        }
        PlaybackState playbackState = (PlaybackState) obj;
        List<PlaybackState.CustomAction> customActions = playbackState.getCustomActions();
        if (customActions != null) {
            ArrayList arrayList2 = new ArrayList(customActions.size());
            Iterator<PlaybackState.CustomAction> it = customActions.iterator();
            while (it.hasNext()) {
                arrayList2.add(CustomAction.m(it.next()));
            }
            arrayList = arrayList2;
        } else {
            arrayList = null;
        }
        PlaybackStateCompat playbackStateCompat = new PlaybackStateCompat(playbackState.getState(), playbackState.getPosition(), playbackState.getBufferedPosition(), playbackState.getPlaybackSpeed(), playbackState.getActions(), playbackState.getErrorMessage(), playbackState.getLastPositionUpdateTime(), arrayList, playbackState.getActiveQueueItemId(), Build.VERSION.SDK_INT >= 22 ? playbackState.getExtras() : null);
        playbackStateCompat.mm = obj;
        return playbackStateCompat;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final float getPlaybackSpeed() {
        return this.mSpeed;
    }

    public final String toString() {
        return "PlaybackState {state=" + this.mState + ", position=" + this.mf + ", buffered position=" + this.mg + ", speed=" + this.mSpeed + ", updated=" + this.mUpdateTime + ", actions=" + this.mh + ", error code=" + this.mi + ", error message=" + this.mj + ", custom actions=" + this.mk + ", active item id=" + this.ml + "}";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.writeInt(this.mState);
        parcel.writeLong(this.mf);
        parcel.writeFloat(this.mSpeed);
        parcel.writeLong(this.mUpdateTime);
        parcel.writeLong(this.mg);
        parcel.writeLong(this.mh);
        TextUtils.writeToParcel(this.mj, parcel, i);
        parcel.writeTypedList(this.mk);
        parcel.writeLong(this.ml);
        parcel.writeBundle(this.mExtras);
        parcel.writeInt(this.mi);
    }
}
