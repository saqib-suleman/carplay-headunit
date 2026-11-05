package android.support.v4.media.session;

import android.os.Build;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Message;
import android.support.v4.media.MediaMetadataCompat;

/* JADX INFO: loaded from: classes.dex */
public abstract class g implements IBinder.DeathRecipient {
    private final Object lN;
    h lO;
    a lP;

    public g() {
        if (Build.VERSION.SDK_INT >= 21) {
            this.lN = new p(new i(this));
            return;
        }
        j jVar = new j(this);
        this.lP = jVar;
        this.lN = jVar;
    }

    final void a(int i, Object obj, Bundle bundle) {
        if (this.lO != null) {
            Message messageObtainMessage = this.lO.obtainMessage(i, obj);
            messageObtainMessage.setData(bundle);
            messageObtainMessage.sendToTarget();
        }
    }

    public void a(MediaMetadataCompat mediaMetadataCompat) {
    }

    public void a(PlaybackStateCompat playbackStateCompat) {
    }

    public void bM() {
    }

    public final a bU() {
        return this.lP;
    }

    final void bV() {
        if (this.lO != null) {
            this.lO.mRegistered = false;
            this.lO.removeCallbacksAndMessages(null);
            this.lO = null;
        }
    }

    @Override // android.os.IBinder.DeathRecipient
    public void binderDied() {
        onSessionDestroyed();
    }

    public void onSessionDestroyed() {
    }

    public void onSessionEvent(String str, Bundle bundle) {
    }
}
