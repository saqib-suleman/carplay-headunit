#!/usr/bin/env bash
# De-bloat the unit: DISABLE (reversible) unneeded apps with `pm disable-user --user 0` -- nothing is
# deleted, everything can be restored. Also dumps the full installed-package list to wireless-data/ so we
# can refine the list. Hotspot (auto-detect) or wired (pass IP:5555 as an argument).
#   bash tools/debloat.sh                   # disable the curated list + dump the package list
#   bash tools/debloat.sh list              # ONLY dump the installed-package list (change nothing)
#   bash tools/debloat.sh enable com.foo    # restore a package you want back
set -uo pipefail
DIR="$(cd "$(dirname "$0")/.." && pwd)"
export PATH="${ANDROID_HOME:-$HOME/Library/Android/sdk}/platform-tools:$PATH"

# Curated + reversible: the 4 you named, plus clearly non-essential Google media/productivity apps.
# NOT touched: Play Services (com.google.android.gms), Play Store, Maps (nav), phone/Bluetooth/dialer,
# and the vendor CarPlay + BT-AUDIO apps (com.autochips.*, com.bw.* , com.cpbridge, app.carplayscreen).
BLOAT="
com.skype.raider
com.skype.m2
com.google.android.googlequicksearchbox
com.google.android.calendar
com.android.calendar
com.android.browser
com.android.chrome
com.google.android.gm
com.google.android.youtube
com.google.android.apps.docs
com.google.android.apps.photos
com.google.android.apps.tachyon
com.google.android.videos
com.google.android.music
com.google.android.apps.magazines
com.google.android.keep
com.google.android.talk
com.android.email
com.google.android.apps.pdfviewer
com.google.android.apps.enterprise.cpanel
com.google.android.feedback
com.google.android.inputmethod.pinyin
com.accuweather.android
com.baidu.map.location
com.estrongs.android.pop
com.example
mdm.tw.com.mdm
net.easyconn
radiotime.player
"

MODE="${1:-disable}"; ADDR=""
for a in "$@"; do case "$a" in *:*) ADDR="$a" ;; esac; done
adb kill-server >/dev/null 2>&1 || true; adb start-server >/dev/null 2>&1 || true
if [ -z "$ADDR" ]; then
  G=$(netstat -nr 2>/dev/null | awk '/^default/{print $2; exit}')
  [ -z "$G" ] && { echo "No gateway — join the unit's hotspot or pass IP:5555."; exit 1; }
  ADDR="$G:5555"
fi
adb connect "$ADDR" >/dev/null 2>&1; sleep 2
[ "$(adb -s "$ADDR" get-state 2>/dev/null)" = device ] || { echo "adb offline for $ADDR; try again"; exit 1; }
echo "unit = $ADDR"

mkdir -p "$DIR/wireless-data"
PKGS="$DIR/wireless-data/packages-$(date +%Y%m%d-%H%M%S).txt"
adb -s "$ADDR" shell 'pm list packages' 2>/dev/null | tr -d '\r' | sed 's/^package://' | sort > "$PKGS"
echo "installed packages -> $PKGS ($(wc -l < "$PKGS" | tr -d ' ') pkgs)"

if [ "$MODE" = list ]; then echo "listing only; nothing changed. Send me that file to pick more."; exit 0; fi

if [ "$MODE" = enable ]; then
  shift
  for p in "$@"; do case "$p" in *:*) ;; *)
    r=$(adb -s "$ADDR" shell su 0 pm enable --user 0 "$p" 2>&1 | tr -d '\r'); echo "enable $p -> $r" ;; esac
  done
  exit 0
fi

echo ">>> disabling bloatware (reversible: bash tools/debloat.sh enable <pkg>)"
for p in $BLOAT; do
  grep -qx "$p" "$PKGS" || { echo "skip     $p (not installed)"; continue; }
  r=$(adb -s "$ADDR" shell su 0 pm disable-user --user 0 "$p" 2>&1 | tr -d '\r')
  echo "$r" | grep -qi 'disabled' && echo "disabled $p" || echo "FAILED   $p -> $r"
done
echo ">>> done. Review $PKGS and tell me any other package to disable."
