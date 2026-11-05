package com.autochips.carplay.b;

import android.os.Message;
import android.util.Log;
import com.android.internal.util.State;
import com.autochips.carplay.common.CarplayMessage;

/* JADX INFO: loaded from: classes.dex */
final class i extends State {
    final /* synthetic */ h ss;

    i(h hVar) {
        this.ss = hVar;
    }

    public final void enter() {
        Log.d("FullDuplexAudioManager", "entering AccessoryState");
    }

    public final void exit() {
        Log.d("FullDuplexAudioManager", "exit AccessoryState");
    }

    public final boolean processMessage(Message message) {
        Log.d("FullDuplexAudioManager", getName() + " processMessage: " + message.what);
        int i = message.what;
        switch (i) {
            case 10:
                h.a(this.ss, message.arg1, message.arg2);
                return true;
            case 11:
            case 13:
                return true;
            case 12:
                this.ss.transitionTo(this.ss.so);
                return true;
            case 14:
                break;
            case 15:
                int mode = this.ss.sm.mAudioManager.getMode();
                if (mode == 2019 || mode == 2020) {
                    Log.d("FullDuplexAudioManager", "<AccessoryState> audio mode in " + mode + ", set to normal");
                    this.ss.sm.mAudioManager.setMode(0);
                }
                break;
            default:
                switch (i) {
                    case CarplayMessage.ACCESSORY_AUDIO_STATE_CHANGED /* 2305 */:
                    case CarplayMessage.ACCESSORY_CALL_STATE_CHANGED /* 2306 */:
                        boolean zEl = this.ss.sm.rY.el();
                        int iEm = this.ss.sm.rY.em();
                        if (zEl || iEm != 0) {
                            return true;
                        }
                        Log.d("FullDuplexAudioManager", "<AccessoryState> accessoty callOn: " + zEl + ", audioState: " + iEm);
                        if (this.ss.sr != 3) {
                            return true;
                        }
                        h.d(this.ss);
                        return true;
                    default:
                        Log.d("FullDuplexAudioManager", "received an invalid message: " + message);
                        return false;
                }
        }
        h.b(this.ss);
        return true;
    }
}
