package com.autochips.carplay.b;

import android.os.Message;
import android.util.Log;
import com.android.internal.util.State;
import com.autochips.carplay.common.CarplayMessage;

/* JADX INFO: loaded from: classes.dex */
final class ad extends State {
    final /* synthetic */ ac sW;

    ad(ac acVar) {
        this.sW = acVar;
    }

    public final void enter() {
        Log.d("ScreenManager", "entering AccessoryState");
    }

    public final void exit() {
        Log.d("ScreenManager", "exit AccessoryState");
    }

    public final boolean processMessage(Message message) {
        ac acVar;
        State state;
        Log.d("ScreenManager", getName() + " processMessage: " + message.what);
        int i = message.what;
        if (i == 20) {
            Log.w("ScreenManager", "wait mode change timeout, current request transfer type: " + this.sW.sr + "(" + message.arg1 + ")");
            ac.q(this.sW);
        } else if (i != 22) {
            switch (i) {
                case 0:
                    if (!this.sW.sT.sg) {
                        ac.a(this.sW, message, true);
                        return true;
                    }
                    break;
                case 1:
                    ac.b(this.sW);
                    this.sW.mSurface = null;
                    return true;
                default:
                    switch (i) {
                        case 10:
                            this.sW.sD = 0;
                            Log.w("ScreenManager", "mode not change to controller, but screen stream already started");
                            acVar = this.sW;
                            state = this.sW.ey;
                            acVar.transitionTo(state);
                            return true;
                        case 11:
                            this.sW.sD = 1;
                            return true;
                        case 12:
                            if (this.sW.sr == 4 || this.sW.sr == 1 || this.sW.sr == 2) {
                                this.sW.removeMessages(20);
                                ac.e(this.sW);
                            } else if (this.sW.sU) {
                                this.sW.removeMessages(20);
                            }
                            acVar = this.sW;
                            state = this.sW.so;
                            acVar.transitionTo(state);
                            return true;
                        case 13:
                            if (this.sW.sr == 3) {
                                this.sW.removeMessages(20);
                                ac.e(this.sW);
                                return true;
                            }
                            break;
                        case 14:
                        case 15:
                            ac.b(this.sW);
                            this.sW.mSurface = null;
                            ac.j(this.sW);
                            ac.e(this.sW);
                            this.sW.sD = 1;
                            this.sW.sV = false;
                            this.sW.removeMessages(0);
                            this.sW.removeMessages(22);
                            this.sW.removeMessages(23);
                            this.sW.removeMessages(21);
                            this.sW.removeMessages(24);
                            this.sW.removeMessages(20);
                            return true;
                        default:
                            switch (i) {
                                case CarplayMessage.ACCESSORY_AUDIO_STATE_CHANGED /* 2305 */:
                                case CarplayMessage.ACCESSORY_CALL_STATE_CHANGED /* 2306 */:
                                    boolean zEl = this.sW.sT.rY.el();
                                    int iEm = this.sW.sT.rY.em();
                                    if (!zEl && iEm == 0) {
                                        Log.d("ScreenManager", "<AccessoryState> accessoty callOn: " + zEl + ", audioState: " + iEm);
                                        if (this.sW.sU) {
                                            this.sW.dp();
                                            return true;
                                        }
                                    }
                                    break;
                                default:
                                    switch (i) {
                                        case CarplayMessage.BACKCAR_EVENT_START /* 4097 */:
                                            this.sW.sT.sg = true;
                                            return true;
                                        case CarplayMessage.BACKCAR_EVENT_STOP /* 4098 */:
                                            this.sW.sT.sg = false;
                                            return true;
                                        case CarplayMessage.BACKCAR_EVENT_ARM2_EXIT /* 4099 */:
                                            aa.c(this.sW.sT);
                                            return true;
                                        default:
                                            Log.d("ScreenManager", "received an invalid message: " + message);
                                            return false;
                                    }
                            }
                            break;
                    }
                    break;
            }
        } else if (this.sW.sU && !this.sW.hasMessages(0)) {
            Message messageObtainMessage = this.sW.sT.sQ.obtainMessage(0);
            messageObtainMessage.obj = this.sW.mSurface;
            this.sW.sendMessage(messageObtainMessage);
            return true;
        }
        return true;
    }
}
