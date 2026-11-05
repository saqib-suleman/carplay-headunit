package android.net.dns;

import android.net.Network;
import android.system.GaiException;
import android.system.OsConstants;
import android.system.StructAddrinfo;
import java.net.InetAddress;
import libcore.io.Libcore;

/* JADX INFO: loaded from: classes.dex */
public final class a {
    public static InetAddress[] a(Network network, String str, int i) {
        StructAddrinfo structAddrinfo = new StructAddrinfo();
        structAddrinfo.ai_flags = i;
        structAddrinfo.ai_family = OsConstants.AF_UNSPEC;
        structAddrinfo.ai_socktype = OsConstants.SOCK_STREAM;
        try {
            return Libcore.os.android_getaddrinfo(str, structAddrinfo, new Network((int) (((long) network.netId) | 2147483648L)).netId);
        } catch (GaiException e) {
            e.rethrowAsUnknownHostException(str + ": TLS-bypass resolution failed");
            return null;
        }
    }
}
