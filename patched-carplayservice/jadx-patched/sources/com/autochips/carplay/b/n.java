package com.autochips.carplay.b;

import android.media.AudioManager;
import android.os.Message;
import android.util.Log;

/* JADX INFO: loaded from: classes.dex */
final class n implements AudioManager.OnAudioFocusChangeListener {
    final /* synthetic */ m sC;

    n(m mVar) {
        this.sC = mVar;
    }

    @Override // android.media.AudioManager.OnAudioFocusChangeListener
    public final void onAudioFocusChange(int i) {
        Log.i("OutputAudioManager", "onAudioFocusChangeListener focuschange " + i);
        Message messageObtainMessage = this.sC.sw.obtainMessage(12);
        messageObtainMessage.arg1 = i;
        this.sC.sw.sendMessage(messageObtainMessage);
    }
}
