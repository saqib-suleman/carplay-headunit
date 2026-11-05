#!/usr/bin/env bash
# Return the unit to WIRED-ONLY CarPlay: no hotspot, no Bluetooth dialing, no wireless attempts.
# Run while the Mac is on the unit's hotspot (the unit is currently in wireless mode).
#   1. reverts /vendor/build.prop ro.atc.carplay.wireless 1 -> 0 (safe: backup + read-back)
#   2. disables the bridge app so it stops trying to reach the iPhone over Bluetooth
#   3. reboots -> unit comes back on home Wi-Fi doing normal wired CarPlay
# Reversible: re-enable with  ./wired-only.sh undo   (sets flag back to 1 + re-enables the bridge)
set -uo pipefail
DIR="$(cd "$(dirname "$0")" && pwd)"
export PATH="${ANDROID_HOME:-$HOME/Library/Android/sdk}/platform-tools:$PATH"
MODE="${1:-wired}"   # wired (default) | undo
if [ "$MODE" = undo ]; then FROM=0; TO=1; else FROM=1; TO=0; fi

echo "================ wired-only ($MODE: flag $FROM -> $TO) $(date) ================"
adb kill-server >/dev/null 2>&1 || true; adb start-server >/dev/null 2>&1 || true
ADDR=""
for i in $(seq 1 15); do
  AP_IP=$(netstat -nr 2>/dev/null | awk '/^default/{print $2; exit}')
  [ -z "$AP_IP" ] && { echo "   [$i] no gateway yet (join the unit's hotspot)"; sleep 3; continue; }
  ADDR="$AP_IP:5555"; export ANDROID_SERIAL="$ADDR"
  adb disconnect "$ADDR" >/dev/null 2>&1 || true; adb connect "$ADDR" >/dev/null 2>&1; sleep 2
  [ "$(adb get-state 2>/dev/null)" = device ] && break; sleep 1
done
[ "$(adb get-state 2>/dev/null)" = device ] || { echo "!! not connected"; adb devices -l; exit 1; }
echo ">>> connected to $ADDR"

echo ">>> getting root + remounting /vendor rw"
adb root >/dev/null 2>&1; sleep 3; adb connect "$ADDR" >/dev/null 2>&1
adb remount >/dev/null 2>&1 || true
adb shell 'test -w /vendor/build.prop && echo WRITABLE || echo readonly' | tr -d '\r' | grep -q WRITABLE || {
  echo "!! /vendor not writable (adb root/remount failed) — aborting, nothing changed"; exit 1; }

echo ">>> backing up build.prop"
mkdir -p "$DIR/backup"
adb exec-out su 0 cat /vendor/build.prop > "$DIR/backup/vendor-build.prop.$MODE.$(date +%s)" 2>/dev/null
SZ=$(adb shell 'wc -c < /vendor/build.prop' | tr -d '\r ')
echo "   current: $(adb shell 'grep "^ro.atc.carplay.wireless=" /vendor/build.prop' | tr -d '\r')  size=$SZ"

echo ">>> writing flag = $TO (edit a copy in /data, then cat it over — sed -i can't temp on /vendor)"
adb shell "sed 's/^ro.atc.carplay.wireless=$FROM\$/ro.atc.carplay.wireless=$TO/' /vendor/build.prop > /data/local/tmp/bp.rev"
adb shell 'cat /data/local/tmp/bp.rev > /vendor/build.prop; sync'
LINE=$(adb shell 'grep "^ro.atc.carplay.wireless=" /vendor/build.prop' | tr -d '\r')
SZ2=$(adb shell 'wc -c < /vendor/build.prop' | tr -d '\r ')
if [ "$LINE" = "ro.atc.carplay.wireless=$TO" ] && [ "$SZ2" = "$SZ" ]; then
  echo "   OK: $LINE (size unchanged)"
  adb shell 'rm -f /data/local/tmp/bp.rev'
else
  echo "   !! MISMATCH ($LINE size=$SZ2 vs $SZ) — restoring backup, NOT rebooting"
  cat "$DIR"/backup/vendor-build.prop.$MODE.* 2>/dev/null | tail -1 >/dev/null
  BK=$(ls -t "$DIR"/backup/vendor-build.prop.$MODE.* | head -1)
  cat "$BK" | adb shell 'cat > /vendor/build.prop'; adb shell sync
  exit 1
fi

if [ "$MODE" = undo ]; then
  echo ">>> re-enabling the bridge"
  adb shell pm enable com.cpbridge 2>&1 | tr -d '\r' || true
else
  echo ">>> disabling the bridge (stops Bluetooth dialing) + stopping authd"
  adb shell pm disable-user --user 0 com.cpbridge 2>&1 | tr -d '\r' || true
  adb shell am force-stop com.cpbridge >/dev/null 2>&1 || true
  adb shell su 0 /data/local/tmp/authd stop >/dev/null 2>&1 || true
fi

echo ">>> rebooting into $([ "$MODE" = undo ] && echo wireless || echo wired) mode"
adb shell su 0 svc power reboot >/dev/null 2>&1 || adb reboot >/dev/null 2>&1 || true
echo "================ DONE — unit rebooting; it will come back on home Wi-Fi ================"
