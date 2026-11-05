package com.autochips.carplay.service;

import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.IBinder;
import android.os.Message;
import android.os.Parcel;
import android.os.RemoteException;
import android.os.SystemProperties;
import android.os.UserHandle;
import android.os.UserManager;
import android.text.TextUtils;
import android.util.Log;
import android.util.Slog;
import android.view.Surface;
import com.autochips.carplay.CarplayAppState;
import com.autochips.carplay.CarplayCall;
import com.autochips.carplay.CarplayDevice;
import com.autochips.carplay.CarplayResourceState;
import com.autochips.carplay.ICarplayCallback;
import com.autochips.carplay.common.CarplayMessage;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class CarplayService extends Service {
    private static CarplayService tV;
    private static final String uf = SystemProperties.get("ro.atc.carplay.client.action", "");
    private static final String ug = SystemProperties.get("ro.atc.carplay.client.package", "");
    private static final boolean uh = SystemProperties.getBoolean("ro.atc.carplay.init_resolution", false);
    private static final boolean ui = SystemProperties.getBoolean("ro.atc.carplay.toast_finalized", true);
    private Context mContext;
    private PackageManager mPackageManager;
    private z mRemoteDevices;
    private p tW;
    private UserManager tX;
    private UserHandle tY;
    private boolean tZ;
    private a tm;
    private boolean ua = false;
    private HashMap ub;
    private o uc;
    private g ud;
    private n ue;

    private synchronized int a(boolean z, int i) {
        int i2;
        Log.d("CarplayService", "enable() - Enable called with quiet mode status =  " + z);
        this.ua = z;
        if (this.tm != null) {
            this.tm.sendMessage(CarplayMessage.USER_TURN_ON, i);
            i2 = 0;
        } else {
            i2 = -19;
        }
        return i2;
    }

    private static synchronized void b(CarplayService carplayService) {
        Log.d("CarplayService", "setCarplayService() - trying to set service to " + carplayService);
        if (carplayService == null) {
            return;
        }
        tV = carplayService;
    }

    private static synchronized void c(CarplayService carplayService) {
        if (tV == carplayService) {
            tV = null;
        }
    }

    final void a(CarplayAppState carplayAppState) {
        Log.d("CarplayService", "updateAppState, appState=" + carplayAppState);
        if (this.ue != null) {
            Message messageObtainMessage = this.ue.obtainMessage(13);
            messageObtainMessage.obj = carplayAppState;
            this.ue.sendMessage(messageObtainMessage);
        }
    }

    final void a(CarplayCall carplayCall) {
        Log.d("CarplayService", "updateCallState, call=" + carplayCall);
        if (this.ue != null) {
            Message messageObtainMessage = this.ue.obtainMessage(16);
            messageObtainMessage.obj = carplayCall;
            this.ue.sendMessage(messageObtainMessage);
        }
    }

    public final void a(CarplayDevice carplayDevice, int i) {
        Log.d("CarplayService", "updateConnectionState, device=" + carplayDevice + ", state=" + i);
        if (this.ue != null) {
            Message messageObtainMessage = this.ue.obtainMessage(11);
            messageObtainMessage.obj = carplayDevice;
            messageObtainMessage.arg1 = i;
            this.ue.sendMessage(messageObtainMessage);
        }
    }

    final void a(CarplayResourceState carplayResourceState) {
        Log.d("CarplayService", "updateResourceState, resourceState=" + carplayResourceState);
        if (this.ue != null) {
            Message messageObtainMessage = this.ue.obtainMessage(14);
            messageObtainMessage.obj = carplayResourceState;
            this.ue.sendMessage(messageObtainMessage);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final void aj(int i) {
        Log.d("CarplayService", "updateRequestAccessoryUI, url=" + i);
        if (this.ue != null) {
            Message messageObtainMessage = this.ue.obtainMessage(15);
            messageObtainMessage.arg1 = i;
            this.ue.sendMessage(messageObtainMessage);
        }
    }

    public final void c(int i, int i2, Parcel parcel) {
        Log.d("CarplayService", "updateAudioInfo, streamId=" + i + ", audioType=" + i2);
        if (this.ue != null) {
            Message messageObtainMessage = this.ue.obtainMessage(17);
            messageObtainMessage.arg1 = i;
            messageObtainMessage.arg2 = i2;
            messageObtainMessage.obj = parcel;
            this.ue.sendMessage(messageObtainMessage);
        }
    }

    final int disable(int i) {
        Log.d("CarplayService", "disable()");
        if (this.tm == null) {
            return -19;
        }
        this.tm.sendMessage(CarplayMessage.USER_TURN_OFF, i);
        return 0;
    }

    @Override // android.app.Service
    protected void dump(FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr) {
        if (strArr.length == 0) {
            printWriter.println("Skipping dump in APP SERVICES, see Carplay_manager section.");
            printWriter.println("Use --print argument for dumpsys direct from CarplayService.");
            return;
        }
        Log.v("CarplayService", "dumpsys arguments, check for protobuf output: " + TextUtils.join(" ", strArr));
        printWriter.println();
        if (this.tm != null) {
            this.tm.dump(fileDescriptor, printWriter, strArr);
        }
        printWriter.println();
        if (this.tm != null) {
            this.tW.dump(fileDescriptor, printWriter, strArr);
        }
        printWriter.flush();
    }

    public final int enable(int i) {
        Log.d("CarplayService", "enable()");
        return a(false, i);
    }

    public final int enableNoAutoSwitch(int i) {
        Log.d("CarplayService", "enableNoAutoSwitch()");
        return a(true, i);
    }

    public final void g(int i, int i2, int i3) {
        Log.d("CarplayService", "updateStreamState, streamId=" + i + ", audioType=" + i2 + ", streamState=" + i3);
        if (this.ue != null) {
            Message messageObtainMessage = this.ue.obtainMessage(12);
            messageObtainMessage.arg1 = i;
            messageObtainMessage.arg2 = i2;
            messageObtainMessage.obj = Integer.valueOf(i3);
            this.ue.sendMessage(messageObtainMessage);
        }
    }

    public final CarplayAppState getAppState() {
        if (this.tW == null) {
            return null;
        }
        return this.tW.getAppState();
    }

    public final List getConnectedDevices() {
        if (this.tW == null) {
            return null;
        }
        return this.tW.getConnectedDevices();
    }

    public final int getConnectionState(CarplayDevice carplayDevice) {
        if (this.tW != null) {
            return this.tW.getConnectionState(carplayDevice);
        }
        return 0;
    }

    public final List getCurrentCalls() {
        if (this.tW == null) {
            return null;
        }
        return this.tW.getCurrentCalls();
    }

    public final int getEnableState() {
        if (this.tm == null) {
            return 0;
        }
        return this.tm.getEnableState();
    }

    public final int getLastUIState(CarplayDevice carplayDevice) {
        return ac.a(this.mContext).K(carplayDevice.toString());
    }

    public final String getRemoteName(CarplayDevice carplayDevice) {
        aa aaVarB;
        if (this.mRemoteDevices == null || (aaVarB = this.mRemoteDevices.b(carplayDevice)) == null) {
            return null;
        }
        return aaVarB.getName();
    }

    public final CarplayResourceState getResourceState() {
        if (this.tW == null) {
            return null;
        }
        return this.tW.getResourceState();
    }

    public final int getStreamState(CarplayDevice carplayDevice, int i, int i2) {
        aa aaVarB;
        if (this.mRemoteDevices == null || (aaVarB = this.mRemoteDevices.b(carplayDevice)) == null) {
            return 1;
        }
        int iR = aaVarB.r(i, i2);
        Slog.i("CarplayService", "getStreamState , devices=" + carplayDevice + ", streamId=" + i + ", audioType=" + i2 + ", state=" + iR);
        return iR;
    }

    public final boolean isAvailable() {
        return !this.tZ;
    }

    public final boolean isEnabled() {
        return this.tm != null && 2 == this.tm.getEnableState();
    }

    final void o(int i, int i2) {
        if (this.ue != null) {
            Message messageObtainMessage = this.ue.obtainMessage(2);
            messageObtainMessage.arg1 = i;
            messageObtainMessage.arg2 = i2;
            this.ue.sendMessage(messageObtainMessage);
        }
    }

    @Override // android.app.Service
    public IBinder onBind(Intent intent) {
        Log.d("CarplayService", "onBind()");
        return this.uc;
    }

    @Override // android.app.Service
    public void onCreate() {
        super.onCreate();
        this.mContext = getApplicationContext();
        Log.d("CarplayService", "onCreate(), mContext:" + this.mContext);
        this.mPackageManager = getApplicationContext().getPackageManager();
        this.tX = (UserManager) getSystemService("user");
        this.tY = UserHandle.of(this.tX.getUserHandle());
        this.ud = new g(this, this.mContext);
        this.ud.init();
        this.uc = new o(this);
        this.tm = this.ud.dB();
        this.tW = this.ud.dC();
        this.mRemoteDevices = this.ud.dA();
        this.ub = new HashMap();
        b(this);
        this.ue = new n(this, this.ud.dD().getLooper());
        Log.d("CarplayService", "onCreate(), mClientHandler:" + this.ue);
    }

    @Override // android.app.Service
    public void onDestroy() {
        Log.d("CarplayService", "onDestroy()");
        Slog.i("CarplayService", "Force exit to cleanup internal state in Carplay stack");
        System.exit(0);
    }

    @Override // android.app.Service
    public boolean onUnbind(Intent intent) {
        Log.d("CarplayService", "onUnbind() - calling cleanup");
        Log.d("CarplayService", "cleanup()");
        if (this.tZ) {
            Log.e("CarplayService", "cleanup() - Service already starting to cleanup, ignoring request...");
        } else {
            c(this);
            this.tZ = true;
            if (this.uc != null) {
                this.uc.cleanup();
                this.uc = null;
            }
            if (this.ud != null) {
                this.ud.deinit();
                this.ud = null;
            }
        }
        return super.onUnbind(intent);
    }

    public final void p(int i, int i2) {
        Log.d("CarplayService", "updateEnableState, prevState=" + i + ", newState=" + i2);
        if (this.ue != null) {
            Message messageObtainMessage = this.ue.obtainMessage(10);
            messageObtainMessage.arg1 = i;
            messageObtainMessage.arg2 = i2;
            this.ue.sendMessage(messageObtainMessage);
        }
    }

    public final int registerCallback(IBinder iBinder, ICarplayCallback iCarplayCallback, int i) {
        if (iBinder == null) {
            throw new IllegalArgumentException("Binder must not be null");
        }
        if (iCarplayCallback == null) {
            throw new IllegalArgumentException("Callback must not be null");
        }
        try {
            iBinder.linkToDeath(new m(this, iBinder, i), 0);
            if (this.ue == null) {
                return -1;
            }
            Message messageObtainMessage = this.ue.obtainMessage(1);
            messageObtainMessage.arg1 = i;
            messageObtainMessage.obj = iCarplayCallback;
            return true == this.ue.sendMessage(messageObtainMessage) ? 0 : -1;
        } catch (RemoteException e) {
            Log.e("CarplayService", "Error on linkToDeath - " + e);
            return -1;
        }
    }

    public final int requestDeviceUI(int i, String str) {
        if (this.tW == null) {
            return -1;
        }
        Message messageObtainMessage = this.tW.obtainMessage(CarplayMessage.USER_REQUEST_DEVICE_UI);
        messageObtainMessage.arg1 = i;
        messageObtainMessage.arg2 = CarplayMessage.USER_SELECT_STOP_VIDEO;
        messageObtainMessage.obj = str;
        this.tW.sendMessage(messageObtainMessage);
        return 0;
    }

    public final int requestSiri(int i) {
        if (this.tW == null) {
            return -1;
        }
        Message messageObtainMessage = this.tW.obtainMessage(CarplayMessage.USER_REQUEST_SIRI);
        messageObtainMessage.arg1 = i;
        this.tW.sendMessage(messageObtainMessage);
        return 0;
    }

    public final int setAudioEnable(boolean z) {
        if (this.tW == null) {
            return -1;
        }
        Message messageObtainMessage = this.tW.obtainMessage(CarplayMessage.USER_SET_AUDIO_ENABLE);
        messageObtainMessage.obj = Boolean.valueOf(z);
        this.tW.sendMessage(messageObtainMessage);
        return 0;
    }

    public final int setNightMode(boolean z) {
        if (this.tW == null) {
            return -1;
        }
        Message messageObtainMessage = this.tW.obtainMessage(CarplayMessage.USER_SET_NIGHT_MODE);
        messageObtainMessage.obj = Boolean.valueOf(z);
        this.tW.sendMessage(messageObtainMessage);
        return 0;
    }

    public final int setOemIconLabel(String str) {
        if (this.tW == null) {
            return -1;
        }
        Message messageObtainMessage = this.tW.obtainMessage(CarplayMessage.USER_SET_OEM_ICON_LABEL);
        messageObtainMessage.obj = str;
        this.tW.sendMessage(messageObtainMessage);
        return 0;
    }

    public final int setScreenSize(int i, int i2) {
        if (this.tW == null) {
            return -1;
        }
        Message messageObtainMessage = this.tW.obtainMessage(CarplayMessage.USER_SET_SCREEN_SIZE);
        messageObtainMessage.arg1 = i;
        messageObtainMessage.arg2 = i2;
        this.tW.sendMessage(messageObtainMessage);
        return 0;
    }

    public final int setVideoResolution(int i, int i2) {
        if (this.tW == null) {
            return -1;
        }
        Message messageObtainMessage = this.tW.obtainMessage(CarplayMessage.USER_SET_VIDEO_RESOLUTION);
        messageObtainMessage.arg1 = i;
        messageObtainMessage.arg2 = i2;
        this.tW.sendMessage(messageObtainMessage);
        return 0;
    }

    public final int startVideo(Surface surface) {
        if (this.tW == null) {
            return -1;
        }
        Message messageObtainMessage = this.tW.obtainMessage(CarplayMessage.USER_START_VIDEO);
        messageObtainMessage.obj = surface;
        this.tW.sendMessage(messageObtainMessage);
        return 0;
    }

    public final int stopVideo(boolean z) {
        if (this.tW == null) {
            return -1;
        }
        Message messageObtainMessage = this.tW.obtainMessage(CarplayMessage.USER_STOP_VIDEO);
        if (z) {
            messageObtainMessage.arg1 = CarplayMessage.USER_SELECT_STOP_VIDEO;
        }
        this.tW.sendMessage(messageObtainMessage);
        return 0;
    }

    public final int updateKnob(boolean z, boolean z2, boolean z3, int i, int i2, int i3) {
        if (this.tW == null) {
            return -1;
        }
        Message messageObtainMessage = this.tW.obtainMessage(CarplayMessage.USER_UPDATE_KNOB);
        messageObtainMessage.obj = new com.autochips.carplay.common.h(z, z2, z3, i, i2, i3);
        this.tW.sendMessage(messageObtainMessage);
        return 0;
    }

    public final int updateMedia(int i) {
        if (this.tW == null) {
            return -1;
        }
        Message messageObtainMessage = this.tW.obtainMessage(CarplayMessage.USER_UPDATE_MEDIA_BUTTON);
        messageObtainMessage.arg1 = i;
        this.tW.sendMessage(messageObtainMessage);
        return 0;
    }

    public final int updateTelehony(int i) {
        if (this.tW == null) {
            return -1;
        }
        Message messageObtainMessage = this.tW.obtainMessage(CarplayMessage.USER_UPDATE_TELEPHONY);
        messageObtainMessage.arg1 = i;
        this.tW.sendMessage(messageObtainMessage);
        return 0;
    }

    public final int updateTouchScreen(boolean z, int i, int i2) {
        if (this.tW == null) {
            return -1;
        }
        Message messageObtainMessage = this.tW.obtainMessage(CarplayMessage.USER_UPDATE_TOUCH_SCREEN);
        messageObtainMessage.obj = Boolean.valueOf(z);
        messageObtainMessage.arg1 = i;
        messageObtainMessage.arg2 = i2;
        this.tW.sendMessage(messageObtainMessage);
        return 0;
    }
}
