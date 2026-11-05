package com.autochips.carplay.av;

/* JADX INFO: loaded from: classes.dex */
public class a {
    private AudioStream qk;
    private AudioStream ql;
    private f qn = new b(this);
    private StreamController qm = new StreamController(1);

    public a() {
        this.qm.setStreamAction(this.qn);
    }

    private AudioStream R(int i) {
        switch (i) {
            case 100:
                return this.qk;
            case 101:
                return this.ql;
            default:
                return null;
        }
    }

    public final int S(int i) {
        AudioStream audioStreamR = R(i);
        if (audioStreamR != null) {
            return audioStreamR.stop();
        }
        return -2;
    }

    public final int b(float f, float f2) {
        AudioStream audioStreamR = R(100);
        if (audioStreamR != null) {
            return audioStreamR.setVolume(f, f2);
        }
        return -2;
    }

    public final void setOnStreamListener(e eVar) {
        this.qm.setOnStreamListener(eVar);
    }

    public final int start(int i) {
        AudioStream audioStreamR = R(i);
        if (audioStreamR != null) {
            return audioStreamR.start();
        }
        return -2;
    }
}
