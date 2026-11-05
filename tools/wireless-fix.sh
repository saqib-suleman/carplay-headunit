#!/usr/bin/env bash
# Run ON THE UNIT'S HOTSPOT. Applies the full wireless fix AND captures everything to a file:
#   - starts authd from /data/local/tmp (so it can dlopen the MFi lib; /vendor/bin can't) + selftest
#   - pins the LIVE ap0 IP + channel 6 + creds (fixes the stale ap_ip)
#   - re-enables + restarts the bridge and screen app
#   - waits for a dial/auth cycle, then dumps the bridge log tail
# Saves to wireless-data/fix-<timestamp>.txt. Then rejoin home Wi-Fi and tell Claude the file is ready.
set -uo pipefail
DIR="$(cd "$(dirname "$0")/.." && pwd)"
export PATH="${ANDROID_HOME:-$HOME/Library/Android/sdk}/platform-tools:$PATH"
mkdir -p "$DIR/wireless-data"
OUT="$DIR/wireless-data/fix-$(date +%s).txt"

G=$(netstat -nr 2>/dev/null | awk '/^default/{print $2; exit}')
[ -z "$G" ] && { echo "No gateway — join the unit's hotspot first."; exit 1; }
ADDR="$G:5555"
adb disconnect "$ADDR" >/dev/null 2>&1; adb kill-server >/dev/null 2>&1; adb start-server >/dev/null 2>&1; sleep 1
S=""; for i in 1 2 3 4 5 6; do adb connect "$ADDR" >/dev/null 2>&1; sleep 2; S=$(adb -s "$ADDR" get-state 2>/dev/null); [ "$S" = device ] && break; done
echo "unit=$ADDR state=$S" | tee "$OUT"
[ "$S" = device ] || { echo "Could not reach the unit over the hotspot (adb offline). Try again." | tee -a "$OUT"; exit 1; }

# on-device fix + capture (pushed to avoid shell-quoting problems)
cat > /tmp/cp-fix-dev.sh <<'DEV'
echo "===== $(date) ====="
echo "--- stop any authd, ensure it lives in /data/local/tmp ---"
/vendor/bin/authd stop 2>/dev/null; /data/local/tmp/authd stop 2>/dev/null; sleep 1
[ -x /data/local/tmp/authd ] || cp /vendor/bin/authd /data/local/tmp/authd
chmod 755 /data/local/tmp/authd
echo "--- spawn authd from /data/local/tmp ---"
env CPAUTH_LIB=/system/lib64/libCoreUtils.so /data/local/tmp/authd spawn
sleep 2
echo "--- authd status + selftest (want RESULT: PASS, no dlopen error) ---"
/data/local/tmp/authd status
/data/local/tmp/authd selftest 1
echo "--- pin LIVE ap0 IP + channel + creds ---"
AP=$(ip -4 -o addr show ap0 2>/dev/null | sed -n 's#.*inet \([0-9.]*\)/.*#\1#p' | head -1)
echo "live ap0=$AP (was persist.cpbridge.ap_ip=$(getprop persist.cpbridge.ap_ip))"
[ -n "$AP" ] && setprop persist.cpbridge.ap_ip "$AP"
CONF=/data/vendor/wifi/hostapd/hostapd_ap0.conf
if [ -f "$CONF" ]; then
  S=$(sed -n 's/^ssid=//p' "$CONF" | head -1); [ -n "$S" ] && setprop persist.cpbridge.ssid "$S"
  P=$(sed -n 's/^wpa_passphrase=//p' "$CONF" | head -1); [ -n "$P" ] && setprop persist.cpbridge.passphrase "$P"
fi
for c in /system/bin/hostapd_cli /vendor/bin/hostapd_cli; do [ -x "$c" ] && "$c" -p /data/vendor/wifi/hostapd/ctrl -i ap0 chan_switch 5 2437 ht >/dev/null 2>&1 && break; done
setprop persist.cpbridge.channel 6
echo "--- re-enable + restart bridge + screen ---"
pm enable --user 0 com.cpbridge >/dev/null 2>&1
am force-stop com.cpbridge; am start-foreground-service -n com.cpbridge/.BridgeService
am start-foreground-service -n app.carplayscreen/.Watcher
echo "--- waiting ~25s for a dial/auth cycle ---"
sleep 25
echo "--- bridge log tail (did auth pass? look for 0xAA01 cert + NOT 0xAA04) ---"
tail -60 /data/media/0/Android/data/com.cpbridge/files/cpbridge.log 2>/dev/null
DEV
adb -s "$ADDR" push /tmp/cp-fix-dev.sh /data/local/tmp/cp-fix-dev.sh >/dev/null 2>&1
adb -s "$ADDR" shell su 0 sh /data/local/tmp/cp-fix-dev.sh 2>&1 | tr -d '\r' | tee -a "$OUT"

echo "================================================================" | tee -a "$OUT"
echo "Saved to: $OUT"
echo "Keep the iPhone unlocked (BT + Wi-Fi on, not on USB). If CarPlay didn't appear,"
echo "rejoin home Wi-Fi and tell Claude the fix file is ready."
