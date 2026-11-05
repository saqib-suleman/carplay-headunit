package android.net.dhcp;

import android.net.metrics.DhcpClientEvent;
import android.os.Message;
import android.os.SystemClock;
import android.util.Log;
import android.util.TimeUtils;
import com.android.internal.util.State;

/* JADX INFO: loaded from: classes.dex */
abstract class o extends State {
    final /* synthetic */ b dB;
    private long dD;

    o(b bVar) {
        this.dB = bVar;
    }

    public void enter() {
        Log.d("DhcpClient", "Entering state " + getName());
        this.dD = SystemClock.elapsedRealtime();
    }

    public void exit() {
        long jElapsedRealtime = SystemClock.elapsedRealtime() - this.dD;
        b bVar = this.dB;
        bVar.ay.log(bVar.db, new DhcpClientEvent(getName(), (int) jElapsedRealtime));
    }

    public String getName() {
        return getClass().getSimpleName();
    }

    public boolean processMessage(Message message) {
        StringBuilder sb = new StringBuilder();
        sb.append(getName());
        long jUptimeMillis = SystemClock.uptimeMillis();
        StringBuilder sb2 = new StringBuilder(" ");
        TimeUtils.formatDuration(message.getWhen() - jUptimeMillis, sb2);
        sb2.append(" ");
        int i = message.what;
        sb2.append((String) b.cP.get(i, Integer.toString(i)));
        sb2.append(" ");
        sb2.append(message.arg1);
        sb2.append(" ");
        sb2.append(message.arg2);
        sb2.append(" ");
        sb2.append(message.obj);
        sb.append(sb2.toString());
        Log.d("DhcpClient", sb.toString());
        return false;
    }
}
