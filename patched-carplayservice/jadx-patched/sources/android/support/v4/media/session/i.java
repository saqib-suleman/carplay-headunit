package android.support.v4.media.session;

import android.os.Build;
import android.os.Bundle;
import android.support.v4.media.MediaMetadataCompat;
import java.lang.ref.WeakReference;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
final class i implements o {
    private final WeakReference lR;

    i(g gVar) {
        this.lR = new WeakReference(gVar);
    }

    @Override // android.support.v4.media.session.o
    public final void a(int i, int i2, int i3, int i4, int i5) {
        if (((g) this.lR.get()) != null) {
            new m(i, i2, i3, i4, i5);
        }
    }

    @Override // android.support.v4.media.session.o
    public final void bW() {
        this.lR.get();
    }

    @Override // android.support.v4.media.session.o
    public final void bX() {
        this.lR.get();
    }

    @Override // android.support.v4.media.session.o
    public final void j(Object obj) {
        g gVar = (g) this.lR.get();
        if (gVar == null || gVar.lP != null) {
            return;
        }
        gVar.a(PlaybackStateCompat.l(obj));
    }

    @Override // android.support.v4.media.session.o
    public final void k(Object obj) {
        g gVar = (g) this.lR.get();
        if (gVar != null) {
            gVar.a(MediaMetadataCompat.i(obj));
        }
    }

    @Override // android.support.v4.media.session.o
    public final void onQueueChanged(List list) {
        if (((g) this.lR.get()) != null) {
            MediaSessionCompat.QueueItem.d(list);
        }
    }

    @Override // android.support.v4.media.session.o
    public final void onSessionDestroyed() {
        g gVar = (g) this.lR.get();
        if (gVar != null) {
            gVar.onSessionDestroyed();
        }
    }

    @Override // android.support.v4.media.session.o
    public final void onSessionEvent(String str, Bundle bundle) {
        g gVar = (g) this.lR.get();
        if (gVar != null) {
            if (gVar.lP == null || Build.VERSION.SDK_INT >= 23) {
                gVar.onSessionEvent(str, bundle);
            }
        }
    }
}
