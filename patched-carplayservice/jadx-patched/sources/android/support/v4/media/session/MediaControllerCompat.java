package android.support.v4.media.session;

import android.media.session.MediaController;
import android.os.Bundle;
import android.os.RemoteException;
import android.os.ResultReceiver;
import android.support.v4.media.ba;
import android.text.TextUtils;
import android.util.Log;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public final class MediaControllerCompat {
    private final k lL;
    private final HashSet lM;

    final class MediaControllerImplApi21 implements k {
        protected final Object lS;
        private final List lT;
        private HashMap lU;
        private final MediaSessionCompat.Token lV;

        class ExtraBinderRequestResultReceiver extends ResultReceiver {
            private WeakReference lW;

            @Override // android.os.ResultReceiver
            protected void onReceiveResult(int i, Bundle bundle) {
                MediaControllerImplApi21 mediaControllerImplApi21 = (MediaControllerImplApi21) this.lW.get();
                if (mediaControllerImplApi21 == null || bundle == null) {
                    return;
                }
                mediaControllerImplApi21.lV.a(e.d(android.support.v4.app.f.a(bundle, "android.support.v4.media.session.EXTRA_BINDER")));
                mediaControllerImplApi21.lV.a(ba.p(bundle.getBundle("android.support.v4.media.session.SESSION_TOKEN2")));
                MediaControllerImplApi21.b(mediaControllerImplApi21);
            }
        }

        static /* synthetic */ void b(MediaControllerImplApi21 mediaControllerImplApi21) {
            if (mediaControllerImplApi21.lV.bY() != null) {
                synchronized (mediaControllerImplApi21.lT) {
                    for (g gVar : mediaControllerImplApi21.lT) {
                        l lVar = new l(gVar);
                        mediaControllerImplApi21.lU.put(gVar, lVar);
                        gVar.lP = lVar;
                        try {
                            mediaControllerImplApi21.lV.bY().a(lVar);
                            gVar.bM();
                        } catch (RemoteException e) {
                            Log.e("MediaControllerCompat", "Dead object in registerCallback.", e);
                            mediaControllerImplApi21.lT.clear();
                        }
                    }
                    mediaControllerImplApi21.lT.clear();
                }
            }
        }

        @Override // android.support.v4.media.session.k
        public final void a(g gVar) {
            ((MediaController) this.lS).unregisterCallback((MediaController.Callback) gVar.lN);
            if (this.lV.bY() == null) {
                synchronized (this.lT) {
                    this.lT.remove(gVar);
                }
                return;
            }
            try {
                l lVar = (l) this.lU.remove(gVar);
                if (lVar != null) {
                    gVar.lP = null;
                    this.lV.bY().b(lVar);
                }
            } catch (RemoteException e) {
                Log.e("MediaControllerCompat", "Dead object in unregisterCallback.", e);
            }
        }

        @Override // android.support.v4.media.session.k
        public final void sendCommand(String str, Bundle bundle, ResultReceiver resultReceiver) {
            ((MediaController) this.lS).sendCommand(str, bundle, resultReceiver);
        }
    }

    public final void a(g gVar) {
        if (gVar == null) {
            throw new IllegalArgumentException("callback must not be null");
        }
        try {
            this.lM.remove(gVar);
            this.lL.a(gVar);
        } finally {
            gVar.bV();
        }
    }

    public final void sendCommand(String str, Bundle bundle, ResultReceiver resultReceiver) {
        if (TextUtils.isEmpty(str)) {
            throw new IllegalArgumentException("command must neither be null nor empty");
        }
        this.lL.sendCommand(str, bundle, resultReceiver);
    }
}
