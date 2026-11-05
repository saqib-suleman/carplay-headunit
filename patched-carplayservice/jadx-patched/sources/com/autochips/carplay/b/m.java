package com.autochips.carplay.b;

import android.content.Context;
import android.media.AudioManager;
import android.os.Looper;
import android.os.SystemProperties;
import android.util.Log;
import com.autochips.carplay.common.CarplayMessage;

/* JADX INFO: loaded from: classes.dex */
public final class m extends com.autochips.carplay.av.a implements z {
    private static final boolean sA;
    static m sj;
    private AudioManager mAudioManager;
    private final Context mContext;
    final s sw;
    final o sx;
    private com.autochips.carplay.service.h mCarplayMonitor = null;
    private com.autochips.carplay.c.a rY = null;
    private int sy = 0;
    private boolean sz = false;
    private final Object mLock = new Object();
    private AudioManager.OnAudioFocusChangeListener sB = new n(this);

    static {
        sA = 1 == SystemProperties.getInt("ro.atc.carplay.audio_enable_ctl", 0);
    }

    private m(Context context, Looper looper) {
        this.mContext = context;
        this.mAudioManager = (AudioManager) this.mContext.getSystemService("audio");
        setOnStreamListener(new r(this));
        this.sw = new s(this, looper);
        this.sx = new o(this, looper);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static boolean X(int i) {
        return 100 == i || 102 == i;
    }

    public static m a(Context context, Looper looper) {
        Log.d("OutputAudioManager", "make() - Creating mOutputAudioManager");
        if (sj == null) {
            sj = new m(context, looper);
        }
        return sj;
    }

    static /* synthetic */ void a(m mVar, boolean z) {
        synchronized (mVar.mLock) {
            mVar.sz = z;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean dg() {
        boolean z;
        synchronized (this.mLock) {
            z = this.sz;
        }
        return z;
    }

    static /* synthetic */ boolean k(int i, int i2) {
        if (!X(i)) {
            return false;
        }
        if (100 != i) {
            return 102 == i && i2 == 3;
        }
        if (i2 == 6) {
            return true;
        }
        switch (i2) {
            case 1:
            case 2:
            case 3:
                return true;
            default:
                return false;
        }
    }

    static /* synthetic */ boolean l(int i, int i2) {
        if (101 != i) {
            return false;
        }
        if (i2 != 6) {
            switch (i2) {
                case 0:
                case 1:
                    break;
                default:
                    return false;
            }
        }
        return true;
    }

    public final void W(int i) {
        if (i == 0) {
            this.sw.sendMessage(16);
        } else {
            if (i != 2) {
                return;
            }
            this.sw.sendMessage(15);
        }
    }

    public final void a(com.autochips.carplay.service.h hVar, com.autochips.carplay.c.a aVar) {
        this.mCarplayMonitor = hVar;
        this.rY = aVar;
        if (this.mCarplayMonitor != null) {
            this.mCarplayMonitor.a(CarplayMessage.ACCESSORY_AUDIO_STATE_CHANGED, this.sw.getHandler());
            this.mCarplayMonitor.a(CarplayMessage.ACCESSORY_CALL_STATE_CHANGED, this.sw.getHandler());
        }
    }
}
