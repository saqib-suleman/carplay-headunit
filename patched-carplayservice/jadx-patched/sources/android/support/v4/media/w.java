package android.support.v4.media;

import android.os.Bundle;
import android.os.ResultReceiver;
import android.support.v4.media.session.PlaybackStateCompat;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
final class w extends android.support.v4.media.session.g {
    final /* synthetic */ s kM;

    @Override // android.support.v4.media.session.g
    public final void a(MediaMetadataCompat mediaMetadataCompat) {
        synchronized (this.kM.mLock) {
            this.kM.kK = mediaMetadataCompat;
        }
    }

    @Override // android.support.v4.media.session.g
    public final void a(PlaybackStateCompat playbackStateCompat) {
        synchronized (this.kM.mLock) {
            this.kM.kJ = playbackStateCompat;
        }
    }

    @Override // android.support.v4.media.session.g
    public final void bM() {
        this.kM.a("android.support.v4.media.controller.command.CONNECT", new MediaController2ImplLegacy$ControllerCompatCallback$1(this, this.kM.mHandler));
    }

    @Override // android.support.v4.media.session.g
    public final void onSessionDestroyed() {
        this.kM.close();
    }

    /* JADX WARN: Unreachable blocks removed: 1, instructions: 1 */
    @Override // android.support.v4.media.session.g
    public final void onSessionEvent(String str, Bundle bundle) {
        if (bundle != null) {
            bundle.setClassLoader(as.class.getClassLoader());
        }
        byte b = -1;
        switch (str.hashCode()) {
            case -2076894204:
                if (str.equals("android.support.v4.media.session.event.ON_BUFFERING_STATE_CHANGED")) {
                    b = 13;
                }
                break;
            case -2060536131:
                if (str.equals("android.support.v4.media.session.event.ON_PLAYBACK_SPEED_CHANGED")) {
                    b = 12;
                }
                break;
            case -1588811870:
                if (str.equals("android.support.v4.media.session.event.ON_PLAYBACK_INFO_CHANGED")) {
                    b = 11;
                }
                break;
            case -1471144819:
                if (str.equals("android.support.v4.media.session.event.ON_PLAYER_STATE_CHANGED")) {
                    b = 1;
                }
                break;
            case -1021916189:
                if (str.equals("android.support.v4.media.session.event.ON_ERROR")) {
                    b = 3;
                }
                break;
            case -617184370:
                if (str.equals("android.support.v4.media.session.event.ON_CURRENT_MEDIA_ITEM_CHANGED")) {
                    b = 2;
                }
                break;
            case -92092013:
                if (str.equals("android.support.v4.media.session.event.ON_ROUTES_INFO_CHANGED")) {
                    b = 4;
                }
                break;
            case -53555497:
                if (str.equals("android.support.v4.media.session.event.ON_REPEAT_MODE_CHANGED")) {
                    b = 7;
                }
                break;
            case 229988025:
                if (str.equals("android.support.v4.media.session.event.SEND_CUSTOM_COMMAND")) {
                    b = 9;
                }
                break;
            case 306321100:
                if (str.equals("android.support.v4.media.session.event.ON_PLAYLIST_METADATA_CHANGED")) {
                    b = 6;
                }
                break;
            case 408969344:
                if (str.equals("android.support.v4.media.session.event.SET_CUSTOM_LAYOUT")) {
                    b = 10;
                }
                break;
            case 806201420:
                if (str.equals("android.support.v4.media.session.event.ON_PLAYLIST_CHANGED")) {
                    b = 5;
                }
                break;
            case 896576579:
                if (str.equals("android.support.v4.media.session.event.ON_SHUFFLE_MODE_CHANGED")) {
                    b = 8;
                }
                break;
            case 1696119769:
                if (str.equals("android.support.v4.media.session.event.ON_ALLOWED_COMMANDS_CHANGED")) {
                    b = 0;
                }
                break;
            case 1871849865:
                if (str.equals("android.support.v4.media.session.event.ON_SEEK_COMPLETED")) {
                    b = 14;
                }
                break;
        }
        switch (b) {
            case 0:
                az azVarO = az.o(bundle.getBundle("android.support.v4.media.argument.ALLOWED_COMMANDS"));
                synchronized (this.kM.mLock) {
                    this.kM.kG = azVarO;
                    break;
                }
                this.kM.mCallbackExecutor.execute(new af(this, azVarO));
                return;
            case 1:
                int i = bundle.getInt("android.support.v4.media.argument.PLAYER_STATE");
                PlaybackStateCompat playbackStateCompat = (PlaybackStateCompat) bundle.getParcelable("android.support.v4.media.argument.PLAYBACK_STATE_COMPAT");
                if (playbackStateCompat == null) {
                    return;
                }
                synchronized (this.kM.mLock) {
                    this.kM.kC = i;
                    this.kM.kJ = playbackStateCompat;
                    break;
                }
                this.kM.mCallbackExecutor.execute(new ag(this, i));
                return;
            case 2:
                ap apVarJ = ap.j(bundle.getBundle("android.support.v4.media.argument.MEDIA_ITEM"));
                synchronized (this.kM.mLock) {
                    this.kM.kD = apVarJ;
                    break;
                }
                this.kM.mCallbackExecutor.execute(new ah(this, apVarJ));
                return;
            case 3:
                this.kM.mCallbackExecutor.execute(new ai(this, bundle.getInt("android.support.v4.media.argument.ERROR_CODE"), bundle.getBundle("android.support.v4.media.argument.EXTRAS")));
                return;
            case 4:
                this.kM.mCallbackExecutor.execute(new aj(this, aw.b(bundle.getParcelableArray("android.support.v4.media.argument.ROUTE_BUNDLE"))));
                return;
            case 5:
                aq aqVarK = aq.k(bundle.getBundle("android.support.v4.media.argument.PLAYLIST_METADATA"));
                List listA = aw.a(bundle.getParcelableArray("android.support.v4.media.argument.PLAYLIST"));
                synchronized (this.kM.mLock) {
                    this.kM.kz = listA;
                    this.kM.kA = aqVarK;
                    break;
                }
                this.kM.mCallbackExecutor.execute(new ak(this, listA, aqVarK));
                return;
            case 6:
                aq aqVarK2 = aq.k(bundle.getBundle("android.support.v4.media.argument.PLAYLIST_METADATA"));
                synchronized (this.kM.mLock) {
                    this.kM.kA = aqVarK2;
                    break;
                }
                this.kM.mCallbackExecutor.execute(new al(this, aqVarK2));
                return;
            case 7:
                int i2 = bundle.getInt("android.support.v4.media.argument.REPEAT_MODE");
                synchronized (this.kM.mLock) {
                    this.kM.mRepeatMode = i2;
                    break;
                }
                this.kM.mCallbackExecutor.execute(new am(this, i2));
                return;
            case 8:
                int i3 = bundle.getInt("android.support.v4.media.argument.SHUFFLE_MODE");
                synchronized (this.kM.mLock) {
                    this.kM.kB = i3;
                    break;
                }
                this.kM.mCallbackExecutor.execute(new y(this, i3));
                return;
            case 9:
                Bundle bundle2 = bundle.getBundle("android.support.v4.media.argument.CUSTOM_COMMAND");
                if (bundle2 == null) {
                    return;
                }
                this.kM.mCallbackExecutor.execute(new z(this, ay.n(bundle2), bundle.getBundle("android.support.v4.media.argument.ARGUMENTS"), (ResultReceiver) bundle.getParcelable("android.support.v4.media.argument.RESULT_RECEIVER")));
                return;
            case 10:
                this.kM.mCallbackExecutor.execute(new aa(this, aw.c(bundle.getParcelableArray("android.support.v4.media.argument.COMMAND_BUTTONS"))));
                return;
            case 11:
                q qVarG = q.g(bundle.getBundle("android.support.v4.media.argument.PLAYBACK_INFO"));
                if (qVarG == null) {
                    return;
                }
                synchronized (this.kM.mLock) {
                    this.kM.kF = qVarG;
                    break;
                }
                this.kM.mCallbackExecutor.execute(new ab(this, qVarG));
                return;
            case 12:
                PlaybackStateCompat playbackStateCompat2 = (PlaybackStateCompat) bundle.getParcelable("android.support.v4.media.argument.PLAYBACK_STATE_COMPAT");
                if (playbackStateCompat2 == null) {
                    return;
                }
                synchronized (this.kM.mLock) {
                    this.kM.kJ = playbackStateCompat2;
                    break;
                }
                this.kM.mCallbackExecutor.execute(new ac(this, playbackStateCompat2));
                return;
            case 13:
                ap apVarJ2 = ap.j(bundle.getBundle("android.support.v4.media.argument.MEDIA_ITEM"));
                int i4 = bundle.getInt("android.support.v4.media.argument.BUFFERING_STATE");
                PlaybackStateCompat playbackStateCompat3 = (PlaybackStateCompat) bundle.getParcelable("android.support.v4.media.argument.PLAYBACK_STATE_COMPAT");
                if (apVarJ2 == null || playbackStateCompat3 == null) {
                    return;
                }
                synchronized (this.kM.mLock) {
                    this.kM.kE = i4;
                    this.kM.kJ = playbackStateCompat3;
                    break;
                }
                this.kM.mCallbackExecutor.execute(new ad(this, apVarJ2, i4));
                return;
            case 14:
                long j = bundle.getLong("android.support.v4.media.argument.SEEK_POSITION");
                PlaybackStateCompat playbackStateCompat4 = (PlaybackStateCompat) bundle.getParcelable("android.support.v4.media.argument.PLAYBACK_STATE_COMPAT");
                if (playbackStateCompat4 == null) {
                    return;
                }
                synchronized (this.kM.mLock) {
                    this.kM.kJ = playbackStateCompat4;
                    break;
                }
                this.kM.mCallbackExecutor.execute(new ae(this, j));
                return;
            default:
                return;
        }
    }
}
