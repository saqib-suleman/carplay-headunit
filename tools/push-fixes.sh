#!/usr/bin/env bash
# Flash the connect-reliability fix bundle (review items A-E) onto the unit in one shot, then reboot
# for a clean cold-start measurement. Does BOTH halves:
#   - installs the rebuilt bridge APK  (A: live-ap0 IP + defer-if-unknown, B: bounded handoff grace,
#     C: milestone timing logs, E: iAP2 negotiation deadline)
#   - pushes the fixed boot daemon     (D: daemon no longer force-stops the bridge mid-handshake;
#     starts it only if absent; guards the IP pin)
# Works over the unit's HOTSPOT (join it first; auto-detects the gateway) or wired home Wi-Fi (pass ADDR).
# USB must be UNPLUGGED (adb root wedges network adb when USB is attached on this unit).
#   on the hotspot:  bash tools/push-fixes.sh
#   on home wifi:    bash tools/push-fixes.sh 192.168.1.44:5555
set -uo pipefail
DIR="$(cd "$(dirname "$0")/.." && pwd)"
export PATH="${ANDROID_HOME:-$HOME/Library/Android/sdk}/platform-tools:$PATH"
APK="$DIR/headunit-carplay-ref/client/CarPlayBridge.apk"
SCREEN_APK="$DIR/headunit-carplay-ref/carplay-screen/CarPlay.apk"
HELPER_APK="$DIR/restart-app/HeadUnitHelper.apk"
BOOT="$DIR/tools/carplay-boot.sh"
FLIP="$DIR/tools/cp-hotspot-flip.sh"
[ -f "$APK" ]        || { echo "!! missing bridge APK: $APK  (build: cd headunit-carplay-ref/client && bash build.sh)"; exit 1; }
[ -f "$SCREEN_APK" ] || { echo "!! missing util APK: $SCREEN_APK  (build: cd headunit-carplay-ref/carplay-screen && bash build.sh)"; exit 1; }
[ -f "$HELPER_APK" ] || { echo "!! missing Head Unit Helper APK: $HELPER_APK  (build: cd restart-app && bash build.sh)"; exit 1; }
[ -f "$BOOT" ]       || { echo "!! missing daemon: $BOOT"; exit 1; }
[ -f "$FLIP" ]       || { echo "!! missing hotspot helper: $FLIP"; exit 1; }

adb kill-server >/dev/null 2>&1 || true; adb start-server >/dev/null 2>&1 || true
if [ $# -ge 1 ]; then ADDR="$1"; else
  G=$(netstat -nr 2>/dev/null | awk '/^default/{print $2; exit}')
  [ -z "$G" ] && { echo "No gateway — join the unit's hotspot, or pass ADDR."; exit 1; }
  ADDR="$G:5555"
fi
adb connect "$ADDR" >/dev/null 2>&1; sleep 2
[ "$(adb -s "$ADDR" get-state 2>/dev/null)" = device ] || { echo "!! not connected to $ADDR"; adb devices -l; exit 1; }
echo "unit = $ADDR"

die() { echo "!! $*"; echo "ABORTED — the unit was NOT rebooted. Fix the above and re-run."; exit 1; }
install_apk() { # $1 = apk path, $2 = label  (abort unless 'Success')
  out=$(adb -s "$ADDR" install -r "$1" 2>&1 | tr -d '\r')
  echo "$out" | grep -q 'Success' || die "install failed: $2 -> $(echo "$out" | grep -iE 'fail|error' | tail -1)"
  echo "    installed $2"
}

echo ">>> [1/4] installing rebuilt bridge APK + CarPlay screen + Head Unit Helper (toggles)"
install_apk "$APK" "bridge"
install_apk "$SCREEN_APK" "CarPlay screen"
install_apk "$HELPER_APK" "Head Unit Helper"

echo ">>> [2/4] adb root + reconnect + remount (USB must be unplugged)"
adb -s "$ADDR" root >/dev/null 2>&1; sleep 6
for i in $(seq 1 12); do adb disconnect "$ADDR" >/dev/null 2>&1; adb connect "$ADDR" >/dev/null 2>&1; sleep 3; [ "$(adb -s "$ADDR" get-state 2>/dev/null)" = device ] && break; done
[ "$(adb -s "$ADDR" shell id -u | tr -d '\r')" = 0 ] || { echo "!! no root (is USB unplugged?)"; exit 1; }
adb -s "$ADDR" remount >/dev/null 2>&1
adb -s "$ADDR" shell 'test -w /vendor/bin && echo rw || echo ro' | tr -d '\r' | grep -q rw || { echo "!! /vendor not writable"; exit 1; }

echo ">>> [3/4] pushing fixed boot daemon (D) + on-device hotspot-flip helper"
adb -s "$ADDR" push "$BOOT" /vendor/bin/carplay-boot.sh >/dev/null 2>&1 || die "push failed: carplay-boot.sh"
adb -s "$ADDR" push "$FLIP" /vendor/bin/cp-hotspot-flip.sh >/dev/null 2>&1 || die "push failed: cp-hotspot-flip.sh"
adb -s "$ADDR" shell 'chmod 755 /vendor/bin/carplay-boot.sh /vendor/bin/cp-hotspot-flip.sh; chown root:root /vendor/bin/carplay-boot.sh /vendor/bin/cp-hotspot-flip.sh; sync'
# verify the two files are actually on /vendor and the init service is registered to run the daemon
adb -s "$ADDR" shell 'test -s /vendor/bin/carplay-boot.sh && test -s /vendor/bin/cp-hotspot-flip.sh && echo OK' | tr -d '\r' | grep -q OK || die "daemon/helper not present on /vendor after push"
SVC=$(adb -s "$ADDR" shell 'su 0 grep -c "service carplay_wl" /vendor/etc/init/hw/init.ac8257.rc' | tr -d '\r')
[ "${SVC:-0}" -ge 1 ] 2>/dev/null || die "init service 'carplay_wl' not registered in init.ac8257.rc (run install-boot-automation.sh first)"
echo "    daemon + helper on /vendor; init service registered (x$SVC)"
adb -s "$ADDR" shell 'rm -f /data/local/tmp/carplay-boot.log' 2>/dev/null

echo ">>> [4/4] all pieces verified -> rebooting for a clean cold start"
adb -s "$ADDR" reboot >/dev/null 2>&1
echo "================================================================"
echo "This one-time install also puts the toggles ON THE UNIT (open the CarPlay app's connect screen):"
echo "    - 'Wireless CarPlay' switch  -> bridge on/off, instant"
echo "    - 'Hotspot' switch           -> off = free the unit's Wi-Fi (asks, then reboots)"
echo "The laptop toggles still work too (no app needed):"
echo "    bash tools/wireless-carplay.sh off|on     # CarPlay bridge, instant"
echo "    bash tools/hotspot.sh off|on              # hotspot / Wi-Fi mode, reboots"
echo
echo "Keep the iPhone UNLOCKED, BT + Wi-Fi on, NOT on USB."
echo "After it comes back, rejoin the hotspot and capture one connect so we get real timings:"
echo "    bash tools/wireless-diag.sh"
echo "The new logs stamp each milestone (+Nms): negotiation complete, 0x5703 creds, 0x4301, screen up."
echo "Tuning knobs (persist props, no rebuild, take effect on next dial):"
echo "    adb shell su 0 setprop persist.cpbridge.handoff_grace_ms 20000     # def 30000"
echo "    adb shell su 0 setprop persist.cpbridge.negotiate_deadline_ms 15000 # def 15000"
echo "================================================================"
