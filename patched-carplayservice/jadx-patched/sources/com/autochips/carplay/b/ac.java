package com.autochips.carplay.b;

import android.os.Looper;
import android.os.Message;
import android.util.Log;
import android.view.Surface;
import android.widget.Toast;
import com.android.internal.util.State;
import com.android.internal.util.StateMachine;
import com.autochips.carplay.common.CarplayMessage;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
final class ac extends StateMachine {
    private final State ey;
    private Surface mSurface;
    private com.autochips.carplay.common.f rZ;
    private int sD;
    final /* synthetic */ aa sT;
    private boolean sU;
    private boolean sV;
    private final State sn;
    private final State so;
    private int sr;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    ac(aa aaVar, Looper looper) {
        super("ScreenManager", looper);
        this.sT = aaVar;
        this.sU = false;
        this.mSurface = null;
        this.sD = 1;
        this.sV = false;
        this.sn = new ad(this);
        this.so = new ae(this);
        this.ey = new af(this);
        this.rZ = null;
        this.sr = 0;
        addState(this.sn);
        addState(this.so);
        addState(this.ey, this.so);
        setInitialState(this.sn);
        start();
    }

    private void A(String str) {
        if (this.sT.sS == null) {
            this.sT.sS = Toast.makeText(this.sT.mContext, str, 0);
        } else {
            this.sT.sS.cancel();
            this.sT.sS = Toast.makeText(this.sT.mContext, str, 0);
            this.sT.sS.setText(str);
        }
        this.sT.sS.show();
    }

    /* JADX WARN: Code restructure failed: missing block: B:45:0x0114, code lost:
    
        if (r12 != false) goto L46;
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x0116, code lost:
    
        r10.deferMessage(r11);
     */
    /* JADX WARN: Code restructure failed: missing block: B:47:0x0119, code lost:
    
        return false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:58:0x0161, code lost:
    
        if (r12 != false) goto L46;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    static /* synthetic */ boolean a(com.autochips.carplay.b.ac r10, android.os.Message r11, boolean r12) {
        /*
            Method dump skipped, instruction units count: 357
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.autochips.carplay.b.ac.a(com.autochips.carplay.b.ac, android.os.Message, boolean):boolean");
    }

    private boolean a(com.autochips.carplay.common.f fVar) {
        if (fVar.equals(this.rZ) && this.sr != 0) {
            Log.w("ScreenManager", "the same request, ignore!");
            return false;
        }
        this.rZ = fVar;
        Message messageObtain = Message.obtain(getHandler());
        messageObtain.what = CarplayMessage.USER_CHANGE_MODE_REQUEST;
        messageObtain.obj = fVar;
        aa.si.a(messageObtain);
        return true;
    }

    static /* synthetic */ boolean b(ac acVar) {
        acVar.sU = false;
        return false;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void dp() {
        if (this.rZ == null) {
            Log.d("ScreenManager", "mCurrentModeRequest is null");
            removeMessages(20);
            sendMessageDelayed(20, 0, 1000L);
            return;
        }
        int i = this.rZ.qF.qK;
        Log.d("ScreenManager", "transferType: " + i);
        if (i != 3) {
            if (i == 1) {
                Log.d("ScreenManager", "untakeScreen");
                com.autochips.carplay.common.f fVar = new com.autochips.carplay.common.f();
                fVar.qF.qK = 2;
                if (a(fVar)) {
                    this.sr = 2;
                    removeMessages(20);
                    sendMessageDelayed(20, 2, 1000L);
                    return;
                }
                return;
            }
            return;
        }
        Log.d("ScreenManager", "unborrowScreen");
        com.autochips.carplay.common.f fVar2 = new com.autochips.carplay.common.f();
        fVar2.qF.qK = 4;
        fVar2.qF.qL = 500;
        fVar2.qF.qM = 0;
        fVar2.qF.qN = 0;
        if (a(fVar2)) {
            this.sr = 4;
            removeMessages(20);
            sendMessageDelayed(20, 4, 1000L);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean dq() {
        Log.d("ScreenManager", "takeScreen");
        com.autochips.carplay.common.f fVar = new com.autochips.carplay.common.f();
        fVar.qF.qK = 1;
        fVar.qF.qL = 500;
        fVar.qF.qM = 500;
        fVar.qF.qN = 100;
        boolean zA = a(fVar);
        if (zA) {
            this.sr = 1;
            removeMessages(20);
            sendMessageDelayed(20, 1, 1000L);
        }
        return zA;
    }

    static /* synthetic */ int e(ac acVar) {
        acVar.sr = 0;
        return 0;
    }

    static /* synthetic */ com.autochips.carplay.common.f j(ac acVar) {
        acVar.rZ = null;
        return null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void n(boolean z) {
        Log.w("ScreenManager", "doErrorHandler, mIsEnableVideo:" + this.sU);
        if (!z) {
            if (hasDeferredMessages(0)) {
                Log.w("ScreenManager", "doErrorHandler, mode change timeout, remove deffered start cmd");
                removeDeferredMessages(0);
            }
            if (hasMessages(0)) {
                removeMessages(0);
            }
        }
        if (this.sU) {
            Message messageObtainMessage = this.sT.sQ.obtainMessage(0);
            messageObtainMessage.obj = this.mSurface;
            if (z) {
                if (hasMessages(22)) {
                    return;
                }
                sendMessageDelayed(22, 10000L);
                return;
            }
            sendMessage(messageObtainMessage);
            com.autochips.carplay.service.p pVarDC = com.autochips.carplay.service.g.dx().dC();
            if (pVarDC != null) {
                List connectedDevices = pVarDC.getConnectedDevices();
                if (connectedDevices.size() == 0 || connectedDevices.get(0) == null) {
                    return;
                }
                Message messageObtainMessage2 = pVarDC.obtainMessage(CarplayMessage.USER_REQUEST_DEVICE_UI);
                messageObtainMessage2.arg1 = 1;
                messageObtainMessage2.obj = null;
                pVarDC.sendMessage(messageObtainMessage2);
            }
        }
    }

    static /* synthetic */ void q(ac acVar) {
        acVar.sr = 0;
        acVar.n(false);
    }

    protected final void onHalting() {
        Log.d("ScreenManager", "onHalting:" + this);
    }

    protected final void onQuitting() {
        Log.d("ScreenManager", "onQuitting:" + this);
    }
}
