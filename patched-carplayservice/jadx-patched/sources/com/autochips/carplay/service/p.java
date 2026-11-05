package com.autochips.carplay.service;

import android.os.Message;
import android.util.Log;
import com.android.internal.util.State;
import com.android.internal.util.StateMachine;
import com.autochips.carplay.CarplayAppState;
import com.autochips.carplay.CarplayCall;
import com.autochips.carplay.CarplayDevice;
import com.autochips.carplay.CarplayResourceState;
import com.autochips.carplay.common.CarplayMessage;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

/* JADX INFO: loaded from: classes.dex */
public class p extends StateMachine {
    private static final String TAG = p.class.getSimpleName();
    private h mCarplayMonitor;
    private CarplayService sZ;
    private i ta;
    private com.autochips.carplay.b.d tu;
    private com.autochips.carplay.b.e tv;
    private final ConcurrentHashMap uA;
    private boolean uB;
    private boolean uC;
    private u uo;
    private v up;
    private y uq;
    private w ur;
    private t us;
    private r ut;
    private x uu;
    private s uv;
    private CarplayDevice uw;
    private com.autochips.carplay.common.b ux;
    private State uy;
    private int uz;

    private p(CarplayService carplayService) {
        super(TAG);
        this.uo = new u(this);
        this.up = new v(this);
        this.uq = new y(this);
        this.ur = new w(this);
        this.us = new t(this);
        this.ut = new r(this);
        this.uu = new x(this);
        this.uv = new s(this);
        this.uw = null;
        this.ux = null;
        this.uy = null;
        this.uz = 0;
        this.uA = new ConcurrentHashMap();
        this.uB = false;
        this.uC = false;
        this.sZ = carplayService;
        addState(this.uo);
        addState(this.up, this.uo);
        addState(this.uq, this.uo);
        addState(this.ur, this.uo);
        addState(this.us, this.uo);
        addState(this.ut, this.us);
        addState(this.uu, this.us);
        addState(this.uv, this.uu);
        setInitialState(this.up);
    }

    static /* synthetic */ void a(p pVar, int i) {
        synchronized (pVar) {
            pVar.uz = i;
        }
    }

    static /* synthetic */ void a(p pVar, Message message) {
        Message messageObtainMessage = pVar.tv.obtainMessage(message.what);
        messageObtainMessage.arg1 = message.arg1;
        messageObtainMessage.arg2 = message.arg2;
        messageObtainMessage.obj = message.obj;
        pVar.tv.sendMessage(messageObtainMessage);
    }

    static /* synthetic */ void a(p pVar, CarplayCall carplayCall) {
        carplayCall.setDevice(pVar.uw);
        UUID uuid = carplayCall.getUUID();
        int state = carplayCall.getState();
        if (pVar.uA.containsKey(uuid) && state == 0) {
            pVar.uA.remove(uuid);
        } else {
            pVar.uA.put(uuid, carplayCall);
        }
        Log.d(TAG, "current carplaycall: " + carplayCall.toString());
        for (Map.Entry entry : pVar.uA.entrySet()) {
            Log.d(TAG, "call: " + ((CarplayCall) entry.getValue()).toString());
        }
        pVar.sZ.a(carplayCall);
    }

    static /* synthetic */ void a(p pVar, CarplayDevice carplayDevice) {
        synchronized (pVar) {
            pVar.uw = carplayDevice;
        }
    }

    static /* synthetic */ void a(p pVar, com.autochips.carplay.common.b bVar) {
        com.autochips.carplay.common.b bVarEe = pVar.ee();
        if (bVarEe != null && bVarEe.equals(bVar)) {
            Log.w(TAG, "ignore the same mode");
            return;
        }
        synchronized (pVar) {
            pVar.ux = bVar;
        }
        if (bVarEe == null || (bVar != null && bVarEe.b(bVar))) {
            com.autochips.carplay.common.d dVarCT = bVar.cT();
            pVar.sZ.a(new CarplayAppState(dVarCT.qA == 1 ? dVarCT.qB : -1, bVar.cU() == 1, bVar.cV() == 1));
            Message messageObtainMessage = pVar.tu.obtainMessage(CarplayMessage.CARPLAY_MODE_CHANGED);
            messageObtainMessage.obj = bVar;
            pVar.tu.sendMessage(messageObtainMessage);
        }
        if (bVarEe == null || (bVar != null && bVarEe.a(bVar))) {
            pVar.sZ.a(new CarplayResourceState(bVar.getMainAudio(), bVar.cS()));
            Message messageObtainMessage2 = pVar.tv.obtainMessage(CarplayMessage.CARPLAY_MODE_CHANGED);
            messageObtainMessage2.obj = bVar;
            pVar.tv.sendMessage(messageObtainMessage2);
        }
    }

    static /* synthetic */ void al(int i) {
        ad adVarDE = g.dx().dE();
        if (adVarDE != null) {
            adVarDE.an(i);
        }
    }

    static /* synthetic */ void b(p pVar, Message message) {
        Message messageObtainMessage = pVar.tu.obtainMessage(message.what);
        messageObtainMessage.arg1 = message.arg1;
        messageObtainMessage.arg2 = message.arg2;
        messageObtainMessage.obj = message.obj;
        pVar.tu.sendMessage(messageObtainMessage);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public CarplayDevice ec() {
        CarplayDevice carplayDevice;
        synchronized (this) {
            carplayDevice = this.uw;
        }
        return carplayDevice;
    }

    private int ed() {
        int i;
        synchronized (this) {
            i = this.uz;
        }
        return i;
    }

    public static p l(CarplayService carplayService) {
        Log.d(TAG, "make() - Creating CarplaySessionStateMachine");
        return new p(carplayService);
    }

    public final void a(i iVar, h hVar, com.autochips.carplay.b.e eVar, com.autochips.carplay.b.d dVar) {
        this.ta = iVar;
        this.mCarplayMonitor = hVar;
        this.tu = dVar;
        this.tv = eVar;
        Log.d(TAG, "registerForMonitorEvents");
        this.mCarplayMonitor.a(CarplayMessage.BLUETOOTH_ENABLED, getHandler());
        this.mCarplayMonitor.a(CarplayMessage.BLUETOOTH_DISABLED, getHandler());
        this.mCarplayMonitor.a(CarplayMessage.IAP2_OVER_USB_CONNECTING, getHandler());
        this.mCarplayMonitor.a(CarplayMessage.IAP2_OVER_USB_CONNECTED, getHandler());
        this.mCarplayMonitor.a(CarplayMessage.IAP2_OVER_USB_DISCONNECTING, getHandler());
        this.mCarplayMonitor.a(CarplayMessage.IAP2_OVER_USB_DISCONNECTED, getHandler());
        this.mCarplayMonitor.a(CarplayMessage.IAP2_OVER_USB_CONNECT_FAIL, getHandler());
        this.mCarplayMonitor.a(CarplayMessage.IAP2_OVER_BLUETOOTH_CONNECTING, getHandler());
        this.mCarplayMonitor.a(CarplayMessage.IAP2_OVER_BLUETOOTH_CONNECTED, getHandler());
        this.mCarplayMonitor.a(CarplayMessage.IAP2_OVER_BLUETOOTH_DISCONNECTING, getHandler());
        this.mCarplayMonitor.a(CarplayMessage.IAP2_OVER_BLUETOOTH_DISCONNECTED, getHandler());
        this.mCarplayMonitor.a(CarplayMessage.IAP2_OVER_BLUETOOTH_CONNECT_FAIL, getHandler());
        this.mCarplayMonitor.a(CarplayMessage.IAP2_OVER_CARPLAY_CONNECTING, getHandler());
        this.mCarplayMonitor.a(CarplayMessage.IAP2_OVER_CARPLAY_CONNECTED, getHandler());
        this.mCarplayMonitor.a(CarplayMessage.IAP2_OVER_CARPLAY_DISCONNECTING, getHandler());
        this.mCarplayMonitor.a(CarplayMessage.IAP2_OVER_CARPLAY_DISCONNECTED, getHandler());
        this.mCarplayMonitor.a(CarplayMessage.IAP2_OVER_CARPLAY_CONNECT_FAIL, getHandler());
        this.mCarplayMonitor.a(CarplayMessage.IAP2_CALL_STATE_UPDATE, getHandler());
        this.mCarplayMonitor.a(CarplayMessage.CARPLAY_SESSION_CONNECTED, getHandler());
        this.mCarplayMonitor.a(CarplayMessage.CARPLAY_SESSION_DISCONNECTED, getHandler());
        this.mCarplayMonitor.a(CarplayMessage.CARPLAY_SESSION_FAILED, getHandler());
        this.mCarplayMonitor.a(CarplayMessage.CARPLAY_DUCK_AUDIO, getHandler());
        this.mCarplayMonitor.a(CarplayMessage.CARPLAY_UNDUCK_AUDIO, getHandler());
        this.mCarplayMonitor.a(CarplayMessage.CARPLAY_SESSION_CONTROL, getHandler());
        this.mCarplayMonitor.a(CarplayMessage.CARPLAY_MODE_CHANGED, getHandler());
        this.mCarplayMonitor.a(CarplayMessage.CARPLAY_REQUEST_ACCESSORY_UI, getHandler());
    }

    public final com.autochips.carplay.common.b ee() {
        com.autochips.carplay.common.b bVar;
        synchronized (this) {
            bVar = this.ux;
        }
        return bVar;
    }

    final CarplayAppState getAppState() {
        synchronized (this) {
            if (this.ux == null) {
                Log.i(TAG, "getAppState, current state is null");
                return null;
            }
            com.autochips.carplay.common.d dVarCT = this.ux.cT();
            CarplayAppState carplayAppState = new CarplayAppState(dVarCT.qA == 1 ? dVarCT.qB : -1, this.ux.cU() == 1, this.ux.cV() == 1);
            Log.i(TAG, "getAppState, appState:" + carplayAppState);
            return carplayAppState;
        }
    }

    public final List getConnectedDevices() {
        ArrayList arrayList = new ArrayList();
        synchronized (this) {
            int iEd = ed();
            if (iEd == 3 || iEd == 4 || iEd == 5 || iEd == 6) {
                arrayList.add(this.uw);
            }
            Log.i(TAG, "getConnectedDevices, devices:" + arrayList + ", size:" + arrayList.size());
        }
        return arrayList;
    }

    public final synchronized int getConnectionState(CarplayDevice carplayDevice) {
        Log.d(TAG, "getConnectionState mCurrentDevice: " + this.uw + ", device:" + carplayDevice);
        if (this.uw == null) {
            return 0;
        }
        if (!this.uw.equals(carplayDevice)) {
            return 0;
        }
        int iEd = ed();
        Log.d(TAG, "getConnectionState currentState: " + iEd);
        if (iEd != 1 && iEd != 2) {
            if (iEd != 3 && iEd != 4 && iEd != 5 && iEd != 6) {
                Log.e(TAG, "Bad currentState: " + iEd);
                return 0;
            }
            return 2;
        }
        return 1;
    }

    final List getCurrentCalls() {
        ArrayList arrayList;
        synchronized (this) {
            arrayList = new ArrayList(this.uA.values());
        }
        return arrayList;
    }

    final CarplayResourceState getResourceState() {
        synchronized (this) {
            if (this.ux == null) {
                Log.i(TAG, "getResourceState, current state is null");
                return null;
            }
            CarplayResourceState carplayResourceState = new CarplayResourceState(this.ux.getMainAudio(), this.ux.cS());
            Log.i(TAG, "getResourceState, state:" + carplayResourceState);
            return carplayResourceState;
        }
    }

    protected void onQuitting() {
        if (this.tv != null) {
            this.tv = null;
        }
        if (this.tu != null) {
            this.tu = null;
        }
        if (this.mCarplayMonitor != null) {
            this.mCarplayMonitor = null;
        }
        if (this.ta != null) {
            this.ta = null;
        }
        if (this.sZ != null) {
            this.sZ = null;
        }
    }
}
