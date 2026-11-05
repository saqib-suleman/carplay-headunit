package com.autochips.carplay.plugin;

import android.util.Log;
import com.autochips.carplay.CarplayDevice;
import com.autochips.carplay.common.CarplayMessage;
import com.autochips.carplay.common.b;
import com.autochips.carplay.service.aa;
import com.autochips.carplay.service.g;
import com.autochips.carplay.service.h;
import com.autochips.carplay.service.z;

/* JADX INFO: loaded from: classes.dex */
public final class CarplayPluginJniCallbacks {
    private static final String TAG = "CarplayPluginJniCallbacks";
    private h mCarplayMonitor = g.dx().dz();
    private z mRemoteDevices = g.dx().dA();

    public CarplayPluginJniCallbacks() {
        Log.d(TAG, "mCarplayMonitor: " + this.mCarplayMonitor);
    }

    public final void cleanup() {
        this.mCarplayMonitor = null;
        this.mRemoteDevices = null;
    }

    public final Object clone() throws CloneNotSupportedException {
        throw new CloneNotSupportedException();
    }

    final void init() {
    }

    final void onDuckAudio(double d, double d2) {
        Log.d(TAG, "onDuckAudio, inDurationSecs: " + d + ", inVolume" + d2);
        if (this.mCarplayMonitor != null) {
            this.mCarplayMonitor.sendMessage(CarplayMessage.CARPLAY_DUCK_AUDIO, Double.valueOf(d2));
        }
    }

    final void onModesChanged(int i, int i2, int i3, int i4, int i5, int i6) {
        Log.d(TAG, "onModesChanged, screenEntity:" + i + ", mainAudioEntity:" + i2 + ", speechEntity:" + i3 + ", SpeechMode:" + i4 + ", phoneCallEntity:" + i5 + ", trunByTurnEntity:" + i6);
        b bVar = new b(i, i2, i3, i4, i5, i6);
        if (this.mCarplayMonitor != null) {
            this.mCarplayMonitor.sendMessage(CarplayMessage.CARPLAY_MODE_CHANGED, bVar);
        }
    }

    final void onPluginInited(boolean z) {
        Log.d(TAG, "onPluginInited, inited: " + z);
        if (this.mCarplayMonitor != null) {
            if (z) {
                this.mCarplayMonitor.sendMessage(CarplayMessage.CARPLAY_PLUGIN_STARTED);
            } else {
                this.mCarplayMonitor.sendMessage(CarplayMessage.CARPLAY_PLUGIN_STOPPED);
            }
        }
    }

    final void onRequestAccessoryUI(int i) {
        Log.d(TAG, "onRequestAccessoryUI: " + i);
        if (this.mCarplayMonitor != null) {
            this.mCarplayMonitor.sendMessage(CarplayMessage.CARPLAY_REQUEST_ACCESSORY_UI, i);
        }
    }

    final void onSessionControl(int i, String str) {
        Log.d(TAG, "onSessionControl: " + i + ", deviceID: " + str);
        if (this.mCarplayMonitor != null) {
            this.mCarplayMonitor.sendMessage(CarplayMessage.CARPLAY_SESSION_CONTROL, i, 0, str);
        }
    }

    final void onSessionCreated(String str, String str2, String str3) {
        aa aaVarB;
        Log.d(TAG, "onSessionCreated, deviceID:" + str + ", clientMacAddr:" + str2 + ", clientName:" + str3);
        CarplayDevice carplayDeviceH = this.mRemoteDevices.H(str);
        if (carplayDeviceH == null) {
            Log.d(TAG, "Added new device property");
            aa aaVarI = this.mRemoteDevices.I(str);
            carplayDeviceH = this.mRemoteDevices.H(str);
            aaVarB = aaVarI;
        } else {
            aaVarB = this.mRemoteDevices.b(carplayDeviceH);
        }
        aaVarB.setName(str3);
        aaVarB.setAddress(str2);
        if (this.mCarplayMonitor != null) {
            this.mCarplayMonitor.sendMessage(CarplayMessage.CARPLAY_SESSION_CONNECTED, carplayDeviceH);
        }
    }

    final void onSessionFailed(String str, int i) {
        Log.d(TAG, "onSessionFailed, deviceID:" + str + ", reason:" + i);
        CarplayDevice carplayDeviceH = this.mRemoteDevices.H(str);
        if (carplayDeviceH != null) {
            this.mRemoteDevices.J(str);
        } else if (!str.isEmpty()) {
            carplayDeviceH = new CarplayDevice(str);
        }
        if (this.mCarplayMonitor != null) {
            this.mCarplayMonitor.sendMessage(CarplayMessage.CARPLAY_SESSION_FAILED, i, 0, carplayDeviceH);
        }
    }

    final void onSessionFinalized(String str) {
        Log.d(TAG, "onSessionFinalized, deviceID:" + str);
        CarplayDevice carplayDeviceH = this.mRemoteDevices.H(str);
        if (carplayDeviceH != null) {
            this.mRemoteDevices.J(str);
        } else {
            carplayDeviceH = new CarplayDevice(str);
        }
        if (this.mCarplayMonitor != null) {
            this.mCarplayMonitor.sendMessage(CarplayMessage.CARPLAY_SESSION_DISCONNECTED, carplayDeviceH);
        }
    }

    final void onUnduckAudio(double d) {
        Log.d(TAG, "onUnduckAudio, inDurationSecs: " + d);
        if (this.mCarplayMonitor != null) {
            this.mCarplayMonitor.sendMessage(CarplayMessage.CARPLAY_UNDUCK_AUDIO, Double.valueOf(d));
        }
    }
}
