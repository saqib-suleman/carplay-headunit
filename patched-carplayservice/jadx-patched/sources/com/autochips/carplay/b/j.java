package com.autochips.carplay.b;

import android.os.Message;
import android.util.Log;
import com.android.internal.util.State;
import com.autochips.carplay.common.CarplayMessage;

/* JADX INFO: loaded from: classes.dex */
final class j extends State {
    final /* synthetic */ h ss;

    j(h hVar) {
        this.ss = hVar;
    }

    public final void enter() {
        Log.d("FullDuplexAudioManager", "entering ControllerState");
    }

    public final void exit() {
        Log.d("FullDuplexAudioManager", "exit ControllerState");
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Code duplicated, block: B:14:0x0074  */
    public final boolean processMessage(Message message) {
        h hVar;
        State state;
        Log.d("FullDuplexAudioManager", getName() + " processMessage: " + message.what);
        int i = message.what;
        if (i != 15) {
            switch (i) {
                case 10:
                    h.a(this.ss, message.arg1, message.arg2);
                    return true;
                case 11:
                    int i2 = message.arg1;
                    if (i2 != 100 && i2 != 102) {
                        Log.d("FullDuplexAudioManager", "ignore invalid stream id: " + i2);
                        return true;
                    }
                    com.autochips.carplay.common.b bVarDo = f.sk.m3do();
                    if (bVarDo != null) {
                        int mainAudio = bVarDo.getMainAudio();
                        if (2 == mainAudio) {
                            hVar = this.ss;
                            state = this.ss.sn;
                        } else {
                            if (1 != mainAudio || this.ss.getCurrentState() == this.ss.so) {
                                Log.w("FullDuplexAudioManager", "main audio entity: " + mainAudio);
                                return true;
                            }
                            hVar = this.ss;
                            state = this.ss.so;
                        }
                        hVar.transitionTo(state);
                        return true;
                    }
                    break;
                case 12:
                    break;
                case 13:
                    hVar = this.ss;
                    state = this.ss.sn;
                    hVar.transitionTo(state);
                    return true;
                default:
                    switch (i) {
                        case CarplayMessage.ACCESSORY_AUDIO_STATE_CHANGED /* 2305 */:
                        case CarplayMessage.ACCESSORY_CALL_STATE_CHANGED /* 2306 */:
                            boolean zEl = this.ss.sm.rY.el();
                            int iEm = this.ss.sm.rY.em();
                            if (!zEl && iEm == 0) {
                                Log.d("FullDuplexAudioManager", "<ControllerState> accessoty callOn: " + zEl + ", audioState: " + iEm);
                                if (this.ss.sr == 3) {
                                    h.d(this.ss);
                                    return true;
                                }
                            }
                            break;
                        default:
                            return false;
                    }
                    break;
            }
        } else {
            int mode = this.ss.sm.mAudioManager.getMode();
            if (mode == 2019 || mode == 2020) {
                Log.d("FullDuplexAudioManager", "<ControllerState> audio mode in " + mode + ", set to normal");
                this.ss.sm.mAudioManager.setMode(0);
            }
        }
        return true;
    }
}
