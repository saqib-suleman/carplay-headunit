package com.autochips.carplay.service;

import android.text.TextUtils;
import android.util.Log;
import java.util.HashMap;
import java.util.Iterator;

/* JADX INFO: loaded from: classes.dex */
final class k {
    private int tS;
    private HashMap tT;

    private k() {
        this.tT = new HashMap();
    }

    /* synthetic */ k(byte b) {
        this();
    }

    static /* synthetic */ j a(k kVar, String str) {
        for (j jVar : kVar.tT.values()) {
            if (TextUtils.equals(jVar.name, str)) {
                return jVar;
            }
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public j ai(int i) {
        return (j) this.tT.get(Integer.valueOf(i));
    }

    static /* synthetic */ j b(k kVar, int i) {
        j jVar = new j(kVar.tS, i);
        kVar.tT.put(Integer.valueOf(kVar.tS), jVar);
        kVar.tS++;
        return jVar;
    }

    static /* synthetic */ j c(k kVar, int i) {
        return (j) kVar.tT.remove(Integer.valueOf(i));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Iterator dV() {
        return this.tT.keySet().iterator();
    }

    public final void dU() {
        Iterator itDV = dV();
        while (itDV.hasNext()) {
            j jVarAi = ai(((Integer) itDV.next()).intValue());
            if (jVarAi.type == 0) {
                itDV.remove();
                Log.i("CarplayNative", "Successfully remove iface " + jVarAi);
            }
        }
    }
}
