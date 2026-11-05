package com.autochips.carplay.a;

import android.content.Context;
import android.os.Build;
import android.os.Looper;
import android.os.Message;
import android.os.RemoteException;
import android.os.SystemProperties;
import android.util.Log;
import android.util.Slog;
import com.autochips.carplay.common.CarplayMessage;
import vendor.autochips.hardware.iap.V1_0.IIAPCarplay;
import vendor.autochips.hardware.iap.V1_0.IIAPClient;
import vendor.autochips.hardware.iap.V1_0.IIAPService;

/* JADX INFO: loaded from: classes.dex */
public class a extends com.autochips.carplay.common.a {
    private static final String qZ = Build.SERIAL;
    private static final boolean ra = SystemProperties.getBoolean("persist.carplay.uuid.enable", false);
    private static final String rb = SystemProperties.get("persist.carplay.uuid.value", "");
    private final Context mContext;
    private boolean mEnabled;
    private final c qT;
    private IIAPService qU;
    private IIAPCarplay qV;
    private int qW;
    private e qX;
    private d qY;

    public a(Context context, Looper looper) {
        super(looper);
        this.mEnabled = false;
        this.qW = 0;
        this.mContext = context;
        this.qT = new c(this);
        this.qY = new d(this, (byte) 0);
        this.qX = new e(this.mContext, this.qY);
    }

    static /* synthetic */ int a(a aVar) {
        if (aVar.qV != null) {
            return 0;
        }
        Log.w("CarplayIAP2Adapter", "Proxy not attached to service");
        return -2;
    }

    private int cW() {
        Log.d("CarplayIAP2Adapter", "enableIAP2");
        try {
            this.qU = IIAPService.getService();
            if (this.qU == null) {
                Log.e("CarplayIAP2Adapter", "iap service is null");
                return -1;
            }
            this.qU.linkToDeath(this.qT, 0L);
            this.qV = this.qU.createCarplay(IIAPClient.asInterface(new b(this, (byte) 0).asBinder()));
            if (this.qV == null) {
                Log.e("CarplayIAP2Adapter", "enableIAP2 fail, carplay obj is null");
                return -1;
            }
            Log.d("CarplayIAP2Adapter", "enableIAP2, mCarplay:" + this.qV);
            String str = qZ;
            Log.d("CarplayIAP2Adapter", "ro.serialno:" + str);
            this.qV.setDeviceConfigInfo(7, str, false);
            this.qV.setDeviceConfigInfo(20, "", true);
            this.qV.setDeviceConfigInfo(21, "", true);
            this.qV.setDeviceConfigInfo(22, "", true);
            this.qV.setDeviceConfigInfo(8, rb, ra);
            return 0;
        } catch (RemoteException | NullPointerException | Exception e) {
            Log.e("CarplayIAP2Adapter", "", e);
            return -1;
        }
    }

    private int cX() {
        int i;
        Log.d("CarplayIAP2Adapter", "disableIAP2, mCarplay:" + this.qV);
        try {
            if (this.qV != null) {
                this.qU.destroyCarplay(this.qV);
                this.qV = null;
            }
            this.qU.unlinkToDeath(this.qT);
            i = 0;
        } catch (RemoteException e) {
            e.printStackTrace();
            i = -1;
        } catch (Exception e2) {
            Log.e("CarplayIAP2Adapter", "", e2);
            i = -1;
        }
        this.qU = null;
        return i;
    }

    private int cY() {
        int i = this.qW;
        this.qW = i + 1;
        return i < 6 ? sendMessageDelayed(obtainMessage(4), 500L) : false ? 0 : -1;
    }

    @Override // android.os.Handler
    public void handleMessage(Message message) {
        Slog.d("CarplayIAP2Adapter", "handleMessage, what:" + message.what);
        int i = message.what;
        if (i != 1330) {
            switch (i) {
                case 1:
                case 4:
                    if (cW() != 0) {
                        if (cY() != 0) {
                            V(CarplayMessage.IAP2_START_FAILURE);
                            return;
                        }
                        return;
                    } else {
                        this.mEnabled = true;
                        if (this.qW != 0) {
                            Slog.w("CarplayIAP2Adapter", "iapService is recovered from error");
                            this.qW = 0;
                        }
                        V(CarplayMessage.IAP2_STARTED);
                        return;
                    }
                case 2:
                    removeMessages(4);
                    if (this.mEnabled && cX() != 0) {
                        V(CarplayMessage.IAP2_STOP_FAILURE);
                        return;
                    } else {
                        this.mEnabled = false;
                        V(CarplayMessage.IAP2_STOPPED);
                        return;
                    }
                case 3:
                    if (!this.mEnabled || cY() == 0) {
                        return;
                    }
                    this.mEnabled = false;
                    V(CarplayMessage.IAP2_STOPPED);
                    return;
                default:
                    switch (i) {
                        case 10:
                            int i2 = message.arg1;
                            int i3 = message.arg2;
                            Log.d("CarplayIAP2Adapter", "updateConnectionState, connectionStatus=" + i2 + ", transportType = " + i3 + ", deviceID = " + ((String) message.obj));
                            if (i2 == 255) {
                                switch (i3) {
                                    case 0:
                                        sendMessage(obtainMessage(CarplayMessage.IAP2_OVER_USB_CONNECT_FAIL));
                                        break;
                                    case 1:
                                        sendMessage(obtainMessage(CarplayMessage.IAP2_OVER_BLUETOOTH_CONNECT_FAIL));
                                        break;
                                    case 2:
                                        sendMessage(obtainMessage(CarplayMessage.IAP2_OVER_CARPLAY_CONNECT_FAIL));
                                        break;
                                }
                                return;
                            }
                            switch (i2) {
                                case 0:
                                    switch (i3) {
                                        case 0:
                                            sendMessage(obtainMessage(CarplayMessage.IAP2_OVER_USB_CONNECTING));
                                            break;
                                        case 1:
                                            sendMessage(obtainMessage(CarplayMessage.IAP2_OVER_BLUETOOTH_CONNECTING));
                                            break;
                                        case 2:
                                            sendMessage(obtainMessage(CarplayMessage.IAP2_OVER_CARPLAY_CONNECTING));
                                            break;
                                    }
                                    break;
                                case 1:
                                    switch (i3) {
                                        case 0:
                                            sendMessage(obtainMessage(CarplayMessage.IAP2_OVER_USB_CONNECTED));
                                            break;
                                        case 1:
                                            sendMessage(obtainMessage(CarplayMessage.IAP2_OVER_BLUETOOTH_CONNECTED));
                                            break;
                                        case 2:
                                            sendMessage(obtainMessage(CarplayMessage.IAP2_OVER_CARPLAY_CONNECTED));
                                            break;
                                    }
                                    break;
                                case 2:
                                    switch (i3) {
                                        case 0:
                                            sendMessage(obtainMessage(CarplayMessage.IAP2_OVER_USB_DISCONNECTING));
                                            break;
                                        case 1:
                                            sendMessage(obtainMessage(CarplayMessage.IAP2_OVER_BLUETOOTH_DISCONNECTING));
                                            break;
                                        case 2:
                                            sendMessage(obtainMessage(CarplayMessage.IAP2_OVER_CARPLAY_DISCONNECTING));
                                            break;
                                    }
                                    break;
                                case 3:
                                    switch (i3) {
                                        case 0:
                                            sendMessage(obtainMessage(CarplayMessage.IAP2_OVER_USB_DISCONNECTED));
                                            break;
                                        case 1:
                                            sendMessage(obtainMessage(CarplayMessage.IAP2_OVER_BLUETOOTH_DISCONNECTED));
                                            break;
                                        case 2:
                                            sendMessage(obtainMessage(CarplayMessage.IAP2_OVER_CARPLAY_DISCONNECTED));
                                            break;
                                    }
                                    break;
                            }
                            return;
                        case 11:
                            int i4 = message.arg1;
                            int i5 = message.arg2;
                            String str = (String) message.obj;
                            Log.d("CarplayIAP2Adapter", "updateLocationChange, locationChange=" + i4 + ", deviceID = " + str + ", locationDataType = " + i5);
                            this.qX.e(i5, str);
                            switch (i4) {
                                case 0:
                                    this.qX.cZ();
                                    break;
                                case 1:
                                    this.qX.start();
                                    break;
                                default:
                                    Log.d("CarplayIAP2Adapter", "Info not support" + i4);
                                    break;
                            }
                            return;
                        default:
                            switch (i) {
                                case CarplayMessage.IAP2_OVER_USB_CONNECTING /* 1290 */:
                                case CarplayMessage.IAP2_OVER_USB_CONNECTED /* 1291 */:
                                case CarplayMessage.IAP2_OVER_USB_DISCONNECTING /* 1292 */:
                                case CarplayMessage.IAP2_OVER_USB_DISCONNECTED /* 1293 */:
                                case CarplayMessage.IAP2_OVER_USB_CONNECT_FAIL /* 1294 */:
                                    break;
                                default:
                                    switch (i) {
                                        case CarplayMessage.IAP2_OVER_BLUETOOTH_CONNECTING /* 1300 */:
                                        case CarplayMessage.IAP2_OVER_BLUETOOTH_CONNECTED /* 1301 */:
                                        case CarplayMessage.IAP2_OVER_BLUETOOTH_DISCONNECTING /* 1302 */:
                                        case CarplayMessage.IAP2_OVER_BLUETOOTH_DISCONNECTED /* 1303 */:
                                        case CarplayMessage.IAP2_OVER_BLUETOOTH_CONNECT_FAIL /* 1304 */:
                                            break;
                                        default:
                                            switch (i) {
                                                case CarplayMessage.IAP2_OVER_CARPLAY_CONNECTING /* 1310 */:
                                                case CarplayMessage.IAP2_OVER_CARPLAY_CONNECTED /* 1311 */:
                                                case CarplayMessage.IAP2_OVER_CARPLAY_DISCONNECTING /* 1312 */:
                                                case CarplayMessage.IAP2_OVER_CARPLAY_DISCONNECTED /* 1313 */:
                                                case CarplayMessage.IAP2_OVER_CARPLAY_CONNECT_FAIL /* 1314 */:
                                                    break;
                                                default:
                                                    Slog.d("CarplayIAP2Adapter", "ignoring msg=" + message);
                                                    break;
                                            }
                                            return;
                                    }
                                    break;
                            }
                            break;
                    }
                    break;
            }
        }
        com.autochips.carplay.service.g.dx().dz().sendMessage(message.what, message.arg1, message.arg2, message.obj);
    }
}
