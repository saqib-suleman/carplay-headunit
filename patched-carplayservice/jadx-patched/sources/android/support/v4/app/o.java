package android.support.v4.app;

import android.os.Handler;
import android.os.Message;

/* JADX INFO: loaded from: classes.dex */
final class o extends Handler {
    final /* synthetic */ n iv;

    o(n nVar) {
        this.iv = nVar;
    }

    @Override // android.os.Handler
    public final void handleMessage(Message message) {
        switch (message.what) {
            case 1:
                if (this.iv.mStopped) {
                    this.iv.e(false);
                }
                break;
            case 2:
                this.iv.ip.dispatchResume();
                this.iv.ip.execPendingActions();
                break;
            default:
                super.handleMessage(message);
                break;
        }
    }
}
