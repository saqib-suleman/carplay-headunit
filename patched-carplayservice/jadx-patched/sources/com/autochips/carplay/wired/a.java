package com.autochips.carplay.wired;

import android.content.Context;
import android.net.InterfaceConfiguration;
import android.net.MacAddress;
import android.os.IBinder;
import android.os.INetworkManagementService;
import android.os.Looper;
import android.os.Message;
import android.os.RemoteException;
import android.os.ServiceManager;
import android.util.Log;
import android.util.Slog;
import com.autochips.carplay.common.CarplayMessage;
import com.autochips.carplay.service.h;
import com.autochips.usbd.IUSBDService;

/* JADX INFO: loaded from: classes.dex */
public class a extends com.autochips.carplay.common.a {
    private IBinder mBinder;
    private final h mCarplayMonitor;
    private final Context mContext;
    private boolean mEnabled;
    private int qW;
    private final INetworkManagementService tk;
    private IUSBDService uN;
    private b uO;
    private c uP;

    public a(Context context, Looper looper, INetworkManagementService iNetworkManagementService, h hVar) {
        super(looper);
        this.mEnabled = false;
        this.qW = 0;
        this.mContext = context;
        this.tk = iNetworkManagementService;
        this.mCarplayMonitor = hVar;
        Log.d("CarplayUSBNCMAdapter", "registerForMonitorEvents");
        this.mCarplayMonitor.a(CarplayMessage.NET_IFACE_ADD, this);
        this.mCarplayMonitor.a(CarplayMessage.NET_IFACE_REMOVE, this);
        this.mCarplayMonitor.a(CarplayMessage.NET_IFACE_LINK_STATE_CHANGED, this);
    }

    private boolean D(String str) {
        InterfaceConfiguration interfaceConfig;
        try {
            interfaceConfig = this.tk.getInterfaceConfig(str);
        } catch (RemoteException | IllegalStateException e) {
            Log.e("CarplayUSBNCMAdapter", "", e);
            interfaceConfig = null;
        }
        if (interfaceConfig == null) {
            return false;
        }
        return interfaceConfig.isUp();
    }

    private boolean E(String str) {
        InterfaceConfiguration interfaceConfig;
        try {
            interfaceConfig = this.tk.getInterfaceConfig(str);
        } catch (RemoteException e) {
            Log.e("CarplayUSBNCMAdapter", "", e);
            interfaceConfig = null;
        }
        if (interfaceConfig == null) {
            return false;
        }
        String hardwareAddress = interfaceConfig.getHardwareAddress();
        Log.e("CarplayUSBNCMAdapter", "iface " + str + " hwAddr is " + hardwareAddress);
        return (hardwareAddress == null || MacAddress.fromString(hardwareAddress).equals(MacAddress.ALL_ZEROS_ADDRESS)) ? false : true;
    }

    private int ao(int i) {
        Log.d("CarplayUSBNCMAdapter", "enableUsbNcm, reason: " + i);
        this.mBinder = ServiceManager.getService("usb_daemon");
        this.uN = IUSBDService.Stub.asInterface(this.mBinder);
        int i2 = -1;
        if (this.uN == null || this.mBinder == null) {
            Log.e("CarplayUSBNCMAdapter", "get usbdservice failed");
        } else {
            Log.d("CarplayUSBNCMAdapter", "get usbdservice success");
            this.uP = new c(this, this.mBinder);
            try {
                byte b = 0;
                this.mBinder.linkToDeath(this.uP, 0);
                if (this.uO == null) {
                    this.uO = new b(this, b);
                }
                i2 = this.uO != null ? 0 : -1;
                if (i2 == 0) {
                    this.uN.setLinkType(1);
                    this.uN.enbaleCarplay(true, i, this.uO);
                    this.uN.enableCarplayAutoSwitch(true, i);
                    return i2;
                }
            } catch (RemoteException e) {
                e.printStackTrace();
                return i2;
            }
        }
        return i2;
    }

    private int ap(int i) {
        if (this.uN == null || this.mBinder == null) {
            Log.e("CarplayUSBNCMAdapter", "usbdservice is null");
            return -1;
        }
        Log.d("CarplayUSBNCMAdapter", "disableUsbNcm, reason: " + i);
        try {
            this.uN.enableCarplayAutoSwitch(false, i);
            this.uN.enbaleCarplay(false, i, this.uO);
            if (this.uO != null) {
                this.uO = null;
            }
            this.mBinder.unlinkToDeath(this.uP, 0);
            this.uP = null;
            this.uN = null;
            this.mBinder = null;
            return 0;
        } catch (RemoteException e) {
            e.printStackTrace();
            return -1;
        }
    }

    private int ef() {
        int i = this.qW;
        this.qW = i + 1;
        return i < 6 ? sendMessageDelayed(obtainMessage(4), 500L) : false ? 0 : -1;
    }

    @Override // android.os.Handler
    public void handleMessage(Message message) {
        Slog.d("CarplayUSBNCMAdapter", "handleMessage, what: " + message.what);
        int i = message.what;
        if (i != 2049 && i != 2051) {
            switch (i) {
                case 1:
                case 4:
                    if (ao(message.arg1) == 0) {
                        this.mEnabled = true;
                        if (this.qW != 0) {
                            Slog.w("CarplayUSBNCMAdapter", "usb ncm is recovered from error");
                            this.qW = 0;
                        }
                        V(CarplayMessage.USB_NCM_STARTED);
                    } else if (ef() != 0) {
                        V(CarplayMessage.USB_NCM_START_FAILURE);
                    }
                    break;
                case 2:
                    int i2 = message.arg1;
                    removeMessages(4);
                    if (this.mEnabled && ap(i2) != 0) {
                        V(CarplayMessage.USB_NCM_STOP_FAILURE);
                    } else {
                        this.mEnabled = false;
                        V(CarplayMessage.USB_NCM_STOPPED);
                    }
                    break;
                case 3:
                    if (this.mEnabled && ef() != 0) {
                        this.mEnabled = false;
                        V(CarplayMessage.USB_NCM_STOPPED);
                        break;
                    }
                    break;
                case 5:
                    break;
                default:
                    Slog.d("CarplayUSBNCMAdapter", "ignoring msg=" + message);
                    break;
            }
            return;
        }
        String str = (String) message.obj;
        if (str == null || !str.equals("ncm0")) {
            Slog.i("CarplayUSBNCMAdapter", "iface=" + str + "is not usb net dev");
            return;
        }
        if (D(str)) {
            Slog.i("CarplayUSBNCMAdapter", "iface=" + str + " already up");
            return;
        }
        if (!E(str)) {
            Slog.i("CarplayUSBNCMAdapter", "iface=" + str + "is no hw address");
            return;
        }
        try {
            Slog.i("CarplayUSBNCMAdapter", "setInterfaceUp =" + str);
            this.tk.setInterfaceUp(str);
        } catch (RemoteException | IllegalStateException e) {
            Log.e("CarplayUSBNCMAdapter", String.valueOf(e));
        }
    }
}
