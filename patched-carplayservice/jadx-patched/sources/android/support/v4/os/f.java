package android.support.v4.os;

import android.os.Bundle;

/* JADX INFO: loaded from: classes.dex */
final class f implements Runnable {
    final int mResultCode;
    final Bundle mResultData;
    final /* synthetic */ ResultReceiver mq;

    f(ResultReceiver resultReceiver, int i, Bundle bundle) {
        this.mq = resultReceiver;
        this.mResultCode = i;
        this.mResultData = bundle;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.mq.onReceiveResult(this.mResultCode, this.mResultData);
    }
}
