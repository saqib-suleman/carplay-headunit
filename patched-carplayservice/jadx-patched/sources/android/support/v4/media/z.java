package android.support.v4.media;

import android.os.Bundle;
import android.os.ResultReceiver;

/* JADX INFO: loaded from: classes.dex */
final class z implements Runnable {
    final /* synthetic */ w kP;
    final /* synthetic */ ay kS;
    final /* synthetic */ Bundle kT;
    final /* synthetic */ ResultReceiver kU;

    z(w wVar, ay ayVar, Bundle bundle, ResultReceiver resultReceiver) {
        this.kP = wVar;
        this.kS = ayVar;
        this.kT = bundle;
        this.kU = resultReceiver;
    }

    @Override // java.lang.Runnable
    public final void run() {
        p unused = this.kP.kM.ku;
        o unused2 = this.kP.kM.kw;
    }
}
