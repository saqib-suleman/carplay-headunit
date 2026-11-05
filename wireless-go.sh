#!/usr/bin/env bash
# FINAL attempt: pin ch6 + real creds + CORRECT ap_ip (the fix), (re)start authd + bridge, then watch
# for the iPhone to connect to ap0:7000 and CarPlay to appear. Uses grep (not awk) for port checks.
# Run on the unit's hotspot (iPhone Wi-Fi ON, bonded, unlocked). ~3 min watch. Saves wireless-session.log.
set -uo pipefail
DIR="$(cd "$(dirname "$0")" && pwd)"
LOG="$DIR/wireless-session.log"; : > "$LOG"; exec > >(tee -a "$LOG") 2>&1
export PATH="${ANDROID_HOME:-$HOME/Library/Android/sdk}/platform-tools:$PATH"
REF="$DIR/headunit-carplay-ref"

echo "================ wireless-go (final) $(date) ================"
adb kill-server >/dev/null 2>&1 || true; adb start-server >/dev/null 2>&1 || true
ADDR=""
for i in $(seq 1 20); do
  AP_IP=$(netstat -nr 2>/dev/null | awk '/^default/{print $2; exit}')
  [ -z "$AP_IP" ] && { echo "   [$i] no gateway yet (join the unit's hotspot)"; sleep 3; continue; }
  ADDR="$AP_IP:5555"; export ANDROID_SERIAL="$ADDR"
  adb disconnect "$ADDR" >/dev/null 2>&1 || true; adb connect "$ADDR" >/dev/null 2>&1; sleep 2
  st=$(adb get-state 2>/dev/null); echo "   [$i] gw=$AP_IP state=${st:-none}"
  [ "$st" = device ] && break; sleep 1
done
[ "$(adb get-state 2>/dev/null)" = device ] || { echo "!! not connected"; adb devices -l; exit 1; }
echo ">>> connected to $ADDR (this IP is the AP; the bridge must send it in 0x4301)"

p7() { adb shell su 0 grep -i 1B58 /proc/net/tcp /proc/net/tcp6 2>/dev/null | tr -d '\r'; }
echo ">>> receiver on 7000 now? (0A=listen, 01=ESTABLISHED)"; p7 | sed 's/^/   /'

echo; echo ">>> pin ch6 + creds + CORRECT ap_ip, via apfix"
adb push "$DIR/tools/apfix.sh" /data/local/tmp/apfix.sh >/dev/null
adb shell su 0 sh /data/local/tmp/apfix.sh fixall 2>&1 | tr -d '\r' | grep -iE 'PINNED|verify|ap_ip|channel|STATUS after' | sed 's/^/   /'
adb connect "$ADDR" >/dev/null 2>&1 || true; sleep 1

echo; echo ">>> authd + bridge"
adb shell su 0 env CPAUTH_LIB=/system/lib64/libCoreUtils.so /data/local/tmp/authd spawn >/dev/null 2>&1 || true
sleep 2
echo "   authd: $(adb shell su 0 /data/local/tmp/authd status 2>&1 | tr -d '\r')"
adb shell am force-stop com.cpbridge >/dev/null 2>&1 || true; sleep 1
adb shell am start-foreground-service -n com.cpbridge/.BridgeService >/dev/null 2>&1 || true

echo; echo ">>> iPhone: Wi-Fi ON, bonded, off USB, UNLOCKED. WATCH THE UNIT SCREEN."
echo ">>> Watching ~3 min. SUCCESS = a '01' (ESTABLISHED) line on :1B58 from the iPhone + CarPlay screen."
END=$(( $(date +%s) + 180 ))
while [ "$(date +%s)" -lt "$END" ]; do
  echo "---- $(date +%H:%M:%S) ----"
  echo "   [7000 sockets]"; p7 | sed 's/^/     /'
  echo "   [AP stations / AirPlay / CarPlay session / AUDIO streams]"
  adb shell "logcat -d -t 120 2>/dev/null | grep -aiE 'is connected|is disconnected|AirPlay|CarPlay|RTSP|setNightMode|HTTPServer|screen|session|AudioStream|streamID|onStreamStateChanged|StreamController|VideoStream' | grep -aivE 'PlayCommon|cpbridge|Operator'" 2>&1 | tr -d '\r' | tail -8 | sed 's/^/     /'
  echo "   [bridge last stage]"
  TAIL=20 "$REF/scripts/bridge-log.sh" "$ADDR" 2>&1 | grep -aE 'stage=g_carplay|0x4301|apIp|AUTH SUCCEEDED' | tail -2 | sed 's/^/     /'
  sleep 15
done
echo; echo "================ DONE ================"
echo "CarPlay screen up? Rejoin home Wi-Fi and tell Claude 'done' (+ whether the screen appeared). Log: $LOG"
