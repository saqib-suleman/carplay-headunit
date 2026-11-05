package com.autochips.carplay.common;

import android.content.Context;
import android.net.nsd.NsdManager;
import android.os.Looper;
import android.os.Message;
import android.util.Slog;

/* JADX INFO: loaded from: classes.dex */
public class c extends a {
    private final Context mContext;
    private NsdManager qy;
    private int qz;

    public c(Context context, Looper looper) {
        super(looper);
        this.qy = null;
        this.qz = 0;
        this.mContext = context;
    }

    @Override // android.os.Handler
    public void handleMessage(Message message) {
        Slog.d("CarplayNsdAdapter", "handleMessage, what: " + message.what);
        switch (message.what) {
            case 1:
            case 3:
                Slog.d("CarplayNsdAdapter", "mNsdManager +++:" + this.qy);
                this.qy = (NsdManager) this.mContext.getSystemService("servicediscovery");
                Slog.d("CarplayNsdAdapter", "mNsdManager ---:" + this.qy);
                if (this.qy != null) {
                    this.qz = 0;
                    V(CarplayMessage.NSD_STARTED);
                } else if (this.qz >= 3) {
                    V(CarplayMessage.NSD_START_FAILURE);
                } else {
                    this.qz++;
                    sendMessage(obtainMessage(3));
                }
                break;
            case 2:
                if (this.qy != null) {
                    this.qy.disconnect();
                    this.qy = null;
                }
                V(CarplayMessage.NSD_STOPPED);
                break;
            default:
                Slog.d("CarplayNsdAdapter", "CarplayNSDAdapter.handleMessage ignoring msg=" + message);
                break;
        }
    }
}
