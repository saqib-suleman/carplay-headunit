#!/usr/bin/env bash
# Run this ON THE UNIT'S HOTSPOT (join the unit's Wi-Fi first; you lose internet, that's expected).
# It connects to the unit via the hotspot gateway, RE-ENABLES the bridge the right way
# (pm enable --user 0), collects a full diagnostic, starts the bridge + screen app, and saves
# everything to wireless-data/diag-<timestamp>.txt which you can paste back to Claude on home Wi-Fi.
#   ./tools/wireless-diag.sh
set -uo pipefail
DIR="$(cd "$(dirname "$0")/.." && pwd)"
export PATH="${ANDROID_HOME:-$HOME/Library/Android/sdk}/platform-tools:$PATH"
mkdir -p "$DIR/wireless-data"
OUT="$DIR/wireless-data/diag-$(date +%s).txt"

adb kill-server >/dev/null 2>&1 || true; adb start-server >/dev/null 2>&1 || true
G=$(netstat -nr 2>/dev/null | awk '/^default/{print $2; exit}')
[ -z "$G" ] && { echo "No gateway — are you on the unit's hotspot?"; exit 1; }
ADDR="$G:5555"
adb connect "$ADDR" >/dev/null 2>&1; sleep 2
[ "$(adb get-state -s "$ADDR" 2>/dev/null)" = device ] || adb -s "$ADDR" wait-for-device 2>/dev/null
echo "unit (hotspot gateway) = $ADDR"

# on-device diag + fix (pushed to avoid shell-quoting problems)
cat > /tmp/cp-diag-dev.sh <<'DEV'
echo "===== $(date) ====="
echo "--- wireless flag ---"; getprop ro.atc.carplay.wireless
echo "--- bridge pm state (listed here = DISABLED) ---"; pm list packages -d | grep cpbridge || echo "cpbridge: enabled"
echo "--- RE-ENABLING bridge for user 0 ---"; pm enable --user 0 com.cpbridge
echo "--- screen app pm state ---"; pm list packages -d | grep carplayscreen || echo "carplayscreen: enabled"
echo "--- ap0 ---"; ip -4 -o addr show ap0 2>/dev/null || echo "no ap0"
echo "--- receiver on port 7000? (0x1B58, 0A=LISTEN) ---"; grep -i 1B58 /proc/net/tcp /proc/net/tcp6 2>/dev/null | head
echo "--- authd ---"; /vendor/bin/authd status 2>/dev/null || /data/local/tmp/authd status 2>/dev/null || echo "authd: not responding"
echo "--- persist.cpbridge.* ---"; getprop | grep cpbridge
echo "--- carplay_wl boot log (did the init service run + how far) ---"; grep -a carplay_wl /data/misc/bwlog/kernellog/kernel.log 2>/dev/null | tail -20
echo "--- recent bridge/screen logcat ---"; logcat -d -s CPBRIDGE:* Cplog:* CarPlayScreen:E 2>/dev/null | tail -40
echo "--- (re)starting bridge + screen app ---"
am start-foreground-service -n com.cpbridge/.BridgeService 2>&1
am start-foreground-service -n app.carplayscreen/.Watcher 2>&1
DEV
adb -s "$ADDR" push /tmp/cp-diag-dev.sh /data/local/tmp/cp-diag-dev.sh >/dev/null 2>&1
adb -s "$ADDR" shell su 0 sh /data/local/tmp/cp-diag-dev.sh 2>&1 | tr -d '\r' | tee "$OUT"
echo
echo "================================================================"
echo "Saved to: $OUT"
echo "Bridge was re-enabled + started. Keep the iPhone unlocked (BT+WiFi on, not on USB)"
echo "and watch for CarPlay for ~1-2 min. Then rejoin home Wi-Fi and paste $OUT to Claude."
echo "================================================================"
