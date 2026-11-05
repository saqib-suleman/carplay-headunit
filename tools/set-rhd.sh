#!/usr/bin/env bash
# CarPlay sidebar/dock side. Flips right-hand-drive in /system/etc/carplay/carplayaccessoryinfo.xml and
# reboots. The native CarPlay plugin reports this to iOS, which places the dock on the driver's side.
#   on  = right-hand-drive=1  -> sidebar on the RIGHT (for RHD cars)
#   off = right-hand-drive=0  -> sidebar on the LEFT  (Apple default / LHD)
# Edits in place (backup + read-back + size check), needs root + reboot. USB UNPLUGGED. Only the
# right-hand-drive attribute changes; screen-size and other settings in the file are preserved.
# Hotspot (auto-detect gateway) or wired (pass ADDR).
#   bash tools/set-rhd.sh on
#   bash tools/set-rhd.sh off 192.168.1.44:5555
set -uo pipefail
export PATH="${ANDROID_HOME:-$HOME/Library/Android/sdk}/platform-tools:$PATH"
case "${1:-}" in
  on)  V=1 ;;
  off) V=0 ;;
  *)   echo "usage: $0 on|off [adb-address]   (on = sidebar on the right)"; exit 2 ;;
esac

adb kill-server >/dev/null 2>&1 || true; adb start-server >/dev/null 2>&1 || true
if [ $# -ge 2 ]; then ADDR="$2"; else
  G=$(netstat -nr 2>/dev/null | awk '/^default/{print $2; exit}')
  [ -z "$G" ] && { echo "No gateway — join the unit's hotspot, or pass the address."; exit 1; }
  ADDR="$G:5555"
fi
adb connect "$ADDR" >/dev/null 2>&1; sleep 2
[ "$(adb -s "$ADDR" get-state 2>/dev/null)" = device ] || { echo "!! not connected to $ADDR"; exit 1; }
echo "unit = $ADDR   (setting sidebar to the $([ "$V" = 1 ] && echo RIGHT || echo LEFT))"

echo ">>> adb root + reconnect + remount (USB must be unplugged)"
adb -s "$ADDR" root >/dev/null 2>&1; sleep 6
for i in $(seq 1 12); do adb disconnect "$ADDR" >/dev/null 2>&1; adb connect "$ADDR" >/dev/null 2>&1; sleep 3; [ "$(adb -s "$ADDR" get-state 2>/dev/null)" = device ] && break; done
[ "$(adb -s "$ADDR" shell id -u | tr -d '\r')" = 0 ] || { echo "!! no root (is USB unplugged?)"; exit 1; }
adb -s "$ADDR" remount >/dev/null 2>&1

# guarded in-place edit on the unit (write to /data temp, cat back -- /system can't hold a sed tempfile)
cat > /tmp/set-rhd-dev.sh <<'DEV'
#!/system/bin/sh
V="$1"
f=/system/etc/carplay/carplayaccessoryinfo.xml
bk=/data/local/tmp/cpai.bak
[ "$V" = 0 ] || [ "$V" = 1 ] || { echo "BADARG"; exit 2; }
[ -f "$f" ] || { echo "NOFILE $f"; exit 3; }
grep -q 'right-hand-drive="[01]"' "$f" || { echo "NOKEY"; exit 4; }
cur=$(sed -n 's/.*right-hand-drive="\([01]\)".*/\1/p' "$f")
[ "$cur" = "$V" ] && { echo "already right-hand-drive=$V"; exit 0; }
osz=$(wc -c < "$f")
mo=$(mount -o rw,remount /system 2>&1)
echo "$mo" | grep -qi verity && { echo "VERITY"; exit 4; }
[ -w "$f" ] || { echo "RO /system"; mount -o ro,remount /system 2>/dev/null; exit 1; }
# FRESH byte-verified backup (#2 — never trust a possibly-corrupt pre-existing one)
cp "$f" "$bk" || { echo "BAKFAIL"; mount -o ro,remount /system 2>/dev/null; exit 1; }; sync
cmp -s "$f" "$bk" || { echo "BAKVERIFY"; mount -o ro,remount /system 2>/dev/null; exit 1; }
# candidate on the SAME filesystem, verified, then ATOMIC rename over the live file (no truncation, #2)
tmp="$f.new.$$"
sed "s/right-hand-drive=\"[01]\"/right-hand-drive=\"$V\"/" "$f" > "$tmp" 2>/dev/null \
  || { echo "SEDFAIL"; rm -f "$tmp"; mount -o ro,remount /system 2>/dev/null; exit 4; }
nv=$(sed -n 's/.*right-hand-drive="\([01]\)".*/\1/p' "$tmp"); nsz=$(wc -c < "$tmp")
if [ "$nv" != "$V" ] || [ "$nsz" != "$osz" ]; then echo "CANDBAD nv=$nv sz=$osz/$nsz"; rm -f "$tmp"; mount -o ro,remount /system 2>/dev/null; exit 4; fi
mv -f "$tmp" "$f" || { echo "RENAMEFAIL"; rm -f "$tmp"; mount -o ro,remount /system 2>/dev/null; exit 4; }
sync
rv=$(sed -n 's/.*right-hand-drive="\([01]\)".*/\1/p' "$f"); rsz=$(wc -c < "$f")
if [ "$rv" != "$V" ] || [ "$rsz" != "$osz" ]; then
  echo "BADWRITE rv=$rv size=$osz/$rsz -> restoring verified backup"; cat "$bk" > "$f"; sync
  mount -o ro,remount /system 2>/dev/null; exit 4
fi
mount -o ro,remount /system 2>/dev/null
echo "OK right-hand-drive=$V (backup $bk)"
DEV
adb -s "$ADDR" push /tmp/set-rhd-dev.sh /data/local/tmp/set-rhd-dev.sh >/dev/null 2>&1 \
  || { echo "!! push of the edit script failed; aborting (nothing changed)"; exit 1; }
# run it and capture the device-side exit status; reboot ONLY on a clean success (#4)
RAW=$(adb -s "$ADDR" shell 'su 0 sh /data/local/tmp/set-rhd-dev.sh '"$V"'; echo "RC=$?"' 2>&1 | tr -d '\r')
RC=$(echo "$RAW" | sed -n 's/^RC=//p' | tail -1)
OUT=$(echo "$RAW" | grep -v '^RC=')
echo ">>> $OUT"
case "$RC:$OUT" in
  0:*OK\ right-hand-drive*|0:*already*)
       echo ">>> rebooting to apply"; adb -s "$ADDR" reboot >/dev/null 2>&1
       echo ">>> after it boots, reconnect CarPlay; the sidebar moves to the $([ "$V" = 1 ] && echo RIGHT || echo LEFT)." ;;
  *NOFILE*) echo "!! accessory XML not found at /system/etc/carplay/ — not this layout; nothing changed." ;;
  *NOKEY*)  echo "!! no right-hand-drive attribute in the XML; nothing changed." ;;
  *RO*)     echo "!! /system read-only; nothing changed (verity? adb remount failed)." ;;
  *VERITY*) echo "!! verity on /system; refused. Nothing changed." ;;
  *BADWRITE*|*RESTORE*) echo "!! write/read-back mismatch; backup restored, NOT rebooting." ;;
  *) echo "!! not rebooting (rc=$RC). Check the unit." ;;
esac
