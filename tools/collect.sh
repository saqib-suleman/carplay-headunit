#!/usr/bin/env bash
# ONE-SHOT diagnostic capture to BRING BACK after a car session. Starts a passive capture (no state
# changes -- it observes the real daemon/app-driven connect), waits while you attempt a connect, then
# pulls EVERYTHING to wireless-data/collect-<ts>/ and makes a .tgz to send back. Hotspot (auto-detect
# the gateway) or wired (pass IP:5555).
#   bash tools/collect.sh            # capture ~240s, then pull
#   bash tools/collect.sh 300        # custom capture window (seconds)
#   bash tools/collect.sh pull       # just pull the latest capture (e.g. after you Ctrl-C'd the wait)
#   bash tools/collect.sh 300 192.168.1.44:5555
set -uo pipefail
DIR="$(cd "$(dirname "$0")/.." && pwd)"
export PATH="${ANDROID_HOME:-$HOME/Library/Android/sdk}/platform-tools:$PATH"
DEV="$DIR/tools/collect-device.sh"
[ -f "$DEV" ] || { echo "!! missing $DEV"; exit 1; }

WIN=240; MODE=run; ADDR=""
for a in "$@"; do
  case "$a" in
    pull) MODE=pull ;;
    *:*)  ADDR="$a" ;;
    *[0-9]) WIN="$a" ;;
  esac
done

adb kill-server >/dev/null 2>&1 || true; adb start-server >/dev/null 2>&1 || true
if [ -z "$ADDR" ]; then
  G=$(netstat -nr 2>/dev/null | awk '/^default/{print $2; exit}')
  [ -z "$G" ] && { echo "No gateway — join the unit's hotspot or pass IP:5555."; exit 1; }
  ADDR="$G:5555"
fi
adb connect "$ADDR" >/dev/null 2>&1; sleep 2
[ "$(adb -s "$ADDR" get-state 2>/dev/null)" = device ] || { echo "adb offline for $ADDR; try again"; exit 1; }
echo "unit = $ADDR"

pull() {
  OUT="$DIR/wireless-data/collect-$(date +%Y%m%d-%H%M%S)"; mkdir -p "$OUT"
  adb -s "$ADDR" shell su 0 sh /data/local/tmp/collect-device.sh stop 2>&1 | tr -d '\r'
  D=$(adb -s "$ADDR" shell cat /data/local/tmp/cp-col.latest 2>/dev/null | tr -d '\r')
  [ -n "$D" ] && adb -s "$ADDR" pull "$D" "$OUT" >/dev/null 2>&1
  ( cd "$DIR/wireless-data" && tar czf "$(basename "$OUT").tgz" "$(basename "$OUT")" ) 2>/dev/null
  echo "================================================================"
  echo "Pulled to: $OUT"
  echo "Send back:  $OUT.tgz"
  echo "Quick look: $OUT/$(basename "${D:-cp-col}")/timeline.txt   (milestone +Nms stamps)"
  echo "            $OUT/$(basename "${D:-cp-col}")/net.txt         (port 7000 ESTABLISHED? iPhone lease?)"
  echo "================================================================"
}

if [ "$MODE" = pull ]; then pull; exit 0; fi

echo ">>> starting PASSIVE capture (no state changes; observes the real connect)"
adb -s "$ADDR" push "$DEV" /data/local/tmp/collect-device.sh >/dev/null 2>&1
adb -s "$ADDR" shell su 0 sh /data/local/tmp/collect-device.sh start 2>&1 | tr -d '\r'
echo ">>> CAPTURING ${WIN}s. ATTEMPT THE CONNECT NOW — iPhone UNLOCKED, BT + Wi-Fi on, NOT on USB."
echo "    (If CarPlay shows sooner, Ctrl-C and run:  bash tools/collect.sh pull)"
sleep "$WIN"
pull
