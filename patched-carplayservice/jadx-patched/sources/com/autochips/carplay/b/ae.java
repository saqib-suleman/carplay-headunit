package com.autochips.carplay.b;

import android.util.Log;
import com.android.internal.util.State;

/* JADX INFO: loaded from: classes.dex */
final class ae extends State {
    final /* synthetic */ ac sW;

    ae(ac acVar) {
        this.sW = acVar;
    }

    public final void enter() {
        Log.d("ScreenManager", "entering ControllerState");
    }

    public final void exit() {
        Log.d("ScreenManager", "exit ControllerState");
    }

    /* JADX WARN: Code restructure failed: missing block: B:20:0x009e, code lost:
    
        if (2 == r7.cS()) goto L26;
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x00af, code lost:
    
        if (r6.sW.sD != 0) goto L26;
     */
    /* JADX WARN: Code restructure failed: missing block: B:26:0x00b1, code lost:
    
        r6.sW.dp();
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x00b6, code lost:
    
        return true;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean processMessage(android.os.Message r7) {
        /*
            Method dump skipped, instruction units count: 530
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.autochips.carplay.b.ae.processMessage(android.os.Message):boolean");
    }
}
