package com.autochips.carplay.service;

import android.os.IBinder;
import android.util.Log;
import android.view.Surface;
import com.autochips.carplay.CarplayAppState;
import com.autochips.carplay.CarplayDevice;
import com.autochips.carplay.CarplayResourceState;
import com.autochips.carplay.ICarplay;
import com.autochips.carplay.ICarplayCallback;
import java.io.FileDescriptor;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
final class o extends ICarplay.Stub {
    private CarplayService tl;

    o(CarplayService carplayService) {
        this.tl = carplayService;
    }

    private CarplayService eb() {
        if (this.tl == null || !this.tl.isAvailable()) {
            return null;
        }
        return this.tl;
    }

    public final void cleanup() {
        this.tl = null;
    }

    public final int disable(int i) {
        CarplayService carplayServiceEb = eb();
        if (carplayServiceEb != null) {
            return carplayServiceEb.disable(i);
        }
        return -1;
    }

    public final void dump(FileDescriptor fileDescriptor, String[] strArr) throws Throwable {
        FileOutputStream fileOutputStream = null;
        try {
            try {
                try {
                    FileOutputStream fileOutputStream2 = new FileOutputStream(fileDescriptor);
                    try {
                        PrintWriter printWriter = new PrintWriter(fileOutputStream2);
                        CarplayService carplayServiceEb = eb();
                        if (carplayServiceEb == null) {
                            fileOutputStream2.close();
                            return;
                        }
                        carplayServiceEb.dump(fileDescriptor, printWriter, strArr);
                        printWriter.close();
                        fileOutputStream2.close();
                    } catch (Exception e) {
                        e = e;
                        fileOutputStream = fileOutputStream2;
                        e.printStackTrace();
                        Log.e("CarplayServiceBinder", "exception writing date to file", e);
                        if (fileOutputStream != null) {
                            fileOutputStream.close();
                        }
                    } catch (Throwable th) {
                        th = th;
                        fileOutputStream = fileOutputStream2;
                        if (fileOutputStream != null) {
                            try {
                                fileOutputStream.close();
                            } catch (IOException e2) {
                                e2.printStackTrace();
                                Log.d("CarplayServiceBinder", "close FileOutputStream", e2.getCause());
                            }
                        }
                        throw th;
                    }
                } catch (IOException e3) {
                    e3.printStackTrace();
                    Log.d("CarplayServiceBinder", "close FileOutputStream", e3.getCause());
                }
            } catch (Exception e4) {
                e = e4;
            }
        } catch (Throwable th2) {
            th = th2;
        }
    }

    public final int enable(int i) {
        CarplayService carplayServiceEb = eb();
        if (carplayServiceEb != null) {
            return carplayServiceEb.enable(i);
        }
        return -1;
    }

    public final int enableNoAutoSwitch(int i) {
        CarplayService carplayServiceEb = eb();
        if (carplayServiceEb != null) {
            return carplayServiceEb.enableNoAutoSwitch(i);
        }
        return -1;
    }

    public final CarplayAppState getAppState() {
        CarplayService carplayServiceEb = eb();
        if (carplayServiceEb == null) {
            return null;
        }
        return carplayServiceEb.getAppState();
    }

    public final List getConnectedDevices() {
        CarplayService carplayServiceEb = eb();
        return carplayServiceEb == null ? new ArrayList(0) : carplayServiceEb.getConnectedDevices();
    }

    public final int getConnectionState(CarplayDevice carplayDevice) {
        CarplayService carplayServiceEb = eb();
        if (carplayServiceEb != null) {
            return carplayServiceEb.getConnectionState(carplayDevice);
        }
        return 0;
    }

    public final List getCurrentCalls() {
        CarplayService carplayServiceEb = eb();
        return carplayServiceEb == null ? new ArrayList(0) : carplayServiceEb.getCurrentCalls();
    }

    public final int getEnableState() {
        CarplayService carplayServiceEb = eb();
        if (carplayServiceEb != null) {
            return carplayServiceEb.getEnableState();
        }
        return 0;
    }

    public final int getLastUIState(CarplayDevice carplayDevice) {
        CarplayService carplayServiceEb = eb();
        if (carplayServiceEb == null || carplayDevice == null) {
            return 0;
        }
        return carplayServiceEb.getLastUIState(carplayDevice);
    }

    public final String getRemoteName(CarplayDevice carplayDevice) {
        CarplayService carplayServiceEb = eb();
        if (carplayServiceEb != null) {
            return carplayServiceEb.getRemoteName(carplayDevice);
        }
        return null;
    }

    public final CarplayResourceState getResourceState() {
        CarplayService carplayServiceEb = eb();
        if (carplayServiceEb == null) {
            return null;
        }
        return carplayServiceEb.getResourceState();
    }

    public final int getStreamState(CarplayDevice carplayDevice, int i, int i2) {
        CarplayService carplayServiceEb = eb();
        if (carplayServiceEb != null) {
            return carplayServiceEb.getStreamState(carplayDevice, i, i2);
        }
        return 1;
    }

    public final boolean isEnabled() {
        CarplayService carplayServiceEb = eb();
        if (carplayServiceEb != null) {
            return carplayServiceEb.isEnabled();
        }
        return false;
    }

    public final int registerCallback(IBinder iBinder, ICarplayCallback iCarplayCallback, int i) {
        CarplayService carplayServiceEb = eb();
        if (carplayServiceEb != null) {
            return carplayServiceEb.registerCallback(iBinder, iCarplayCallback, i);
        }
        return -1;
    }

    public final int requestDeviceUI(int i, String str) {
        CarplayService carplayServiceEb = eb();
        if (carplayServiceEb != null) {
            return carplayServiceEb.requestDeviceUI(i, str);
        }
        return -1;
    }

    public final int requestSiri(int i) {
        CarplayService carplayServiceEb = eb();
        if (carplayServiceEb != null) {
            return carplayServiceEb.requestSiri(i);
        }
        return -1;
    }

    public final int setAudioEnable(boolean z) {
        CarplayService carplayServiceEb = eb();
        if (carplayServiceEb != null) {
            return carplayServiceEb.setAudioEnable(z);
        }
        return -1;
    }

    public final int setNightMode(boolean z) {
        CarplayService carplayServiceEb = eb();
        if (carplayServiceEb != null) {
            return carplayServiceEb.setNightMode(z);
        }
        return -1;
    }

    public final int setOemIconLabel(String str) {
        CarplayService carplayServiceEb = eb();
        if (carplayServiceEb != null) {
            return carplayServiceEb.setOemIconLabel(str);
        }
        return -1;
    }

    public final int setScreenSize(int i, int i2) {
        CarplayService carplayServiceEb = eb();
        if (carplayServiceEb != null) {
            return carplayServiceEb.setScreenSize(i, i2);
        }
        return -1;
    }

    public final int setVideoResolution(int i, int i2) {
        CarplayService carplayServiceEb = eb();
        if (carplayServiceEb != null) {
            return carplayServiceEb.setVideoResolution(i, i2);
        }
        return -1;
    }

    public final int startVideo(Surface surface) {
        CarplayService carplayServiceEb = eb();
        if (carplayServiceEb != null) {
            return carplayServiceEb.startVideo(surface);
        }
        return -1;
    }

    public final int stopVideo(boolean z) {
        CarplayService carplayServiceEb = eb();
        if (carplayServiceEb != null) {
            return carplayServiceEb.stopVideo(z);
        }
        return -1;
    }

    public final void unregisterCallback(int i) {
        CarplayService carplayServiceEb = eb();
        if (carplayServiceEb != null) {
            carplayServiceEb.o(i, 0);
        }
    }

    public final int updateKnob(boolean z, boolean z2, boolean z3, int i, int i2, int i3) {
        CarplayService carplayServiceEb = eb();
        if (carplayServiceEb != null) {
            return carplayServiceEb.updateKnob(z, z2, z3, i, i2, i3);
        }
        return -1;
    }

    public final int updateMedia(int i) {
        CarplayService carplayServiceEb = eb();
        if (carplayServiceEb != null) {
            return carplayServiceEb.updateMedia(i);
        }
        return -1;
    }

    public final int updateTelehony(int i) {
        CarplayService carplayServiceEb = eb();
        if (carplayServiceEb != null) {
            return carplayServiceEb.updateTelehony(i);
        }
        return -1;
    }

    public final int updateTouchScreen(boolean z, int i, int i2) {
        CarplayService carplayServiceEb = eb();
        if (carplayServiceEb != null) {
            return carplayServiceEb.updateTouchScreen(z, i, i2);
        }
        return -1;
    }
}
