package android.support.v4.media;

import android.os.Bundle;
import android.os.Handler;
import android.os.ResultReceiver;

/* JADX INFO: loaded from: classes.dex */
class MediaController2ImplLegacy$ControllerCompatCallback$1 extends ResultReceiver {
    final /* synthetic */ w kP;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    MediaController2ImplLegacy$ControllerCompatCallback$1(w wVar, Handler handler) {
        super(handler);
        this.kP = wVar;
    }

    @Override // android.os.ResultReceiver
    protected void onReceiveResult(int i, Bundle bundle) {
        if (this.kP.kM.kv.isAlive()) {
            switch (i) {
                case -1:
                    this.kP.kM.mCallbackExecutor.execute(new x(this));
                    this.kP.kM.close();
                    break;
                case 0:
                    this.kP.kM.h(bundle);
                    break;
            }
        }
    }
}
