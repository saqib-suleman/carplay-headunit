#!/usr/bin/env bash
# Auto-switch the unit's audio source to BTMUSIC when CarPlay connects, so steering + audio work
# without pressing SOURCE. The exact switch trigger is vendor-internal and must be DISCOVERED at the
# car (writing bw_current_source_name does NOT switch; CarInputService ignores the SOURCE key;
# CarAudioService.setSourceChannel needs system access). Workflow:
#
#   ./btmusic-autoswitch.sh discover <IP>            # capture what fires when YOU press SOURCE->BTMUSIC
#   ./btmusic-autoswitch.sh try <IP> '<am-command>'  # replay a candidate, report if source became MUSIC_BT
#   ./btmusic-autoswitch.sh watch <IP> '<am-command>'# once a trigger works: auto-apply it on CarPlay connect
set -uo pipefail
export PATH="${ANDROID_HOME:-$HOME/Library/Android/sdk}/platform-tools:$PATH"
src() { adb -s "$1:5555" shell settings get system bw_current_source_name 2>/dev/null | tr -d '\r'; }

discover() {   # $1=IP : find the broadcast/action that selecting BTMUSIC fires
  local a="$1:5555"; adb connect "$a" >/dev/null 2>&1
  echo "current source: $(src "$1")"
  echo "clearing event log; now PRESS SOURCE on the steering until the tab shows BTMUSIC, then press Enter..."
  adb -s "$a" shell logcat -c -b events 2>/dev/null
  adb -s "$a" shell dumpsys activity broadcasts 2>/dev/null | tr -d '\r' > /tmp/bcast_before.txt
  read -r _
  echo "source now: $(src "$1")"
  echo "=== broadcasts fired during the switch (actions) ==="
  adb -s "$a" shell logcat -b events -d 2>/dev/null | tr -d '\r' | grep -iE "am_broadcast|am_focused|source|audio|media" | tail -40
  echo "=== recently-active components (what took over) ==="
  adb -s "$a" shell dumpsys activity broadcasts 2>/dev/null | tr -d '\r' > /tmp/bcast_after.txt
  diff /tmp/bcast_before.txt /tmp/bcast_after.txt | grep -iE "action|com.bw|source|bluetooth|media" | head -30
  echo "Look for a com.bw.* action above; replay it with:  ./btmusic-autoswitch.sh try $1 'am broadcast -a <ACTION> ...'"
}

try() {   # $1=IP $2=am command to run as the switch trigger
  local a="$1:5555"; adb connect "$a" >/dev/null 2>&1
  local before after; before=$(src "$1")
  echo "source before: $before ; running: $2"
  adb -s "$a" shell su 0 sh -c "$2" 2>&1 | tr -d '\r' | sed 's/^/  /'
  sleep 2 2>/dev/null || true
  after=$(src "$1")
  echo "source after: $after"
  [ "$after" = "MUSIC_BT" ] && echo ">>> WORKS: this trigger switches to BTMUSIC" || echo ">>> no switch (still $after)"
}

watch() {   # $1=IP $2=the working trigger command : apply it whenever CarPlay connects
  local a="$1:5555"; local last=""
  echo "watching for CarPlay connect on $a; will apply: $2"
  while true; do
    adb connect "$a" >/dev/null 2>&1
    local owner; owner=$(adb -s "$a" shell dumpsys carplay_manager 2>/dev/null | tr -d '\r' | grep -c "screen controller" || true)
    local cur; cur=$(src "$1")
    if adb -s "$a" shell logcat -d -v time 2>/dev/null | tr -d '\r' | grep -q "Modes changed: screen controller"; then
      if [ "$cur" != "MUSIC_BT" ] && [ "$last" != connected ]; then
        echo "$(date +%T) CarPlay up, source=$cur -> switching to BTMUSIC"
        adb -s "$a" shell su 0 sh -c "$2" >/dev/null 2>&1 || true
        last=connected
      fi
    else
      last=""
    fi
    sleep 5
  done
}

cmd="${1:-}"; shift || true
case "$cmd" in
  discover) discover "$@" ;;
  try)      try "$@" ;;
  watch)    watch "$@" ;;
  *) echo "usage: discover <IP> | try <IP> '<am cmd>' | watch <IP> '<am cmd>'"; exit 2 ;;
esac
