#!/system/bin/sh
# On-device half of the wireless-audio trial. Invoked by tools/audio-capture.sh.
#   arm : snapshot props + the existing logcat buffer, set debug.cp.cpaudio=1, restart Watcher so it
#         re-runs enableCarplayAudio with the override (claims the CarPlay audio route), start logging.
#   grab: take two dumpsys audio/flinger/policy + CarPlay-service snapshots while music should be
#         audible, stop logging, extract the audio timeline, restore the override, make it adb-pullable.
LATEST=/data/local/tmp/cp-audio.latest
case "${1:-}" in
  arm)
    D=/data/local/tmp/cp-audio-$(date +%s); mkdir -p "$D"; echo "$D" > "$LATEST"
    getprop debug.cp.cpaudio               > "$D/cpaudio_before.txt"
    getprop ro.atc.carplay.wireless        > "$D/wireless.txt"
    getprop ro.atc.carplay.audio_enable_ctl > "$D/audio_enable_ctl.txt"
    getprop ro.atc.carplay.disable_bt      > "$D/disable_bt.txt"
    getprop persist.carplay.alsa.enable    > "$D/alsa_enable.txt"
    logcat -b all -d -v threadtime > "$D/pre.log" 2>&1
    setprop debug.cp.cpaudio 1
    am force-stop app.carplayscreen 2>/dev/null
    am start-foreground-service -n app.carplayscreen/.Watcher >/dev/null 2>&1
    nohup logcat -b all -v threadtime > "$D/live.log" 2>&1 </dev/null & echo $! > "$D/pid"
    echo "ARMED $D (debug.cp.cpaudio=1, Watcher restarted). Bring up wireless CarPlay + play music, then grab."
    ;;
  grab)
    D=$(cat "$LATEST" 2>/dev/null); [ -n "$D" ] || { echo "NOT-ARMED"; exit 1; }
    log -p e -t CP_AUDIO_PROBE 'audio snapshot begins' 2>/dev/null
    for T in 1 2; do
      { date; cat /proc/uptime; } > "$D/time-$T.txt" 2>&1
      dumpsys audio > "$D/audio-$T.txt" 2>&1
      dumpsys media.audio_flinger > "$D/flinger-$T.txt" 2>&1
      dumpsys media.audio_policy  > "$D/policy-$T.txt" 2>&1
      dumpsys activity service com.autochips.carplay/.service.CarplayService > "$D/carplay-svc-$T.txt" 2>&1
      ps -A 2>/dev/null | grep -E 'com.autochips.carplay|audioserver|com.cpbridge' > "$D/procs-$T.txt"
      grep -i 1B58 /proc/net/tcp /proc/net/tcp6 > "$D/port7000-$T.txt" 2>/dev/null
      cat /proc/asound/cards /proc/asound/pcm > "$D/alsa-$T.txt" 2>&1
      for P in /proc/asound/card*/pcm*p/sub*/status /proc/asound/card*/pcm*p/sub*/hw_params; do
        [ -r "$P" ] && { echo "== $P =="; cat "$P"; }
      done >> "$D/alsa-$T.txt" 2>&1
      sleep 5
    done
    [ -f "$D/pid" ] && kill "$(cat "$D/pid")" 2>/dev/null
    grep -aiE 'CP_AUDIO_PROBE|CarPlayScreen|\[audio\]|onStreamStateChanged|onAudioInfo|AudioStream|StreamController|AudioPlayer|AudioTrack|AudioFlinger|focusRequest|startMainAudioStreaming|setAudioEnable|CARPLAY_SESSION|disconnect bluetooth|a2dp' \
      "$D/pre.log" "$D/live.log" 2>/dev/null > "$D/audio-timeline.txt"
    ob=$(cat "$D/cpaudio_before.txt" 2>/dev/null)
    if [ -n "$ob" ] && [ "$ob" != "1" ]; then setprop debug.cp.cpaudio "$ob"; else setprop debug.cp.cpaudio ""; fi
    chmod -R 777 "$D" 2>/dev/null
    echo "GRABBED $D"
    ;;
  *) echo "usage: audio-capture-device.sh arm|grab" ;;
esac
