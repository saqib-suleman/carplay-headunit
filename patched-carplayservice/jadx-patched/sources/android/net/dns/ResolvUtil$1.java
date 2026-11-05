package android.net.dns;

import android.net.Network;
import android.system.OsConstants;
import java.net.InetAddress;

/* JADX INFO: loaded from: classes.dex */
class ResolvUtil$1 extends Network {
    final /* synthetic */ Network ek;

    @Override // android.net.Network
    public InetAddress[] getAllByName(String str) {
        return a.a(this.ek, str, OsConstants.AI_ADDRCONFIG);
    }
}
