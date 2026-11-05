package com.autochips.carplay.b;

import android.os.Message;
import android.util.Log;
import com.android.internal.util.State;

/* JADX INFO: loaded from: classes.dex */
final class p extends State {
    final /* synthetic */ o sF;

    p(o oVar) {
        this.sF = oVar;
    }

    public final void enter() {
        Log.d("AlternateAudioStateMachine", "entering IdleState");
    }

    public final boolean processMessage(Message message) {
        Log.d("AlternateAudioStateMachine", getName() + " processMessage: " + message.what);
        switch (message.what) {
            case 10:
                this.sF.sD = 0;
                this.sF.transitionTo(this.sF.ey);
                return true;
            case 11:
                return true;
            default:
                Log.d("AlternateAudioStateMachine", "received an invalid message: " + message);
                return false;
        }
    }
}
