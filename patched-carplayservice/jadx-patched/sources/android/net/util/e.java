package android.net.util;

import android.database.ContentObserver;
import android.net.Uri;
import android.util.Slog;

/* JADX INFO: loaded from: classes.dex */
final class e extends ContentObserver {
    final /* synthetic */ c gu;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e(c cVar) {
        super(null);
        this.gu = cVar;
    }

    @Override // android.database.ContentObserver
    public final void onChange(boolean z) {
        Slog.wtf(c.TAG, "Should never be reached.");
    }

    @Override // android.database.ContentObserver
    public final void onChange(boolean z, Uri uri) {
        if (!this.gu.go.contains(uri)) {
            Slog.wtf(c.TAG, "Unexpected settings observation: " + uri);
        }
        this.gu.reevaluate();
    }
}
