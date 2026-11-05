package android.support.v4.media;

import android.annotation.TargetApi;

/* JADX INFO: loaded from: classes.dex */
@TargetApi(19)
public final class o implements AutoCloseable {
    private final r kn;

    @Override // java.lang.AutoCloseable
    public final void close() {
        try {
            this.kn.close();
        } catch (Exception e) {
        }
    }
}
