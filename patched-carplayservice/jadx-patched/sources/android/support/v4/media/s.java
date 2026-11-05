package android.support.v4.media;

import android.annotation.TargetApi;
import android.content.Context;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Process;
import android.os.ResultReceiver;
import android.support.v4.media.session.MediaControllerCompat;
import android.support.v4.media.session.PlaybackStateCompat;
import android.util.Log;
import java.util.List;
import java.util.concurrent.Executor;

/* JADX INFO: loaded from: classes.dex */
@TargetApi(16)
final class s implements r {
    private static final boolean DEBUG = Log.isLoggable("MC2ImplLegacy", 3);
    static final Bundle ks;
    private aq kA;
    private int kB;
    private int kC;
    private ap kD;
    private int kE;
    private q kF;
    private az kG;
    private MediaControllerCompat kH;
    private w kI;
    private PlaybackStateCompat kJ;
    private MediaMetadataCompat kK;
    private volatile boolean kL;
    private final ba kt;
    private final p ku;
    private final HandlerThread kv;
    private o kw;
    private MediaBrowserCompat kx;
    private boolean ky;
    private List kz;
    private final Executor mCallbackExecutor;
    private final Context mContext;
    private final Handler mHandler;
    final Object mLock;
    private int mRepeatMode;

    static {
        Bundle bundle = new Bundle();
        ks = bundle;
        bundle.putBoolean("android.support.v4.media.root_default_root", true);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void a(String str, ResultReceiver resultReceiver) {
        MediaControllerCompat mediaControllerCompat;
        w wVar;
        Bundle bundle = new Bundle();
        synchronized (this.mLock) {
            mediaControllerCompat = this.kH;
            wVar = this.kI;
        }
        android.support.v4.app.f.a(bundle, "android.support.v4.media.argument.ICONTROLLER_CALLBACK", wVar.bU().asBinder());
        bundle.putString("android.support.v4.media.argument.PACKAGE_NAME", this.mContext.getPackageName());
        bundle.putInt("android.support.v4.media.argument.UID", Process.myUid());
        bundle.putInt("android.support.v4.media.argument.PID", Process.myPid());
        mediaControllerCompat.sendCommand(str, bundle, resultReceiver);
    }

    @Override // java.lang.AutoCloseable
    public final void close() {
        if (DEBUG) {
            Log.d("MC2ImplLegacy", "release from " + this.kt);
        }
        synchronized (this.mLock) {
            if (this.ky) {
                return;
            }
            this.mHandler.removeCallbacksAndMessages(null);
            if (Build.VERSION.SDK_INT >= 18) {
                this.kv.quitSafely();
            } else {
                this.kv.quit();
            }
            this.ky = true;
            a("android.support.v4.media.controller.command.DISCONNECT", (ResultReceiver) null);
            if (this.kH != null) {
                this.kH.a(this.kI);
            }
            if (this.kx != null) {
                this.kx = null;
            }
            if (this.kH != null) {
                this.kH.a(this.kI);
                this.kH = null;
            }
            this.kL = false;
            this.mCallbackExecutor.execute(new t(this));
        }
    }

    final void h(Bundle bundle) {
        bundle.setClassLoader(as.class.getClassLoader());
        az azVarO = az.o(bundle.getBundle("android.support.v4.media.argument.ALLOWED_COMMANDS"));
        int i = bundle.getInt("android.support.v4.media.argument.PLAYER_STATE");
        ap apVarJ = ap.j(bundle.getBundle("android.support.v4.media.argument.MEDIA_ITEM"));
        int i2 = bundle.getInt("android.support.v4.media.argument.BUFFERING_STATE");
        PlaybackStateCompat playbackStateCompat = (PlaybackStateCompat) bundle.getParcelable("android.support.v4.media.argument.PLAYBACK_STATE_COMPAT");
        int i3 = bundle.getInt("android.support.v4.media.argument.REPEAT_MODE");
        int i4 = bundle.getInt("android.support.v4.media.argument.SHUFFLE_MODE");
        List listA = aw.a(bundle.getParcelableArray("android.support.v4.media.argument.PLAYLIST"));
        q qVarG = q.g(bundle.getBundle("android.support.v4.media.argument.PLAYBACK_INFO"));
        aq aqVarK = aq.k(bundle.getBundle("android.support.v4.media.argument.PLAYLIST_METADATA"));
        if (DEBUG) {
            Log.d("MC2ImplLegacy", "onConnectedNotLocked token=" + this.kt + ", allowedCommands=" + azVarO);
        }
        try {
            synchronized (this.mLock) {
                try {
                    if (this.ky) {
                        return;
                    }
                    if (this.kL) {
                        Log.e("MC2ImplLegacy", "Cannot be notified about the connection result many times. Probably a bug or malicious app.");
                        try {
                            close();
                            return;
                        } catch (Throwable th) {
                            th = th;
                            throw th;
                        }
                    }
                    this.kG = azVarO;
                    this.kC = i;
                    this.kD = apVarJ;
                    this.kE = i2;
                    this.kJ = playbackStateCompat;
                    this.mRepeatMode = i3;
                    this.kB = i4;
                    this.kz = listA;
                    this.kA = aqVarK;
                    this.kL = true;
                    this.kF = qVarG;
                    this.mCallbackExecutor.execute(new u(this, azVarO));
                } catch (Throwable th2) {
                    th = th2;
                }
            }
        } catch (Throwable th3) {
            if (0 != 0) {
                close();
            }
            throw th3;
        }
    }
}
