package android.net.util;

import android.os.MessageQueue;
import java.io.FileDescriptor;

/* JADX INFO: loaded from: classes.dex */
final class i implements MessageQueue.OnFileDescriptorEventListener {
    final /* synthetic */ h gz;

    i(h hVar) {
        this.gz = hVar;
    }

    @Override // android.os.MessageQueue.OnFileDescriptorEventListener
    public final int onFileDescriptorEvents(FileDescriptor fileDescriptor, int i) {
        if (this.gz.isRunning() && this.gz.aE()) {
            return 5;
        }
        this.gz.aF();
        return 0;
    }
}
