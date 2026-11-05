package com.autochips.carplay.b;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.util.Log;
import android.view.Surface;
import com.autochips.carplay.common.CarplayMessage;

/* JADX INFO: loaded from: classes.dex */
public final class e extends Handler {
    private com.autochips.carplay.service.h mCarplayMonitor;
    private final Context mContext;
    private com.autochips.carplay.c.a rY;
    private final aa si;
    private final m sj;
    private final f sk;

    public e(Context context, Looper looper) {
        super(looper);
        this.mCarplayMonitor = null;
        this.rY = null;
        this.mContext = context;
        Log.d("ScreenManager", "make() - Creating ScreenManager");
        if (aa.si == null) {
            aa.si = new aa(context, looper);
        }
        this.si = aa.si;
        this.sj = m.a(context, looper);
        Log.d("FullDuplexAudioManager", "make() - Creating FullDuplexAudioManager");
        if (f.sk == null) {
            f.sk = new f(context, looper);
        }
        this.sk = f.sk;
    }

    public final void a(com.autochips.carplay.service.h hVar, com.autochips.carplay.c.a aVar) {
        this.mCarplayMonitor = hVar;
        this.rY = aVar;
        this.si.a(hVar, aVar);
        this.sj.a(hVar, aVar);
        this.sk.a(hVar, aVar);
        if (this.mCarplayMonitor != null) {
            this.mCarplayMonitor.a(CarplayMessage.CARPLAY_SESSION_CONNECTED, this);
        }
    }

    @Override // android.os.Handler
    public final void handleMessage(Message message) {
        Log.d("CarplayResourceController", "handleMessage: " + CarplayMessage.messageString(message.what));
        int i = message.what;
        switch (i) {
            case CarplayMessage.USER_START_VIDEO /* 259 */:
                Surface surface = (Surface) message.obj;
                Log.d("CarplayResourceController", "setSurface: " + surface);
                aa aaVar = this.si;
                Message messageObtainMessage = aaVar.sQ.obtainMessage(0);
                messageObtainMessage.obj = surface;
                aaVar.sQ.sendMessage(messageObtainMessage);
                break;
            case CarplayMessage.USER_STOP_VIDEO /* 260 */:
                Log.d("CarplayResourceController", "user select " + message.arg1);
                this.si.disable(message.arg1);
                break;
            case CarplayMessage.USER_SET_AUDIO_ENABLE /* 261 */:
                if (!((Boolean) message.obj).booleanValue()) {
                    this.sj.sw.sendMessage(1);
                } else {
                    this.sj.sw.sendMessage(0);
                }
                break;
            default:
                switch (i) {
                    case CarplayMessage.CARPLAY_SESSION_CONNECTED /* 1802 */:
                        this.si.W(2);
                        this.sj.W(2);
                        this.sk.W(2);
                        break;
                    case CarplayMessage.CARPLAY_SESSION_DISCONNECTED /* 1803 */:
                        this.si.W(0);
                        this.sj.W(0);
                        this.sk.W(0);
                        break;
                    default:
                        switch (i) {
                            case CarplayMessage.CARPLAY_DUCK_AUDIO /* 1812 */:
                                double dDoubleValue = ((Double) message.obj).doubleValue();
                                Log.d("CarplayResourceController", "double inVolume: " + dDoubleValue);
                                float f = (float) dDoubleValue;
                                Log.d("CarplayResourceController", "float volume: " + f);
                                this.sj.b(f, f);
                                break;
                            case CarplayMessage.CARPLAY_UNDUCK_AUDIO /* 1813 */:
                                this.sj.b(1.0f, 1.0f);
                                break;
                            case CarplayMessage.CARPLAY_MODE_CHANGED /* 1814 */:
                                com.autochips.carplay.common.b bVar = (com.autochips.carplay.common.b) message.obj;
                                aa aaVar2 = this.si;
                                switch (bVar.cS()) {
                                    case 1:
                                        aaVar2.sQ.sendMessage(12);
                                        break;
                                    case 2:
                                        aaVar2.sQ.sendMessage(13);
                                        break;
                                }
                                m mVar = this.sj;
                                switch (bVar.getMainAudio()) {
                                    case 1:
                                        mVar.sw.sendMessage(13);
                                        break;
                                    case 2:
                                        mVar.sw.sendMessage(14);
                                        break;
                                }
                                f fVar = this.sk;
                                switch (bVar.getMainAudio()) {
                                    case 1:
                                        fVar.sl.sendMessage(12);
                                        break;
                                    case 2:
                                        fVar.sl.sendMessage(13);
                                        break;
                                }
                                break;
                            case CarplayMessage.CARPLAY_REQUEST_ACCESSORY_UI /* 1815 */:
                                Log.d("CarplayResourceController", "request accessory ui");
                                this.si.disable(CarplayMessage.USER_SELECT_STOP_VIDEO);
                                break;
                            default:
                                Log.d("CarplayResourceController", "ignoring msg=" + message);
                                break;
                        }
                        break;
                }
                break;
        }
    }
}
