package com.autochips.carplay.b;

import android.os.Message;
import android.util.Log;
import com.android.internal.util.State;

/* JADX INFO: loaded from: classes.dex */
final class q extends State {
    final /* synthetic */ o sF;

    q(o oVar) {
        this.sF = oVar;
    }

    public final void enter() {
        Log.d("AlternateAudioStateMachine", "entering StartedState");
        m.a(this.sF.sC, true);
        this.sF.st = this.sF.di();
        m.sj.start(101);
    }

    public final void exit() {
        m.a(this.sF.sC, false);
        m.sj.start(101);
        this.sF.dj();
    }

    public final boolean processMessage(Message message) {
        Log.d("AlternateAudioStateMachine", getName() + " processMessage: " + message.what);
        switch (message.what) {
            case 11:
                this.sF.sD = 1;
                this.sF.transitionTo(this.sF.sE);
            case 10:
                return true;
            default:
                Log.d("AlternateAudioStateMachine", "received an invalid message: " + message);
                return false;
        }
    }
}
