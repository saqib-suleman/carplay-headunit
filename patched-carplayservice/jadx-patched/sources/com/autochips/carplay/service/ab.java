package com.autochips.carplay.service;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/* JADX INFO: loaded from: classes.dex */
public final class ab {
    private Map mStates = new ConcurrentHashMap();
    final /* synthetic */ z uI;

    ab(z zVar) {
        this.uI = zVar;
    }

    final int am(int i) {
        Integer num = (Integer) this.mStates.get(new Integer(i));
        if (num != null) {
            return num.intValue();
        }
        return 1;
    }

    final void s(int i, int i2) {
        this.mStates.put(new Integer(i), new Integer(i2));
    }
}
