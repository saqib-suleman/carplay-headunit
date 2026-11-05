package android.support.v4.media;

import android.os.Bundle;

/* JADX INFO: loaded from: classes.dex */
public final class q {
    private final int ko;
    private final int kp;
    private final int kq;
    private final a kr;
    private final int mPlaybackType;

    private q(int i, a aVar, int i2, int i3, int i4) {
        this.mPlaybackType = i;
        this.kr = aVar;
        this.ko = i2;
        this.kp = i3;
        this.kq = i4;
    }

    static q g(Bundle bundle) {
        if (bundle == null) {
            return null;
        }
        return new q(bundle.getInt("android.media.audio_info.playback_type"), a.b(bundle.getBundle("android.media.audio_info.audio_attrs")), bundle.getInt("android.media.audio_info.control_type"), bundle.getInt("android.media.audio_info.max_volume"), bundle.getInt("android.media.audio_info.current_volume"));
    }
}
