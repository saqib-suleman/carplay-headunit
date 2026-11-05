package com.autochips.carplay.b;

import android.os.Message;
import android.util.Log;
import com.android.internal.util.State;

/* JADX INFO: loaded from: classes.dex */
final class v extends State {
    final /* synthetic */ s sP;

    v(s sVar) {
        this.sP = sVar;
    }

    public final void enter() {
        Log.d("OutputAudioStateMachine", "entering CompatiblityState");
    }

    public final void exit() {
        this.sP.dj();
        Log.d("OutputAudioStateMachine", "exit CompatiblityState");
    }

    public final boolean processMessage(Message message) {
        Log.d("OutputAudioStateMachine", getName() + " processMessage: " + message.what);
        int i = message.what;
        if (i == 0) {
            s.a(this.sP, true);
        } else if (i != 3) {
            return false;
        }
        if (this.sP.sC.sy <= 0) {
            this.sP.Z(6);
        } else {
            s.aa(this.sP.sG);
        }
        if (this.sP.sJ) {
            s.u(this.sP);
        }
        return true;
    }
}
