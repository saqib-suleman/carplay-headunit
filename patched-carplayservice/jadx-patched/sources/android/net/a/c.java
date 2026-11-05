package android.net.a;

import android.net.INetd;
import android.net.InterfaceConfiguration;
import android.net.LinkAddress;
import android.net.util.SharedLog;
import android.os.INetworkManagementService;
import android.os.RemoteException;
import android.os.ServiceSpecificException;
import android.system.OsConstants;
import java.net.InetAddress;

/* JADX INFO: loaded from: classes.dex */
public final class c {
    private final String eq;
    private final INetworkManagementService er;
    private final INetd es;
    private final SharedLog et;

    public c(String str, INetworkManagementService iNetworkManagementService, INetd iNetd, SharedLog sharedLog) {
        this.eq = str;
        this.er = iNetworkManagementService;
        this.es = iNetd;
        this.et = sharedLog;
    }

    private void a(String str, Object... objArr) {
        this.et.p(String.format(str, objArr));
    }

    public final boolean W() {
        try {
            InterfaceConfiguration interfaceConfiguration = new InterfaceConfiguration();
            interfaceConfiguration.setLinkAddress(new LinkAddress("0.0.0.0/0"));
            this.er.setInterfaceConfig(this.eq, interfaceConfiguration);
            return true;
        } catch (RemoteException | IllegalStateException e) {
            a("Failed to clear IPv4 address on interface %s: %s", this.eq, e);
            return false;
        }
    }

    public final boolean X() {
        try {
            this.er.enableIpv6(this.eq);
            return true;
        } catch (RemoteException | IllegalStateException e) {
            a("enabling IPv6 failed: %s", e);
            return false;
        }
    }

    public final boolean Y() {
        try {
            this.er.disableIpv6(this.eq);
            return true;
        } catch (RemoteException | IllegalStateException e) {
            a("disabling IPv6 failed: %s", e);
            return false;
        }
    }

    public final boolean Z() {
        try {
            this.er.setInterfaceIpv6PrivacyExtensions(this.eq, true);
            return true;
        } catch (RemoteException | IllegalStateException e) {
            a("error setting IPv6 privacy extensions: %s", e);
            return false;
        }
    }

    public final boolean a(LinkAddress linkAddress) {
        InterfaceConfiguration interfaceConfiguration = new InterfaceConfiguration();
        interfaceConfiguration.setLinkAddress(linkAddress);
        try {
            this.er.setInterfaceConfig(this.eq, interfaceConfiguration);
            return true;
        } catch (RemoteException | IllegalStateException e) {
            a("IPv4 configuration failed: %s", e);
            return false;
        }
    }

    public final boolean aa() {
        try {
            this.er.clearInterfaceAddresses(this.eq);
            return true;
        } catch (Exception e) {
            a("Failed to clear addresses: %s", e);
            return false;
        }
    }

    public final boolean addAddress(InetAddress inetAddress, int i) {
        try {
            this.es.interfaceAddAddress(this.eq, inetAddress.getHostAddress(), i);
            return true;
        } catch (ServiceSpecificException | RemoteException e) {
            a("failed to add %s/%d: %s", inetAddress, Integer.valueOf(i), e);
            return false;
        }
    }

    public final boolean f(int i) {
        String str;
        Object[] objArr;
        try {
            this.er.setIPv6AddrGenMode(this.eq, i);
            return true;
        } catch (RemoteException e) {
            str = "Unable to set IPv6 addrgen mode: %s";
            objArr = new Object[]{e};
            a(str, objArr);
            return false;
        } catch (ServiceSpecificException e2) {
            if (e2.errorCode == OsConstants.EOPNOTSUPP) {
                return true;
            }
            str = "Unable to set IPv6 addrgen mode: %s";
            objArr = new Object[]{e2};
            a(str, objArr);
            return false;
        }
    }
}
