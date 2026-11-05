package com.autochips.carplay.b;

import android.os.Looper;
import android.os.Message;
import android.util.Log;
import com.android.internal.util.State;
import com.android.internal.util.StateMachine;
import com.autochips.carplay.common.CarplayMessage;

/* JADX INFO: loaded from: classes.dex */
final class h extends StateMachine {
    private com.autochips.carplay.common.f rZ;
    final /* synthetic */ f sm;
    private final State sn;
    private final State so;
    private final State sp;
    private final State sq;
    private int sr;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    h(f fVar, Looper looper) {
        super("FullDuplexAudioManager", looper);
        this.sm = fVar;
        this.sn = new i(this);
        this.so = new j(this);
        this.sp = new l(this);
        this.sq = new k(this);
        this.rZ = null;
        this.sr = 0;
        addState(this.sn);
        addState(this.so);
        addState(this.sp, this.so);
        addState(this.sq, this.so);
        setInitialState(this.sn);
        start();
    }

    static /* synthetic */ void a(h hVar, int i, int i2) {
        if (i != 100) {
            Log.d("FullDuplexAudioManager", "ignore invalid stream id: " + i);
        } else {
            switch (i2) {
                case 4:
                    hVar.transitionTo(hVar.sp);
                    break;
                case 5:
                    hVar.transitionTo(hVar.sq);
                    break;
            }
        }
    }

    private boolean a(com.autochips.carplay.common.f fVar) {
        if (fVar.equals(this.rZ)) {
            Log.w("FullDuplexAudioManager", "the same request, ignore!");
            return false;
        }
        this.rZ = fVar;
        Message messageObtain = Message.obtain(getHandler());
        messageObtain.what = CarplayMessage.USER_CHANGE_MODE_REQUEST;
        messageObtain.obj = fVar;
        f.sk.a(messageObtain);
        return true;
    }

    static /* synthetic */ com.autochips.carplay.common.f b(h hVar) {
        hVar.rZ = null;
        return null;
    }

    static /* synthetic */ void d(h hVar) {
        Log.d("FullDuplexAudioManager", "unborrowAudio");
        com.autochips.carplay.common.f fVar = new com.autochips.carplay.common.f();
        fVar.qG.qK = 4;
        if (hVar.a(fVar)) {
            hVar.sr = 4;
        }
    }

    static /* synthetic */ void dd() {
        Log.d("FullDuplexAudioManager", "startMainAudioStreaming");
        f.sk.start(100);
    }

    static /* synthetic */ void de() {
        Log.d("FullDuplexAudioManager", "stopMainAudioStreaming");
        f.sk.S(100);
    }

    static /* synthetic */ void f(h hVar) {
        Log.d("FullDuplexAudioManager", "borrowAudio");
        com.autochips.carplay.common.f fVar = new com.autochips.carplay.common.f();
        fVar.qG.qK = 3;
        fVar.qG.qL = 500;
        fVar.qG.qN = 1000;
        if (hVar.a(fVar)) {
            hVar.sr = 3;
        }
    }

    protected final void onHalting() {
        Log.d("FullDuplexAudioManager", "onHalting:" + this);
    }

    protected final void onQuitting() {
        Log.d("FullDuplexAudioManager", "onQuitting:" + this);
    }
}
