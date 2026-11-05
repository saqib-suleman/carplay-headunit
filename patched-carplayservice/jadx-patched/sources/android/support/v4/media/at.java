package android.support.v4.media;

import android.os.Bundle;

/* JADX INFO: loaded from: classes.dex */
public final class at {
    private String en;
    private ay lx;
    private int ly;
    private boolean mEnabled;
    private Bundle mExtras;

    private at(ay ayVar, int i, String str, Bundle bundle, boolean z) {
        this.lx = ayVar;
        this.ly = i;
        this.en = str;
        this.mExtras = bundle;
        this.mEnabled = z;
    }

    /* synthetic */ at(ay ayVar, int i, String str, Bundle bundle, boolean z, byte b) {
        this(ayVar, i, str, bundle, z);
    }

    public static at l(Bundle bundle) {
        if (bundle == null) {
            return null;
        }
        au auVar = new au();
        auVar.a(ay.n(bundle.getBundle("android.media.media_session2.command_button.command")));
        auVar.w(bundle.getInt("android.media.media_session2.command_button.icon_res_id", 0));
        auVar.u(bundle.getString("android.media.media_session2.command_button.display_name"));
        auVar.m(bundle.getBundle("android.media.media_session2.command_button.extras"));
        auVar.f(bundle.getBoolean("android.media.media_session2.command_button.enabled"));
        try {
            return auVar.bO();
        } catch (IllegalStateException e) {
            return null;
        }
    }
}
