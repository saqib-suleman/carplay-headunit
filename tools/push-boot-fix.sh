#!/usr/bin/env bash
# Push the (fixed) boot script onto the unit and reboot, so the NEXT boot brings up wireless CarPlay
# laptop-free. Works over the unit's HOTSPOT (join it first) or over wired home Wi-Fi (pass ADDR).
# One-time install step; after this, the connection at each boot needs no laptop.
#   on the hotspot:   bash tools/push-boot-fix.sh
#   on home wifi:     bash tools/push-boot-fix.sh 192.168.1.44:5555
set -uo pipefail
DIR="$(cd "$(dirname "$0")/.." && pwd)"
export PATH="${ANDROID_HOME:-$HOME/Library/Android/sdk}/platform-tools:$PATH"

adb kill-server >/dev/null 2>&1 || true; adb start-server >/dev/null 2>&1 || true
if [ $# -ge 1 ]; then ADDR="$1"; else
  G=$(netstat -nr 2>/dev/null | awk '/^default/{print $2; exit}')
  [ -z "$G" ] && { echo "No gateway — join the unit's hotspot, or pass ADDR."; exit 1; }
  ADDR="$G:5555"
fi
adb connect "$ADDR" >/dev/null 2>&1; sleep 2
[ "$(adb -s "$ADDR" get-state 2>/dev/null)" = device ] || { echo "!! not connected to $ADDR"; adb devices -l; exit 1; }
echo "unit = $ADDR"

echo ">>> adb root + reconnect + remount (USB must be unplugged)"
adb -s "$ADDR" root >/dev/null 2>&1; sleep 6
for i in $(seq 1 12); do adb disconnect "$ADDR" >/dev/null 2>&1; adb connect "$ADDR" >/dev/null 2>&1; sleep 3; [ "$(adb -s "$ADDR" get-state 2>/dev/null)" = device ] && break; done
[ "$(adb -s "$ADDR" shell id -u | tr -d '\r')" = 0 ] || { echo "!! no root"; exit 1; }
adb -s "$ADDR" remount >/dev/null 2>&1
adb -s "$ADDR" shell 'test -w /vendor/bin && echo rw || echo ro' | tr -d '\r' | grep -q rw || { echo "!! /vendor not writable"; exit 1; }

echo ">>> pushing fixed boot script"
adb -s "$ADDR" push "$DIR/tools/carplay-boot.sh" /vendor/bin/carplay-boot.sh | tr -d '\r' | tail -1
adb -s "$ADDR" shell 'chmod 755 /vendor/bin/carplay-boot.sh; chown root:root /vendor/bin/carplay-boot.sh; sync'
echo ">>> verify the init service is still registered to run it"
adb -s "$ADDR" shell 'su 0 grep -n "service carplay_wl" /vendor/etc/init/hw/init.ac8257.rc' | tr -d '\r'
echo ">>> clearing old boot marker"
adb -s "$ADDR" shell 'rm -f /data/local/tmp/carplay-boot.log' 2>/dev/null

echo ">>> rebooting — the unit will come up and bring wireless CarPlay up on its own (no laptop)."
adb -s "$ADDR" reboot >/dev/null 2>&1
echo "================================================================"
echo "Keep the iPhone unlocked (BT+WiFi on, NOT on USB). Give it a few minutes —"
echo "the hotspot can take a bit to appear, and the boot script now waits up to 6 min for it,"
echo "starts authd first, and re-enables the bridge. CarPlay should come up with no laptop."
echo "To check afterwards (rejoin hotspot): bash tools/wireless-diag.sh"
echo "================================================================"
