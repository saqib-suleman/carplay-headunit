package android.net.a;

import android.net.LinkProperties;

/* JADX INFO: loaded from: classes.dex */
final /* synthetic */ class h {
    static final /* synthetic */ int[] eY = new int[LinkProperties.ProvisioningChange.values().length];

    static {
        try {
            eY[LinkProperties.ProvisioningChange.GAINED_PROVISIONING.ordinal()] = 1;
        } catch (NoSuchFieldError e) {
        }
        try {
            eY[LinkProperties.ProvisioningChange.LOST_PROVISIONING.ordinal()] = 2;
        } catch (NoSuchFieldError e2) {
        }
    }
}
