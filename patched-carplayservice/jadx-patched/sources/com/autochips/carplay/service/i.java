package com.autochips.carplay.service;

import android.net.InterfaceConfiguration;
import android.net.MacAddress;
import android.os.INetworkManagementService;
import android.os.Message;
import android.os.RemoteException;
import android.util.Log;
import com.autochips.carplay.common.CarplayMessage;
import java.util.Iterator;

/* JADX INFO: loaded from: classes.dex */
public final class i {
    private final h mCarplayMonitor;
    private final com.autochips.carplay.c.a rY;
    private final com.autochips.carplay.wired.a tI;
    private final com.autochips.carplay.plugin.a tJ;
    private final com.autochips.carplay.a.a tK;
    private final com.autochips.carplay.c.e tL;
    private final com.autochips.carplay.common.c tM;
    private final INetworkManagementService tk;
    private Object mLock = new Object();
    private final k tO = new k((byte) 0);
    private boolean tP = false;
    private final l tN = new l(this, 0);

    public i(com.autochips.carplay.wired.a aVar, com.autochips.carplay.plugin.a aVar2, com.autochips.carplay.a.a aVar3, com.autochips.carplay.c.a aVar4, com.autochips.carplay.c.e eVar, com.autochips.carplay.common.c cVar, INetworkManagementService iNetworkManagementService, h hVar) {
        this.tI = aVar;
        this.tJ = aVar2;
        this.tK = aVar3;
        this.rY = aVar4;
        this.tL = eVar;
        this.tM = cVar;
        this.tk = iNetworkManagementService;
        this.mCarplayMonitor = hVar;
        a(this.tN);
    }

    private boolean E(String str) {
        synchronized (this.mLock) {
            boolean z = false;
            if (k.a(this.tO, str) == null) {
                Log.e("CarplayNative", "Trying to get iface state on invalid iface=" + str);
                return false;
            }
            InterfaceConfiguration interfaceConfig = null;
            try {
                interfaceConfig = this.tk.getInterfaceConfig(str);
            } catch (RemoteException e) {
                Log.e("CarplayNative", "", e);
            }
            if (interfaceConfig == null) {
                return false;
            }
            String hardwareAddress = interfaceConfig.getHardwareAddress();
            Log.i("CarplayNative", "iface " + str + " hwAddr is " + hardwareAddress);
            if (this.mCarplayMonitor != null && hardwareAddress != null && !MacAddress.fromString(hardwareAddress).equals(MacAddress.ALL_ZEROS_ADDRESS)) {
                this.mCarplayMonitor.sendMessage(CarplayMessage.NET_DEVICE_HW_ADDRESS_CHANGED, hardwareAddress);
                z = true;
            }
            return z;
        }
    }

    static /* synthetic */ void a(i iVar, j jVar, boolean z) {
        synchronized (iVar.mLock) {
            if (z != jVar.tQ) {
                Log.i("CarplayNative", "onInterfaceStateChanged " + jVar + ", isUp=" + z);
                jVar.tQ = z;
                return;
            }
            if (iVar.tP) {
                Log.v("CarplayNative", "Interface status unchanged on " + jVar + " from " + z + ", Ignoring...");
            }
        }
    }

    private boolean a(l lVar) {
        if (lVar == null) {
            return false;
        }
        try {
            this.tk.registerObserver(lVar);
            return true;
        } catch (RemoteException e) {
            Log.e("CarplayNative", "", e);
            return false;
        }
    }

    private boolean b(l lVar) {
        if (lVar == null) {
            return false;
        }
        try {
            this.tk.unregisterObserver(lVar);
            return true;
        } catch (RemoteException e) {
            Log.e("CarplayNative", "", e);
            return false;
        }
    }

    public final boolean D(String str) {
        InterfaceConfiguration interfaceConfig;
        synchronized (this.mLock) {
            if (k.a(this.tO, str) == null) {
                Log.e("CarplayNative", "Trying to get iface state on invalid iface=" + str);
                return false;
            }
            try {
                interfaceConfig = this.tk.getInterfaceConfig(str);
            } catch (RemoteException e) {
                Log.e("CarplayNative", "", e);
                interfaceConfig = null;
            }
            if (interfaceConfig == null) {
                return false;
            }
            return interfaceConfig.isUp();
        }
    }

    public final boolean F(String str) {
        Message messageObtainMessage = this.rY.obtainMessage(5);
        messageObtainMessage.obj = str;
        return this.rY.sendMessage(messageObtainMessage);
    }

    public final boolean G(String str) {
        Message messageObtainMessage = this.tJ.obtainMessage(CarplayMessage.USER_SET_OEM_ICON_LABEL);
        messageObtainMessage.obj = str;
        return this.tJ.sendMessage(messageObtainMessage);
    }

    public final boolean a(com.autochips.carplay.common.f fVar, int i) {
        Message messageObtainMessage = this.tJ.obtainMessage(CarplayMessage.USER_CHANGE_MODE_REQUEST);
        messageObtainMessage.obj = fVar;
        messageObtainMessage.arg1 = i;
        return this.tJ.sendMessage(messageObtainMessage);
    }

    public final boolean a(com.autochips.carplay.common.h hVar) {
        Message messageObtainMessage = this.tJ.obtainMessage(CarplayMessage.USER_UPDATE_KNOB);
        messageObtainMessage.obj = hVar;
        return this.tJ.sendMessage(messageObtainMessage);
    }

    public final boolean a(boolean z, int i, int i2) {
        Message messageObtainMessage = this.tJ.obtainMessage(CarplayMessage.USER_UPDATE_TOUCH_SCREEN);
        messageObtainMessage.obj = Boolean.valueOf(z);
        messageObtainMessage.arg1 = i;
        messageObtainMessage.arg2 = i2;
        return this.tJ.sendMessage(messageObtainMessage);
    }

    public final boolean ad(int i) {
        boolean zSendMessage;
        synchronized (this.mLock) {
            j jVarB = k.b(this.tO, 0);
            jVarB.name = "ncm0";
            com.autochips.carplay.wired.a aVar = this.tI;
            Message messageObtainMessage = aVar.obtainMessage(1);
            messageObtainMessage.arg1 = i;
            zSendMessage = aVar.sendMessage(messageObtainMessage);
            if (!zSendMessage) {
                k.c(this.tO, jVarB.id);
            }
        }
        return zSendMessage;
    }

    public final boolean ae(int i) {
        com.autochips.carplay.wired.a aVar = this.tI;
        Message messageObtainMessage = aVar.obtainMessage(2);
        messageObtainMessage.arg1 = i;
        boolean zSendMessage = aVar.sendMessage(messageObtainMessage);
        if (!zSendMessage) {
            return zSendMessage;
        }
        synchronized (this.mLock) {
            this.tO.dU();
            Log.i("CarplayNative", "Successfully remove ifaces");
        }
        return zSendMessage;
    }

    public final boolean af(int i) {
        Message messageObtainMessage = this.tJ.obtainMessage(CarplayMessage.USER_UPDATE_TELEPHONY);
        messageObtainMessage.arg1 = i;
        return this.tJ.sendMessage(messageObtainMessage);
    }

    public final boolean ag(int i) {
        Message messageObtainMessage = this.tJ.obtainMessage(CarplayMessage.USER_UPDATE_MEDIA_BUTTON);
        messageObtainMessage.arg1 = i;
        return this.tJ.sendMessage(messageObtainMessage);
    }

    public final boolean ah(int i) {
        Message messageObtainMessage = this.tJ.obtainMessage(CarplayMessage.USER_REQUEST_SIRI);
        messageObtainMessage.arg1 = i;
        return this.tJ.sendMessage(messageObtainMessage);
    }

    public final boolean b(com.autochips.carplay.common.f fVar) {
        return a(fVar, 0);
    }

    final void cleanup() {
        b(this.tN);
    }

    public final boolean dH() {
        boolean z;
        synchronized (this.mLock) {
            Iterator itDV = this.tO.dV();
            while (true) {
                if (!itDV.hasNext()) {
                    z = false;
                    break;
                }
                j jVarAi = this.tO.ai(((Integer) itDV.next()).intValue());
                if (E(jVarAi.name)) {
                    z = true;
                    Log.i("CarplayNative", "carplayNetIfaceHasHWAddress " + jVarAi);
                    break;
                }
            }
        }
        Log.i("CarplayNative", "carplayNetIfaceHasHWAddress, ret " + z);
        return z;
    }

    public final void dI() {
        if (this.rY != null) {
            com.autochips.carplay.c.a aVar = this.rY;
            aVar.sendMessage(aVar.obtainMessage(4));
        }
    }

    public final boolean dJ() {
        com.autochips.carplay.c.a aVar = this.rY;
        return aVar.sendMessage(aVar.obtainMessage(1));
    }

    public final boolean dK() {
        com.autochips.carplay.c.a aVar = this.rY;
        return aVar.sendMessage(aVar.obtainMessage(2));
    }

    public final boolean dL() {
        boolean zSendMessage;
        synchronized (this.mLock) {
            j jVarB = k.b(this.tO, 1);
            jVarB.name = "ap0";
            com.autochips.carplay.c.e eVar = this.tL;
            zSendMessage = eVar.sendMessage(eVar.obtainMessage(1));
            if (!zSendMessage) {
                k.c(this.tO, jVarB.id);
            }
        }
        return zSendMessage;
    }

    public final boolean dM() {
        com.autochips.carplay.c.e eVar = this.tL;
        boolean zSendMessage = eVar.sendMessage(eVar.obtainMessage(2));
        if (!zSendMessage) {
            return zSendMessage;
        }
        synchronized (this.mLock) {
            this.tO.dU();
            Log.i("CarplayNative", "Successfully remove ifaces");
        }
        return zSendMessage;
    }

    public final boolean dN() {
        com.autochips.carplay.a.a aVar = this.tK;
        return aVar.sendMessage(aVar.obtainMessage(1));
    }

    public final boolean dO() {
        com.autochips.carplay.a.a aVar = this.tK;
        return aVar.sendMessage(aVar.obtainMessage(2));
    }

    public final boolean dP() {
        com.autochips.carplay.plugin.a aVar = this.tJ;
        return aVar.sendMessage(aVar.obtainMessage(1));
    }

    public final boolean dQ() {
        com.autochips.carplay.plugin.a aVar = this.tJ;
        return aVar.sendMessage(aVar.obtainMessage(2));
    }

    public final boolean dR() {
        com.autochips.carplay.common.c cVar = this.tM;
        return cVar.sendMessage(cVar.obtainMessage(1));
    }

    public final boolean dS() {
        com.autochips.carplay.common.c cVar = this.tM;
        return cVar.sendMessage(cVar.obtainMessage(2));
    }

    public final boolean dT() {
        return this.tJ.sendMessage(this.tJ.obtainMessage(CarplayMessage.USER_FORCE_KEY_FRAME));
    }

    public final boolean f(int i, String str) {
        Message messageObtainMessage = this.tJ.obtainMessage(CarplayMessage.USER_REQUEST_DEVICE_UI);
        messageObtainMessage.arg1 = i;
        messageObtainMessage.obj = str;
        return this.tJ.sendMessage(messageObtainMessage);
    }

    public final boolean m(int i, int i2) {
        Message messageObtainMessage = this.tJ.obtainMessage(CarplayMessage.USER_SET_VIDEO_RESOLUTION);
        messageObtainMessage.arg1 = i;
        messageObtainMessage.arg2 = i2;
        return this.tJ.sendMessage(messageObtainMessage);
    }

    public final boolean n(int i, int i2) {
        Message messageObtainMessage = this.tJ.obtainMessage(CarplayMessage.USER_SET_SCREEN_SIZE);
        messageObtainMessage.arg1 = i;
        messageObtainMessage.arg2 = i2;
        return this.tJ.sendMessage(messageObtainMessage);
    }

    public final boolean o(boolean z) {
        Message messageObtainMessage = this.tJ.obtainMessage(CarplayMessage.USER_SET_NIGHT_MODE);
        messageObtainMessage.obj = Boolean.valueOf(z);
        return this.tJ.sendMessage(messageObtainMessage);
    }
}
