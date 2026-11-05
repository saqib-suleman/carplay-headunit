package com.autochips.carplay.service;

import android.content.Context;
import android.os.HandlerThread;
import android.os.INetworkManagementService;
import android.os.Looper;
import android.os.ServiceManager;
import android.util.Log;

/* JADX INFO: loaded from: classes.dex */
public final class g {
    static g tj = null;
    private h mCarplayMonitor;
    private final Context mContext;
    private z mRemoteDevices;
    private i ta;
    private final INetworkManagementService tk;
    private CarplayService tl;
    private a tm;
    private p tn;
    private com.autochips.carplay.wired.a to = null;
    private com.autochips.carplay.plugin.a tp = null;
    private com.autochips.carplay.a.a tq = null;
    private com.autochips.carplay.c.a tr = null;
    private com.autochips.carplay.c.e ts = null;
    private com.autochips.carplay.common.c tt = null;
    private com.autochips.carplay.b.d tu = null;
    private com.autochips.carplay.b.e tv = null;
    private HandlerThread tw = null;
    private HandlerThread tx = null;
    private HandlerThread ty = null;
    private HandlerThread tz = null;
    private HandlerThread tA = null;
    private HandlerThread tB = null;
    private HandlerThread tC = null;
    private HandlerThread tD = null;
    private HandlerThread tE = null;
    private com.autochips.carplay.b.a tF = null;
    private ad tG = null;

    public g(CarplayService carplayService, Context context) {
        Log.d("CarplayInjector", "svc:" + carplayService + ", context:" + context);
        if (context == null) {
            throw new IllegalStateException("CarplayInjector should not be initialized with a null Context.");
        }
        if (tj != null) {
            throw new IllegalStateException("CarplayInjector was already created, use getInstance instead.");
        }
        tj = this;
        this.tl = carplayService;
        this.mContext = context;
        this.tk = INetworkManagementService.Stub.asInterface(ServiceManager.getService("network_management"));
    }

    public static g dx() {
        if (tj != null) {
            return tj;
        }
        throw new IllegalStateException("Attempted to retrieve a CarplayInjector instance before constructor was called.");
    }

    public final z dA() {
        return this.mRemoteDevices;
    }

    public final a dB() {
        return this.tm;
    }

    public final p dC() {
        return this.tn;
    }

    public final HandlerThread dD() {
        return this.tw;
    }

    public final ad dE() {
        return this.tG;
    }

    public final com.autochips.carplay.b.a dF() {
        return this.tF;
    }

    public final void deinit() {
        if (this.tE != null) {
            this.tF.db();
            this.tE.quitSafely();
            this.tF = null;
            this.tE = null;
        }
        if (this.tn != null) {
            this.tn.quitNow();
        }
        if (this.tG != null) {
            this.tG = null;
        }
        if (this.tm != null) {
            this.tm.quitNow();
        }
        if (this.ta != null) {
            this.ta.cleanup();
            this.ta = null;
        }
        if (this.tu != null) {
            this.tu.removeCallbacksAndMessages(null);
            this.tu = null;
        }
        if (this.tv != null) {
            this.tv.removeCallbacksAndMessages(null);
            this.tv = null;
        }
        if (this.tD != null) {
            this.tD.quitSafely();
            this.tD = null;
        }
        if (this.tq != null) {
            this.tq.removeCallbacksAndMessages(null);
            this.tq = null;
        }
        if (this.tB != null) {
            this.tB.quitSafely();
            this.tB = null;
        }
        if (this.ts != null) {
            this.ts.removeCallbacksAndMessages(null);
            this.ts.cleanup();
            this.ts = null;
        }
        if (this.tA != null) {
            this.tA.quitSafely();
            this.tA = null;
        }
        if (this.tr != null) {
            this.tr.removeCallbacksAndMessages(null);
            this.tr.cleanup();
            this.tr = null;
        }
        if (this.tz != null) {
            this.tz.quitSafely();
            this.tz = null;
        }
        if (this.tp != null) {
            this.tp.removeCallbacksAndMessages(null);
            this.tp.cleanup();
            this.tp = null;
        }
        if (this.tC != null) {
            this.tC.quitSafely();
            this.tC = null;
        }
        if (this.tt != null) {
            this.tt.removeCallbacksAndMessages(null);
            this.tt = null;
        }
        if (this.ty != null) {
            this.ty.quitSafely();
            this.ty = null;
        }
        if (this.to != null) {
            this.to.removeCallbacksAndMessages(null);
            this.to = null;
        }
        if (this.tx != null) {
            this.tx.quitSafely();
            this.tx = null;
        }
        if (this.tw != null) {
            this.tw.quitSafely();
            this.tw = null;
        }
        if (this.mRemoteDevices != null) {
            this.mRemoteDevices.reset();
        }
        if (this.mCarplayMonitor != null) {
            this.mCarplayMonitor.dG();
        }
        this.tl = null;
    }

    public final CarplayService dy() {
        return this.tl;
    }

    public final h dz() {
        return this.mCarplayMonitor;
    }

    public final void init() {
        this.mCarplayMonitor = new h();
        this.mRemoteDevices = new z();
        this.mRemoteDevices.init();
        if (this.tw == null) {
            this.tw = new HandlerThread(CarplayService.class.getSimpleName());
            this.tw.start();
        }
        if (this.tx == null) {
            this.tx = new HandlerThread(com.autochips.carplay.wired.a.class.getSimpleName());
            this.tx.start();
        }
        if (this.to == null) {
            this.to = new com.autochips.carplay.wired.a(this.mContext, this.tx.getLooper(), this.tk, this.mCarplayMonitor);
        }
        if (this.ty == null) {
            this.ty = new HandlerThread(com.autochips.carplay.common.c.class.getSimpleName());
            this.ty.start();
        }
        if (this.tt == null) {
            this.tt = new com.autochips.carplay.common.c(this.mContext, this.ty.getLooper());
        }
        if (this.tC == null) {
            this.tC = new HandlerThread(com.autochips.carplay.plugin.a.class.getSimpleName());
            this.tC.start();
        }
        if (this.tp == null) {
            this.tp = new com.autochips.carplay.plugin.a(this.mContext, this.tC.getLooper());
        }
        if (this.tr == null) {
            this.tr = new com.autochips.carplay.c.a(this.mContext, Looper.getMainLooper());
        }
        if (this.tA == null) {
            this.tA = new HandlerThread(com.autochips.carplay.c.e.class.getSimpleName());
            this.tA.start();
        }
        if (this.ts == null) {
            this.ts = new com.autochips.carplay.c.e(this.mContext, this.tA.getLooper());
        }
        if (this.tB == null) {
            this.tB = new HandlerThread(com.autochips.carplay.a.a.class.getSimpleName());
            this.tB.start();
        }
        if (this.tq == null) {
            this.tq = new com.autochips.carplay.a.a(this.mContext, this.tB.getLooper());
        }
        if (this.tD == null) {
            this.tD = new HandlerThread("CarplayResourceManager");
            this.tD.start();
        }
        if (this.tv == null) {
            this.tv = new com.autochips.carplay.b.e(this.mContext, this.tD.getLooper());
            this.tv.a(this.mCarplayMonitor, this.tr);
        }
        if (this.tu == null) {
            this.tu = new com.autochips.carplay.b.d(this.mContext, this.tD.getLooper());
            this.tu.a(this.mCarplayMonitor, this.tr);
        }
        this.ta = new i(this.to, this.tp, this.tq, this.tr, this.ts, this.tt, this.tk, this.mCarplayMonitor);
        this.tm = a.a(this.tl);
        this.tm.a(this.ta, this.mCarplayMonitor);
        this.tm.start();
        this.tG = new ad(this.tm);
        this.tn = p.l(this.tl);
        this.tn.a(this.ta, this.mCarplayMonitor, this.tv, this.tu);
        this.tn.start();
        if (this.tE == null) {
            this.tE = new HandlerThread(com.autochips.carplay.b.a.class.getSimpleName());
            this.tE.start();
            this.tF = new com.autochips.carplay.b.a(this.tE.getLooper(), this.mCarplayMonitor);
            this.tF.da();
        }
    }
}
