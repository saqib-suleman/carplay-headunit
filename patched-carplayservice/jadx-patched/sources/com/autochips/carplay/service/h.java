package com.autochips.carplay.service;

import android.os.Handler;
import android.os.Message;
import android.util.ArraySet;
import android.util.SparseArray;
import java.util.Set;

/* JADX INFO: loaded from: classes.dex */
public final class h {
    private final SparseArray tH = new SparseArray();

    private void sendMessage(Message message) {
        Set<Handler> set = (Set) this.tH.get(message.what);
        if (set != null) {
            for (Handler handler : set) {
                if (handler != null) {
                    Message messageObtain = Message.obtain(message);
                    messageObtain.setTarget(handler);
                    messageObtain.sendToTarget();
                }
            }
        }
        message.recycle();
    }

    public final synchronized void a(int i, Handler handler) {
        Set arraySet = (Set) this.tH.get(i);
        if (arraySet == null) {
            arraySet = new ArraySet();
            this.tH.put(i, arraySet);
        }
        arraySet.add(handler);
    }

    public final synchronized void dG() {
        this.tH.clear();
    }

    public final void sendMessage(int i) {
        sendMessage(Message.obtain((Handler) null, i));
    }

    public final void sendMessage(int i, int i2) {
        sendMessage(Message.obtain(null, i, i2, 0));
    }

    public final void sendMessage(int i, int i2, int i3, Object obj) {
        sendMessage(Message.obtain(null, i, i2, i3, obj));
    }

    public final void sendMessage(int i, Object obj) {
        sendMessage(Message.obtain(null, i, obj));
    }
}
