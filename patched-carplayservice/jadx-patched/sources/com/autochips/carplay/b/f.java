package com.autochips.carplay.b;

import android.content.Context;
import android.media.AudioManager;
import android.os.Looper;
import com.autochips.carplay.common.CarplayMessage;

/* JADX INFO: loaded from: classes.dex */
public final class f extends com.autochips.carplay.av.a implements z {
    static f sk;
    private AudioManager mAudioManager;
    private final Context mContext;
    final h sl;
    private com.autochips.carplay.service.h mCarplayMonitor = null;
    private com.autochips.carplay.c.a rY = null;

    public f(Context context, Looper looper) {
        this.mContext = context;
        this.mAudioManager = (AudioManager) this.mContext.getSystemService("audio");
        setOnStreamListener(new g(this));
        this.sl = new h(this, looper);
    }

    static /* synthetic */ boolean j(int i, int i2) {
        if (!(100 == i)) {
            return false;
        }
        switch (i2) {
            case 4:
            case 5:
                return true;
            default:
                return false;
        }
    }

    public final void W(int i) {
        if (i == 0) {
            this.sl.sendMessage(15);
        } else {
            if (i != 2) {
                return;
            }
            this.sl.sendMessage(14);
        }
    }

    public final void a(com.autochips.carplay.service.h hVar, com.autochips.carplay.c.a aVar) {
        this.mCarplayMonitor = hVar;
        this.rY = aVar;
        if (this.mCarplayMonitor != null) {
            this.mCarplayMonitor.a(CarplayMessage.ACCESSORY_AUDIO_STATE_CHANGED, this.sl.getHandler());
            this.mCarplayMonitor.a(CarplayMessage.ACCESSORY_CALL_STATE_CHANGED, this.sl.getHandler());
        }
    }
}
