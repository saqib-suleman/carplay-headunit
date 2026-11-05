package com.autochips.carplay.av;

import android.util.Log;

/* JADX INFO: loaded from: classes.dex */
final class h implements f {
    final /* synthetic */ g qs;

    h(g gVar) {
        this.qs = gVar;
    }

    @Override // com.autochips.carplay.av.f
    public final void T(int i) {
        Log.d("VidoeStreamController", "created, streamID:" + i);
        if (i == 110) {
            this.qs.qr = new VideoStream();
        }
    }

    @Override // com.autochips.carplay.av.f
    public final void U(int i) {
        Log.d("VidoeStreamController", "destroyed, streamID:" + i + ", mVideoStream:" + this.qs.qr);
        if (i != 110 || this.qs.qr == null) {
            return;
        }
        this.qs.qr.release();
        this.qs.qr = null;
    }
}
