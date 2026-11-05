#!/system/bin/sh
# ON-DEVICE hotspot / Wi-Fi-mode flip for the util app's on-screen toggle. Installed to
# /vendor/bin/cp-hotspot-flip.sh and invoked by carplay-boot.sh (as root) when the app asks for a
# hotspot change. Flips ro.atc.carplay.wireless in /vendor/build.prop with the SAME guards as the laptop
# scripts/wireless-mode.sh -- backup, single char-for-char write, read-back, size check -- then reboots.
#   cp-hotspot-flip.sh 0   # hotspot OFF: free the Wi-Fi radio for station mode (unit can use its Wi-Fi)
#   cp-hotspot-flip.sh 1   # hotspot ON : wireless CarPlay
PROP=ro.atc.carplay.wireless
FILE=/vendor/build.prop
BK=/data/local/tmp/vendor-build.prop.bak
TRIG=/data/media/0/Android/data/app.carplayscreen/files/toggle.cmd
log() { echo "cp-hotspot-flip: $*" > /dev/kmsg 2>/dev/null; echo "$(date) cp-hotspot-flip: $*" >> /data/local/tmp/carplay-boot.log 2>/dev/null; }

WANT="$1"
case "$WANT" in 0) OLD=1 ;; 1) OLD=0 ;; *) log "usage: cp-hotspot-flip.sh 0|1"; exit 2 ;; esac
[ "$(id -u)" = 0 ] || { log "need root"; exit 1; }
grep -q "^$PROP=" "$FILE" || { log "no $PROP line in $FILE; not this unit, leaving alone"; exit 3; }

cur=$(sed -n "s/^$PROP=//p" "$FILE")
if [ "$cur" != "$WANT" ]; then
  [ "$cur" = "$OLD" ] || { log "unexpected $PROP=$cur (want $WANT/old $OLD); refusing"; exit 4; }
  osize=$(wc -c < "$FILE")
  mo=$(mount -o rw,remount /vendor 2>&1)
  echo "$mo" | grep -qi verity && { log "verity on /vendor; refuse (never disable-verity)"; exit 4; }
  [ -w "$FILE" ] || { log "/vendor not writable; abort (nothing edited)"; mount -o ro,remount /vendor 2>/dev/null; exit 1; }
  # FRESH, fully byte-verified backup (#2 — never trust a possibly-corrupt pre-existing one).
  cp "$FILE" "$BK" || { log "backup cp failed; abort (nothing edited)"; mount -o ro,remount /vendor 2>/dev/null; exit 1; }
  sync
  cmp -s "$FILE" "$BK" || { log "backup != original (byte compare); abort (nothing edited)"; mount -o ro,remount /vendor 2>/dev/null; exit 1; }
  # Candidate on the SAME filesystem as the target, verified, then ATOMIC rename over the live file --
  # so the live build.prop is never truncated (a cat>live can leave a partial file if interrupted, #2).
  TMP="$FILE.new.$$"
  sed "s/^$PROP=$OLD\$/$PROP=$WANT/" "$FILE" > "$TMP" 2>/dev/null \
    || { log "sed failed; abort (live untouched)"; rm -f "$TMP"; mount -o ro,remount /vendor 2>/dev/null; exit 4; }
  if [ "$(sed -n "s/^$PROP=//p" "$TMP")" != "$WANT" ] || [ "$(wc -c < "$TMP")" != "$osize" ]; then
    log "candidate bad (val/size); abort (live untouched)"; rm -f "$TMP"; mount -o ro,remount /vendor 2>/dev/null; exit 4
  fi
  mv -f "$TMP" "$FILE" || { log "atomic rename failed; live untouched"; rm -f "$TMP"; mount -o ro,remount /vendor 2>/dev/null; exit 4; }
  sync
  if [ "$(sed -n "s/^$PROP=//p" "$FILE")" != "$WANT" ] || [ "$(wc -c < "$FILE")" != "$osize" ]; then
    log "post-rename read-back wrong; restoring verified backup"; cat "$BK" > "$FILE"; sync
    mount -o ro,remount /vendor 2>/dev/null; exit 4
  fi
  mount -o ro,remount /vendor 2>/dev/null
  log "wrote $PROP=$WANT (atomic; verified backup $BK)"
else
  log "$PROP already $WANT in $FILE; just rebooting to apply"
fi
rm -f "$TRIG" 2>/dev/null
log "rebooting to apply hotspot mode=$WANT"
svc power reboot 2>/dev/null || reboot
