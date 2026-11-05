#!/system/bin/sh
# Quick wireless CarPlay bring-up, on the unit as root. No capture, no logcat, no snapshots.
# Pins the live ap_ip + ch6 + creds, spawns authd, starts the screen app + the bridge. Exits fast.
AP=$(ip -4 -o addr show ap0 2>/dev/null | sed -n 's#.*inet \([0-9.]*\)/.*#\1#p' | head -1)
[ -z "$AP" ] && AP=$(ip addr show ap0 2>/dev/null | sed -n 's/.*inet \([0-9.]*\).*/\1/p' | head -1)
if ! echo "$AP" | grep -qE '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$'; then
  echo "FATAL: no ap0 IPv4 (got '$AP') — not starting"; exit 1
fi
setprop persist.cpbridge.ap_ip "$AP"
CONF=/data/vendor/wifi/hostapd/hostapd_ap0.conf
if [ -f "$CONF" ]; then
  S=$(sed -n 's/^ssid=//p' "$CONF" | head -1);  [ -n "$S" ] && setprop persist.cpbridge.ssid "$S"
  P=$(sed -n 's/^wpa_passphrase=//p' "$CONF" | head -1); [ -n "$P" ] && setprop persist.cpbridge.passphrase "$P"
fi
# channel 6 (iPhone refuses 13); bounded so a stuck hostapd_cli can't hang us
CLI=""; for c in /system/bin/hostapd_cli /vendor/bin/hostapd_cli; do [ -x "$c" ] && CLI="$c" && break; done
[ -n "$CLI" ] && timeout 8 "$CLI" -p /data/vendor/wifi/hostapd/ctrl -i ap0 chan_switch 5 2437 ht >/dev/null 2>&1
setprop persist.cpbridge.channel 6
# authd (MFi helper) — needed each boot
env CPAUTH_LIB=/system/lib64/libCoreUtils.so /data/local/tmp/authd spawn >/dev/null 2>&1
sleep 1
# screen app + bridge (restart the bridge so it re-reads the fresh ap_ip)
am start-foreground-service -n app.carplayscreen/.Watcher >/dev/null 2>&1
am force-stop com.cpbridge >/dev/null 2>&1; sleep 1
am start-foreground-service -n com.cpbridge/.BridgeService >/dev/null 2>&1
echo "BRINGUP OK: ap_ip=$AP ch=$(getprop persist.cpbridge.channel) ssid=$(getprop persist.cpbridge.ssid) authd=[$(/data/local/tmp/authd status 2>/dev/null)]"
