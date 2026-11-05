package com.autochips.carplay.b;

import android.os.Parcel;
import android.util.Log;

/* JADX INFO: loaded from: classes.dex */
public final class ab implements com.autochips.carplay.av.e {
    final /* synthetic */ aa sT;

    public ab(aa aaVar) {
        this.sT = aaVar;
    }

    @Override // com.autochips.carplay.av.e
    public final void a(int i, int i2, Parcel parcel) {
    }

    @Override // com.autochips.carplay.av.e
    public final void h(int i, int i2) {
        if (aa.ac(i)) {
            Log.d("ScreenManager", "onCreated, streamID: " + i + ", audioType: " + i2);
            this.sT.sQ.sendMessage(10, i);
            this.sT.f(i, i2, 0);
        }
    }

    @Override // com.autochips.carplay.av.e
    public final void i(int i, int i2) {
        if (aa.ac(i)) {
            Log.d("ScreenManager", "onDestroyed, streamID: " + i + ", audioType: " + i2);
            this.sT.sQ.sendMessage(11, i);
            this.sT.f(i, i2, 1);
        }
    }

    @Override // com.autochips.carplay.av.e
    public final void onError(int i, int i2) {
        if (aa.ac(i)) {
            Log.d("ScreenManager", "video err " + i2);
            if (i2 == 1) {
                this.sT.sQ.sendMessage(16, i);
            }
        }
    }
}
