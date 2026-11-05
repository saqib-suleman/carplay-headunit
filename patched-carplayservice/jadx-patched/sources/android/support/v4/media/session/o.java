package android.support.v4.media.session;

import android.os.Bundle;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public interface o {
    void a(int i, int i2, int i3, int i4, int i5);

    void bW();

    void bX();

    void j(Object obj);

    void k(Object obj);

    void onQueueChanged(List list);

    void onSessionDestroyed();

    void onSessionEvent(String str, Bundle bundle);
}
