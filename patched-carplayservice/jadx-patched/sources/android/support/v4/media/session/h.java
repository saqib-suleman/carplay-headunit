package android.support.v4.media.session;

import android.os.Handler;
import android.os.Message;
import android.support.v4.media.MediaMetadataCompat;

/* JADX INFO: loaded from: classes.dex */
final class h extends Handler {
    final /* synthetic */ g lQ;
    boolean mRegistered;

    @Override // android.os.Handler
    public final void handleMessage(Message message) {
        if (this.mRegistered) {
            switch (message.what) {
                case 1:
                    this.lQ.onSessionEvent((String) message.obj, message.getData());
                    break;
                case 2:
                    this.lQ.a((PlaybackStateCompat) message.obj);
                    break;
                case 3:
                    this.lQ.a((MediaMetadataCompat) message.obj);
                    break;
                case 4:
                    Object obj = message.obj;
                    break;
                case 5:
                    Object obj2 = message.obj;
                    break;
                case 6:
                    Object obj3 = message.obj;
                    break;
                case 7:
                    Object obj4 = message.obj;
                    break;
                case 8:
                    this.lQ.onSessionDestroyed();
                    break;
                case 9:
                    ((Integer) message.obj).intValue();
                    break;
                case 11:
                    ((Boolean) message.obj).booleanValue();
                    break;
                case 12:
                    ((Integer) message.obj).intValue();
                    break;
                case 13:
                    this.lQ.bM();
                    break;
            }
        }
    }
}
