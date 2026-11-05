package android.support.v4.os;

import android.os.Bundle;

/* JADX INFO: loaded from: classes.dex */
final class e extends b {
    final /* synthetic */ ResultReceiver mq;

    e(ResultReceiver resultReceiver) {
        this.mq = resultReceiver;
    }

    @Override // android.support.v4.os.a
    public final void send(int i, Bundle bundle) {
        if (this.mq.mHandler != null) {
            this.mq.mHandler.post(new f(this.mq, i, bundle));
        } else {
            this.mq.onReceiveResult(i, bundle);
        }
    }
}
