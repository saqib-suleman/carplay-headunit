package com.autochips.carplay.b;

import android.os.Message;
import android.os.Parcel;
import android.util.Log;

/* JADX INFO: loaded from: classes.dex */
public interface z {
    default void a(Message message) {
        Log.d("ResourceManager", "sendRequest: " + message);
        if (com.autochips.carplay.service.g.dx().dC() != null) {
            com.autochips.carplay.service.g.dx().dC().sendMessage(message);
        }
    }

    default void b(int i, int i2, Parcel parcel) {
        Log.d("ResourceManager", "sendAudioInfo, streamId:" + i + ", audioType:" + i2);
        if (com.autochips.carplay.service.g.dx().dy() != null) {
            com.autochips.carplay.service.g.dx().dy().c(i, i2, parcel);
        }
    }

    /* JADX INFO: renamed from: do, reason: not valid java name */
    default com.autochips.carplay.common.b m3do() {
        Log.d("ResourceManager", "getCurrentModeState");
        if (com.autochips.carplay.service.g.dx().dC() != null) {
            return com.autochips.carplay.service.g.dx().dC().ee();
        }
        return null;
    }

    default void f(int i, int i2, int i3) {
        Log.d("ResourceManager", "sendStreamStateChanged, streamId:" + i + ", audioType:" + i2 + ", streamState:" + i3);
        if (com.autochips.carplay.service.g.dx().dy() != null) {
            com.autochips.carplay.service.g.dx().dy().g(i, i2, i3);
        }
    }
}
