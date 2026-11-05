package com.autochips.carplay.b;

import android.content.Context;
import android.media.AudioManager;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.util.Log;
import com.autochips.carplay.CarplayDevice;
import com.autochips.carplay.common.CarplayMessage;
import com.autochips.carplay.service.CarplayService;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public final class d extends Handler {
    private AudioManager mAudioManager;
    private com.autochips.carplay.service.h mCarplayMonitor;
    private final Context mContext;
    private com.autochips.carplay.c.a rY;
    private com.autochips.carplay.common.f rZ;
    private com.autochips.carplay.common.g sa;
    private com.autochips.carplay.common.g sb;
    private int sc;
    private boolean sd;
    private int se;
    private boolean sf;
    private boolean sg;
    private int sh;

    public d(Context context, Looper looper) {
        super(looper);
        this.mAudioManager = null;
        this.mCarplayMonitor = null;
        this.rY = null;
        this.rZ = null;
        this.sa = null;
        this.sb = null;
        this.sc = 0;
        this.sd = false;
        this.se = 0;
        this.sf = false;
        this.sg = false;
        this.sh = 0;
        this.mContext = context;
        this.mAudioManager = (AudioManager) this.mContext.getSystemService("audio");
    }

    private void a(com.autochips.carplay.common.f fVar, CarplayDevice carplayDevice) {
        if (this.sg) {
            fVar.qF.qK = 3;
            fVar.qF.qL = 500;
            fVar.qF.qM = 0;
            fVar.qF.qN = 1000;
            return;
        }
        fVar.qF.qK = 1;
        if (carplayDevice == null || com.autochips.carplay.service.ac.a(this.mContext).K(carplayDevice.toString()) != 0) {
            fVar.qF.qL = 100;
            fVar.qF.qM = 100;
        } else {
            fVar.qF.qL = 500;
            fVar.qF.qM = 500;
        }
        fVar.qF.qN = 100;
    }

    private boolean a(com.autochips.carplay.common.f fVar, boolean z) {
        boolean zEl = this.rY.el();
        Log.d("CarplayAppStateController", "updatePhoneCall, isAccessoryCallOn: " + zEl + ", force: " + z);
        if (!z && this.sd == zEl) {
            return false;
        }
        this.sd = zEl;
        if (zEl) {
            fVar.qH = 1;
            return true;
        }
        fVar.qH = -1;
        return true;
    }

    private boolean a(com.autochips.carplay.common.f fVar, boolean z, boolean z2) {
        if (fVar.equals(this.rZ)) {
            Log.w("CarplayAppStateController", "the same request, ignore!");
            return false;
        }
        if (fVar.qG.equals(this.sb)) {
            Log.w("CarplayAppStateController", "the same main audio request, reset!");
            fVar.qG.qK = 0;
            fVar.qG.qL = 0;
            fVar.qG.qM = 0;
            fVar.qG.qN = 0;
        } else {
            this.sb = fVar.qG;
        }
        if (!fVar.qF.equals(this.sa) || z2) {
            this.sa = fVar.qF;
        } else {
            Log.w("CarplayAppStateController", "the same main screen request, reset!");
            fVar.qF.qK = 0;
            fVar.qF.qL = 0;
            fVar.qF.qM = 0;
            fVar.qF.qN = 0;
        }
        this.rZ = fVar;
        Message messageObtainMessage = obtainMessage(CarplayMessage.USER_CHANGE_MODE_REQUEST);
        messageObtainMessage.obj = fVar;
        messageObtainMessage.arg1 = z ? 1 : 0;
        if (com.autochips.carplay.service.g.dx().dC() == null) {
            return true;
        }
        com.autochips.carplay.service.g.dx().dC().sendMessage(messageObtainMessage);
        return true;
    }

    private boolean b(com.autochips.carplay.common.f fVar, boolean z) {
        int i;
        int iEk = this.rY.ek();
        int iEm = this.rY.em();
        Log.d("CarplayAppStateController", "updateSpeech, callType: " + iEk + ", audioState: " + iEm);
        boolean z2 = false;
        if (iEk == 1 || iEm == 2) {
            fVar.qF.qK = 3;
            fVar.qF.qL = 500;
            fVar.qF.qM = 0;
            fVar.qF.qN = 1000;
            fVar.qG.qK = 3;
            fVar.qG.qL = 500;
            fVar.qG.qM = 0;
            fVar.qG.qN = 1000;
            fVar.qI = 1;
            i = 1;
            z2 = true;
        } else {
            if (!z && iEk == 0 && iEm == 0) {
                com.autochips.carplay.service.p pVarDC = com.autochips.carplay.service.g.dx().dC();
                if (pVarDC != null) {
                    List connectedDevices = pVarDC.getConnectedDevices();
                    if (connectedDevices.size() != 0 && connectedDevices.get(0) != null && com.autochips.carplay.service.ac.a(this.mContext).K(((CarplayDevice) connectedDevices.get(0)).toString()) == 1) {
                        Message messageObtainMessage = obtainMessage(CarplayMessage.USER_REQUEST_DEVICE_UI);
                        messageObtainMessage.arg1 = 1;
                        messageObtainMessage.obj = null;
                        pVarDC.sendMessage(messageObtainMessage);
                    }
                }
                if (this.sg) {
                    Log.d("CarplayAppStateController", "backcar ongoing, ignore unborrow screen");
                } else {
                    fVar.qF.qK = 4;
                }
                fVar.qG.qK = 4;
            } else if (iEk == 2 && iEm == 0) {
                if (this.sb != null && this.sb.qK == 3 && this.sb.qN == 1000) {
                    fVar.qG.qK = 3;
                    fVar.qG.qL = 500;
                    fVar.qG.qM = 0;
                    fVar.qG.qN = 1000;
                }
                fVar.qF.qK = 3;
                fVar.qF.qL = 500;
                fVar.qF.qM = 0;
                fVar.qF.qN = 1000;
            } else {
                i = -1;
            }
            fVar.qI = -1;
            i = -1;
            z2 = true;
        }
        if (iEk != 0) {
            fVar.qH = 1;
        } else {
            fVar.qH = -1;
        }
        if (this.se != i) {
            this.se = i;
        }
        if (iEk == 0 && iEm == 0) {
            sendMessage(obtainMessage(1));
        }
        return z2;
    }

    private void m(boolean z) {
        List connectedDevices;
        CarplayService carplayServiceDy = com.autochips.carplay.service.g.dx().dy();
        if (carplayServiceDy == null || (connectedDevices = carplayServiceDy.getConnectedDevices()) == null || connectedDevices.size() == 0) {
            return;
        }
        if (com.autochips.carplay.service.ac.a(this.mContext).K(((CarplayDevice) connectedDevices.get(0)).toString()) == 0) {
            Log.d("CarplayAppStateController", "UI_STATE_BACKGROUND");
            com.autochips.carplay.common.f fVar = new com.autochips.carplay.common.f();
            a(fVar, (CarplayDevice) connectedDevices.get(0));
            a(fVar, true, z);
            return;
        }
        Log.d("CarplayAppStateController", "UI_STATE_FOREGROUND");
        com.autochips.carplay.common.f fVar2 = new com.autochips.carplay.common.f();
        fVar2.qF.qK = 4;
        a(fVar2, true, z);
        Message messageObtainMessage = obtainMessage(CarplayMessage.USER_REQUEST_DEVICE_UI);
        messageObtainMessage.arg1 = 1;
        messageObtainMessage.obj = null;
        com.autochips.carplay.service.g.dx().dC().sendMessage(messageObtainMessage);
    }

    public final com.autochips.carplay.common.f a(CarplayDevice carplayDevice) {
        com.autochips.carplay.common.f fVar = new com.autochips.carplay.common.f();
        a(fVar, carplayDevice);
        int currentAudioFocusContentType = this.mAudioManager != null ? this.mAudioManager.getCurrentAudioFocusContentType() : 0;
        Log.d("CarplayAppStateController", "contentType = " + currentAudioFocusContentType);
        fVar.qG.qK = 1;
        if (currentAudioFocusContentType == 2 || currentAudioFocusContentType == 3 || currentAudioFocusContentType == 7) {
            fVar.qG.qL = 500;
            fVar.qG.qM = 500;
        } else {
            fVar.qG.qL = 100;
            fVar.qG.qM = 100;
        }
        fVar.qG.qN = 100;
        a(fVar, true);
        b(fVar, true);
        fVar.qJ = -1;
        Log.d("CarplayAppStateController", "getInitialMode: " + fVar);
        return fVar;
    }

    public final void a(com.autochips.carplay.service.h hVar, com.autochips.carplay.c.a aVar) {
        this.mCarplayMonitor = hVar;
        this.rY = aVar;
        this.mCarplayMonitor.a(CarplayMessage.CARPLAY_SESSION_CONNECTED, this);
        this.mCarplayMonitor.a(CarplayMessage.BLUETOOTH_PROFILE_STATE_CHANGED, this);
        this.mCarplayMonitor.a(CarplayMessage.ACCESSORY_AUDIO_STATE_CHANGED, this);
        this.mCarplayMonitor.a(CarplayMessage.ACCESSORY_CALL_STATE_CHANGED, this);
        this.mCarplayMonitor.a(CarplayMessage.BACKCAR_EVENT_START, this);
        this.mCarplayMonitor.a(CarplayMessage.BACKCAR_EVENT_STOP, this);
        this.mCarplayMonitor.a(CarplayMessage.BACKCAR_EVENT_ARM2_EXIT, this);
        this.mCarplayMonitor.a(CarplayMessage.BACKCAR_EVENT_ERROR, this);
    }

    @Override // android.os.Handler
    public final void handleMessage(Message message) {
        Log.d("CarplayAppStateController", "handleMessage: " + message.what);
        int i = message.what;
        if (i == 1) {
            if (!this.sg && this.sh > 0) {
                this.sh--;
                m(true);
                return;
            } else {
                if (this.sg && this.sh == 0) {
                    Log.d("CarplayAppStateController", "backcar ongoing, but call skip borrow screen, we may unborrow screen after backcar stop");
                    this.sh++;
                    return;
                }
                return;
            }
        }
        if (i == 777) {
            int i2 = message.arg1;
            int i3 = message.arg2;
            Log.d("CarplayAppStateController", "profile:" + i2 + ", connectState:" + i3);
            if (16 == i2 && i3 == 0) {
                com.autochips.carplay.common.f fVar = new com.autochips.carplay.common.f();
                boolean zA = a(fVar, !this.sf);
                boolean zB = b(fVar, !this.sf);
                if ((zA || zB) && this.rZ != null) {
                    a(fVar, !this.sf, false);
                    return;
                }
                return;
            }
            return;
        }
        if (i == 1814) {
            Log.d("CarplayAppStateController", "mode state=" + ((com.autochips.carplay.common.b) message.obj));
            return;
        }
        switch (i) {
            case CarplayMessage.CARPLAY_SESSION_CONNECTED /* 1802 */:
                this.sf = true;
                break;
            case CarplayMessage.CARPLAY_SESSION_DISCONNECTED /* 1803 */:
                this.sf = false;
                this.rZ = null;
                this.sa = null;
                this.sb = null;
                this.sc = 0;
                this.sd = false;
                break;
            default:
                switch (i) {
                    case CarplayMessage.ACCESSORY_AUDIO_STATE_CHANGED /* 2305 */:
                        if (2305 == message.what) {
                            Log.d("CarplayAppStateController", "scoState: " + message.arg1);
                        }
                        break;
                    case CarplayMessage.ACCESSORY_CALL_STATE_CHANGED /* 2306 */:
                        break;
                    default:
                        switch (i) {
                            case CarplayMessage.BACKCAR_EVENT_START /* 4097 */:
                                Log.d("CarplayAppStateController", "BACKCAR_EVENT_START");
                                if (this.sf && !this.sg) {
                                    this.sg = true;
                                    if (!this.rY.el()) {
                                        com.autochips.carplay.common.f fVar2 = new com.autochips.carplay.common.f();
                                        a(fVar2, (CarplayDevice) null);
                                        a(fVar2, true, false);
                                        this.sh++;
                                    } else {
                                        Log.d("CarplayAppStateController", "carkit call ongoing, ignore backcar start event");
                                    }
                                } else {
                                    this.sg = true;
                                }
                                break;
                            case CarplayMessage.BACKCAR_EVENT_STOP /* 4098 */:
                                if (this.sf && this.sg) {
                                    this.sg = false;
                                    Log.d("CarplayAppStateController", "BACKCAR_EVENT_STOP");
                                    if (this.rY.el()) {
                                        Log.d("CarplayAppStateController", "carkit call ongoing, ignore backcar stop event");
                                    } else if (this.sh > 0) {
                                        this.sh--;
                                        m(false);
                                    }
                                }
                                this.sg = false;
                                break;
                            case CarplayMessage.BACKCAR_EVENT_ARM2_EXIT /* 4099 */:
                                this.sg = false;
                                break;
                            case CarplayMessage.BACKCAR_EVENT_ERROR /* 4100 */:
                                Log.d("CarplayAppStateController", "nothing to do with backcar error");
                                this.sg = false;
                                break;
                            default:
                                Log.d("CarplayAppStateController", "ignoring msg=" + message);
                                break;
                        }
                        break;
                }
                com.autochips.carplay.common.f fVar3 = new com.autochips.carplay.common.f();
                boolean zA2 = a(fVar3, !this.sf);
                boolean zB2 = b(fVar3, !this.sf);
                if (zA2 || zB2) {
                    a(fVar3, !this.sf, false);
                }
                break;
        }
    }
}
