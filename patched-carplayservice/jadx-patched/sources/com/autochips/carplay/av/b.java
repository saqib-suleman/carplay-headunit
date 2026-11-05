package com.autochips.carplay.av;

import android.util.Log;

/* JADX INFO: loaded from: classes.dex */
final class b implements f {
    final /* synthetic */ a qo;

    b(a aVar) {
        this.qo = aVar;
    }

    @Override // com.autochips.carplay.av.f
    public final void T(int i) {
        Log.d("AudioStreamController", "created, streamID:" + i);
        if (i == 100 || i == 102) {
            this.qo.qk = new AudioStream(i);
        } else if (i != 101) {
            Log.e("AudioStreamController", "unknown stream id");
        } else {
            this.qo.ql = new AudioStream(i);
        }
    }

    @Override // com.autochips.carplay.av.f
    public final void U(int i) {
        Log.d("AudioStreamController", "destroyed, streamID:" + i);
        if (i == 100 || i == 102) {
            this.qo.qk.release();
            this.qo.qk = null;
        } else if (i != 101) {
            Log.e("AudioStreamController", "unknown stream id");
        } else {
            this.qo.ql.release();
            this.qo.ql = null;
        }
    }
}
