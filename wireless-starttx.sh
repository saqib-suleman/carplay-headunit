#!/usr/bin/env bash
# Get the vendor AirPlay receiver (port 7000) to start WITHOUT a reboot, by firing the vendor's own
# CarPlay-start trigger (the missing client app would have sent it), then verify port 7000 and, if up,
# run the handshake. Diagnoses the vendor service's components/logs along the way. Run on the hotspot.
set -uo pipefail
DIR="$(cd "$(dirname "$0")" && pwd)"
LOG="$DIR/wireless-session.log"; : > "$LOG"; exec > >(tee -a "$LOG") 2>&1
export PATH="${ANDROID_HOME:-$HOME/Library/Android/sdk}/platform-tools:$PATH"
REF="$DIR/headunit-carplay-ref"

echo "================ wireless-starttx $(date) ================"
adb kill-server >/dev/null 2>&1 || true; adb start-server >/dev/null 2>&1 || true
ADDR=""
for i in $(seq 1 12); do
  AP_IP=$(netstat -nr 2>/dev/null | awk '/^default/{print $2; exit}')
  [ -z "$AP_IP" ] && { echo "   [$i] no gateway yet"; sleep 3; continue; }
  ADDR="$AP_IP:5555"; export ANDROID_SERIAL="$ADDR"
  adb disconnect "$ADDR" >/dev/null 2>&1 || true; adb connect "$ADDR" >/dev/null 2>&1; sleep 2
  st=$(adb get-state 2>/dev/null); echo "   [$i] gw=$AP_IP state=${st:-none}"
  [ "$st" = device ] && break; sleep 1
done
[ "$(adb get-state 2>/dev/null)" = device ] || { echo "!! not connected"; adb devices -l; exit 1; }
echo ">>> connected to $ADDR"
g() { adb shell su 0 sh -c "$1" 2>&1 | tr -d '\r' | sed 's/^/   /'; }

echo; echo "===== [0] pulling the vendor CarPlay service APK (for offline decompile) ====="
mkdir -p "$DIR/vendor-dump"
adb pull /system/app/CarplayService "$DIR/vendor-dump/" 2>&1 | tr -d '\r' | sed 's/^/   /' || true
adb pull /system/priv-app/CarplayService "$DIR/vendor-dump/" 2>&1 | tr -d '\r' | sed 's/^/   /' || true
ls -la "$DIR/vendor-dump" 2>/dev/null | sed 's/^/   /'
port7000() { adb shell su 0 sh -c 'awk "{print \$2, \$4}" /proc/net/tcp /proc/net/tcp6 2>/dev/null | grep -iE ":1B58"' 2>&1 | tr -d '\r'; }

echo; echo "===== [A] vendor carplay service components (services/receivers + their actions) ====="
g 'dumpsys package com.autochips.carplay 2>/dev/null | grep -iE "Service|Receiver|Activity|filter|Action:|carplay|START" | head -60'

echo; echo "===== [B] carplay_on + wireless flag ====="
g 'echo carplay_on=$(settings get global carplay_on); echo wireless=$(getprop ro.atc.carplay.wireless); echo client.action=$(getprop ro.atc.carplay.client.action)'

echo; echo "===== [C] vendor service recent log (pid-filtered) — why no receiver/7000 ====="
VPID=$(adb shell pidof com.autochips.carplay 2>/dev/null | tr -d '\r')
echo "   com.autochips.carplay pid=$VPID"
adb shell "logcat -d -t 3000 2>/dev/null | grep -iE 'carplay|airplay|7000|plugin|receiver|wireless|not enabled|AirTunes|RTSP' | grep -ivE 'cpbridge|CPBRIDGE' | tail -40" 2>&1 | tr -d '\r' | sed 's/^/   /'

echo; echo "===== [D] port 7000 BEFORE trigger ====="
b=$(port7000); echo "   ${b:-NONE on 7000}"

echo; echo "===== [E] firing the vendor CarPlay-start trigger (several safe forms) ====="
ACT=$(adb shell getprop ro.atc.carplay.client.action 2>/dev/null | tr -d '\r'); ACT=${ACT:-com.autochips.carplay.START_CARPLAY_SERVICE}
echo "   action=$ACT"
g "am startservice -a '$ACT' -n com.autochips.carplay/.CarPlayService 2>&1; echo '---'; am startservice -a '$ACT' 2>&1; echo '---'; am start-foreground-service -a '$ACT' 2>&1; echo '---'; am broadcast -a '$ACT' 2>&1"

echo; echo "===== [F] port 7000 AFTER trigger (poll ~25s) ====="
up=""
for i in 1 2 3 4 5; do sleep 5; p=$(port7000); echo "   [$i] ${p:-none}"; [ -n "$p" ] && { up=1; break; }; done

if [ -n "$up" ]; then
  echo; echo ">>> PORT 7000 IS UP. Ensuring channel6+creds, restarting bridge, watching for the screen."
  adb push "$DIR/tools/apfix.sh" /data/local/tmp/apfix.sh >/dev/null
  adb shell su 0 sh /data/local/tmp/apfix.sh fixall 2>&1 | tr -d '\r' | grep -iE 'PINNED|channel|STATUS after' | sed 's/^/   /'
  adb connect "$ADDR" >/dev/null 2>&1 || true; sleep 1
  adb shell su 0 env CPAUTH_LIB=/system/lib64/libCoreUtils.so /data/local/tmp/authd spawn >/dev/null 2>&1 || true
  adb shell am force-stop com.cpbridge >/dev/null 2>&1 || true; sleep 1
  adb shell am start-foreground-service -n com.cpbridge/.BridgeService >/dev/null 2>&1 || true
  echo ">>> iPhone: Wi-Fi ON, bonded, off USB, unlocked. Watching ~2 min — WATCH THE UNIT SCREEN."
  END=$(( $(date +%s) + 120 ))
  while [ "$(date +%s)" -lt "$END" ]; do
    echo "---- $(date +%H:%M:%S)  port7000=$(port7000 | head -1) ----"
    TAIL=40 "$REF/scripts/bridge-log.sh" "$ADDR" 2>&1 | grep -aE 'stage=g_carplay|0x4301|AUTH SUCCEEDED|channel=' | tail -4 | sed 's/^/   /'
    sleep 12
  done
else
  echo; echo ">>> Port 7000 still not up after the trigger. The dump in [A]/[C] shows the real start path;"
  echo ">>> the fallback is the author's persistent-flag + reboot method. Tell Claude."
fi
echo; echo "================ DONE ================"
echo "Rejoin home Wi-Fi and tell Claude 'done'. Log: $LOG"
