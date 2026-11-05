#!/usr/bin/env bash
# Quick wireless CarPlay bring-up (no capture). Run on the unit's hotspot. ~10s.
#   ./up.sh
set -uo pipefail
DIR="$(cd "$(dirname "$0")" && pwd)"
export PATH="${ANDROID_HOME:-$HOME/Library/Android/sdk}/platform-tools:$PATH"

adb kill-server >/dev/null 2>&1 || true; adb start-server >/dev/null 2>&1 || true
ADDR=""
for i in $(seq 1 12); do
  AP_IP=$(netstat -nr 2>/dev/null | awk '/^default/{print $2; exit}')
  [ -z "$AP_IP" ] && { echo "   [$i] no gateway yet (join the unit's hotspot)"; sleep 3; continue; }
  ADDR="$AP_IP:5555"; export ANDROID_SERIAL="$ADDR"
  adb disconnect "$ADDR" >/dev/null 2>&1 || true; adb connect "$ADDR" >/dev/null 2>&1; sleep 2
  [ "$(adb get-state 2>/dev/null)" = device ] && break; sleep 1
done
[ "$(adb get-state 2>/dev/null)" = device ] || { echo "!! not connected"; adb devices -l; exit 1; }
echo ">>> connected to $ADDR"
# authd must be present on the unit
adb shell 'su 0 sh -c "[ -x /data/local/tmp/authd ]"' 2>/dev/null || adb push "$DIR/headunit-carplay-ref/authd/authd" /data/local/tmp/authd >/dev/null
adb push "$DIR/tools/bringup-device.sh" /data/local/tmp/bringup-device.sh >/dev/null
adb shell su 0 chmod 755 /data/local/tmp/authd /data/local/tmp/bringup-device.sh 2>/dev/null || true
echo ">>> bringing up wireless CarPlay..."
adb shell su 0 sh /data/local/tmp/bringup-device.sh 2>&1 | tr -d '\r' | sed 's/^/   /'
echo ">>> done. Keep the iPhone unlocked; CarPlay should appear within ~1-2 min."
