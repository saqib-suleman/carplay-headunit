#!/usr/bin/env bash
# SECOND toggle -- the HOTSPOT / Wi-Fi-mode switch. Different layer from wireless-carplay.sh:
#
#   tools/wireless-carplay.sh off  -> stops the CarPlay BRIDGE only (no reboot). The hotspot STAYS UP,
#                                     so the unit's single Wi-Fi radio is still busy as an AP -- you
#                                     CANNOT use the unit's own Wi-Fi.
#   tools/hotspot.sh off           -> turns the whole hotspot OFF at the vendor level (reboot). The
#                                     radio is freed for STATION mode, so the unit can join your home /
#                                     phone Wi-Fi and use the internet. Wired USB CarPlay still works;
#                                     wireless CarPlay does not (no hotspot).
#   tools/hotspot.sh on            -> hotspot + wireless-CarPlay infrastructure back on (reboot).
#
# It flips ro.atc.carplay.wireless in /vendor/build.prop via the author's hardened wireless-mode.sh
# (single guarded /vendor write, backup, read-back, verity check), then reboots. Needs root, so USB
# must be UNPLUGGED. Works over the unit's HOTSPOT (auto-detect) or wired home Wi-Fi (pass ADDR).
#   on hotspot:  bash tools/hotspot.sh off
#   on wired:    bash tools/hotspot.sh on 192.168.1.44:5555
#
# NOTE: after `hotspot.sh off` the hotspot is gone, so to turn it back ON later you must reach the unit
# another way -- over the home Wi-Fi it now joins (station mode), over USB, or in the boot window with
# headunit-carplay-ref/scripts/wireless-recovery.sh.
set -uo pipefail
DIR="$(cd "$(dirname "$0")/.." && pwd)"
export PATH="${ANDROID_HOME:-$HOME/Library/Android/sdk}/platform-tools:$PATH"
MODE_SH="$DIR/headunit-carplay-ref/scripts/wireless-mode.sh"
[ -f "$MODE_SH" ] || { echo "!! missing $MODE_SH"; exit 1; }

case "${1:-}" in
  on)  WANT=on;  DESC="hotspot + wireless CarPlay ON" ;;
  off) WANT=off; DESC="hotspot OFF -- unit Wi-Fi (station) usable; wireless CarPlay off, wired still works" ;;
  *)   echo "usage: $0 on|off [adb-address]"; echo "  off = free the Wi-Fi radio to use the unit's own Wi-Fi"; exit 2 ;;
esac

adb kill-server >/dev/null 2>&1 || true; adb start-server >/dev/null 2>&1 || true
if [ $# -ge 2 ]; then ADDR="$2"; else
  G=$(netstat -nr 2>/dev/null | awk '/^default/{print $2; exit}')
  [ -z "$G" ] && { echo "No gateway — join the unit's hotspot, or pass the address."; exit 1; }
  ADDR="$G:5555"
fi
echo ">>> $DESC"
echo ">>> target $ADDR (USB must be unplugged; this reboots the unit)"
bash "$MODE_SH" "$WANT" "$ADDR"
rc=$?
case "$rc" in
  0) echo ">>> OK. The unit is rebooting into: $DESC" ;;
  1) echo "!! nothing changed (no adb / no root / /vendor read-only). Is USB unplugged? Try again." ;;
  3) echo "!! that device isn't the head unit (no ro.atc.carplay.wireless); left alone." ;;
  4) echo "!! STOP: /vendor read-back wrong or verity on. Do not retry; restore backup/vendor-build.prop by hand." ;;
  *) echo "!! wireless-mode.sh exited $rc" ;;
esac
exit "$rc"
