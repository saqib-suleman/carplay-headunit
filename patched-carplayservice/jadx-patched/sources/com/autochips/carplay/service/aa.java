package com.autochips.carplay.service;

import android.util.Slog;
import com.autochips.carplay.CarplayDevice;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/* JADX INFO: loaded from: classes.dex */
public final class aa {
    private String mName;
    private String rj;
    private String uF;
    private CarplayDevice uG;
    private Map uH = new ConcurrentHashMap();
    final /* synthetic */ z uI;

    aa(z zVar) {
        this.uI = zVar;
    }

    final CarplayDevice getDevice() {
        CarplayDevice carplayDevice;
        synchronized (z.rS) {
            carplayDevice = this.uG;
        }
        return carplayDevice;
    }

    final String getName() {
        String str;
        synchronized (z.rS) {
            str = this.mName;
        }
        return str;
    }

    public final void h(int i, int i2, int i3) {
        synchronized (z.rS) {
            Slog.i("RemoteDevices", "setStreamState, streamId=" + i + ", audioType=" + i2 + ", streamState=" + i3);
            ab abVar = (ab) this.uH.get(new Integer(i));
            if (abVar == null) {
                abVar = new ab(this.uI);
            }
            abVar.s(i2, i3);
            this.uH.put(new Integer(i), abVar);
        }
    }

    public final int r(int i, int i2) {
        int iAm;
        synchronized (z.rS) {
            ab abVar = (ab) this.uH.get(new Integer(i));
            Slog.i("RemoteDevices", "getStreamState, streamId=" + i + ", audioType=" + i2 + ", type=" + abVar);
            if (abVar != null) {
                iAm = abVar.am(i2);
                Slog.i("RemoteDevices", "getStreamState, state=" + iAm);
            } else {
                iAm = 1;
            }
        }
        return iAm;
    }

    public final void setAddress(String str) {
        synchronized (z.rS) {
            this.uF = str;
        }
    }

    public final void setName(String str) {
        synchronized (z.rS) {
            this.mName = str;
        }
    }
}
