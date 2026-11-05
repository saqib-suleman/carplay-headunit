#!/usr/bin/env bash
# Reboot the head unit. Works over the unit's HOTSPOT (join it first; auto-detects the gateway) or
# over wired home Wi-Fi (pass the address).
#   on hotspot:  bash tools/reboot-unit.sh
#   on wired:    bash tools/reboot-unit.sh 192.168.1.44:5555
set -uo pipefail
export PATH="${ANDROID_HOME:-$HOME/Library/Android/sdk}/platform-tools:$PATH"

adb kill-server >/dev/null 2>&1 || true; adb start-server >/dev/null 2>&1 || true
if [ $# -ge 1 ]; then ADDR="$1"; else
  G=$(netstat -nr 2>/dev/null | awk '/^default/{print $2; exit}')
  [ -z "$G" ] && { echo "No gateway found — join the unit's hotspot, or pass the address."; exit 1; }
  ADDR="$G:5555"
fi

S=""; for i in 1 2 3 4 5 6; do adb connect "$ADDR" >/dev/null 2>&1; sleep 2; S=$(adb -s "$ADDR" get-state 2>/dev/null); [ "$S" = device ] && break; done
echo "unit=$ADDR state=$S"
[ "$S" = device ] || { echo "Could not reach the unit (adb offline). Try again."; exit 1; }

echo ">>> rebooting the unit"
adb -s "$ADDR" shell su 0 svc power reboot >/dev/null 2>&1 || adb -s "$ADDR" reboot >/dev/null 2>&1 || true
echo ">>> reboot issued. It will come back on its own hotspot in a few minutes;"
echo "    keep the iPhone's Bluetooth on and CarPlay should come up by itself."
