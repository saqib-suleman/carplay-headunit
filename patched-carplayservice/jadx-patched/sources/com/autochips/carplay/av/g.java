package com.autochips.carplay.av;

import android.view.Surface;

/* JADX INFO: loaded from: classes.dex */
public class g {
    private VideoStream qr;
    private f qn = new h(this);
    private StreamController qm = new StreamController(0);

    public g() {
        this.qm.setStreamAction(this.qn);
    }

    public final int cQ() {
        if (this.qr != null) {
            return this.qr.start();
        }
        return -2;
    }

    public final int cR() {
        if (this.qr != null) {
            return this.qr.stop();
        }
        return -2;
    }

    public final void setOnStreamListener(e eVar) {
        this.qm.setOnStreamListener(eVar);
    }

    public final int setSurface(Surface surface) {
        if (this.qr != null) {
            return this.qr.setSurface(surface);
        }
        return -2;
    }
}
