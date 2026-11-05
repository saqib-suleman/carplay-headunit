#!/usr/bin/env bash
# Install laptop-free boot automation for wireless CarPlay onto the unit.
#
# What it does (idempotent):
#   - pushes /vendor/bin/carplay-boot.sh (the bring-up script) and /vendor/bin/authd (MFi signer)
#   - appends a `service carplay_wl ... class late_start` block to the vendor init file that
#     /init.rc imports: /vendor/etc/init/hw/init.ac8257.rc  (adding a NEW .rc under /vendor/etc/init
#     does NOT work on this build, nor does an `on property:sys.boot_completed=1` trigger for a
#     late-added action — class late_start started from the imported file is what init honours)
# After a reboot, on every boot: in wireless mode the script waits for ap0, pins the live ap_ip +
# channel 6 + creds, spawns authd, and (re)starts the bridge + screen app — no laptop needed.
# In wired mode it logs to the kernel log and exits. Remove the appended block (and reboot) to disable.
#
# Needs: adb root + remount (persistent /vendor write). Run with USB UNPLUGGED (adb root over USB
# wedges this unit). Does NOT reboot.
#   ./tools/install-boot-automation.sh [ADDR]        (default ADDR=192.168.1.44:5555)
set -uo pipefail
DIR="$(cd "$(dirname "$0")/.." && pwd)"
export PATH="${ANDROID_HOME:-$HOME/Library/Android/sdk}/platform-tools:$PATH"
ADDR="${1:-192.168.1.44:5555}"
RC=/vendor/etc/init/hw/init.ac8257.rc
A() { adb -s "$ADDR" "$@"; }

echo "================ install boot automation -> $ADDR $(date) ================"
adb connect "$ADDR" >/dev/null 2>&1; sleep 1
[ "$(A get-state 2>/dev/null)" = device ] || { echo "!! not connected to $ADDR"; adb devices -l; exit 1; }

echo ">>> adb root + reconnect + remount (USB must be unplugged)"
A root >/dev/null 2>&1; sleep 6
for i in $(seq 1 12); do adb disconnect "$ADDR" >/dev/null 2>&1; adb connect "$ADDR" >/dev/null 2>&1; sleep 3; [ "$(A get-state 2>/dev/null)" = device ] && break; done
[ "$(A shell id -u | tr -d '\r')" = 0 ] || { echo "!! no root (adb root wedged? unplug USB, reboot, retry)"; exit 1; }
A remount >/dev/null 2>&1
A shell 'test -w /vendor/bin && echo rw || echo ro' | tr -d '\r' | grep -q rw || { echo "!! /vendor not writable"; exit 1; }

echo ">>> pushing script + authd"
A push "$DIR/tools/carplay-boot.sh" /vendor/bin/carplay-boot.sh | tr -d '\r' | tail -1
if A shell 'test -x /data/local/tmp/authd && echo y' | tr -d '\r' | grep -q y; then
  A shell 'cat /data/local/tmp/authd > /vendor/bin/authd'
elif [ -f "$DIR/headunit-carplay-ref/authd/authd" ]; then
  A push "$DIR/headunit-carplay-ref/authd/authd" /vendor/bin/authd | tr -d '\r' | tail -1
fi
A shell 'chmod 755 /vendor/bin/carplay-boot.sh /vendor/bin/authd; chown root:root /vendor/bin/carplay-boot.sh /vendor/bin/authd'

echo ">>> appending service to $RC (idempotent)"
if A shell "grep -q carplay_wl $RC" ; then
  echo "   already present — not appending again"
else
  mkdir -p "$DIR/backup"
  A exec-out su 0 cat "$RC" > "$DIR/backup/init.ac8257.rc.$(date +%s)"
  A exec-out su 0 cat "$RC" > /tmp/_rc.new
  cat >> /tmp/_rc.new <<'BLOCK'

# --- carplay wireless boot automation (added by carplay project; remove this block to disable) ---
service carplay_wl /vendor/bin/sh /vendor/bin/carplay-boot.sh
    class late_start
    seclabel u:r:init:s0
    oneshot
BLOCK
  A push /tmp/_rc.new "$RC" | tr -d '\r' | tail -1
  A shell "chmod 644 $RC; chown root:root $RC"
fi
A shell sync

echo ">>> verify"
A shell "grep -n 'service carplay_wl' $RC; ls -l /vendor/bin/carplay-boot.sh /vendor/bin/authd" 2>&1 | tr -d '\r'
echo "================ installed. Reboot to activate. Pull boot log to check:"
echo "   adb -s $ADDR shell su 0 grep -a carplay_wl /data/misc/bwlog/kernellog/kernel.log"
echo "================"
