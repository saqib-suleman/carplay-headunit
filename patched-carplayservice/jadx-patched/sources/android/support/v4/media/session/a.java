package android.support.v4.media.session;

import android.os.Bundle;
import android.os.IInterface;
import android.support.v4.media.MediaMetadataCompat;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public interface a extends IInterface {
    void a(MediaMetadataCompat mediaMetadataCompat);

    void a(ParcelableVolumeInfo parcelableVolumeInfo);

    void a(PlaybackStateCompat playbackStateCompat);

    void bM();

    void g(boolean z);

    void h(boolean z);

    void onEvent(String str, Bundle bundle);

    void onExtrasChanged(Bundle bundle);

    void onQueueChanged(List list);

    void onQueueTitleChanged(CharSequence charSequence);

    void onSessionDestroyed();

    void u(int i);

    void v(int i);
}
