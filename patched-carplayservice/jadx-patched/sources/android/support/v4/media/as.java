package android.support.v4.media;

import android.annotation.TargetApi;

/* JADX INFO: loaded from: classes.dex */
@TargetApi(19)
public class as implements AutoCloseable {
    private final av lw;

    @Override // java.lang.AutoCloseable
    public void close() {
        try {
            this.lw.close();
        } catch (Exception e) {
        }
    }
}
