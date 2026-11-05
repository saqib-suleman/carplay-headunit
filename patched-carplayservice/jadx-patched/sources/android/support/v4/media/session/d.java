package android.support.v4.media.session;

import android.app.PendingIntent;
import android.net.Uri;
import android.os.Bundle;
import android.os.IInterface;
import android.support.v4.media.MediaDescriptionCompat;
import android.support.v4.media.MediaMetadataCompat;
import android.support.v4.media.RatingCompat;
import android.view.KeyEvent;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public interface d extends IInterface {
    void a(int i, int i2, String str);

    void a(MediaDescriptionCompat mediaDescriptionCompat);

    void a(MediaDescriptionCompat mediaDescriptionCompat, int i);

    void a(RatingCompat ratingCompat);

    void a(RatingCompat ratingCompat, Bundle bundle);

    void a(a aVar);

    void a(String str, Bundle bundle, MediaSessionCompat.ResultReceiverWrapper resultReceiverWrapper);

    boolean a(KeyEvent keyEvent);

    void b(int i, int i2, String str);

    void b(MediaDescriptionCompat mediaDescriptionCompat);

    void b(a aVar);

    ParcelableVolumeInfo bP();

    MediaMetadataCompat bQ();

    PlaybackStateCompat bR();

    boolean bS();

    boolean bT();

    void fastForward();

    Bundle getExtras();

    long getFlags();

    PendingIntent getLaunchPendingIntent();

    String getPackageName();

    List getQueue();

    CharSequence getQueueTitle();

    int getRatingType();

    int getRepeatMode();

    int getShuffleMode();

    String getTag();

    void i(boolean z);

    boolean isTransportControlEnabled();

    void j(boolean z);

    void next();

    void pause();

    void play();

    void playFromMediaId(String str, Bundle bundle);

    void playFromSearch(String str, Bundle bundle);

    void playFromUri(Uri uri, Bundle bundle);

    void prepare();

    void prepareFromMediaId(String str, Bundle bundle);

    void prepareFromSearch(String str, Bundle bundle);

    void prepareFromUri(Uri uri, Bundle bundle);

    void previous();

    void rewind();

    void seekTo(long j);

    void sendCustomAction(String str, Bundle bundle);

    void setRepeatMode(int i);

    void setShuffleMode(int i);

    void skipToQueueItem(long j);

    void stop();

    void x(int i);
}
