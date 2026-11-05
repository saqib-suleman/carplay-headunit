package android.support.v4.media.session;

import android.os.Bundle;
import android.support.v4.media.MediaMetadataCompat;
import java.lang.ref.WeakReference;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
class j extends b {
    private final WeakReference lR;

    j(g gVar) {
        this.lR = new WeakReference(gVar);
    }

    @Override // android.support.v4.media.session.a
    public void a(MediaMetadataCompat mediaMetadataCompat) {
        g gVar = (g) this.lR.get();
        if (gVar != null) {
            gVar.a(3, mediaMetadataCompat, null);
        }
    }

    @Override // android.support.v4.media.session.a
    public void a(ParcelableVolumeInfo parcelableVolumeInfo) {
        g gVar = (g) this.lR.get();
        if (gVar != null) {
            gVar.a(4, parcelableVolumeInfo != null ? new m(parcelableVolumeInfo.volumeType, parcelableVolumeInfo.me, parcelableVolumeInfo.controlType, parcelableVolumeInfo.maxVolume, parcelableVolumeInfo.currentVolume) : null, null);
        }
    }

    @Override // android.support.v4.media.session.a
    public final void a(PlaybackStateCompat playbackStateCompat) {
        g gVar = (g) this.lR.get();
        if (gVar != null) {
            gVar.a(2, playbackStateCompat, null);
        }
    }

    @Override // android.support.v4.media.session.a
    public final void bM() {
        g gVar = (g) this.lR.get();
        if (gVar != null) {
            gVar.a(13, null, null);
        }
    }

    @Override // android.support.v4.media.session.a
    public final void g(boolean z) {
    }

    @Override // android.support.v4.media.session.a
    public final void h(boolean z) {
        g gVar = (g) this.lR.get();
        if (gVar != null) {
            gVar.a(11, Boolean.valueOf(z), null);
        }
    }

    @Override // android.support.v4.media.session.a
    public final void onEvent(String str, Bundle bundle) {
        g gVar = (g) this.lR.get();
        if (gVar != null) {
            gVar.a(1, str, bundle);
        }
    }

    @Override // android.support.v4.media.session.a
    public void onExtrasChanged(Bundle bundle) {
        g gVar = (g) this.lR.get();
        if (gVar != null) {
            gVar.a(7, bundle, null);
        }
    }

    @Override // android.support.v4.media.session.a
    public void onQueueChanged(List list) {
        g gVar = (g) this.lR.get();
        if (gVar != null) {
            gVar.a(5, list, null);
        }
    }

    @Override // android.support.v4.media.session.a
    public void onQueueTitleChanged(CharSequence charSequence) {
        g gVar = (g) this.lR.get();
        if (gVar != null) {
            gVar.a(6, charSequence, null);
        }
    }

    @Override // android.support.v4.media.session.a
    public void onSessionDestroyed() {
        g gVar = (g) this.lR.get();
        if (gVar != null) {
            gVar.a(8, null, null);
        }
    }

    @Override // android.support.v4.media.session.a
    public final void u(int i) {
        g gVar = (g) this.lR.get();
        if (gVar != null) {
            gVar.a(9, Integer.valueOf(i), null);
        }
    }

    @Override // android.support.v4.media.session.a
    public final void v(int i) {
        g gVar = (g) this.lR.get();
        if (gVar != null) {
            gVar.a(12, Integer.valueOf(i), null);
        }
    }
}
