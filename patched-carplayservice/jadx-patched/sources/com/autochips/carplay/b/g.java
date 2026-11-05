package com.autochips.carplay.b;

import android.os.Parcel;
import android.util.Log;

/* JADX INFO: loaded from: classes.dex */
public final class g implements com.autochips.carplay.av.e {
    final /* synthetic */ f sm;

    public g(f fVar) {
        this.sm = fVar;
    }

    @Override // com.autochips.carplay.av.e
    public final void a(int i, int i2, Parcel parcel) {
        if (f.j(i, i2)) {
            this.sm.b(i, i2, parcel);
        }
    }

    @Override // com.autochips.carplay.av.e
    public final void h(int i, int i2) {
        if (f.j(i, i2)) {
            Log.d("FullDuplexAudioManager", "onCreated, streamID: " + i + ", audioType: " + i2);
            this.sm.sl.sendMessage(10, i, i2);
            this.sm.f(i, i2, 0);
        }
    }

    @Override // com.autochips.carplay.av.e
    public final void i(int i, int i2) {
        if (f.j(i, i2)) {
            Log.d("FullDuplexAudioManager", "onDestroyed, streamID: " + i + ", audioType: " + i2);
            this.sm.sl.sendMessage(11, i, i2);
            this.sm.f(i, i2, 1);
        }
    }

    @Override // com.autochips.carplay.av.e
    public final void onError(int i, int i2) {
    }
}
