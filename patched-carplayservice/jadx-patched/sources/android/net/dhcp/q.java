package android.net.dhcp;

import android.net.metrics.DhcpErrorEvent;
import android.system.ErrnoException;
import android.system.Os;
import android.util.EventLog;
import android.util.Log;
import com.android.internal.util.HexDump;
import java.io.IOException;

/* JADX INFO: loaded from: classes.dex */
final class q extends Thread {
    final /* synthetic */ b dB;
    private final byte[] bM = new byte[1500];
    private volatile boolean mStopped = false;

    q(b bVar) {
        this.dB = bVar;
    }

    @Override // java.lang.Thread, java.lang.Runnable
    public final void run() {
        b bVar;
        int i;
        int i2;
        Log.d("DhcpClient", "Receive thread started");
        while (!this.mStopped) {
            try {
                try {
                    i2 = Os.read(this.dB.cS, this.bM, 0, this.bM.length);
                    try {
                        DhcpPacket dhcpPacketB = DhcpPacket.b(this.bM, i2);
                        Log.d("DhcpClient", "Received packet: " + dhcpPacketB);
                        this.dB.sendMessage(196710, dhcpPacketB);
                    } catch (DhcpPacket.ParseException e) {
                        e = e;
                        Log.e("DhcpClient", "Can't parse packet: " + e.getMessage());
                        Log.d("DhcpClient", HexDump.dumpHexString(this.bM, 0, i2));
                        if (e.errorCode == DhcpErrorEvent.DHCP_NO_COOKIE) {
                            EventLog.writeEvent(1397638484, "31850211", -1, DhcpPacket.ParseException.class.getName());
                        }
                        bVar = this.dB;
                        i = e.errorCode;
                        bVar.ay.log(bVar.db, new DhcpErrorEvent(i));
                    }
                } catch (DhcpPacket.ParseException e2) {
                    e = e2;
                    i2 = 0;
                }
            } catch (ErrnoException | IOException e3) {
                if (!this.mStopped) {
                    Log.e("DhcpClient", "Read error", e3);
                    bVar = this.dB;
                    i = DhcpErrorEvent.RECEIVE_ERROR;
                    bVar.ay.log(bVar.db, new DhcpErrorEvent(i));
                }
            }
        }
        Log.d("DhcpClient", "Receive thread stopped");
    }

    public final void z() {
        this.mStopped = true;
        b.a(this.dB);
    }
}
