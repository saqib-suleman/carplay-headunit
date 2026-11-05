package android.support.v4.media;

import android.os.Bundle;
import android.os.ResultReceiver;

/* JADX INFO: loaded from: classes.dex */
class MediaController2ImplLegacy$3 extends ResultReceiver {
    final /* synthetic */ s kM;

    @Override // android.os.ResultReceiver
    protected void onReceiveResult(int i, Bundle bundle) {
        if (this.kM.kv.isAlive()) {
            switch (i) {
                case -1:
                    this.kM.mCallbackExecutor.execute(new v(this));
                    this.kM.close();
                    break;
                case 0:
                    this.kM.h(bundle);
                    break;
            }
        }
    }
}
