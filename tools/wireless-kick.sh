#!/usr/bin/env bash
# Run ON THE UNIT'S HOTSPOT. ap_ip is already synced by the daemon; this just starts the bridge +
# screen via su (the daemon's init context can't start a foreground service) and tails the bridge log
# to confirm it dials with the correct IP. Saves to wireless-data/kick-<timestamp>.txt. WATCH for CarPlay.
set -uo pipefail
DIR="$(cd "$(dirname "$0")/.." && pwd)"
export PATH="${ANDROID_HOME:-$HOME/Library/Android/sdk}/platform-tools:$PATH"
mkdir -p "$DIR/wireless-data"
OUT="$DIR/wireless-data/kick-$(date +%s).txt"

G=$(netstat -nr 2>/dev/null | awk '/^default/{print $2; exit}')
[ -z "$G" ] && { echo "No gateway — join the unit's hotspot first."; exit 1; }
ADDR="$G:5555"
adb disconnect "$ADDR" >/dev/null 2>&1; adb kill-server >/dev/null 2>&1; adb start-server >/dev/null 2>&1; sleep 1
S=""; for i in 1 2 3 4 5 6; do adb connect "$ADDR" >/dev/null 2>&1; sleep 2; S=$(adb -s "$ADDR" get-state 2>/dev/null); [ "$S" = device ] && break; done
echo "unit=$ADDR state=$S" | tee "$OUT"
[ "$S" = device ] || { echo "adb offline over hotspot; try again" | tee -a "$OUT"; exit 1; }

cat > /tmp/kick-dev.sh <<'DEV'
echo "===== $(date) ====="
echo "ap_ip pinned = $(getprop persist.cpbridge.ap_ip)"
echo "ap0 live     = $(ip -4 -o addr show ap0 2>/dev/null | sed -n 's#.*inet \([0-9.]*\)/.*#\1#p' | head -1)"
echo "--- bridge running before? ---"; ps -A 2>/dev/null | grep cpbridge || echo "NOT running"
pm enable --user 0 com.cpbridge >/dev/null 2>&1
am force-stop com.cpbridge >/dev/null 2>&1
echo "--- starting bridge + screen via su ---"
am start-foreground-service -n com.cpbridge/.BridgeService
am start-foreground-service -n app.carplayscreen/.Watcher
sleep 3
echo "--- bridge running after? ---"; ps -A 2>/dev/null | grep cpbridge || echo "NOT running"
echo "--- waiting ~25s for a dial/handshake ---"; sleep 25
echo "--- bridge log tail (want a NEW dial with apIp=<the live ip>, reaching 0x4301, no 0xAA04) ---"
tail -45 /data/media/0/Android/data/com.cpbridge/files/cpbridge.log 2>/dev/null
DEV
adb -s "$ADDR" push /tmp/kick-dev.sh /data/local/tmp/kick-dev.sh >/dev/null 2>&1
adb -s "$ADDR" shell su 0 sh /data/local/tmp/kick-dev.sh 2>&1 | tr -d '\r' | tee -a "$OUT"
echo "================================================================" | tee -a "$OUT"
echo "Saved to: $OUT"
echo ">>> WATCH the unit: does CarPlay come up now? Then rejoin home Wi-Fi and say 'kick ready'."
