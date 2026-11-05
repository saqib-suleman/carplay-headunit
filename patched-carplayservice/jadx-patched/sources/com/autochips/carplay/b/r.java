package com.autochips.carplay.b;

import android.os.Parcel;
import android.util.Log;

/* JADX INFO: loaded from: classes.dex */
public final class r implements com.autochips.carplay.av.e {
    final /* synthetic */ m sC;

    public r(m mVar) {
        this.sC = mVar;
    }

    @Override // com.autochips.carplay.av.e
    public final void a(int i, int i2, Parcel parcel) {
        if (m.k(i, i2) || m.l(i, i2)) {
            this.sC.b(i, i2, parcel);
        }
    }

    @Override // com.autochips.carplay.av.e
    public final void h(int i, int i2) {
        boolean z = true;
        if (m.k(i, i2)) {
            this.sC.sw.sendMessage(10, i, i2);
        } else if (m.l(i, i2)) {
            this.sC.sx.sendMessage(10, i, i2);
        } else {
            z = false;
        }
        if (z) {
            Log.d("OutputAudioManager", "onCreated, streamID: " + i + ", audioType: " + i2);
            this.sC.f(i, i2, 0);
        }
    }

    /* JADX WARN: Code duplicated, block: B:11:0x0023  */
    /* JADX WARN: Code duplicated, block: B:13:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Instruction removed from duplicated block: B:11:0x0023, please report this as an issue */
    @Override // com.autochips.carplay.av.e
    public final void i(int i, int i2) {
        boolean z;
        if (!m.k(i, i2)) {
            if (m.l(i, i2)) {
                this.sC.sx.sendMessage(11, i, i2);
            } else {
                z = false;
            }
            if (z) {
                Log.d("OutputAudioManager", "onDestroyed, streamID: " + i + ", audioType: " + i2);
                this.sC.f(i, i2, 1);
            }
        }
        this.sC.sw.sendMessage(11, i, i2);
        z = true;
        if (z) {
            Log.d("OutputAudioManager", "onDestroyed, streamID: " + i + ", audioType: " + i2);
            this.sC.f(i, i2, 1);
        }
    }

    @Override // com.autochips.carplay.av.e
    public final void onError(int i, int i2) {
    }
}
