package android.net.util;

import android.net.MacAddress;
import android.text.TextUtils;
import com.android.internal.util.Preconditions;
import com.autochips.carplay.common.CarplayMessage;
import java.net.NetworkInterface;
import java.net.SocketException;

/* JADX INFO: loaded from: classes.dex */
public class b {
    public final MacAddress fx;
    public final int gm;
    public final int index;
    public final String name;

    private b(String str, int i, MacAddress macAddress, int i2) {
        Preconditions.checkArgument(!TextUtils.isEmpty(str), "impossible interface name");
        Preconditions.checkArgument(i > 0, "invalid interface index");
        this.name = str;
        this.index = i;
        this.fx = macAddress == null ? MacAddress.ALL_ZEROS_ADDRESS : macAddress;
        this.gm = i2 > 1280 ? i2 : CarplayMessage.BASE_IAP2;
    }

    private static MacAddress a(NetworkInterface networkInterface) {
        try {
            return MacAddress.fromBytes(networkInterface.getHardwareAddress());
        } catch (IllegalArgumentException | NullPointerException | SocketException e) {
            return null;
        }
    }

    public static b m(String str) {
        NetworkInterface networkInterfaceN = n(str);
        if (networkInterfaceN == null) {
            return null;
        }
        try {
            return new b(str, networkInterfaceN.getIndex(), a(networkInterfaceN), networkInterfaceN.getMTU());
        } catch (IllegalArgumentException | SocketException e) {
            return null;
        }
    }

    private static NetworkInterface n(String str) {
        try {
            return NetworkInterface.getByName(str);
        } catch (NullPointerException | SocketException e) {
            return null;
        }
    }

    public String toString() {
        return String.format("%s/%d/%s/%d", this.name, Integer.valueOf(this.index), this.fx, Integer.valueOf(this.gm));
    }
}
