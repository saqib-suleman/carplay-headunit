#!/usr/bin/env bash
# FAST path (least car time): install ONLY the rebuilt bridge APK -- fixes A/B/C/E -- with NO root and
# NO reboot, in ~15s, then restart the bridge so the new code runs. Validate the core connect fixes on
# a warm hotspot right away. It does NOT update the boot daemon (fix D) or the on/off toggle; those need
# the one-time `bash tools/push-fixes.sh` (root + reboot). Hotspot (auto-detect) or wired (pass ADDR).
#   on hotspot:  bash tools/install-bridge.sh
#   on wired:    bash tools/install-bridge.sh 192.168.1.44:5555
set -uo pipefail
DIR="$(cd "$(dirname "$0")/.." && pwd)"
export PATH="${ANDROID_HOME:-$HOME/Library/Android/sdk}/platform-tools:$PATH"
APK="$DIR/headunit-carplay-ref/client/CarPlayBridge.apk"
[ -f "$APK" ] || { echo "!! missing APK: $APK  (build: cd headunit-carplay-ref/client && bash build.sh)"; exit 1; }

adb kill-server >/dev/null 2>&1 || true; adb start-server >/dev/null 2>&1 || true
if [ $# -ge 1 ]; then ADDR="$1"; else
  G=$(netstat -nr 2>/dev/null | awk '/^default/{print $2; exit}')
  [ -z "$G" ] && { echo "No gateway — join the unit's hotspot or pass ADDR."; exit 1; }
  ADDR="$G:5555"
fi
S=""; for i in 1 2 3 4 5 6; do adb connect "$ADDR" >/dev/null 2>&1; sleep 2; S=$(adb -s "$ADDR" get-state 2>/dev/null); [ "$S" = device ] && break; done
echo "unit=$ADDR state=$S"
[ "$S" = device ] || { echo "adb offline; try again"; exit 1; }

echo ">>> installing rebuilt bridge APK (A: live ap0 IP / defer, B: bounded handoff grace, C: timing, E: negotiation deadline)"
OUT=$(adb -s "$ADDR" install -r "$APK" 2>&1 | tr -d '\r')
echo "$OUT" | grep -q 'Success' || { echo "!! install FAILED -> $(echo "$OUT" | grep -iE 'fail|error' | tail -1)"; echo "not restarting anything."; exit 1; }
echo "    installed OK"
echo ">>> restarting the bridge + screen app so the new code runs now"
adb -s "$ADDR" shell su 0 sh -c 'am force-stop com.cpbridge; am start-foreground-service -n app.carplayscreen/.Watcher; am start-foreground-service -n com.cpbridge/.BridgeService' 2>&1 | tr -d '\r'
echo "================================================================"
echo ">>> done (~15s, no root, no reboot). Keep the iPhone UNLOCKED, BT + Wi-Fi on, NOT on USB."
echo "Watch one connect and grab the +Nms timing stamps:"
echo "    bash tools/wireless-diag.sh"
echo "Note: this tests the APK fixes only. The daemon fix (D) + the on/off toggle need the one-time"
echo "full install:  bash tools/push-fixes.sh"
echo "================================================================"
