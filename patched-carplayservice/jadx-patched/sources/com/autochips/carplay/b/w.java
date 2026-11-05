package com.autochips.carplay.b;

import android.os.Message;
import android.util.Log;
import com.android.internal.util.State;
import com.autochips.carplay.common.CarplayMessage;

/* JADX INFO: loaded from: classes.dex */
final class w extends State {
    final /* synthetic */ s sP;

    w(s sVar) {
        this.sP = sVar;
    }

    public final void enter() {
        Log.d("OutputAudioStateMachine", "entering ControllerState");
    }

    public final void exit() {
        this.sP.dj();
        Log.d("OutputAudioStateMachine", "exit ControllerState");
    }

    public final boolean processMessage(Message message) {
        s sVar;
        State state;
        com.autochips.carplay.common.b bVarDo;
        Log.d("OutputAudioStateMachine", getName() + " processMessage: " + message.what);
        switch (message.what) {
            case 0:
                s.a(this.sP, true);
                return true;
            case 1:
                s.a(this.sP, false);
                return true;
            case 10:
                int i = message.arg1;
                int i2 = message.arg2;
                this.sP.sD = 0;
                this.sP.sG = i;
                this.sP.sH = i2;
                s.a(this.sP, i, i2);
                return true;
            case 11:
                this.sP.sD = 1;
                this.sP.sG = 0;
                this.sP.sH = 0;
                int i3 = message.arg1;
                if (i3 != 100 && i3 != 102) {
                    Log.d("OutputAudioStateMachine", "ignore invalid stream id: " + i3);
                    return true;
                }
                com.autochips.carplay.common.b bVarDo2 = m.sj.m3do();
                if (bVarDo2 != null) {
                    int mainAudio = bVarDo2.getMainAudio();
                    if (2 == mainAudio) {
                        sVar = this.sP;
                        state = this.sP.sn;
                    } else {
                        if (1 != mainAudio || this.sP.getCurrentState() == this.sP.so) {
                            Log.w("OutputAudioStateMachine", "main audio entity: " + mainAudio);
                            return true;
                        }
                        sVar = this.sP;
                        state = this.sP.so;
                    }
                    sVar.transitionTo(state);
                    return true;
                }
                return true;
            case 12:
                s.d(this.sP, message.arg1);
                return true;
            case 13:
                if (this.sP.sr == 4) {
                    this.sP.removeMessages(18);
                    s.c(this.sP);
                    return true;
                }
                return true;
            case 14:
                if (this.sP.sr == 3 || this.sP.sr == 1 || this.sP.sr == 2) {
                    this.sP.removeMessages(18);
                    s.c(this.sP);
                }
                sVar = this.sP;
                state = this.sP.sn;
                sVar.transitionTo(state);
                return true;
            case 17:
                if (m.sA && !this.sP.sI) {
                    this.sP.dn();
                    return true;
                }
                return true;
            case 18:
                Log.w("OutputAudioStateMachine", "wait mode change timeout, current request transfer type: " + this.sP.sr + "(" + message.arg1 + ")");
                s.l(this.sP);
                return true;
            case CarplayMessage.ACCESSORY_AUDIO_STATE_CHANGED /* 2305 */:
            case CarplayMessage.ACCESSORY_CALL_STATE_CHANGED /* 2306 */:
                boolean zEl = this.sP.sC.rY.el();
                int iEm = this.sP.sC.rY.em();
                if (!zEl && iEm == 0) {
                    Log.d("OutputAudioStateMachine", "<ControllerState> accessoty callOn: " + zEl + ", audioState: " + iEm);
                    if (this.sP.sI && (bVarDo = m.sj.m3do()) != null && 2 == bVarDo.getMainAudio()) {
                        this.sP.dm();
                        return true;
                    }
                }
                return true;
            default:
                return false;
        }
    }
}
