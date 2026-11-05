package com.autochips.carplay.b;

import android.os.Message;
import android.util.Log;
import com.android.internal.util.State;

/* JADX INFO: loaded from: classes.dex */
final class af extends State {
    final /* synthetic */ ac sW;
    private boolean sX = false;

    af(ac acVar) {
        this.sW = acVar;
    }

    public final void enter() {
        Log.d("ScreenManager", "entering StartedState");
        if (!this.sW.sU) {
            if (this.sW.hasMessages(23)) {
                return;
            }
            this.sW.sendMessageDelayed(23, 10000L);
        } else {
            if (this.sW.hasDeferredMessages(0)) {
                return;
            }
            Message messageObtainMessage = this.sW.sT.sQ.obtainMessage(0);
            messageObtainMessage.obj = this.sW.mSurface;
            this.sW.sendMessage(messageObtainMessage);
        }
    }

    public final void exit() {
        Log.d("ScreenManager", "exit StartedState");
        if (this.sW.hasMessages(23)) {
            this.sW.removeMessages(23);
        }
        if (this.sW.hasMessages(21)) {
            this.sW.removeMessages(21);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:33:0x00cd, code lost:
    
        if (r7.sW.hasMessages(21) == false) goto L34;
     */
    /* JADX WARN: Code restructure failed: missing block: B:34:0x00cf, code lost:
    
        r7.sW.sendMessageDelayed(21, 1000);
     */
    /* JADX WARN: Code restructure failed: missing block: B:35:0x00d4, code lost:
    
        return true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:49:0x0162, code lost:
    
        if (r7.sW.hasMessages(21) == false) goto L34;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean processMessage(android.os.Message r8) {
        /*
            Method dump skipped, instruction units count: 368
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.autochips.carplay.b.af.processMessage(android.os.Message):boolean");
    }
}
