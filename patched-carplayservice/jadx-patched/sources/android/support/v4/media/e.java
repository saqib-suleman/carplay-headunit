package android.support.v4.media;

import android.app.PendingIntent;
import android.os.Bundle;
import android.os.IInterface;
import android.os.ResultReceiver;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public interface e extends IInterface {
    void a(int i, Bundle bundle);

    void a(long j, long j2, float f);

    void a(long j, long j2, int i);

    void a(long j, long j2, long j3);

    void a(Bundle bundle, int i, long j);

    void a(Bundle bundle, Bundle bundle2, ResultReceiver resultReceiver);

    void a(Bundle bundle, String str, Bundle bundle2);

    void a(h hVar, Bundle bundle, int i, Bundle bundle2, long j, long j2, float f, long j3, Bundle bundle3, int i2, int i3, List list, PendingIntent pendingIntent);

    void a(String str, int i, int i2, List list, Bundle bundle);

    void a(String str, int i, Bundle bundle);

    void a(String str, Bundle bundle);

    void a(List list, Bundle bundle);

    void b(String str, int i, int i2, List list, Bundle bundle);

    void b(String str, int i, Bundle bundle);

    void b(List list);

    void c(Bundle bundle);

    void c(List list);

    void d(Bundle bundle);

    void e(Bundle bundle);

    void f(Bundle bundle);

    void onDisconnected();

    void u(int i);

    void v(int i);
}
