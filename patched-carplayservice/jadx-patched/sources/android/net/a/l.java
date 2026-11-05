package android.net.a;

import android.net.DhcpResults;
import android.net.LinkProperties;

/* JADX INFO: loaded from: classes.dex */
final class l extends i {
    final /* synthetic */ d eX;
    private i mCallback;

    public l(d dVar, i iVar) {
        this.eX = dVar;
        this.mCallback = iVar;
    }

    private void log(String str) {
        this.eX.et.log("INVOKE " + str);
    }

    @Override // android.net.a.i
    public final void ae() {
        this.mCallback.ae();
        log("onPreDhcpAction()");
    }

    @Override // android.net.a.i
    public final void af() {
        this.mCallback.af();
        log("onPostDhcpAction()");
    }

    @Override // android.net.a.i
    public final void ag() {
        this.mCallback.ag();
        log("onQuit()");
    }

    @Override // android.net.a.i
    public final void ah() {
        this.mCallback.ah();
        log("startReadPacketFilter()");
    }

    @Override // android.net.a.i
    public final void b(DhcpResults dhcpResults) {
        this.mCallback.b(dhcpResults);
        log("onNewDhcpResults({" + dhcpResults + "})");
    }

    @Override // android.net.a.i
    public final void c(LinkProperties linkProperties) {
        this.mCallback.c(linkProperties);
        log("onProvisioningSuccess({" + linkProperties + "})");
    }

    @Override // android.net.a.i
    public final void c(boolean z) {
        this.mCallback.c(z);
        log("setFallbackMulticastFilter(" + z + ")");
    }

    @Override // android.net.a.i
    public final void d(LinkProperties linkProperties) {
        this.mCallback.d(linkProperties);
        log("onProvisioningFailure({" + linkProperties + "})");
    }

    @Override // android.net.a.i
    public final void d(boolean z) {
        this.mCallback.d(z);
        log("setNeighborDiscoveryOffload(" + z + ")");
    }

    @Override // android.net.a.i
    public final void e(LinkProperties linkProperties) {
        this.mCallback.e(linkProperties);
        log("onLinkPropertiesChange({" + linkProperties + "})");
    }

    @Override // android.net.a.i
    public final void e(byte[] bArr) {
        this.mCallback.e(bArr);
        log("installPacketFilter(byte[" + bArr.length + "])");
    }

    @Override // android.net.a.i
    public final void k(String str) {
        this.mCallback.k(str);
        log("onReachabilityLost(" + str + ")");
    }
}
