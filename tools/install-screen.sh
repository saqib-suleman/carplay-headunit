#!/usr/bin/env bash
# Install the rebuilt screen app (carplay-screen/CarPlay.apk) onto the unit and restart its Watcher.
# Works over the unit's HOTSPOT (join it first) or wired home Wi-Fi (pass ADDR).
#   on hotspot:  bash tools/install-screen.sh
#   on wired:    bash tools/install-screen.sh 192.168.1.44:5555
set -uo pipefail
DIR="$(cd "$(dirname "$0")/.." && pwd)"
export PATH="${ANDROID_HOME:-$HOME/Library/Android/sdk}/platform-tools:$PATH"
APK="$DIR/headunit-carplay-ref/carplay-screen/CarPlay.apk"
[ -f "$APK" ] || { echo "APK not found: $APK"; exit 1; }

adb kill-server >/dev/null 2>&1 || true; adb start-server >/dev/null 2>&1 || true
if [ $# -ge 1 ]; then ADDR="$1"; else
  G=$(netstat -nr 2>/dev/null | awk '/^default/{print $2; exit}')
  [ -z "$G" ] && { echo "No gateway — join the unit's hotspot or pass ADDR."; exit 1; }
  ADDR="$G:5555"
fi
S=""; for i in 1 2 3 4 5 6; do adb connect "$ADDR" >/dev/null 2>&1; sleep 2; S=$(adb -s "$ADDR" get-state 2>/dev/null); [ "$S" = device ] && break; done
echo "unit=$ADDR state=$S"
[ "$S" = device ] || { echo "adb offline; try again"; exit 1; }

echo ">>> installing screen app"
adb -s "$ADDR" install -r "$APK" 2>&1 | tr -d '\r' | tail -2
echo ">>> restarting Watcher (via su)"
adb -s "$ADDR" shell su 0 sh -c 'am force-stop app.carplayscreen; am start-foreground-service -n app.carplayscreen/.Watcher' 2>&1 | tr -d '\r'
echo ">>> done. In wireless mode the app now RELEASES the CarPlay audio route so Bluetooth A2DP keeps"
echo "    the sound on the car. Disconnect/reconnect CarPlay (or lock/unlock the phone) so it re-runs,"
echo "    then play music and check the car speakers."
