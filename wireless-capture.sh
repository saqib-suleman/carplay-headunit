#!/usr/bin/env bash
# Next-trip diagnostic (adopts the review's full-handoff capture). Run on the unit's hotspot.
#   ./wireless-capture.sh start   # pin config + start capture + screen app + bridge (runs ~6 min on device)
#   ./wireless-capture.sh browse  # (laptop, on hotspot) show the AP's _airplay._tcp / _carplay-ctrl records
#   ./wireless-capture.sh pull    # tar the capture off the unit to wireless-data/
# Flow: start -> keep iPhone Wi-Fi ON + unlocked, let CarPlay come up, play music / try Siri for ~2 min,
# then `browse` and `pull` while still on the hotspot, then rejoin home Wi-Fi and tell Claude.
set -uo pipefail
DIR="$(cd "$(dirname "$0")" && pwd)"
export PATH="${ANDROID_HOME:-$HOME/Library/Android/sdk}/platform-tools:$PATH"

connect() {
  adb kill-server >/dev/null 2>&1 || true; adb start-server >/dev/null 2>&1 || true
  ADDR=""
  for i in $(seq 1 15); do
    AP_IP=$(netstat -nr 2>/dev/null | awk '/^default/{print $2; exit}')
    [ -z "$AP_IP" ] && { echo "   [$i] no gateway (join the unit's hotspot)"; sleep 3; continue; }
    ADDR="$AP_IP:5555"; export ANDROID_SERIAL="$ADDR"
    adb disconnect "$ADDR" >/dev/null 2>&1 || true; adb connect "$ADDR" >/dev/null 2>&1; sleep 2
    [ "$(adb get-state 2>/dev/null)" = device ] && break; sleep 1
  done
  [ "$(adb get-state 2>/dev/null)" = device ] || { echo "!! not connected"; adb devices -l; exit 1; }
  echo ">>> connected to $ADDR (AP IP = $AP_IP)"
}

case "${1:-}" in
  start)
    connect
    adb push "$DIR/tools/capture-device.sh" /data/local/tmp/capture-device.sh >/dev/null
    # authd must exist on the unit; push if missing (harmless if already there)
    adb shell 'su 0 sh -c "[ -x /data/local/tmp/authd ]"' 2>/dev/null || \
      adb push "$DIR/headunit-carplay-ref/authd/authd" /data/local/tmp/authd >/dev/null
    adb shell su 0 chmod 755 /data/local/tmp/authd /data/local/tmp/capture-device.sh 2>/dev/null || true
    echo ">>> starting capture (pins ch6+creds+ap_ip, starts screen app + bridge)"
    adb shell su 0 sh /data/local/tmp/capture-device.sh start 2>&1 | tr -d '\r' | sed 's/^/   /'
    cat <<EOF

  CAPTURE RUNNING ON THE UNIT (~6 min, survives this ADB link dropping).
  NOW: iPhone Wi-Fi ON, unlocked, bonded, off USB. Wait >=2 min for CarPlay; if it comes up, play
  music and try "Hey Siri". Then, still on the hotspot:
     ./wireless-capture.sh browse     # what the phone can actually discover
     ./wireless-capture.sh pull       # copy the capture to this Mac
  Then rejoin home Wi-Fi and tell Claude 'captured'.
EOF
    ;;
  browse)
    echo ">>> AP _airplay._tcp / _carplay-ctrl._tcp (Ctrl-C after ~15s each; pick the UNIT, not the Mac):"
    echo "--- _airplay._tcp ---";      timeout 15 dns-sd -B _airplay._tcp local. 2>/dev/null || dns-sd -B _airplay._tcp local. &
    sleep 16; kill %1 2>/dev/null || true
    echo "--- _carplay-ctrl._tcp ---"; ( dns-sd -B _carplay-ctrl._tcp local. & sleep 16; kill %1 2>/dev/null ) || true
    ;;
  pull)
    connect
    D=$(adb shell su 0 sh /data/local/tmp/capture-device.sh dir 2>/dev/null | tr -d '\r')
    [ -n "$D" ] || { echo "!! no capture dir on the unit"; exit 1; }
    mkdir -p "$DIR/wireless-data"
    OUT="$DIR/wireless-data/capture-$(date +%Y%m%d-%H%M%S).tar"
    echo ">>> pulling $D -> $OUT"
    adb exec-out su 0 tar -C "$D" -cf - . > "$OUT" 2>/dev/null
    mkdir -p "${OUT%.tar}" && tar -xf "$OUT" -C "${OUT%.tar}" 2>/dev/null
    echo ">>> extracted to ${OUT%.tar}"; ls -la "${OUT%.tar}" 2>/dev/null | sed 's/^/   /'
    echo ">>> rejoin home Wi-Fi and tell Claude 'captured'."
    ;;
  audio)
    connect
    OUT="$DIR/wireless-data/audio-$(date +%Y%m%d-%H%M%S)"; mkdir -p "$OUT"
    echo ">>> grabbing audio state — CarPlay should be PLAYING MUSIC right now"
    adb shell su 0 dumpsys audio              > "$OUT/audio.txt"    2>&1
    adb shell su 0 dumpsys media.audio_flinger > "$OUT/flinger.txt"  2>&1
    adb shell su 0 dumpsys media.audio_policy  > "$OUT/policy.txt"   2>&1
    adb shell "logcat -d | grep -aiE 'AudioStream|StreamController|audioType|AudioTrack|AudioFlinger|focus|MODE_IN|carplay.*audio|setSource|a2dp|avrcp'" > "$OUT/audio-logcat.txt" 2>&1
    adb shell su 0 sh -c 'echo == bluetooth ==; dumpsys bluetooth_manager | grep -iE "A2dp|Avrcp|HeadsetClient|STATE_CONNECTED|mCurrentDevice"; echo == source ==; settings get system bw_current_source_name; echo == props ==; getprop | grep -iE "carplay.*audio|audio.*source"' > "$OUT/bt-source.txt" 2>&1
    echo ">>> saved:"; ls -la "$OUT" | sed 's/^/   /'
    echo ">>> rejoin home Wi-Fi and tell Claude 'audio captured'."
    ;;
  *)
    echo "usage: $0 start | audio | browse | pull   (run on the unit's hotspot)"; exit 2 ;;
esac
