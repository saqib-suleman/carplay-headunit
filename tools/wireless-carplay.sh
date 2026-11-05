#!/usr/bin/env bash
# Toggle wireless CarPlay on/off at runtime — no reboot, persists across reboots.
#   off -> stops the bridge; the unit becomes a normal Bluetooth stereo (A2DP music + phone calls),
#          no wireless CarPlay dialing.
#   on  -> resumes wireless CarPlay (the boot daemon re-starts + dials the bridge within a few seconds).
# Works over the unit's HOTSPOT (auto-detects) or wired home Wi-Fi (pass ADDR).
#   bash tools/wireless-carplay.sh on
#   bash tools/wireless-carplay.sh off
#   bash tools/wireless-carplay.sh off 192.168.1.44:5555
set -uo pipefail
export PATH="${ANDROID_HOME:-$HOME/Library/Android/sdk}/platform-tools:$PATH"

MODE="${1:-}"
case "$MODE" in
  on)  V=1 ;;
  off) V=0 ;;
  *)   echo "usage: $0 on|off [adb-address]"; exit 2 ;;
esac

adb kill-server >/dev/null 2>&1 || true; adb start-server >/dev/null 2>&1 || true
if [ $# -ge 2 ]; then ADDR="$2"; else
  G=$(netstat -nr 2>/dev/null | awk '/^default/{print $2; exit}')
  [ -z "$G" ] && { echo "No gateway — join the unit's hotspot or pass the address."; exit 1; }
  ADDR="$G:5555"
fi
S=""; for i in 1 2 3 4 5 6; do adb connect "$ADDR" >/dev/null 2>&1; sleep 2; S=$(adb -s "$ADDR" get-state 2>/dev/null); [ "$S" = device ] && break; done
echo "unit=$ADDR state=$S"
[ "$S" = device ] || { echo "adb offline; try again"; exit 1; }

# Set the persistent toggle; on OFF also stop the bridge now (the daemon honors the prop within ~5s).
if [ "$V" = 0 ]; then
  adb -s "$ADDR" shell su 0 sh -c 'setprop persist.cpbridge.wl_on 0; am force-stop com.cpbridge' 2>&1 | tr -d '\r'
  echo ">>> wireless CarPlay OFF. The unit is now a normal Bluetooth stereo (music + calls)."
else
  adb -s "$ADDR" shell su 0 sh -c 'setprop persist.cpbridge.wl_on 1' 2>&1 | tr -d '\r'
  echo ">>> wireless CarPlay ON. It will connect within a few seconds / on next boot."
fi
echo "now: persist.cpbridge.wl_on=$(adb -s "$ADDR" shell getprop persist.cpbridge.wl_on | tr -d '\r')"
