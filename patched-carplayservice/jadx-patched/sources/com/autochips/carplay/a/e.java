package com.autochips.carplay.a;

import android.content.Context;
import android.location.LocationManager;
import android.os.Handler;
import android.os.Message;
import android.util.Slog;

/* JADX INFO: loaded from: classes.dex */
public final class e extends Handler {
    private static h rf;
    private Context mContext;
    private LocationManager re;
    private g rg;
    private f rh;
    private int ri;
    private String rj;
    private boolean rd = false;
    public final int rk = 1;
    public final int rl = 2;
    public final int rm = 3;
    public final int rn = 4;
    public final int ro = 5;
    public final int rp = 6;
    public final int rq = 7;
    private final int rr = 1;
    private final int rs = 16;
    private final int rt = 14;
    private final int ru = 1;
    private final int rv = 2;
    private final int rw = 3;
    private final int rx = 4;
    private final int ry = 5;
    private final int rz = 6;
    private final int rA = 7;
    private final int rB = 8;
    private final int rC = 9;
    private final int rD = 10;
    private final int rE = 11;
    private final int rF = 12;
    private final int rG = 13;
    private final int rH = 14;
    private final int rI = 15;
    private final int rJ = 16;
    private final int rK = 4;
    private final int rL = 6;

    public e(Context context, h hVar) {
        this.mContext = context;
        this.re = (LocationManager) context.getSystemService("location");
        rf = hVar;
        this.ri = 0;
        this.rj = "";
    }

    private static String a(String[] strArr) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < strArr.length - 1; i++) {
            sb.append(strArr[i] + ",");
        }
        sb.append(strArr[strArr.length - 1]);
        return sb.toString();
    }

    private static void a(String[] strArr, int i) {
        if (i > strArr.length - 1) {
            return;
        }
        StringBuilder sb = new StringBuilder();
        int i2 = i - 1;
        sb.append(strArr[i2]);
        sb.append("00");
        strArr[i2] = sb.toString();
    }

    private static boolean v(String str) {
        if (!str.isEmpty()) {
            return str.indexOf("$GPGGA") >= 0;
        }
        Slog.d("iAPLocation", "data not valid");
        return false;
    }

    private static boolean x(String str) {
        if (!str.isEmpty()) {
            return str.indexOf("$GPRMC") >= 0;
        }
        Slog.d("iAPLocation", "data not valid");
        return false;
    }

    private void y(String str) {
        if (!x(str) || (this.ri & 4) == 0) {
            return;
        }
        String[] strArrSplit = str.split(",", -1);
        if (strArrSplit.length != 13) {
            Slog.e("iAPLocation", "data of GPRMC not valid:");
            return;
        }
        a(strArrSplit, 4);
        a(strArrSplit, 6);
        rf.a(a(strArrSplit), this.rj);
    }

    private void z(String str) {
        if (rf == null || !this.rd) {
            return;
        }
        if (v(str) && (this.ri & 2) != 0) {
            String[] strArrSplit = str.split(",", -1);
            if (strArrSplit.length != 15) {
                Slog.e("iAPLocation", "data of GPGGA not valid:");
            } else {
                a(strArrSplit, 3);
                a(strArrSplit, 5);
                if (8 <= strArrSplit.length - 1) {
                    strArrSplit[7] = "";
                }
                String strA = a(strArrSplit);
                String strSubstring = "";
                if (v(strA) || x(strA)) {
                    int iIndexOf = strA.indexOf("$");
                    int iIndexOf2 = strA.indexOf("*");
                    strSubstring = (iIndexOf < 0 || iIndexOf2 < 0) ? "" : strA.substring(iIndexOf, iIndexOf2).substring("$".length());
                }
                char c = 0;
                for (char c2 : strSubstring.toCharArray()) {
                    c = (char) (c ^ c2);
                }
                rf.a(strA.substring(0, strA.indexOf("*")) + "*" + Integer.toHexString(c).toUpperCase(), this.rj);
            }
        }
        y(str);
    }

    public final boolean cZ() {
        if (this.rd) {
            this.rd = false;
            return sendMessage(obtainMessage(2));
        }
        Slog.d("iAPLocation", "already stop");
        return false;
    }

    public final void e(int i, String str) {
        Slog.d("iAPLocation", "set type:" + i);
        this.ri = i | this.ri;
        this.rj = str;
    }

    @Override // android.os.Handler
    public final void handleMessage(Message message) {
        Slog.d("iAPLocation", "handleMessage, what:" + message.what);
        switch (message.what) {
            case 1:
                if (this.rg == null) {
                    this.rg = new g(this, (byte) 0);
                    this.re.addNmeaListener(this.rg);
                }
                if (this.rh == null) {
                    this.rh = new f(this, (byte) 0);
                }
                this.re.requestLocationUpdates("gps", 1000L, 0.5f, this.rh);
                break;
            case 2:
                this.re.removeUpdates(this.rh);
                if (this.rg != null) {
                    this.re.removeNmeaListener(this.rg);
                    this.rg = null;
                }
                if (this.rh != null) {
                    this.rh = null;
                }
                break;
            case 3:
                z((String) message.obj);
                break;
            default:
                Slog.d("iAPLocation", "handle unknown Message, what:" + message.what);
                break;
        }
    }

    public final boolean start() {
        if (this.rd) {
            Slog.d("iAPLocation", "already start");
            return false;
        }
        this.rd = true;
        return sendMessage(obtainMessage(1));
    }
}
