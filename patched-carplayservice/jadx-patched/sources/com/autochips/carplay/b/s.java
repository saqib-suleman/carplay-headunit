package com.autochips.carplay.b;

import android.media.AudioAttributes;
import android.media.AudioFocusRequest;
import android.os.Looper;
import android.os.Message;
import android.os.SystemProperties;
import android.util.Log;
import com.android.internal.util.State;
import com.android.internal.util.StateMachine;
import com.autochips.carplay.common.CarplayMessage;

/* JADX INFO: loaded from: classes.dex */
class s extends StateMachine {
    private com.autochips.carplay.common.f rZ;
    final /* synthetic */ m sC;
    private int sD;
    private int sG;
    private int sH;
    private boolean sI;
    private boolean sJ;
    private final int sK;
    private final State sL;
    private final State sM;
    private final State sN;
    private final State sO;
    private final State sn;
    private final State so;
    private int sr;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    s(m mVar, Looper looper) {
        super(s.class.getSimpleName(), looper);
        this.sC = mVar;
        this.sG = 0;
        this.sH = 0;
        this.sD = 1;
        this.sI = false;
        this.sJ = false;
        this.sK = SystemProperties.getInt("ro.atc.carplay.audio_duck_pct", 25);
        this.sn = new t(this);
        this.so = new w(this);
        this.sL = new x(this);
        this.sM = new u(this);
        this.sN = new y(this);
        this.sO = new v(this);
        this.rZ = null;
        this.sr = 0;
        addState(this.sn);
        addState(this.so);
        addState(this.sL, this.so);
        addState(this.sM, this.so);
        addState(this.sN, this.so);
        addState(this.sO, this.so);
        setInitialState(this.sn);
        start();
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Code duplicated, block: B:23:0x00d0 A[DONT_INVERT] */
    /* JADX WARN: Code duplicated, block: B:24:0x00d2 A[Catch: all -> 0x00fb, TryCatch #0 {, blocks: (B:3:0x0001, B:4:0x0015, B:8:0x001d, B:10:0x0037, B:12:0x003d, B:13:0x0051, B:21:0x008e, B:24:0x00d2, B:25:0x00db, B:27:0x00e9, B:28:0x00f0, B:29:0x00f6, B:15:0x0058, B:17:0x0060, B:19:0x0068), top: B:35:0x0001 }] */
    /* JADX WARN: Code duplicated, block: B:27:0x00e9 A[Catch: all -> 0x00fb, TryCatch #0 {, blocks: (B:3:0x0001, B:4:0x0015, B:8:0x001d, B:10:0x0037, B:12:0x003d, B:13:0x0051, B:21:0x008e, B:24:0x00d2, B:25:0x00db, B:27:0x00e9, B:28:0x00f0, B:29:0x00f6, B:15:0x0058, B:17:0x0060, B:19:0x0068), top: B:35:0x0001 }] */
    /* JADX WARN: Code duplicated, block: B:29:0x00f6 A[Catch: all -> 0x00fb, TRY_LEAVE, TryCatch #0 {, blocks: (B:3:0x0001, B:4:0x0015, B:8:0x001d, B:10:0x0037, B:12:0x003d, B:13:0x0051, B:21:0x008e, B:24:0x00d2, B:25:0x00db, B:27:0x00e9, B:28:0x00f0, B:29:0x00f6, B:15:0x0058, B:17:0x0060, B:19:0x0068), top: B:35:0x0001 }] */
    public synchronized int Z(int i) {
        int i2;
        int i3;
        String str;
        String str2;
        int iRequestAudioFocus;
        Log.d("OutputAudioStateMachine", "requestAudioFocus audioType: " + i);
        switch (i) {
            case 1:
                i2 = 0;
                break;
            case 2:
                i2 = 4;
                break;
            default:
                i2 = 1;
                break;
        }
        AudioAttributes audioAttributesBuild = new AudioAttributes.Builder().setUsage(i2).setContentType(2).build();
        com.autochips.carplay.common.b bVarDo = m.sj.m3do();
        if (bVarDo == null || 1 != bVarDo.cU()) {
            if (bVarDo != null && 1 == bVarDo.cT().qA && 1 == bVarDo.cT().qB) {
                str = "OutputAudioStateMachine";
                str2 = "apple device is speech: " + bVarDo.cT().qA + ", speech mode: " + bVarDo.cT().qB;
            } else {
                i3 = 1;
            }
            iRequestAudioFocus = this.sC.mAudioManager.requestAudioFocus(new AudioFocusRequest.Builder(i3).setAudioAttributes(audioAttributesBuild).setWillPauseWhenDucked(true).setOnAudioFocusChangeListener(this.sC.sB, this.sC.sw.getHandler()).build());
            Log.d("OutputAudioStateMachine", "focusRequestStatus: " + iRequestAudioFocus);
            if (iRequestAudioFocus == 1) {
                if (i == 2) {
                    this.sC.mAudioManager.setMode(1);
                }
                aa(this.sG);
                if (-3 == this.sC.sy) {
                    m.sj.b(1.0f, 1.0f);
                }
                this.sC.sy = 1;
            } else {
                dn();
            }
        } else {
            str = "OutputAudioStateMachine";
            str2 = "apple device is phone calling: " + bVarDo.cU();
        }
        Log.d(str, str2);
        i3 = 2;
        iRequestAudioFocus = this.sC.mAudioManager.requestAudioFocus(new AudioFocusRequest.Builder(i3).setAudioAttributes(audioAttributesBuild).setWillPauseWhenDucked(true).setOnAudioFocusChangeListener(this.sC.sB, this.sC.sw.getHandler()).build());
        Log.d("OutputAudioStateMachine", "focusRequestStatus: " + iRequestAudioFocus);
        if (iRequestAudioFocus == 1) {
            if (i == 2) {
                this.sC.mAudioManager.setMode(1);
            }
            aa(this.sG);
            if (-3 == this.sC.sy) {
                m.sj.b(1.0f, 1.0f);
            }
            this.sC.sy = 1;
        } else {
            dn();
        }
        return iRequestAudioFocus;
    }

    /* JADX WARN: Code duplicated, block: B:29:0x0069  */
    /* JADX WARN: Code duplicated, block: B:31:0x006c  */
    /* JADX WARN: Code duplicated, block: B:32:0x006f  */
    /* JADX WARN: Code duplicated, block: B:34:0x0083  */
    /* JADX WARN: Code duplicated, block: B:36:0x0089  */
    /* JADX WARN: Code duplicated, block: B:38:0x008f  */
    /* JADX WARN: Code duplicated, block: B:40:0x0095  */
    /* JADX WARN: Code duplicated, block: B:42:0x009b  */
    /* JADX WARN: Instruction removed from duplicated block: B:32:0x006f, please report this as an issue */
    static /* synthetic */ void a(s sVar, int i, int i2) {
        Message messageObtainMessage;
        String str;
        String str2;
        if (!m.sA || sVar.sI) {
            Log.d("OutputAudioStateMachine", "autoStart to play mainAudio because user already enableAudio");
            messageObtainMessage = sVar.obtainMessage(0);
        } else if (sVar.sJ) {
            messageObtainMessage = sVar.obtainMessage(3);
        } else {
            com.autochips.carplay.common.b bVarDo = m.sj.m3do();
            if (bVarDo == null || 1 != bVarDo.cU()) {
                if (bVarDo != null && 1 == bVarDo.cT().qA && 1 == bVarDo.cT().qB) {
                    str = "OutputAudioStateMachine";
                    str2 = "current app state is ios speech speaking";
                } else if (!sVar.hasMessages(17)) {
                    sVar.sendMessageDelayed(17, 1500L);
                }
                if (i == 100) {
                    if (i != 102 && i2 == 3) {
                        sVar.transitionTo(sVar.sN);
                        return;
                    }
                    Log.d("OutputAudioStateMachine", "ignore invalid stream id: " + i + ", audio type: " + i2);
                    return;
                }
                if (i2 != 6) {
                    sVar.transitionTo(sVar.sO);
                    return;
                }
                switch (i2) {
                    case 1:
                        sVar.transitionTo(sVar.sL);
                        break;
                    case 2:
                        sVar.transitionTo(sVar.sM);
                        break;
                    case 3:
                        sVar.transitionTo(sVar.sN);
                        break;
                    default:
                        Log.d("OutputAudioStateMachine", "donot handle duplex audio: " + i2);
                        break;
                }
            }
            str = "OutputAudioStateMachine";
            str2 = "current app state is ios phone calling";
            Log.d(str, str2);
            messageObtainMessage = sVar.obtainMessage(4);
        }
        sVar.deferMessage(messageObtainMessage);
        if (i == 100) {
            if (i != 102) {
            }
            Log.d("OutputAudioStateMachine", "ignore invalid stream id: " + i + ", audio type: " + i2);
            return;
        }
        if (i2 != 6) {
            sVar.transitionTo(sVar.sO);
            return;
        }
        switch (i2) {
            case 1:
                sVar.transitionTo(sVar.sL);
                break;
            case 2:
                sVar.transitionTo(sVar.sM);
                break;
            case 3:
                sVar.transitionTo(sVar.sN);
                break;
            default:
                Log.d("OutputAudioStateMachine", "donot handle duplex audio: " + i2);
                break;
        }
    }

    static /* synthetic */ void a(s sVar, boolean z) {
        if (!z) {
            sVar.sI = false;
            return;
        }
        sVar.removeMessages(17);
        sVar.sI = true;
        if (sVar.hasDeferredMessages(0)) {
            sVar.removeDeferredMessages(0);
            Log.w("OutputAudioStateMachine", "already has message: 0");
            return;
        }
        com.autochips.carplay.common.b bVarDo = m.sj.m3do();
        if (bVarDo != null) {
            if (bVarDo.cU() != 0) {
                Log.d("OutputAudioStateMachine", "current app state is phone calling, entity: " + bVarDo.cU());
                return;
            }
            com.autochips.carplay.common.d dVarCT = bVarDo.cT();
            if (dVarCT != null && dVarCT.qA != 0) {
                Log.d("OutputAudioStateMachine", "current app state is specch, entity: " + dVarCT.qA + ", specchMode: " + dVarCT.qA);
                return;
            }
        }
        int mode = sVar.sC.mAudioManager.getMode();
        Log.d("OutputAudioStateMachine", "current audio mode: " + mode);
        if (mode == 2 || mode == 3 || bVarDo == null || 2 != bVarDo.getMainAudio()) {
            return;
        }
        sVar.dm();
    }

    private boolean a(com.autochips.carplay.common.f fVar) {
        if (fVar.equals(this.rZ) && this.sr != 0) {
            Log.w("OutputAudioStateMachine", "the same request, ignore!");
            return false;
        }
        this.rZ = fVar;
        Message messageObtain = Message.obtain(getHandler());
        messageObtain.what = CarplayMessage.USER_CHANGE_MODE_REQUEST;
        messageObtain.obj = fVar;
        m.sj.a(messageObtain);
        return true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void aa(int i) {
        Log.d("OutputAudioStateMachine", "startMainAudioStreaming: " + i);
        if (m.X(i)) {
            m.sj.start(i);
        }
    }

    static /* synthetic */ int c(s sVar) {
        sVar.sr = 0;
        return 0;
    }

    /* JADX WARN: Code duplicated, block: B:23:0x00a9  */
    /* JADX WARN: Code duplicated, block: B:56:0x015c  */
    /* JADX WARN: Code duplicated, block: B:58:? A[RETURN, SYNTHETIC] */
    static /* synthetic */ void d(s sVar, int i) {
        String str;
        String string;
        boolean zEl;
        int iEm;
        StringBuilder sb;
        int iCU;
        Log.d("OutputAudioStateMachine", "handleAudioFocusChanged, audioFocusState: " + i);
        boolean z = false;
        if (i != 1) {
            switch (i) {
                case -3:
                    if (true != sVar.sC.dg()) {
                        int i2 = sVar.sK;
                        if (i2 < 0 || i2 > 100) {
                            Log.e("OutputAudioStateMachine", "Invalid duck percent using default.");
                            i2 = 25;
                        }
                        float f = i2 / 100.0f;
                        m.sj.b(f, f);
                    } else {
                        str = "OutputAudioStateMachine";
                        string = "duck by carplay alternate audio, ignore it.";
                        Log.d(str, string);
                    }
                    break;
                case -2:
                    com.autochips.carplay.common.b bVarDo = m.sj.m3do();
                    if (bVarDo != null) {
                        if (1 == bVarDo.cU()) {
                            str = "OutputAudioStateMachine";
                            sb = new StringBuilder("current app state is phone calling, entity: ");
                            iCU = bVarDo.cU();
                        } else {
                            com.autochips.carplay.common.d dVarCT = bVarDo.cT();
                            if (dVarCT == null || 1 != dVarCT.qA) {
                                zEl = sVar.sC.rY.el();
                                iEm = sVar.sC.rY.em();
                                if (zEl) {
                                }
                                str = "OutputAudioStateMachine";
                                string = "accessoty callOn: " + zEl + ", audioState: " + iEm;
                                Log.d(str, string);
                            } else {
                                str = "OutputAudioStateMachine";
                                sb = new StringBuilder("current app state is specch, entity: ");
                                sb.append(dVarCT.qA);
                                sb.append(", specchMode: ");
                                iCU = dVarCT.qA;
                            }
                        }
                        sb.append(iCU);
                        string = sb.toString();
                        Log.d(str, string);
                    } else {
                        zEl = sVar.sC.rY.el();
                        iEm = sVar.sC.rY.em();
                        if (zEl && iEm != 2) {
                            int mode = sVar.sC.mAudioManager.getMode();
                            if (mode == 2 || mode == 3 || mode == 2019 || mode == 2020) {
                                Log.w("OutputAudioStateMachine", "audio mode: " + mode + ", borrow audio in AppStateController!");
                            } else {
                                sVar.dn();
                            }
                        } else {
                            str = "OutputAudioStateMachine";
                            string = "accessoty callOn: " + zEl + ", audioState: " + iEm;
                            Log.d(str, string);
                        }
                    }
                    break;
                case -1:
                    Log.d("OutputAudioStateMachine", "takeAudio");
                    com.autochips.carplay.common.f fVar = new com.autochips.carplay.common.f();
                    fVar.qG.qK = 1;
                    fVar.qG.qL = 500;
                    fVar.qG.qM = 500;
                    fVar.qG.qN = 100;
                    if (sVar.a(fVar)) {
                        sVar.sr = 1;
                        sVar.removeMessages(18);
                        sVar.sendMessageDelayed(18, 1, 1000L);
                    }
                    sVar.dj();
                    break;
                default:
                    str = "OutputAudioStateMachine";
                    string = "not care audioFocus state : " + i;
                    Log.d(str, string);
                    break;
            }
            if (z) {
                sVar.sC.sy = i;
            }
        }
        if (-2 == sVar.sC.sy) {
            sVar.sJ = true;
            sVar.dm();
        } else if (-3 == sVar.sC.sy) {
            m.sj.b(1.0f, 1.0f);
        }
        z = true;
        if (z) {
            sVar.sC.sy = i;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized void dj() {
        Log.d("OutputAudioStateMachine", "abandonAudioFocus, mAudioFocus: " + this.sC.sy);
        if (this.sC.sy > 0) {
            int i = this.sG;
            Log.d("OutputAudioStateMachine", "stopMainAudioStreaming: " + i);
            if (m.X(i)) {
                m.sj.S(i);
            }
            this.sC.mAudioManager.abandonAudioFocus(this.sC.sB);
            this.sC.sy = 0;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void dm() {
        if (this.rZ == null) {
            Log.d("OutputAudioStateMachine", "mCurrentModeRequest is null");
            return;
        }
        int i = this.rZ.qG.qK;
        Log.d("OutputAudioStateMachine", "transferType: " + i);
        if (i == 3) {
            Log.d("OutputAudioStateMachine", "unborrowAudio");
            com.autochips.carplay.common.f fVar = new com.autochips.carplay.common.f();
            fVar.qG.qK = 4;
            if (a(fVar)) {
                this.sr = 4;
                removeMessages(18);
                sendMessageDelayed(18, 4, 1000L);
                return;
            }
            return;
        }
        if (i == 1) {
            Log.d("OutputAudioStateMachine", "untakeAudio");
            com.autochips.carplay.common.f fVar2 = new com.autochips.carplay.common.f();
            fVar2.qG.qK = 2;
            if (a(fVar2)) {
                this.sr = 2;
                removeMessages(18);
                sendMessageDelayed(18, 2, 1000L);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void dn() {
        Log.d("OutputAudioStateMachine", "borrowAudio");
        com.autochips.carplay.common.f fVar = new com.autochips.carplay.common.f();
        fVar.qG.qK = 3;
        fVar.qG.qL = 500;
        fVar.qG.qN = 100;
        if (a(fVar)) {
            this.sr = 3;
            removeMessages(18);
            sendMessageDelayed(18, 3, 1000L);
        }
    }

    static /* synthetic */ com.autochips.carplay.common.f i(s sVar) {
        sVar.rZ = null;
        return null;
    }

    static /* synthetic */ void l(s sVar) {
        sVar.sr = 0;
        if (sVar.sI) {
            if (sVar.hasDeferredMessages(0)) {
                sVar.removeDeferredMessages(0);
            }
            sVar.sendMessage(sVar.sC.sw.obtainMessage(0));
        }
    }

    static /* synthetic */ boolean u(s sVar) {
        sVar.sJ = false;
        return false;
    }

    protected void onHalting() {
        Log.d("OutputAudioStateMachine", "onHalting:" + this);
    }

    protected void onQuitting() {
        this.sI = false;
        dj();
        Log.d("OutputAudioStateMachine", "onQuitting:" + this);
    }
}
