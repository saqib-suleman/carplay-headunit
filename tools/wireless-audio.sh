#!/usr/bin/env bash
# Run ON THE UNIT'S HOTSPOT while wireless CarPlay is showing. Frees Bluetooth for A2DP audio by
# force-stopping the bridge (the CarPlay screen stays — it's already handed off to Wi-Fi), then
# captures the A2DP / audio-routing state. Saves to wireless-data/audio-<timestamp>.txt.
# LISTEN after it runs: does CarPlay audio move to the car speakers?
set -uo pipefail
DIR="$(cd "$(dirname "$0")/.." && pwd)"
export PATH="${ANDROID_HOME:-$HOME/Library/Android/sdk}/platform-tools:$PATH"
mkdir -p "$DIR/wireless-data"
OUT="$DIR/wireless-data/audio-$(date +%s).txt"

G=$(netstat -nr 2>/dev/null | awk '/^default/{print $2; exit}')
[ -z "$G" ] && { echo "No gateway — join the unit's hotspot first."; exit 1; }
ADDR="$G:5555"
adb disconnect "$ADDR" >/dev/null 2>&1; adb kill-server >/dev/null 2>&1; adb start-server >/dev/null 2>&1; sleep 1
S=""; for i in 1 2 3 4 5 6; do adb connect "$ADDR" >/dev/null 2>&1; sleep 2; S=$(adb -s "$ADDR" get-state 2>/dev/null); [ "$S" = device ] && break; done
echo "unit=$ADDR state=$S" | tee "$OUT"
[ "$S" = device ] || { echo "adb offline over hotspot; try again" | tee -a "$OUT"; exit 1; }

cat > /tmp/cp-audio-dev.sh <<'DEV'
echo "===== $(date) ====="
echo "--- BEFORE: A2DP / BT state ---"
dumpsys bluetooth_manager 2>/dev/null | grep -iE "mConnectionState|a2dp|iphone|StateMachine: Connected|activedevice" | head -30
echo "--- BEFORE: audio routing ---"
dumpsys audio 2>/dev/null | grep -iE "a2dp|bluetooth|mConnectedDevices|route|setDeviceConnectionState|sco" | head -30
echo "--- force-stopping bridge to free BT for A2DP (screen is on Wi-Fi, stays up) ---"
am force-stop com.cpbridge
sleep 6
echo "--- AFTER: A2DP / BT state ---"
dumpsys bluetooth_manager 2>/dev/null | grep -iE "mConnectionState|a2dp|iphone|StateMachine: Connected|activedevice" | head -30
echo "--- AFTER: audio routing ---"
dumpsys audio 2>/dev/null | grep -iE "a2dp|bluetooth|mConnectedDevices|route|sco" | head -30
echo "--- is the bridge still stopped? ---"
pm list packages -d | grep cpbridge && echo "DISABLED" || ( ps -A 2>/dev/null | grep -q cpbridge && echo "running" || echo "stopped" )
DEV
adb -s "$ADDR" push /tmp/cp-audio-dev.sh /data/local/tmp/cp-audio-dev.sh >/dev/null 2>&1
adb -s "$ADDR" shell su 0 sh /data/local/tmp/cp-audio-dev.sh 2>&1 | tr -d '\r' | tee -a "$OUT"
echo "================================================================" | tee -a "$OUT"
echo "Saved to: $OUT"
echo ">>> LISTEN NOW: did CarPlay audio move to the car speakers? Then tell Claude 'audio ready'."
