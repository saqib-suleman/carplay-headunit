package com.autochips.carplay.b;

import android.os.Message;
import android.util.Log;
import com.android.internal.util.State;

/* JADX INFO: loaded from: classes.dex */
final class u extends State {
    final /* synthetic */ s sP;

    u(s sVar) {
        this.sP = sVar;
    }

    public final void enter() {
        Log.d("OutputAudioStateMachine", "entering AlertState");
    }

    public final void exit() {
        this.sP.dj();
        Log.d("OutputAudioStateMachine", "exit AlertState");
    }

    public final boolean processMessage(Message message) {
        Log.d("OutputAudioStateMachine", getName() + " processMessage: " + message.what);
        int i = message.what;
        if (i != 0) {
            switch (i) {
                case 3:
                case 4:
                    break;
                default:
                    return false;
            }
        } else {
            s.a(this.sP, true);
        }
        if (this.sP.sC.sy <= 0) {
            this.sP.Z(2);
        } else {
            this.sP.sC.mAudioManager.setMode(1);
            s.aa(this.sP.sG);
        }
        if (this.sP.sJ) {
            s.u(this.sP);
        }
        return true;
    }
}
