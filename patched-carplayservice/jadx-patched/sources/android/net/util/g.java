package android.net.util;

/* JADX INFO: loaded from: classes.dex */
public final class g {
    public static final byte gv = -1;
    public static final byte[] gw = {gv, gv, gv, gv, gv, gv};

    public static int a(byte b) {
        return b & 255;
    }

    public static String asString(int i) {
        return Integer.toString(i);
    }

    public static int c(short s) {
        return s & 65535;
    }
}
