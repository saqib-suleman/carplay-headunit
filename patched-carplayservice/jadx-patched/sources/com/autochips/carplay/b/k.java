package com.autochips.carplay.b;

import android.media.AudioFocusRequest;
import android.media.audiopolicy.AudioPolicy;
import android.os.Message;
import android.util.Log;
import com.android.internal.util.State;

/* JADX INFO: loaded from: classes.dex */
final class k extends State {
    final /* synthetic */ h ss;
    private AudioFocusRequest st = null;
    private AudioPolicy su = null;
    private boolean sv = false;

    k(h hVar) {
        this.ss = hVar;
    }

    public final void enter() {
        Log.d("FullDuplexAudioManager", "entering SpeechRecognitionState");
        this.ss.sm.mAudioManager.setMode(2020);
        Log.w("FullDuplexAudioManager", "SpeechRecognitionState, mode: " + this.ss.sm.mAudioManager.getMode());
        if (!this.sv) {
            Log.d("FullDuplexAudioManager", "requestAudioFocusForSpeech");
            this.ss.sm.mAudioManager.requestAudioFocusForCall(0, 2);
            this.sv = true;
        }
        h.dd();
    }

    public final void exit() {
        Log.d("FullDuplexAudioManager", "exit SpeechRecognitionState");
        h.de();
        if (this.sv) {
            Log.d("FullDuplexAudioManager", "abandonAudioFocusForSpeech");
            this.ss.sm.mAudioManager.abandonAudioFocusForCall();
            this.sv = false;
        }
        this.ss.sm.mAudioManager.setMode(0);
    }

    public final boolean processMessage(Message message) {
        Log.d("FullDuplexAudioManager", getName() + " processMessage: " + message.what);
        if (message.what != 11) {
            return false;
        }
        int i = message.arg1;
        if (i == 100) {
            this.ss.transitionTo(this.ss.so);
            return true;
        }
        Log.d("FullDuplexAudioManager", "ignore invalid stream id: " + i);
        return true;
    }
}
