package com.autochips.carplay.service;

import com.autochips.carplay.CarplayDevice;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/* JADX INFO: loaded from: classes.dex */
public final class z {
    private static final Object rS = new Object();
    private Map uE;

    z() {
    }

    public final CarplayDevice H(String str) {
        aa aaVar = (aa) this.uE.get(str);
        if (aaVar == null) {
            return null;
        }
        return aaVar.getDevice();
    }

    public final aa I(String str) {
        aa aaVar;
        synchronized (this.uE) {
            aaVar = new aa(this);
            aaVar.uG = new CarplayDevice(str);
            aaVar.rj = str;
            this.uE.put(str, aaVar);
        }
        return aaVar;
    }

    public final void J(String str) {
        synchronized (this.uE) {
            this.uE.remove(str);
        }
    }

    public final aa b(CarplayDevice carplayDevice) {
        aa aaVar;
        synchronized (this.uE) {
            aaVar = (aa) this.uE.get(carplayDevice.getDeviceId());
        }
        return aaVar;
    }

    public final Object clone() throws CloneNotSupportedException {
        throw new CloneNotSupportedException();
    }

    final void init() {
        this.uE = new ConcurrentHashMap();
    }

    final void reset() {
        if (this.uE != null) {
            this.uE.clear();
        }
    }
}
