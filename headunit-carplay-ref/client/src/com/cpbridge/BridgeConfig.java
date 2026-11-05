package com.cpbridge;

import android.os.SystemClock;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.InputStreamReader;

/**
 * Static configuration and small runtime probes for the CarPlay bridge.
 *
 * Logging convention: one logcat tag per subsystem, all prefixed CPBRIDGE_.
 *
 * Note: this ROM's logd drops INFO/DEBUG/WARN from untrusted_app — every message
 * is emitted at ERROR priority through Cplog (see Cplog.java).
 */
final class BridgeConfig {

    static final String TAG_A = "CPBRIDGE_PHASE_A";
    static final String TAG_HAL = "CPBRIDGE_HAL";
    static final String TAG_CLIENT = "CPBRIDGE_CLIENT";
    static final String TAG_BT = "CPBRIDGE_BT";
    static final String TAG_IAP = "CPBRIDGE_IAP";
    static final String TAG_WIFI = "CPBRIDGE_WIFI";
    static final String TAG_SVC = "CPBRIDGE_SVC";
    static final String TAG_CFG = "CPBRIDGE_CFG";
    static final String TAG_LINK = "CPBRIDGE_LINK";
    static final String TAG_IAP2 = "CPBRIDGE_IAP2";
    static final String TAG_AUTH = "CPBRIDGE_AUTH";

    // ---- handshake timing (C): elapsed since the iAP2 link started (~RFCOMM connect), so one good
    // capture gives real per-milestone latency instead of my estimates. Logging only; never throws.
    private static volatile long sHandshakeEpochMs = -1;
    /** Reset the handshake stopwatch -- called when a fresh iAP2 link starts. Monotonic clock (#11):
     * elapsedRealtime doesn't jump when the unit syncs its wall clock at boot. */
    static void markHandshakeStart() {
        sHandshakeEpochMs = SystemClock.elapsedRealtime();
    }
    /** Elapsed ms since markHandshakeStart(), or -1 if not started yet. */
    static long sinceHandshake() {
        long t0 = sHandshakeEpochMs;
        return t0 < 0 ? -1 : SystemClock.elapsedRealtime() - t0;
    }

    /**
     * Apple iAP2 accessory RFCOMM service UUID.  The CarPlay-capable iPhone
     * dials this UUID on the car's Bluetooth SDP record.  (This is the UUID the
     * missing reference client com.autochips.carplayapp registered.)
     */
    static final String CARPLAY_IAP2_UUID = "00000000-deca-fade-deca-deafdecacaff";
    static final String SDP_NAME = "CarPlay";

    /** SDP service-record name; override with persist.cpbridge.sdp_name. */
    static String sdpName() {
        String v = getProp("persist.cpbridge.sdp_name", null);
        return (v == null || v.length() == 0) ? SDP_NAME : v;
    }

    /* Wi-Fi SoftAP credentials handed to the iPhone over iAP2 (0x5703).
     * The defaults below are placeholders; override them with
     *   setprop persist.cpbridge.ssid ...
     *   setprop persist.cpbridge.passphrase ...
     *   setprop persist.cpbridge.channel <n>
     *   setprop persist.cpbridge.bssid aa:bb:cc:dd:ee:ff
     *   setprop persist.cpbridge.bt_mac aa:bb:cc:dd:ee:ff
     */
    private static final String DEFAULT_SSID = "YOUR-HOTSPOT-SSID";
    private static final String DEFAULT_PASSPHRASE = "YOUR-HOTSPOT-PASSPHRASE";

    private static volatile String sBtMacSource = "?";
    private static volatile String sBssidSource = "?";
    private static volatile String sChannelSource = "?";

    private BridgeConfig() {
    }

    // ------------------------------------------------------------------
    // properties / exec
    // ------------------------------------------------------------------

    /** Run a command and return stdout+stderr (bounded, best effort). */
    static String exec(String... command) {
        Process process = null;
        BufferedReader reader = null;
        try {
            process = new ProcessBuilder(command).redirectErrorStream(true).start();
            reader = new BufferedReader(new InputStreamReader(
                    process.getInputStream(), "UTF-8"));
            StringBuilder sb = new StringBuilder();
            String line;
            long deadline = System.currentTimeMillis() + 2000;
            while ((line = reader.readLine()) != null) {
                sb.append(line).append('\n');
                if (System.currentTimeMillis() > deadline || sb.length() > 65536) {
                    break;
                }
            }
            try {
                process.waitFor();
            } catch (InterruptedException ignored) {
                Thread.currentThread().interrupt();
            }
            return sb.toString();
        } catch (Throwable t) {
            Cplog.w(TAG_CFG, "exec " + command[0] + " failed: " + t);
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (Throwable ignored) {
                }
            }
            if (process != null) {
                process.destroy();
            }
        }
        return "";
    }

    /** Read an Android property via /system/bin/getprop (avoids hidden-API reflection). */
    static String getProp(String key, String def) {
        String out = exec("/system/bin/getprop", key);
        if (out.length() > 0) {
            String value = out.trim();
            if (value.length() > 0) {
                return value;
            }
        }
        return def;
    }

    static boolean getPropBool(String key, boolean def) {
        String v = getProp(key, null);
        if (v == null) {
            return def;
        }
        return "1".equals(v) || "true".equalsIgnoreCase(v) || "yes".equalsIgnoreCase(v);
    }

    /**
     * Bounded grace (ms) after Wi-Fi credentials are sent, during which the dialer holds off so a
     * SUCCESSFUL handoff has time to come up over Wi-Fi -- at which point the screen app's PAUSE_DIAL
     * takes over and keeps the single BT radio free for A2DP. This replaced a flat 120 s "quiet"
     * window that armed on credentials-sent with no success check: a silently FAILED handoff then
     * blocked the next re-dial for ~110 s, the single biggest cause of multi-minute connects. Kept
     * short so a failed handoff retries quickly. persist.cpbridge.handoff_grace_ms; default 30000.
     * Set 0 for immediate re-dial.
     */
    static long handoffGraceMs() {
        String v = getProp("persist.cpbridge.handoff_grace_ms", null);
        if (v != null && v.length() > 0) {
            try {
                long ms = Long.parseLong(v.trim());
                if (ms >= 0) {
                    return ms;
                }
            } catch (NumberFormatException ignored) {
            }
        }
        return 30000L;
    }

    /** Max time (ms) the dialer will stay paused for an apparent CarPlay session (mDialPaused or an
     * ESTABLISHED :7000) before it dials anyway to recover from a stale/leaked socket or a stuck pause
     * (#1). Long enough not to disturb a normal session, short enough to self-heal.
     * persist.cpbridge.pause_cap_ms; default 300000 (5 min). */
    static long pauseCapMs() {
        String v = getProp("persist.cpbridge.pause_cap_ms", null);
        if (v != null && v.length() > 0) {
            try {
                long ms = Long.parseLong(v.trim());
                if (ms > 0) {
                    return ms;
                }
            } catch (NumberFormatException ignored) {
            }
        }
        return 300000L;
    }

    /** Dead-link watchdog: close + re-dial after this many ms of no RX while NORMAL. Default 8000.
     * Raise it (persist.cpbridge.watchdog_ms, e.g. 60000) to keep the BT/iAP2 link up longer during
     * the Wi-Fi handoff, in case the vendor receiver needs the iAP2 session to persist. */
    static long linkWatchdogMs() {
        String v = getProp("persist.cpbridge.watchdog_ms", null);
        if (v != null && v.length() > 0) {
            try {
                long ms = Long.parseLong(v.trim());
                if (ms > 0) {
                    return ms;
                }
            } catch (NumberFormatException ignored) {
            }
        }
        return Iap2Constants.LINK_WATCHDOG_MS;
    }

    /** Overall negotiation deadline (ms): if the peer never completes the iAP2 SYN exchange within
     * this long, give up on the link and re-dial instead of resending SYN forever (which used to pin
     * the single link slot indefinitely against a silent peer). persist.cpbridge.negotiate_deadline_ms;
     * default 15000. */
    static long negotiateDeadlineMs() {
        String v = getProp("persist.cpbridge.negotiate_deadline_ms", null);
        if (v != null && v.length() > 0) {
            try {
                long ms = Long.parseLong(v.trim());
                if (ms > 0) {
                    return ms;
                }
            } catch (NumberFormatException ignored) {
            }
        }
        return 15000L;
    }

    // ------------------------------------------------------------------
    // identity
    // ------------------------------------------------------------------

    /** ro.serialno, as the vendor client passes it to setDeviceConfigInfo(7, ...). */
    static String serial() {
        String s = getProp("ro.serialno", null);
        if (s == null || s.length() == 0) {
            s = android.os.Build.SERIAL;
        }
        if (s == null || s.length() == 0) {
            s = "unknown";
        }
        return s;
    }

    /**
     * persist.cpbridge.peer_mac override: when set, dial ONLY that Bluetooth
     * address (normalized to upper-case colon form).  Essential for fast
     * iteration against a specific iPhone when many devices are bonded.
     */
    static String peerMac() {
        String v = getProp("persist.cpbridge.peer_mac", null);
        if (v == null || v.length() == 0) {
            return null;
        }
        v = v.trim().toUpperCase(java.util.Locale.US).replace('-', ':');
        return v.length() == 0 ? null : v;
    }

    static String uuidValue() {
        String v = getProp("persist.carplay.uuid.value", null);
        if (v == null || v.length() == 0) {
            v = "autochips.Inc.8257";
        }
        return v;
    }

    static boolean uuidEnable() {
        return getPropBool("persist.carplay.uuid.enable", false);
    }

    /**
     * Accessory Bluetooth MAC for identification parameter 17.  An unprivileged
     * app cannot read the real controller address (BluetoothAdapter#getAddress
     * returns 02:00:00:00:00:00 without BLUETOOTH_PRIVILEGED), so this is a
     * configurable constant — setprop persist.cpbridge.bt_mac to override.
     */
    static String btMac() {
        String v = getProp("persist.cpbridge.bt_mac", null);
        if (v != null && v.length() > 0) {
            sBtMacSource = "prop persist.cpbridge.bt_mac";
            return v;
        }
        sBtMacSource = "default constant (override with persist.cpbridge.bt_mac)";
        return Iap2Constants.DEFAULT_ACCESSORY_BT_MAC;
    }

    static String btMacSource() {
        btMac();
        return sBtMacSource;
    }

    static byte[] btMacBytes() {
        return macToBytes(btMac());
    }

    static byte[] macToBytes(String mac) {
        byte[] out = new byte[6];
        if (mac != null) {
            String[] parts = mac.trim().split("[:\\-]");
            if (parts.length == 6) {
                try {
                    for (int i = 0; i < 6; i++) {
                        out[i] = (byte) Integer.parseInt(parts[i], 16);
                    }
                } catch (NumberFormatException ignored) {
                    return new byte[6];
                }
            }
        }
        return out;
    }

    // ------------------------------------------------------------------
    // Wi-Fi SoftAP values (live AP where possible)
    // ------------------------------------------------------------------

    static String ssid() {
        String v = getProp("persist.cpbridge.ssid", null);
        return (v == null || v.length() == 0) ? DEFAULT_SSID : v;
    }

    static String passphrase() {
        String v = getProp("persist.cpbridge.passphrase", null);
        return (v == null || v.length() == 0) ? DEFAULT_PASSPHRASE : v;
    }

    /** AP interface name, e.g. ap0 / wlan0 (ip -o link show). */
    static String apInterfaceName() {
        String ip = exec("/system/bin/ip", "-o", "link", "show");
        String[] preferred = {"ap0", "swlan0", "wlan0", "wlan1"};
        for (String name : preferred) {
            if (ip.contains(name + ":")) {
                return name;
            }
        }
        return "";
    }

    /** AP BSSID (the AP interface MAC) from `ip -o link show <iface>`. */
    static String wifiBssid() {
        String p = getProp("persist.cpbridge.bssid", null);
        if (p != null && p.length() > 0) {
            sBssidSource = "prop persist.cpbridge.bssid";
            return p;
        }
        String iface = apInterfaceName();
        if (iface.length() > 0) {
            String out = exec("/system/bin/ip", "-o", "link", "show", iface);
            int idx = out.indexOf("link/ether");
            if (idx >= 0) {
                String rest = out.substring(idx + "link/ether".length()).trim();
                String mac = rest.split("\\s+")[0];
                if (mac.matches("([0-9a-fA-F]{2}:){5}[0-9a-fA-F]{2}")) {
                    sBssidSource = "ip link " + iface;
                    return mac;
                }
            }
        }
        sBssidSource = "unavailable (setprop persist.cpbridge.bssid ...)";
        return "";
    }

    /** Wi-Fi channel of the live SoftAP (iw dev), 0 when unknown. */
    static int wifiChannel() {
        String p = getProp("persist.cpbridge.channel", null);
        if (p != null && p.length() > 0) {
            try {
                int v = Integer.parseInt(p.trim());
                if (v > 0) {
                    sChannelSource = "prop persist.cpbridge.channel";
                    return v;
                }
            } catch (NumberFormatException ignored) {
            }
        }
        String iface = apInterfaceName();
        String out = exec("/system/bin/iw", "dev");
        int fallback = -1;
        String current = null;
        for (String rawLine : out.split("\n")) {
            String line = rawLine.trim();
            if (line.startsWith("Interface ")) {
                current = line.substring("Interface ".length()).trim();
            } else if (line.startsWith("channel ")) {
                String[] tokens = line.split("\\s+");
                if (tokens.length >= 2) {
                    try {
                        int ch = Integer.parseInt(tokens[1]);
                        if (ch > 0) {
                            if (iface.length() > 0 && iface.equals(current)) {
                                sChannelSource = "iw dev " + iface;
                                return ch;
                            }
                            if (fallback < 0) {
                                fallback = ch;
                            }
                        }
                    } catch (NumberFormatException ignored) {
                    }
                }
            }
        }
        if (fallback > 0) {
            sChannelSource = "iw dev (first interface channel)";
            return fallback;
        }
        sChannelSource = "unavailable (setprop persist.cpbridge.channel ...)";
        return 0;
    }

    /**
     * AP IPv4 for the 0x4301 wireless group. The LIVE ap0 interface is ground truth; the pinned
     * persist.cpbridge.ap_ip property is only a backstop for when the unprivileged app can't read the
     * interface. We deliberately do NOT trust a pinned value over a live one -- a stale pin from a
     * previous boot used to send the phone to a dead address (the receiver is at the live ap0, not the
     * pin) and burn a whole handoff-grace window. Returns null when neither yields a real address, so
     * the caller can DEFER 0x4301 instead of advertising the 192.168.43.1 guess.
     */
    static String apIpv4Validated() {
        String live = apIpv4Live();
        String pinned = getProp("persist.cpbridge.ap_ip", null);
        if (live != null) {
            if (pinned != null && pinned.length() > 0 && !pinned.equals(live)) {
                Cplog.w(TAG_WIFI, "persist.cpbridge.ap_ip=" + pinned
                        + " is STALE; ap0 is live at " + live + " -> advertising live");
            }
            return live;
        }
        if (pinned != null && pinned.length() > 0) {
            Cplog.i(TAG_WIFI, "ap0 not readable here; using pinned persist.cpbridge.ap_ip=" + pinned);
            return pinned;
        }
        return null;
    }

    /** Live IPv4 on the AP interface, or null if it can't be read. Hard-coded to ap0 on this unit (#1):
     * apInterfaceName() falls back to swlan0/wlan0/wlan1 by mere existence, so during the boot
     * station->hotspot window it could return a STATION address and we'd advertise the wrong IP. */
    private static String apIpv4Live() {
        String iface = "ap0";
        String out = exec("/system/bin/ip", "-4", "-o", "addr", "show", iface);
        int idx = out.indexOf("inet ");
        if (idx < 0) {
            return null;
        }
        String rest = out.substring(idx + "inet ".length()).trim();
        String addr = rest.split("\\s+")[0];
        int slash = addr.indexOf('/');
        if (slash > 0) {
            addr = addr.substring(0, slash);
        }
        return addr.matches("\\d+\\.\\d+\\.\\d+\\.\\d+") ? addr : null;
    }

    /**
     * True when the vendor CarPlay receiver has an ESTABLISHED TCP connection on port 7000 -- i.e.
     * wireless CarPlay is actually up over Wi-Fi. Authoritative, unlike the mDialPaused broadcast which
     * can be missed or lost across a restart (#4). The dialer uses this to NOT re-dial BT (and disturb
     * an active session) when the handoff succeeded but PAUSE_DIAL never arrived. Reads /proc, best
     * effort; false on any error (fall back to the broadcast + grace).
     */
    static boolean carplayReceiverConnected() {
        return tcpHasEstablished7000("/proc/net/tcp") || tcpHasEstablished7000("/proc/net/tcp6");
    }

    private static boolean tcpHasEstablished7000(String path) {
        BufferedReader r = null;
        try {
            r = new BufferedReader(new FileReader(path));
            String line;
            while ((line = r.readLine()) != null) {
                // columns: sl  local_address rem_address st ...  ; local port is hex after ':'
                String t = line.trim();
                int sp = t.indexOf(' ');
                if (sp <= 0) {
                    continue;
                }
                String[] cols = t.split("\\s+");
                if (cols.length < 4) {
                    continue;
                }
                String local = cols[1];               // e.g. 0100007F:1B58
                String state = cols[3];                // 01 = ESTABLISHED
                int colon = local.lastIndexOf(':');
                if (colon < 0) {
                    continue;
                }
                if ("1B58".equalsIgnoreCase(local.substring(colon + 1)) && "01".equals(state)) {
                    return true;
                }
            }
        } catch (Throwable ignored) {
            // /proc not readable or format unexpected -> treat as "unknown / not connected"
        } finally {
            if (r != null) {
                try { r.close(); } catch (Throwable ignored) {}
            }
        }
        return false;
    }

    /** Legacy accessor kept for logging: the validated address, or the softAP-default guess. */
    static String apIpv4() {
        String v = apIpv4Validated();
        return v != null ? v : "192.168.43.1";   // guess; callers needing correctness use Validated
    }

    /** AirPlay receiver public key (0x4301 param 4); empty = do not send 0x4301. */
    static String carplayPublicKey() {
        String v = getProp("persist.cpbridge.public_key", null);
        return v == null ? "" : v.trim();
    }

    static String carplaySourceVersion() {
        String v = getProp("persist.cpbridge.source_version", null);
        return (v == null || v.length() == 0)
                ? Iap2Constants.CARPLAY_SOURCE_VERSION : v;
    }

    static int carplayAirplayPort() {
        String v = getProp("persist.cpbridge.airplay_port", null);
        if (v != null) {
            try {
                int port = Integer.parseInt(v.trim());
                if (port > 0 && port <= 65535) {
                    return port;
                }
            } catch (NumberFormatException ignored) {
            }
        }
        return Iap2Constants.CARPLAY_AIRPLAY_PORT;
    }

    /** Device identifier used in 0x4301: the AP/hotspot MAC when known, else BT MAC. */
    static String carplayDeviceIdentifier() {
        String bssid = wifiBssid();
        if (bssid != null && bssid.length() > 0) {
            return bssid;
        }
        return btMac();
    }

    static String wifiChannelSource() {
        wifiChannel();
        return sChannelSource;
    }

    static String wifiBssidSource() {
        wifiBssid();
        return sBssidSource;
    }

    // ------------------------------------------------------------------
    // hex helpers
    // ------------------------------------------------------------------

    static String hex(byte[] data, int len) {
        if (data == null || len <= 0) {
            return "";
        }
        int n = Math.min(len, data.length);
        int shown = Math.min(n, 64);
        StringBuilder sb = new StringBuilder(shown * 2 + 8);
        for (int i = 0; i < shown; i++) {
            sb.append(String.format("%02x", data[i] & 0xff));
        }
        if (n > shown) {
            sb.append("...(").append(n).append("B)");
        }
        return sb.toString();
    }

    static String hexAll(byte[] data) {
        return hexAll(data, data == null ? 0 : data.length);
    }

    static String hexAll(byte[] data, int len) {
        if (data == null || len <= 0) {
            return "";
        }
        int n = Math.min(len, data.length);
        int cap = Math.min(n, 4096);
        StringBuilder sb = new StringBuilder(cap * 3);
        for (int i = 0; i < cap; i++) {
            if (i > 0) {
                sb.append(' ');
            }
            sb.append(String.format("%02x", data[i] & 0xff));
        }
        if (n > cap) {
            sb.append(" ...(").append(n).append("B total)");
        }
        return sb.toString();
    }
}
