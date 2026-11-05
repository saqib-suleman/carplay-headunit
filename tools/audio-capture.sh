#!/usr/bin/env bash
# The decisive WIRELESS-AUDIO trial. Does CarPlay audio reach the car over Wi-Fi, and if not, which
# stage fails (is it the vendor stream-102 dispatch bug)? Two steps, on the unit's HOTSPOT (auto-detect)
# or wired (pass IP:5555). The rebuilt util app (CarPlay.apk with [audio] logging) must be installed.
#
#   bash tools/audio-capture.sh arm      # BEFORE/at connection: sets debug.cp.cpaudio=1, restarts the
#                                        #   Watcher (so it claims the CarPlay audio route), starts logging
#   ...bring up wireless CarPlay, then play known music with the phone's output aimed at CarPlay...
#   bash tools/audio-capture.sh grab     # snapshots audio/flinger/policy + CarPlay service, pulls it all
#
# Read the result in this order: session up -> audio stream CREATED (which id: 100/101/102?) -> stream
# state -> resource/focus grant -> native start result -> AudioTrack active + frames advancing -> output
# route -> audible. An onStreamStateChanged for stream 102 with no playing AudioTrack = the dispatch bug.
set -uo pipefail
DIR="$(cd "$(dirname "$0")/.." && pwd)"
export PATH="${ANDROID_HOME:-$HOME/Library/Android/sdk}/platform-tools:$PATH"
DEV="$DIR/tools/audio-capture-device.sh"
[ -f "$DEV" ] || { echo "!! missing $DEV"; exit 1; }

MODE="${1:-}"; case "$MODE" in arm|grab) ;; *) echo "usage: $0 arm|grab [adb-address]"; exit 2 ;; esac

adb kill-server >/dev/null 2>&1 || true; adb start-server >/dev/null 2>&1 || true
if [ $# -ge 2 ]; then ADDR="$2"; else
  G=$(netstat -nr 2>/dev/null | awk '/^default/{print $2; exit}')
  [ -z "$G" ] && { echo "No gateway — join the unit's hotspot or pass IP:5555."; exit 1; }
  ADDR="$G:5555"
fi
adb connect "$ADDR" >/dev/null 2>&1; sleep 2
[ "$(adb -s "$ADDR" get-state 2>/dev/null)" = device ] || { echo "adb offline for $ADDR; try again"; exit 1; }
echo "unit = $ADDR"
adb -s "$ADDR" push "$DEV" /data/local/tmp/audio-capture-device.sh >/dev/null 2>&1 \
  || { echo "!! push failed"; exit 1; }

if [ "$MODE" = arm ]; then
  adb -s "$ADDR" shell su 0 sh /data/local/tmp/audio-capture-device.sh arm 2>&1 | tr -d '\r'
  echo "================================================================"
  echo "ARMED. Now:  1) make sure wireless CarPlay comes up (screen + touch),"
  echo "             2) play known music on the iPhone with output set to CarPlay,"
  echo "             3) while it SHOULD be audible, run:  bash tools/audio-capture.sh grab"
  echo "(debug.cp.cpaudio=1 is set and will be restored on grab.)"
  echo "================================================================"
  exit 0
fi

# grab
OUT="$DIR/wireless-data/audio-$(date +%Y%m%d-%H%M%S)"; mkdir -p "$OUT"
adb -s "$ADDR" shell su 0 sh /data/local/tmp/audio-capture-device.sh grab 2>&1 | tr -d '\r'
D=$(adb -s "$ADDR" shell cat /data/local/tmp/cp-audio.latest 2>/dev/null | tr -d '\r')
[ -n "$D" ] && adb -s "$ADDR" pull "$D" "$OUT" >/dev/null 2>&1
( cd "$DIR/wireless-data" && tar czf "$(basename "$OUT").tgz" "$(basename "$OUT")" ) 2>/dev/null
echo "================================================================"
echo "Pulled to: $OUT   (send back: $OUT.tgz)"
echo "First look: $OUT/$(basename "${D:-cp-audio}")/audio-timeline.txt"
echo "  -> is there onStreamStateChanged/onAudioInfo for stream 100, 101, or 102?"
echo "  -> does the timeline show startMainAudioStreaming + an AudioStream start, or a -2?"
echo "  -> flinger-*.txt / audio-*.txt: is a CarPlay AudioTrack active with frames advancing?"
echo "================================================================"
