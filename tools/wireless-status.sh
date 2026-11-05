#!/usr/bin/env bash
# Read-only status capture (ON THE UNIT'S HOTSPOT). Shows what the boot automation did this boot and
# where it stopped, WITHOUT changing anything. Saves to wireless-data/status-<timestamp>.txt.
set -uo pipefail
DIR="$(cd "$(dirname "$0")/.." && pwd)"
export PATH="${ANDROID_HOME:-$HOME/Library/Android/sdk}/platform-tools:$PATH"
mkdir -p "$DIR/wireless-data"
OUT="$DIR/wireless-data/status-$(date +%s).txt"

G=$(netstat -nr 2>/dev/null | awk '/^default/{print $2; exit}')
[ -z "$G" ] && { echo "No gateway — join the unit's hotspot first."; exit 1; }
ADDR="$G:5555"
adb disconnect "$ADDR" >/dev/null 2>&1; adb kill-server >/dev/null 2>&1; adb start-server >/dev/null 2>&1; sleep 1
S=""; for i in 1 2 3 4 5 6; do adb connect "$ADDR" >/dev/null 2>&1; sleep 2; S=$(adb -s "$ADDR" get-state 2>/dev/null); [ "$S" = device ] && break; done
echo "unit=$ADDR state=$S" | tee "$OUT"
[ "$S" = device ] || { echo "adb offline over hotspot; try again" | tee -a "$OUT"; exit 1; }

cat > /tmp/cp-status-dev.sh <<'DEV'
echo "===== $(date) ====="
echo "--- carplay_wl boot log (what the init service did THIS boot) ---"
grep -a carplay_wl /data/misc/bwlog/kernellog/kernel.log 2>/dev/null | tail -15
echo "--- which authd binary is the boot script using? (should be /data/local/tmp) ---"
grep -n "AUTHD=" /vendor/bin/carplay-boot.sh
echo "--- authd running? + selftest (want RESULT: PASS, NO dlopen error) ---"
/data/local/tmp/authd status 2>/dev/null || echo "authd not running"
/data/local/tmp/authd selftest 1 2>/dev/null | tail -6
echo "--- ap0 live vs pinned ---"
echo "live ap0 = $(ip -4 -o addr show ap0 2>/dev/null | sed -n 's#.*inet \([0-9.]*\)/.*#\1#p' | head -1)"
echo "pinned   = $(getprop persist.cpbridge.ap_ip)"
echo "--- receiver on 7000? ---"
grep -i 1B58 /proc/net/tcp /proc/net/tcp6 2>/dev/null | head
echo "--- bridge pm state ---"
pm list packages -d | grep cpbridge && echo "DISABLED" || echo "enabled"
echo "--- A2DP sink state ---"
dumpsys bluetooth_manager 2>/dev/null | grep -iE "A2dpSink.*state|A2DP Sink State"
echo "--- bridge log tail (how far did the handshake get? 0xAA04=auth fail) ---"
tail -40 /data/media/0/Android/data/com.cpbridge/files/cpbridge.log 2>/dev/null
DEV
adb -s "$ADDR" push /tmp/cp-status-dev.sh /data/local/tmp/cp-status-dev.sh >/dev/null 2>&1
adb -s "$ADDR" shell su 0 sh /data/local/tmp/cp-status-dev.sh 2>&1 | tr -d '\r' | tee -a "$OUT"
echo "================================================================" | tee -a "$OUT"
echo "Saved to: $OUT  — rejoin home Wi-Fi and tell Claude 'status ready'."
