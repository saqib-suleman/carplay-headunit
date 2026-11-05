package com.autochips.carplay.b;

import android.media.AudioAttributes;
import android.media.AudioFocusRequest;
import android.os.Looper;
import android.util.Log;
import com.android.internal.util.State;
import com.android.internal.util.StateMachine;

/* JADX INFO: loaded from: classes.dex */
class o extends StateMachine {
    private final State ey;
    final /* synthetic */ m sC;
    private int sD;
    private final State sE;
    private AudioFocusRequest st;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    o(m mVar, Looper looper) {
        super(o.class.getSimpleName(), looper);
        this.sC = mVar;
        this.sD = 1;
        this.sE = new p(this);
        this.ey = new q(this);
        this.st = null;
        addState(this.sE);
        addState(this.ey);
        setInitialState(this.sE);
        start();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized AudioFocusRequest di() {
        AudioFocusRequest audioFocusRequestBuild;
        Log.d("AlternateAudioStateMachine", "requestAudioFocus");
        audioFocusRequestBuild = new AudioFocusRequest.Builder(3).setAudioAttributes(new AudioAttributes.Builder().setUsage(5).setContentType(5).build()).build();
        Log.d("AlternateAudioStateMachine", "focusRequestStatus: " + this.sC.mAudioManager.requestAudioFocus(audioFocusRequestBuild));
        return audioFocusRequestBuild;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized void dj() {
        Log.d("AlternateAudioStateMachine", "abandonAudioFocus");
        if (this.st == null) {
            return;
        }
        this.sC.mAudioManager.abandonAudioFocusRequest(this.st);
        this.st = null;
    }

    protected void onHalting() {
        Log.d("AlternateAudioStateMachine", "onHalting:" + this);
    }

    protected void onQuitting() {
        Log.d("AlternateAudioStateMachine", "onQuitting:" + this);
    }
}
