package android.support.v4.media;

import android.support.v4.media.session.PlaybackStateCompat;

/* JADX INFO: loaded from: classes.dex */
final class ac implements Runnable {
    final /* synthetic */ w kP;
    final /* synthetic */ PlaybackStateCompat kX;

    ac(w wVar, PlaybackStateCompat playbackStateCompat) {
        this.kP = wVar;
        this.kX = playbackStateCompat;
    }

    @Override // java.lang.Runnable
    public final void run() {
        p unused = this.kP.kM.ku;
        o unused2 = this.kP.kM.kw;
        this.kX.getPlaybackSpeed();
    }
}
