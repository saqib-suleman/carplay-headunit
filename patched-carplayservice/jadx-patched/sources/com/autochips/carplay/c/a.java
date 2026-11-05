package com.autochips.carplay.c;

import android.bluetooth.BluetoothA2dpSink;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothAvrcpController;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothHeadsetClient;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.IntentFilter;
import android.os.Looper;
import android.os.Message;
import android.os.SystemProperties;
import android.telephony.PhoneStateListener;
import android.telephony.TelephonyManager;
import android.util.Slog;
import com.autochips.carplay.CarplayDevice;
import com.autochips.carplay.common.CarplayMessage;
import com.autochips.carplay.service.CarplayService;
import com.autochips.carplay.service.ac;
import com.autochips.carplay.service.p;
import java.lang.reflect.Field;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public final class a extends com.autochips.carplay.common.a {
    private final Context mContext;
    private final BroadcastReceiver mReceiver;
    private TelephonyManager mTelephonyManager;
    private int qW;
    private boolean uS;
    private BluetoothAdapter uT;
    private BluetoothDevice uU;
    private BluetoothHeadsetClient uV;
    private BluetoothA2dpSink uW;
    private BluetoothAvrcpController uX;
    private String uY;
    private final boolean uZ;
    private d va;
    private final PhoneStateListener vb;

    public a(Context context, Looper looper) {
        super(looper);
        this.uS = false;
        this.qW = 0;
        this.uY = null;
        this.uZ = SystemProperties.getBoolean("ro.atc.carplay.disable_bt", false);
        this.va = new d(this, (byte) 0);
        this.mReceiver = new b(this);
        this.vb = new c(this);
        this.mContext = context;
        this.uT = BluetoothAdapter.getDefaultAdapter();
        if (this.uT != null) {
            this.uT.getProfileProxy(this.mContext, this.va, 16);
            this.uT.getProfileProxy(this.mContext, this.va, 11);
            this.uT.getProfileProxy(this.mContext, this.va, 12);
        }
        this.mTelephonyManager = TelephonyManager.from(context);
        if (this.mTelephonyManager != null) {
            this.mTelephonyManager.listen(this.vb, 32);
        }
        com.autochips.carplay.service.h hVarDz = com.autochips.carplay.service.g.dx().dz();
        if (hVarDz != null) {
            hVarDz.a(CarplayMessage.CARPLAY_SESSION_CONNECTED, this);
            hVarDz.a(CarplayMessage.NET_DEVICE_HW_ADDRESS_CHANGED, this);
        }
        IntentFilter intentFilter = new IntentFilter();
        intentFilter.addAction("android.bluetooth.adapter.action.STATE_CHANGED");
        intentFilter.addAction("android.bluetooth.headsetclient.profile.action.CONNECTION_STATE_CHANGED");
        intentFilter.addAction("android.bluetooth.headsetclient.profile.action.AG_CALL_CHANGED");
        intentFilter.addAction("android.bluetooth.headsetclient.profile.action.AUDIO_STATE_CHANGED");
        intentFilter.setPriority(1000);
        this.mContext.registerReceiver(this.mReceiver, intentFilter);
    }

    private static String a(BluetoothAdapter bluetoothAdapter) {
        try {
            Field declaredField = bluetoothAdapter.getClass().getDeclaredField("mService");
            declaredField.setAccessible(true);
            Object obj = declaredField.get(bluetoothAdapter);
            if (obj != null) {
                return (String) obj.getClass().getMethod("getAddress", new Class[0]).invoke(obj, new Object[0]);
            }
            return null;
        } catch (Exception e) {
            Slog.e("CarplayBluetoothAdapter", "", e);
            return null;
        }
    }

    private synchronized boolean e(List list) {
        if (list != null) {
            if (this.uW != null) {
                boolean zIsA2dpPlaying = false;
                for (int i = 0; i < list.size() && !(zIsA2dpPlaying = this.uW.isA2dpPlaying((BluetoothDevice) list.get(i))); i++) {
                }
                return zIsA2dpPlaying;
            }
        }
        return false;
    }

    private int eg() {
        boolean zDisable;
        if (this.uT == null) {
            this.uT = BluetoothAdapter.getDefaultAdapter();
        }
        if (this.uT == null) {
            Slog.e("CarplayBluetoothAdapter", "mBluetoothAdapter is null");
            return -1;
        }
        int leState = this.uT.getLeState();
        if (12 == leState) {
            zDisable = this.uT.disable();
        } else if (10 == leState) {
            sendMessage(obtainMessage(CarplayMessage.BLUETOOTH_STOPPED));
            zDisable = true;
        } else {
            zDisable = false;
        }
        return zDisable ? 0 : -1;
    }

    private int eh() {
        if (!this.uZ) {
            return -1;
        }
        Message messageObtainMessage = obtainMessage(2);
        messageObtainMessage.arg1 = 1;
        sendMessage(messageObtainMessage);
        return 0;
    }

    private int ei() {
        int i = this.qW;
        this.qW = i + 1;
        return i < 6 ? sendMessageDelayed(obtainMessage(3), 1000L) : false ? 0 : -1;
    }

    private int ej() {
        synchronized (this.mContext) {
            if (this.uU != null && this.uU.isConnected()) {
                Slog.d("CarplayBluetoothAdapter", "disconnect device: " + this.uU);
                if (this.uV != null) {
                    this.uV.disconnect(this.uU);
                }
                if (this.uW != null) {
                    this.uW.disconnect(this.uU);
                }
            }
        }
        return 0;
    }

    private List en() {
        String str;
        String str2;
        if (this.uV == null) {
            str = "CarplayBluetoothAdapter";
            str2 = "get hf profile fail!";
        } else {
            List connectedDevices = this.uV.getConnectedDevices();
            if (connectedDevices != null && connectedDevices.size() != 0) {
                return connectedDevices;
            }
            str = "CarplayBluetoothAdapter";
            str2 = "hf client is not connected!";
        }
        Slog.e(str, str2);
        return null;
    }

    private void eo() {
        if (this.uT == null) {
            this.uT = BluetoothAdapter.getDefaultAdapter();
        }
        String strA = a(this.uT);
        Slog.d("CarplayBluetoothAdapter", "updateBluetoothAddress, address: " + strA);
        if ((this.uY == null || !this.uY.equals(strA)) && strA != null) {
            this.uY = strA;
            com.autochips.carplay.service.g.dx().dz().sendMessage(CarplayMessage.BLUETOOTH_ADDRESS, this.uY);
        }
    }

    private List getCurrentCalls() {
        List listEn = en();
        if (listEn == null || this.uV == null) {
            Slog.e("CarplayBluetoothAdapter", "get getCurrentCalls is null!");
            return null;
        }
        List currentCalls = this.uV.getCurrentCalls((BluetoothDevice) listEn.get(0));
        if (currentCalls == null) {
            Slog.e("CarplayBluetoothAdapter", "callList is null!");
        }
        return currentCalls;
    }

    public final void cleanup() {
        if (this.mTelephonyManager != null) {
            this.mTelephonyManager.listen(this.vb, 0);
        }
        this.mContext.unregisterReceiver(this.mReceiver);
        this.uT = null;
        this.mTelephonyManager = null;
    }

    public final synchronized int ek() {
        List currentCalls = getCurrentCalls();
        int i = 0;
        if (currentCalls != null) {
            int size = currentCalls.size();
            if (size != 0 && size > 0) {
                i = 2;
            }
            Slog.d("CarplayBluetoothAdapter", "bluetooth call type: " + i);
            if (i != 0) {
                return 2;
            }
        }
        if (this.mTelephonyManager != null) {
            int callState = this.mTelephonyManager.getCallState();
            Slog.d("CarplayBluetoothAdapter", "telehony callState: " + callState);
            if (callState != 0) {
                i = 1;
            }
        }
        return i;
    }

    public final synchronized boolean el() {
        int size;
        if (this.mTelephonyManager != null) {
            int callState = this.mTelephonyManager.getCallState();
            Slog.d("CarplayBluetoothAdapter", "telehony callState: " + callState);
            if (callState != 0) {
                return true;
            }
        }
        List currentCalls = getCurrentCalls();
        boolean z = false;
        if (currentCalls != null && (size = currentCalls.size()) != 0 && size > 0) {
            z = true;
        }
        return z;
    }

    public final synchronized int em() {
        int audioState;
        List listEn = en();
        audioState = 0;
        if (listEn != null && this.uV != null) {
            audioState = this.uV.getAudioState((BluetoothDevice) listEn.get(0));
        }
        Slog.d("CarplayBluetoothAdapter", "getAudioState: " + audioState);
        return audioState;
    }

    /* JADX WARN: Code duplicated, block: B:134:0x02e1  */
    /* JADX WARN: Code duplicated, block: B:146:0x00de A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Code duplicated, block: B:158:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Code duplicated, block: B:55:0x00e2 A[Catch: all -> 0x0273, TryCatch #0 {, blocks: (B:53:0x00de, B:55:0x00e2, B:56:0x00ea), top: B:146:0x00de }] */
    /* JADX WARN: Code duplicated, block: B:59:0x00f4  */
    /* JADX WARN: Code duplicated, block: B:66:0x015a  */
    /* JADX WARN: Instruction removed from duplicated block: B:59:0x00f4, please report this as an issue */
    @Override // android.os.Handler
    public final void handleMessage(Message message) {
        boolean zEnable;
        List connectedDevices;
        String str;
        String str2;
        boolean zEl;
        p pVarDC;
        List connectedDevices2;
        List connectedDevices3;
        Slog.d("CarplayBluetoothAdapter", "handleMessage, what: " + message.what);
        int i = message.what;
        if (i == 777) {
            BluetoothDevice bluetoothDevice = (BluetoothDevice) message.obj;
            if (bluetoothDevice == null || !bluetoothDevice.equals(this.uU)) {
                return;
            }
            ej();
            return;
        }
        if (i == 1802) {
            eh();
            return;
        }
        if (i == 2052) {
            eo();
            return;
        }
        byte b = 0;
        switch (i) {
            case 1:
            case 3:
                if (this.uT == null) {
                    this.uT = BluetoothAdapter.getDefaultAdapter();
                }
                if (this.uT != null) {
                    int leState = this.uT.getLeState();
                    if (10 == leState) {
                        zEnable = this.uT.enable();
                        if (zEnable) {
                            this.uS = true;
                        }
                    } else if (12 == leState) {
                        sendMessage(obtainMessage(CarplayMessage.BLUETOOTH_STARTED));
                        zEnable = true;
                    } else {
                        zEnable = false;
                    }
                    if (!zEnable) {
                    }
                    if (b != 0) {
                        sendMessage(obtainMessage(CarplayMessage.BLUETOOTH_START_FAILURE));
                        return;
                    }
                    return;
                }
                Slog.e("CarplayBluetoothAdapter", "mBluetoothAdapter is null");
                b = -1;
                if (b != 0) {
                    sendMessage(obtainMessage(CarplayMessage.BLUETOOTH_START_FAILURE));
                    return;
                }
                return;
            case 2:
                boolean z = message.arg1 == 1;
                removeMessages(3);
                if (z && eg() == 0) {
                    Slog.d("CarplayBluetoothAdapter", "force to disable bluetooth");
                    this.uS = false;
                    return;
                } else {
                    if (!this.uS || eg() == 0) {
                        this.uS = false;
                        return;
                    }
                    return;
                }
            case 4:
                this.uU = null;
                return;
            case 5:
                if (eh() != 0) {
                    String str3 = (String) message.obj;
                    Slog.d("CarplayBluetoothAdapter", "disconnect bluetooth device: " + str3);
                    List listEn = en();
                    if (this.uW != null) {
                        connectedDevices = this.uW.getConnectedDevices();
                        if (connectedDevices == null || connectedDevices.size() == 0) {
                            str = "CarplayBluetoothAdapter";
                            str2 = "a2dp sink is not connected!";
                        }
                        zEl = el();
                        boolean zE = e(connectedDevices);
                        synchronized (this.mContext) {
                            if (this.uT != null) {
                                this.uU = this.uT.getRemoteDevice(str3);
                            }
                            break;
                        }
                        ej();
                        if (this.uT != null) {
                            Slog.i("CarplayBluetoothAdapter", "handlePhoneContinus: deviceID: " + str3);
                            Slog.i("CarplayBluetoothAdapter", "handlePhoneContinus: hfpDevices: " + listEn);
                            Slog.i("CarplayBluetoothAdapter", "handlePhoneContinus: callOn: " + zEl);
                            BluetoothDevice remoteDevice = this.uT.getRemoteDevice(str3);
                            if (listEn != null && listEn.contains(remoteDevice) && zEl) {
                                Slog.i("CarplayBluetoothAdapter", "Route Phone Call from Bluetooth to Carplay: " + str3);
                                pVarDC = com.autochips.carplay.service.g.dx().dC();
                                if (pVarDC != null) {
                                    connectedDevices2 = pVarDC.getConnectedDevices();
                                    if (connectedDevices2.size() != 0 && connectedDevices2.get(0) != null && ac.a(this.mContext).K(((CarplayDevice) connectedDevices2.get(0)).toString()) == 0) {
                                        Slog.i("CarplayBluetoothAdapter", "UI State is background, requestUI to show carplay: " + str3);
                                        Message messageObtainMessage = pVarDC.obtainMessage(CarplayMessage.USER_REQUEST_DEVICE_UI);
                                        messageObtainMessage.arg1 = 1;
                                        messageObtainMessage.obj = null;
                                        pVarDC.sendMessage(messageObtainMessage);
                                    }
                                }
                            }
                        }
                        if (this.uT != null || str3 == null) {
                            return;
                        }
                        Slog.i("CarplayBluetoothAdapter", "handleMusicContinus: deviceID: " + str3);
                        Slog.i("CarplayBluetoothAdapter", "handleMusicContinus: a2dpDevices: " + connectedDevices);
                        Slog.i("CarplayBluetoothAdapter", "handleMusicContinus: musicOn: " + zE);
                        BluetoothDevice remoteDevice2 = this.uT.getRemoteDevice(str3);
                        if (connectedDevices != null && connectedDevices.contains(remoteDevice2) && zE) {
                            Slog.i("CarplayBluetoothAdapter", "Route Music from Bluetooth to Carplay: " + str3);
                            p pVarDC2 = com.autochips.carplay.service.g.dx().dC();
                            if (pVarDC2 != null) {
                                List connectedDevices4 = pVarDC2.getConnectedDevices();
                                if (connectedDevices4.size() != 0 && connectedDevices4.get(0) != null && ac.a(this.mContext).K(((CarplayDevice) connectedDevices4.get(0)).toString()) == 0) {
                                    Slog.i("CarplayBluetoothAdapter", "UI State is background, requestUI to show carplay: " + str3);
                                    Message messageObtainMessage2 = pVarDC2.obtainMessage(CarplayMessage.USER_REQUEST_DEVICE_UI);
                                    messageObtainMessage2.arg1 = 1;
                                    messageObtainMessage2.obj = null;
                                    pVarDC2.sendMessage(messageObtainMessage2);
                                }
                            }
                            com.autochips.carplay.common.f fVar = new com.autochips.carplay.common.f();
                            fVar.qG.qK = 1;
                            fVar.qG.qL = 100;
                            fVar.qG.qM = 100;
                            fVar.qG.qN = 100;
                            if (pVarDC2 != null) {
                                Message messageObtainMessage3 = pVarDC2.obtainMessage(CarplayMessage.USER_CHANGE_MODE_REQUEST);
                                messageObtainMessage3.obj = fVar;
                                pVarDC2.sendMessage(messageObtainMessage3);
                                return;
                            }
                            return;
                        }
                        return;
                    }
                    str = "CarplayBluetoothAdapter";
                    str2 = "get a2dp sink profile fail!";
                    Slog.e(str, str2);
                    connectedDevices = null;
                    zEl = el();
                    boolean zE2 = e(connectedDevices);
                    synchronized (this.mContext) {
                        if (this.uT != null) {
                            this.uU = this.uT.getRemoteDevice(str3);
                        }
                        ej();
                        if (this.uT != null) {
                            Slog.i("CarplayBluetoothAdapter", "handlePhoneContinus: deviceID: " + str3);
                            Slog.i("CarplayBluetoothAdapter", "handlePhoneContinus: hfpDevices: " + listEn);
                            Slog.i("CarplayBluetoothAdapter", "handlePhoneContinus: callOn: " + zEl);
                            BluetoothDevice remoteDevice3 = this.uT.getRemoteDevice(str3);
                            if (listEn != null) {
                                Slog.i("CarplayBluetoothAdapter", "Route Phone Call from Bluetooth to Carplay: " + str3);
                                pVarDC = com.autochips.carplay.service.g.dx().dC();
                                if (pVarDC != null) {
                                    connectedDevices2 = pVarDC.getConnectedDevices();
                                    if (connectedDevices2.size() != 0) {
                                        Slog.i("CarplayBluetoothAdapter", "UI State is background, requestUI to show carplay: " + str3);
                                        Message messageObtainMessage4 = pVarDC.obtainMessage(CarplayMessage.USER_REQUEST_DEVICE_UI);
                                        messageObtainMessage4.arg1 = 1;
                                        messageObtainMessage4.obj = null;
                                        pVarDC.sendMessage(messageObtainMessage4);
                                    }
                                }
                            }
                        }
                        if (this.uT != null) {
                            return;
                        } else {
                            return;
                        }
                    }
                }
                return;
            default:
                switch (i) {
                    case CarplayMessage.BLUETOOTH_STARTED /* 769 */:
                        CarplayService carplayServiceDy = com.autochips.carplay.service.g.dx().dy();
                        if (carplayServiceDy == null || (connectedDevices3 = carplayServiceDy.getConnectedDevices()) == null || connectedDevices3.size() == 0 || eh() != 0) {
                            if (this.qW != 0) {
                                Slog.w("CarplayBluetoothAdapter", "bluetooth is recovered from error");
                                this.qW = 0;
                            }
                            V(CarplayMessage.BLUETOOTH_STARTED);
                            eo();
                            return;
                        }
                        return;
                    case CarplayMessage.BLUETOOTH_STOPPED /* 770 */:
                        if (!this.uS || ei() != 0) {
                            V(CarplayMessage.BLUETOOTH_STOPPED);
                        }
                        this.uY = null;
                        return;
                    case CarplayMessage.BLUETOOTH_START_FAILURE /* 771 */:
                        if (this.uS && ei() == 0) {
                            return;
                        }
                        V(CarplayMessage.BLUETOOTH_STOPPED);
                        return;
                    default:
                        Slog.d("CarplayBluetoothAdapter", "handleMessage ignoring msg=" + message);
                        return;
                }
        }
    }
}
