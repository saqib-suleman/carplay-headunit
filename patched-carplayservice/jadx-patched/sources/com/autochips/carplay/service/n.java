package com.autochips.carplay.service;

import android.app.UiModeManager;
import android.content.ComponentName;
import android.content.Intent;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.Parcel;
import android.os.RemoteException;
import android.util.DisplayMetrics;
import android.util.Log;
import android.util.Slog;
import android.view.WindowManager;
import android.widget.Toast;
import com.autochips.carplay.CarplayAppState;
import com.autochips.carplay.CarplayAudioInfo;
import com.autochips.carplay.CarplayCall;
import com.autochips.carplay.CarplayDevice;
import com.autochips.carplay.CarplayResourceState;
import com.autochips.carplay.ICarplayCallback;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
final class n extends Handler {
    final /* synthetic */ CarplayService uk;
    private int ul;
    private final UiModeManager um;
    private final WindowManager un;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    n(CarplayService carplayService, Looper looper) {
        super(looper);
        this.uk = carplayService;
        this.ul = 0;
        this.um = (UiModeManager) carplayService.mContext.getSystemService("uimode");
        this.un = (WindowManager) carplayService.mContext.getSystemService("window");
    }

    private void ak(int i) {
        Slog.i("CarplayService", "sendRequestAccessoryUI, url=" + i);
        Iterator it = this.uk.ub.values().iterator();
        while (it.hasNext()) {
            try {
                ((ICarplayCallback) it.next()).onRequestAccessoryUI(i);
            } catch (RemoteException e) {
                Log.e("CarplayService", "sendRequestAccessoryUI: remote exception -- " + e);
                it.remove();
            }
        }
    }

    private void b(int i, int i2, Parcel parcel) {
        Slog.i("CarplayService", "sendAudioInfo, streamId=" + i + ", audioType=" + i2);
        CarplayAudioInfo carplayAudioInfo = new CarplayAudioInfo(parcel.readInt(), parcel.readInt(), parcel.readInt(), parcel.readInt(), parcel.readInt(), parcel.readInt(), parcel.readInt(), parcel.readInt(), parcel.readInt());
        Iterator it = this.uk.ub.values().iterator();
        while (it.hasNext()) {
            try {
                ((ICarplayCallback) it.next()).onAudioInfo(i, i2, carplayAudioInfo);
            } catch (RemoteException e) {
                Log.e("CarplayService", "sendStreamStateChanged: remote exception -- " + e);
                it.remove();
            }
        }
    }

    private void b(CarplayAppState carplayAppState) {
        Slog.i("CarplayService", "sendAppStateChanged, appState=" + carplayAppState);
        Iterator it = this.uk.ub.values().iterator();
        while (it.hasNext()) {
            try {
                ((ICarplayCallback) it.next()).onAppStateChanged(carplayAppState);
            } catch (RemoteException e) {
                Log.e("CarplayService", "sendAppStateChanged: remote exception -- " + e);
                it.remove();
            }
        }
    }

    private void b(CarplayCall carplayCall) {
        Slog.i("CarplayService", "sendCallStateChanged, call=" + carplayCall);
        Iterator it = this.uk.ub.values().iterator();
        while (it.hasNext()) {
            try {
                ((ICarplayCallback) it.next()).onCallStateChanged(carplayCall);
            } catch (RemoteException e) {
                Log.e("CarplayService", "sendCallStateChanged: remote exception -- " + e);
                it.remove();
            }
        }
    }

    private void b(CarplayDevice carplayDevice, int i) {
        Slog.i("CarplayService", "sendConnectionStateChanged, CarplayDevice=" + carplayDevice + ", state=" + i);
        Iterator it = this.uk.ub.values().iterator();
        while (it.hasNext()) {
            try {
                ((ICarplayCallback) it.next()).onConnectionStateChanged(carplayDevice, i);
            } catch (RemoteException e) {
                Log.e("CarplayService", "sendConnectionStateChanged: remote exception -- " + e);
                it.remove();
            }
        }
    }

    private void b(CarplayResourceState carplayResourceState) {
        Slog.i("CarplayService", "sendResourceStateChanged, resourceState=" + carplayResourceState);
        Iterator it = this.uk.ub.values().iterator();
        while (it.hasNext()) {
            try {
                ((ICarplayCallback) it.next()).onResourceStateChanged(carplayResourceState);
            } catch (RemoteException e) {
                Log.e("CarplayService", "sendResourceStateChanged: remote exception -- " + e);
                it.remove();
            }
        }
    }

    private void ea() {
        boolean z;
        Slog.i("CarplayService", "handleCarplayConnected");
        if (!CarplayService.ug.isEmpty()) {
            boolean applicationHiddenSettingAsUser = this.uk.mPackageManager.getApplicationHiddenSettingAsUser(CarplayService.ug, this.uk.tY);
            Slog.i("CarplayService", "getApplicationHiddenSettingAsUser: " + applicationHiddenSettingAsUser);
            if (applicationHiddenSettingAsUser) {
                Slog.i("CarplayService", "setApplicantionHiddenSetting false +++ ");
                this.uk.mPackageManager.setApplicationHiddenSettingAsUser(CarplayService.ug, false, this.uk.tY);
                Slog.i("CarplayService", "setApplicantionHiddenSetting false --- ");
            }
        }
        if (CarplayService.uf.isEmpty()) {
            Slog.w("CarplayService", "CARPLAY_CLIENT_ACTION_NAME: " + CarplayService.uf);
            return;
        }
        Intent intent = new Intent(CarplayService.uf);
        ComponentName componentNameResolveSystemService = intent.resolveSystemService(this.uk.mContext.getPackageManager(), 0);
        intent.setComponent(componentNameResolveSystemService);
        if (componentNameResolveSystemService == null) {
            Slog.e("CarplayService", "Fail to startService to: " + intent);
            z = false;
        } else {
            this.uk.mContext.startForegroundService(intent);
            z = true;
        }
        if (!z) {
            this.uk.ue.sendMessageDelayed(this.uk.ue.obtainMessage(22), 500L);
            return;
        }
        Slog.w("CarplayService", "start service: " + CarplayService.uf + " ok!");
        this.ul = 0;
    }

    private void f(int i, int i2, int i3) {
        Slog.i("CarplayService", "sendStreamStateChanged, streamId=" + i + ", audioType=" + i2 + ", streamState=" + i3);
        Iterator it = this.uk.ub.values().iterator();
        while (it.hasNext()) {
            try {
                ((ICarplayCallback) it.next()).onStreamStateChanged(i, i2, i3);
            } catch (RemoteException e) {
                Log.e("CarplayService", "sendStreamStateChanged: remote exception -- " + e);
                it.remove();
            }
        }
    }

    private void q(int i, int i2) {
        Slog.i("CarplayService", "sendEnableStateChanged, prevState=" + i + ", newState=" + i2);
        Iterator it = this.uk.ub.values().iterator();
        while (it.hasNext()) {
            try {
                ((ICarplayCallback) it.next()).onEnableStateChanged(i, i2);
            } catch (RemoteException e) {
                Log.e("CarplayService", "onEnableStateChanged: remote exception -- " + e);
                it.remove();
            }
        }
    }

    @Override // android.os.Handler
    public final void handleMessage(Message message) {
        ad adVarDE;
        List connectedDevices;
        aa aaVarB;
        int i = message.what;
        if (i == 22) {
            List connectedDevices2 = this.uk.getConnectedDevices();
            if (connectedDevices2 == null || connectedDevices2.size() == 0) {
                return;
            }
            int i2 = this.ul;
            this.ul = i2 + 1;
            if (i2 < 20) {
                ea();
                return;
            }
            return;
        }
        switch (i) {
            case 1:
                this.uk.ub.put(Integer.valueOf(message.arg1), (ICarplayCallback) message.obj);
                if (this.uk.ub.size() > 20) {
                    Log.wtf("CarplayService", "Too many carplay callbacks: " + this.uk.ub.size());
                } else if (this.uk.ub.size() > 10) {
                    Log.w("CarplayService", "Too many carplay callbacks: " + this.uk.ub.size());
                }
                break;
            case 2:
                int i3 = message.arg1;
                if (message.arg2 != 1) {
                    this.uk.ub.remove(Integer.valueOf(i3));
                    break;
                } else if (this.uk.ub.containsKey(Integer.valueOf(i3))) {
                    Log.w("CarplayService", "carplay client death, do error handler: " + i3);
                    this.uk.ub.remove(Integer.valueOf(i3));
                    if (this.uk.ud != null && (adVarDE = this.uk.ud.dE()) != null) {
                        adVarDE.an(5);
                        break;
                    }
                }
                break;
            default:
                switch (i) {
                    case 10:
                        int i4 = message.arg1;
                        int i5 = message.arg2;
                        q(i4, i5);
                        if (i5 == 2) {
                            this.uk.setNightMode(this.um.getNightMode() == 2);
                            if (CarplayService.uh) {
                                DisplayMetrics displayMetrics = new DisplayMetrics();
                                this.un.getDefaultDisplay().getRealMetrics(displayMetrics);
                                this.uk.setVideoResolution(displayMetrics.widthPixels, displayMetrics.heightPixels);
                            }
                            Slog.i("CarplayService", "handleCarplayEnabled");
                            if (!CarplayService.ug.isEmpty()) {
                                boolean applicationHiddenSettingAsUser = this.uk.mPackageManager.getApplicationHiddenSettingAsUser(CarplayService.ug, this.uk.tY);
                                Slog.i("CarplayService", "getApplicationHiddenSettingAsUser: " + applicationHiddenSettingAsUser);
                                if (!applicationHiddenSettingAsUser) {
                                    Slog.i("CarplayService", "setApplicantionHiddenSetting true +++ ");
                                    this.uk.mPackageManager.setApplicationHiddenSettingAsUser(CarplayService.ug, true, this.uk.tY);
                                    Slog.i("CarplayService", "setApplicantionHiddenSetting true --- ");
                                }
                            }
                        }
                        break;
                    case 11:
                        CarplayDevice carplayDevice = (CarplayDevice) message.obj;
                        int i6 = message.arg1;
                        if (carplayDevice != null && 2 == i6) {
                            ea();
                        } else if (carplayDevice != null && i6 == 0 && CarplayService.ui) {
                            Toast.makeText(this.uk.mContext, "Apple Carplay Disconnected", 0).show();
                        }
                        List connectedDevices3 = this.uk.getConnectedDevices();
                        if (this.uk.tm != null && (connectedDevices3 == null || connectedDevices3.size() == 0)) {
                            this.uk.tm.sendMessage(70);
                        }
                        b(carplayDevice, i6);
                        break;
                    case 12:
                        int i7 = message.arg1;
                        int i8 = message.arg2;
                        int iIntValue = ((Integer) message.obj).intValue();
                        if (this.uk.mRemoteDevices != null && (connectedDevices = this.uk.getConnectedDevices()) != null && connectedDevices.size() != 0 && this.uk.mRemoteDevices != null && (aaVarB = this.uk.mRemoteDevices.b((CarplayDevice) connectedDevices.get(0))) != null) {
                            aaVarB.h(i7, i8, iIntValue);
                        }
                        f(i7, i8, iIntValue);
                        break;
                    case 13:
                        b((CarplayAppState) message.obj);
                        break;
                    case 14:
                        b((CarplayResourceState) message.obj);
                        break;
                    case 15:
                        ak(message.arg1);
                        break;
                    case 16:
                        b((CarplayCall) message.obj);
                        break;
                    case 17:
                        b(message.arg1, message.arg2, (Parcel) message.obj);
                        break;
                    default:
                        Slog.d("CarplayService", "ClientHandler.handleMessage ignoring msg=" + message);
                        break;
                }
                break;
        }
    }
}
