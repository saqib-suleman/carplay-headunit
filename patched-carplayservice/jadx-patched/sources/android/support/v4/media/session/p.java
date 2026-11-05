package android.support.v4.media.session;

import android.media.AudioAttributes;
import android.media.MediaMetadata;
import android.media.session.MediaController;
import android.media.session.PlaybackState;
import android.os.Bundle;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
final class p extends MediaController.Callback {
    protected final o lZ;

    public p(o oVar) {
        this.lZ = oVar;
    }

    @Override // android.media.session.MediaController.Callback
    public final void onAudioInfoChanged(MediaController.PlaybackInfo playbackInfo) {
        int i;
        o oVar = this.lZ;
        int playbackType = playbackInfo.getPlaybackType();
        AudioAttributes audioAttributes = playbackInfo.getAudioAttributes();
        if ((audioAttributes.getFlags() & 1) != 1) {
            if ((audioAttributes.getFlags() & 4) != 4) {
                switch (audioAttributes.getUsage()) {
                    case 1:
                    case 11:
                    case 12:
                    case 14:
                    default:
                        i = 3;
                        break;
                    case 2:
                        i = 0;
                        break;
                    case 3:
                        i = 8;
                        break;
                    case 4:
                        i = 4;
                        break;
                    case 5:
                    case 7:
                    case 8:
                    case 9:
                    case 10:
                        i = 5;
                        break;
                    case 6:
                        i = 2;
                        break;
                    case 13:
                        i = 1;
                        break;
                }
            } else {
                i = 6;
            }
        } else {
            i = 7;
        }
        oVar.a(playbackType, i, playbackInfo.getVolumeControl(), playbackInfo.getMaxVolume(), playbackInfo.getCurrentVolume());
    }

    @Override // android.media.session.MediaController.Callback
    public final void onExtrasChanged(Bundle bundle) {
        this.lZ.bX();
    }

    @Override // android.media.session.MediaController.Callback
    public final void onMetadataChanged(MediaMetadata mediaMetadata) {
        this.lZ.k(mediaMetadata);
    }

    @Override // android.media.session.MediaController.Callback
    public final void onPlaybackStateChanged(PlaybackState playbackState) {
        this.lZ.j(playbackState);
    }

    @Override // android.media.session.MediaController.Callback
    public final void onQueueChanged(List list) {
        this.lZ.onQueueChanged(list);
    }

    @Override // android.media.session.MediaController.Callback
    public final void onQueueTitleChanged(CharSequence charSequence) {
        this.lZ.bW();
    }

    @Override // android.media.session.MediaController.Callback
    public final void onSessionDestroyed() {
        this.lZ.onSessionDestroyed();
    }

    @Override // android.media.session.MediaController.Callback
    public final void onSessionEvent(String str, Bundle bundle) {
        this.lZ.onSessionEvent(str, bundle);
    }
}
