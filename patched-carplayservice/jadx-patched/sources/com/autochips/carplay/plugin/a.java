package com.autochips.carplay.plugin;

import android.content.Context;
import android.os.Looper;
import android.os.Message;
import android.os.SystemProperties;
import android.util.Log;
import com.autochips.carplay.common.CarplayMessage;
import com.autochips.carplay.common.e;
import com.autochips.carplay.common.f;
import com.autochips.carplay.service.g;
import com.autochips.carplay.service.h;

/* JADX INFO: loaded from: classes.dex */
public class a extends com.autochips.carplay.common.a {
    private static final boolean rR = SystemProperties.getBoolean("ro.atc.carplay.skip_input", false);
    private final Context mContext;
    private boolean mEnabled;
    private CarplayPluginInterface rO;
    private boolean rP;
    private e rQ;

    public a(Context context, Looper looper) {
        super(looper);
        this.mEnabled = false;
        this.rP = false;
        this.rQ = null;
        this.mContext = context;
        this.rO = new CarplayPluginInterface();
        if (this.rO != null && this.rO.initNative()) {
            this.rP = true;
        }
        h hVarDz = g.dx().dz();
        if (hVarDz != null) {
            hVarDz.a(CarplayMessage.BLUETOOTH_ADDRESS, this);
            hVarDz.a(CarplayMessage.NET_DEVICE_HW_ADDRESS_CHANGED, this);
            hVarDz.a(CarplayMessage.IAP2_OVER_USB_CONNECTING, this);
            hVarDz.a(CarplayMessage.IAP2_OVER_USB_CONNECTED, this);
            hVarDz.a(CarplayMessage.IAP2_OVER_USB_DISCONNECTING, this);
            hVarDz.a(CarplayMessage.IAP2_OVER_USB_DISCONNECTED, this);
            hVarDz.a(CarplayMessage.IAP2_OVER_USB_CONNECT_FAIL, this);
        }
    }

    public final void cleanup() {
        if (this.rP) {
            Log.d("CarplayPluginAdapter", "cleanup() - Cleaning up plugin native");
            this.rO.cleanupNative();
            this.rP = false;
            this.rO.cleanup();
        }
    }

    @Override // android.os.Handler
    public void handleMessage(Message message) {
        int iStartupCarplayNative;
        Log.d("CarplayPluginAdapter", "handleMessage, what: " + message.what);
        int i = message.what;
        if (i == 778) {
            String str = (String) message.obj;
            Log.d("CarplayPluginAdapter", "setBluetoothAddress, address: " + str);
            if (this.rO != null) {
                this.rO.setBluetoothAddressNative(str);
                return;
            }
            return;
        }
        if (i == 2052) {
            String str2 = (String) message.obj;
            if (this.rO != null) {
                this.rO.setDeviceIDNative(str2);
                return;
            }
            return;
        }
        switch (i) {
            case 1:
                if (!this.mEnabled) {
                    iStartupCarplayNative = this.rO != null ? this.rO.startupCarplayNative() : -1;
                    Log.d("CarplayPluginAdapter", "startupCarplay " + iStartupCarplayNative);
                    if (iStartupCarplayNative != 0) {
                        V(CarplayMessage.CARPLAY_PLUGIN_START_FAILURE);
                    } else {
                        this.mEnabled = true;
                    }
                } else {
                    V(CarplayMessage.CARPLAY_PLUGIN_STARTED);
                }
                break;
            case 2:
                if (!this.mEnabled) {
                    V(CarplayMessage.CARPLAY_PLUGIN_STOPPED);
                } else {
                    iStartupCarplayNative = this.rO != null ? this.rO.shutdownCarplayNative() : -1;
                    Log.d("CarplayPluginAdapter", "shutdownCarplay " + iStartupCarplayNative);
                    if (iStartupCarplayNative != 0) {
                        V(CarplayMessage.CARPLAY_PLUGIN_STOP_FAILURE);
                    } else {
                        this.mEnabled = false;
                    }
                }
                break;
            case 3:
                break;
            default:
                switch (i) {
                    case CarplayMessage.USER_REQUEST_DEVICE_UI /* 262 */:
                        int i2 = message.arg1;
                        String str3 = (String) message.obj;
                        String str4 = "";
                        switch (i2) {
                            case 1:
                                str4 = "";
                                break;
                            case 2:
                                str4 = "maps:";
                                break;
                            case 3:
                                str4 = "mobilephone:";
                                break;
                            case 4:
                                str4 = "music:";
                                break;
                            case 5:
                                str4 = "nowplaying:";
                                break;
                            case 6:
                                str4 = "tel:";
                                break;
                            case 7:
                                str4 = "oem:";
                                break;
                        }
                        if (6 == i2) {
                            if (str3 != null) {
                                str4 = str4 + str3;
                            }
                        }
                        if (this.rO != null) {
                            this.rO.requestUINative(str4);
                        }
                        break;
                    case CarplayMessage.USER_REQUEST_SIRI /* 263 */:
                        int i3 = message.arg1;
                        if (this.rO != null) {
                            this.rO.requestSiriActionNative(i3);
                        }
                        break;
                    case CarplayMessage.USER_FORCE_KEY_FRAME /* 264 */:
                        if (this.rO != null) {
                            this.rO.forceKeyFrameNative();
                        }
                        break;
                    case CarplayMessage.USER_SET_LIMIT_UI /* 265 */:
                        boolean zBooleanValue = ((Boolean) message.obj).booleanValue();
                        if (this.rO != null) {
                            this.rO.setLimitedUINative(zBooleanValue);
                        }
                        break;
                    case CarplayMessage.USER_CHANGE_MODE_REQUEST /* 266 */:
                        f fVar = (f) message.obj;
                        int i4 = message.arg1;
                        int i5 = fVar.qF.qK;
                        int i6 = fVar.qF.qL;
                        int i7 = fVar.qF.qM;
                        int i8 = fVar.qF.qN;
                        int i9 = fVar.qG.qK;
                        int i10 = fVar.qG.qL;
                        int i11 = fVar.qG.qM;
                        int i12 = fVar.qG.qN;
                        int i13 = fVar.qH;
                        int i14 = fVar.qI;
                        int i15 = fVar.qJ;
                        if (this.rO != null) {
                            this.rO.sendChangeModeRequestNative(i5, i6, i7, i8, i9, i10, i11, i12, i13, i14, i15, i4 == 1);
                        }
                        break;
                    case CarplayMessage.USER_SET_NIGHT_MODE /* 267 */:
                        boolean zBooleanValue2 = ((Boolean) message.obj).booleanValue();
                        if (this.rO != null) {
                            this.rO.setNightModeNative(zBooleanValue2);
                        }
                        break;
                    case CarplayMessage.USER_SET_VIDEO_RESOLUTION /* 268 */:
                        int i16 = message.arg1;
                        int i17 = message.arg2;
                        Log.d("CarplayPluginAdapter", "setVideoResolution, width: " + i16 + ", height: " + i17);
                        if (this.rO != null) {
                            this.rO.setVideoResolutionNative(i16, i17);
                        }
                        break;
                    case CarplayMessage.USER_SET_SCREEN_SIZE /* 269 */:
                        int i18 = message.arg1;
                        int i19 = message.arg2;
                        Log.d("CarplayPluginAdapter", "setScreenSize, width: " + i18 + ", height: " + i19);
                        if (this.rO != null) {
                            this.rO.setScreenSizeNative(i18, i19);
                        }
                        break;
                    case CarplayMessage.USER_SET_OEM_ICON_LABEL /* 270 */:
                        String str5 = (String) message.obj;
                        Log.d("CarplayPluginAdapter", "setOemIconLabel, label: " + str5);
                        if (this.rO != null) {
                            this.rO.setOemIconLabelNative(str5);
                        }
                        break;
                    default:
                        switch (i) {
                            case CarplayMessage.USER_UPDATE_TOUCH_SCREEN /* 276 */:
                                boolean zBooleanValue3 = ((Boolean) message.obj).booleanValue();
                                int i20 = message.arg1;
                                int i21 = message.arg2;
                                if (rR) {
                                    e eVar = new e(zBooleanValue3, i20, i21);
                                    if (!hasMessages(3) || !eVar.equals(this.rQ)) {
                                        this.rQ = eVar;
                                        if (this.rO != null) {
                                            this.rO.updateTouchScreenNative(zBooleanValue3, i20, i21);
                                        }
                                        removeMessages(3);
                                        sendEmptyMessageDelayed(3, 200L);
                                    } else if (this.rQ != null) {
                                        Log.w("CarplayPluginAdapter", "touchEvent: " + eVar.toString());
                                        Log.w("CarplayPluginAdapter", "mCurrentTouchEvent: " + this.rQ.toString());
                                    }
                                } else if (this.rO != null) {
                                    this.rO.updateTouchScreenNative(zBooleanValue3, i20, i21);
                                }
                                break;
                            case CarplayMessage.USER_UPDATE_TELEPHONY /* 277 */:
                                int i22 = message.arg1;
                                if (this.rO != null) {
                                    this.rO.updateTelephonyNative(i22);
                                }
                                break;
                            case CarplayMessage.USER_UPDATE_MEDIA_BUTTON /* 278 */:
                                int i23 = message.arg1;
                                if (this.rO != null) {
                                    this.rO.updateMediaBuottnNative(i23);
                                }
                                break;
                            case CarplayMessage.USER_UPDATE_KNOB /* 279 */:
                                com.autochips.carplay.common.h hVar = (com.autochips.carplay.common.h) message.obj;
                                if (this.rO != null) {
                                    this.rO.updateKnobNative(hVar.qP, hVar.qQ, hVar.qR, hVar.x, hVar.y, hVar.qS);
                                }
                                break;
                            default:
                                switch (i) {
                                    case CarplayMessage.IAP2_OVER_USB_CONNECTING /* 1290 */:
                                    case CarplayMessage.IAP2_OVER_USB_DISCONNECTING /* 1292 */:
                                        break;
                                    case CarplayMessage.IAP2_OVER_USB_CONNECTED /* 1291 */:
                                        if (this.rO != null) {
                                            this.rO.setIAP2StateNative(true);
                                        }
                                        break;
                                    case CarplayMessage.IAP2_OVER_USB_DISCONNECTED /* 1293 */:
                                    case CarplayMessage.IAP2_OVER_USB_CONNECT_FAIL /* 1294 */:
                                        if (this.rO != null) {
                                            this.rO.setIAP2StateNative(false);
                                        }
                                        break;
                                    default:
                                        Log.d("CarplayPluginAdapter", "ignoring msg=" + message);
                                        break;
                                }
                                break;
                        }
                        break;
                }
                break;
        }
    }
}
