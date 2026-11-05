#!/usr/bin/env bash
# One-shot installer for a car visit. Run on the unit's hotspot (the unit is in persistent wireless
# mode). Installs/updates the three apps, grants phone perms, arms the call service. Idempotent.
set -uo pipefail
DIR="$(cd "$(dirname "$0")" && pwd)"
export PATH="${ANDROID_HOME:-$HOME/Library/Android/sdk}/platform-tools:$PATH"

echo "================ car-setup $(date) ================"
adb kill-server >/dev/null 2>&1 || true; adb start-server >/dev/null 2>&1 || true
ADDR=""
for i in $(seq 1 15); do
  AP_IP=$(netstat -nr 2>/dev/null | awk '/^default/{print $2; exit}')
  [ -z "$AP_IP" ] && { echo "   [$i] no gateway (join the unit's hotspot)"; sleep 3; continue; }
  ADDR="$AP_IP:5555"; export ANDROID_SERIAL="$ADDR"
  adb disconnect "$ADDR" >/dev/null 2>&1 || true; adb connect "$ADDR" >/dev/null 2>&1; sleep 2
  [ "$(adb get-state 2>/dev/null)" = device ] && break; sleep 1
done
[ "$(adb get-state 2>/dev/null)" = device ] || { echo "!! not connected"; adb devices -l; exit 1; }
echo ">>> connected to $ADDR"

echo; echo ">>> installing the screen app (SOURCE+media buttons, robust Watcher)"
adb install -r "$DIR/headunit-carplay-ref/carplay-screen/CarPlay.apk" 2>&1 | tr -d '\r' | grep -iE 'Success|Failure' || true
echo ">>> installing Head Unit Helper (restart + call accept/reject + SOURCE call-audio)"
adb install -r "$DIR/restart-app/HeadUnitHelper.apk" 2>&1 | tr -d '\r' | grep -iE 'Success|Failure' || true
echo ">>> ensuring the wireless bridge is installed"
adb install -r "$DIR/headunit-carplay-ref/client/CarPlayBridge.apk" 2>&1 | tr -d '\r' | grep -iE 'Success|Failure' || true

echo; echo ">>> granting Head Unit Helper phone perms (runtime, not auto-granted)"
adb shell pm grant app.restart android.permission.READ_PHONE_STATE 2>&1 | tr -d '\r'
adb shell pm grant app.restart android.permission.ANSWER_PHONE_CALLS 2>&1 | tr -d '\r'
echo ">>> launching Head Unit Helper once (arms the call-control service)"
adb shell am start -n app.restart/.MainActivity >/dev/null 2>&1 || true

echo; echo ">>> verify"
echo "   CarPlay screen app: $(adb shell pm path app.carplayscreen | tr -d '\r')"
echo "   Head Unit Helper:   $(adb shell pm path app.restart | tr -d '\r')"
echo "   Bridge:             $(adb shell pm path com.cpbridge | tr -d '\r')"
echo "   phone perms:        $(adb shell dumpsys package app.restart | grep -cE 'ANSWER_PHONE_CALLS: granted=true|READ_PHONE_STATE: granted=true' | tr -d '\r') of 2 granted"
echo; echo "================ SETUP DONE — next: ./wireless-capture.sh start ================"
