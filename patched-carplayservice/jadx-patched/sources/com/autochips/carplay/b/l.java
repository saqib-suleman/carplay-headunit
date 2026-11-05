package com.autochips.carplay.b;

import android.os.Message;
import android.util.Log;
import com.android.internal.util.State;
import com.autochips.carplay.common.CarplayMessage;

/* JADX INFO: loaded from: classes.dex */
final class l extends State {
    final /* synthetic */ h ss;
    private boolean sv = false;

    l(h hVar) {
        this.ss = hVar;
    }

    private void df() {
        if (this.sv) {
            return;
        }
        Log.d("FullDuplexAudioManager", "requestAudioFocusForCall");
        this.ss.sm.mAudioManager.requestAudioFocusForCall(0, 2);
        this.sv = true;
    }

    public final void enter() {
        Log.d("FullDuplexAudioManager", "entering TelephonyState");
        int iEk = this.ss.sm.rY.ek();
        int iEm = this.ss.sm.rY.em();
        if (iEk == 1 || (iEk == 2 && iEm == 2)) {
            Log.w("FullDuplexAudioManager", "<TelephonyState> accessoty callType: " + iEk + ", audioState: " + iEm);
            h.f(this.ss);
            return;
        }
        this.ss.sm.mAudioManager.setMode(2019);
        Log.w("FullDuplexAudioManager", "TelephonyState, mode: " + this.ss.sm.mAudioManager.getMode());
        df();
        h.dd();
    }

    public final void exit() {
        Log.d("FullDuplexAudioManager", "exit TelephonyState");
        h.de();
        if (this.sv) {
            Log.d("FullDuplexAudioManager", "abandonAudioFocusForCall");
            this.ss.sm.mAudioManager.abandonAudioFocusForCall();
            this.sv = false;
        }
        this.ss.sm.mAudioManager.setMode(0);
    }

    public final boolean processMessage(Message message) {
        Log.d("FullDuplexAudioManager", getName() + " processMessage: " + message.what);
        int i = message.what;
        if (i == 11) {
            int i2 = message.arg1;
            if (i2 == 100) {
                this.ss.transitionTo(this.ss.so);
                return true;
            }
            Log.d("FullDuplexAudioManager", "ignore invalid stream id: " + i2);
            return true;
        }
        switch (i) {
            case CarplayMessage.ACCESSORY_AUDIO_STATE_CHANGED /* 2305 */:
            case CarplayMessage.ACCESSORY_CALL_STATE_CHANGED /* 2306 */:
                boolean zEl = this.ss.sm.rY.el();
                int iEm = this.ss.sm.rY.em();
                if (zEl || iEm != 0) {
                    return true;
                }
                Log.d("FullDuplexAudioManager", "<TelephonyState> accessoty callOn: " + zEl + ", audioState: " + iEm);
                if (this.ss.sr != 3) {
                    return true;
                }
                h.d(this.ss);
                this.ss.sm.mAudioManager.setMode(2019);
                Log.w("FullDuplexAudioManager", "TelephonyState, mode: " + this.ss.sm.mAudioManager.getMode());
                df();
                h.dd();
                return true;
            default:
                return false;
        }
    }
}
