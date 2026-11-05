package com.autochips.carplay.b;

import android.os.Message;
import android.util.Log;
import com.android.internal.util.State;
import com.autochips.carplay.common.CarplayMessage;

/* JADX INFO: loaded from: classes.dex */
final class t extends State {
    final /* synthetic */ s sP;

    t(s sVar) {
        this.sP = sVar;
    }

    public final void enter() {
        Log.d("OutputAudioStateMachine", "entering AccessoryState");
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    public final boolean processMessage(Message message) {
        Log.d("OutputAudioStateMachine", getName() + " processMessage: " + message.what);
        int i = message.what;
        switch (i) {
            case 0:
                s.a(this.sP, true);
                return true;
            case 1:
                s.a(this.sP, false);
                return true;
            default:
                switch (i) {
                    case 10:
                        int i2 = message.arg1;
                        int i3 = message.arg2;
                        this.sP.sD = 0;
                        this.sP.sG = i2;
                        this.sP.sH = i3;
                        s.a(this.sP, i2, i3);
                        return true;
                    case 11:
                        this.sP.sD = 1;
                        this.sP.sG = 0;
                        this.sP.sH = 0;
                        return true;
                    case 12:
                        s.d(this.sP, message.arg1);
                        return true;
                    case 13:
                        if (this.sP.sr == 4) {
                            this.sP.removeMessages(18);
                            s.c(this.sP);
                        }
                        if (this.sP.sD == 1 || this.sP.sG == 0 || this.sP.sH == 0) {
                            this.sP.transitionTo(this.sP.so);
                            return true;
                        }
                        s.a(this.sP, this.sP.sG, this.sP.sH);
                        return true;
                    case 14:
                        if (this.sP.sr == 3 || this.sP.sr == 1 || this.sP.sr == 2) {
                            this.sP.removeMessages(18);
                            s.c(this.sP);
                            return true;
                        }
                        return true;
                    case 15:
                    case 16:
                        s.i(this.sP);
                        m.a(this.sP.sC, false);
                        this.sP.removeMessages(17);
                        this.sP.removeMessages(18);
                        return true;
                    case 17:
                        return true;
                    case 18:
                        Log.w("OutputAudioStateMachine", "wait mode change timeout, current request transfer type: " + this.sP.sr + "(" + message.arg1 + ")");
                        s.l(this.sP);
                        return true;
                    default:
                        switch (i) {
                            case CarplayMessage.ACCESSORY_AUDIO_STATE_CHANGED /* 2305 */:
                            case CarplayMessage.ACCESSORY_CALL_STATE_CHANGED /* 2306 */:
                                boolean zEl = this.sP.sC.rY.el();
                                int iEm = this.sP.sC.rY.em();
                                if (!zEl && iEm == 0) {
                                    Log.d("OutputAudioStateMachine", "<AccessoryState> accessoty callOn: " + zEl + ", audioState: " + iEm);
                                    if (this.sP.sI) {
                                        this.sP.dm();
                                        return true;
                                    }
                                }
                                return true;
                            default:
                                Log.d("OutputAudioStateMachine", "received an invalid message: " + message);
                                return false;
                        }
                }
        }
    }
}
