#!/vendor/bin/sh
# Boot-time wireless CarPlay daemon — runs as ROOT via init on every boot. No laptop at the car.
# Installed as: service carplay_wl in /vendor/etc/init/hw/init.ac8257.rc
#   class late_start + seclabel u:r:init:s0 (execute_no_trans works on this build; a transition fails).
#
# DESIGN (why this is a forever-loop, not a one-shot):
# The hotspot (ap0) comes up late and gets a DIFFERENT IPv4 every boot. The bridge's
# BridgeConfig.apIpv4() reads persist.cpbridge.ap_ip FRESH on every dial (Iap2Session builds 0x4301
# each time), so the ONLY thing that must be true is: persist.cpbridge.ap_ip == live ap0, always.
# So this daemon just keeps that property in sync forever (and keeps authd alive). The bridge, which
# re-dials on its own, then always sends the right address. No restart races.
# Verbose per-iteration logging for the first ~2 min goes to the kernel log (persisted at
# /data/misc/bwlog/kernellog/kernel.log) and /data/local/tmp/carplay-boot.log so a bad boot is
# diagnosable from one file.
klog() { echo "carplay_wl: $*" > /dev/kmsg 2>/dev/null; echo "$(date) $*" >> /data/local/tmp/carplay-boot.log 2>/dev/null; }

klog "start uid=$(id -u) mode=$(getprop ro.atc.carplay.wireless)"

# late_start can fire twice per boot; let only the first instance run the loop.
if ! mkdir /dev/carplay_wl.lock 2>/dev/null; then klog "already running this boot -> exit"; exit 0; fi

# authd MUST run from /data/local/tmp (a /vendor binary can't dlopen /system/lib64/libCoreUtils.so
# under the Treble vendor namespace -> empty cert -> 0xAA04). Copy it there if needed.
AUTHD=/data/local/tmp/authd
[ -x "$AUTHD" ] || { cp /vendor/bin/authd "$AUTHD" 2>/dev/null; chmod 755 "$AUTHD" 2>/dev/null; }
CONF=/data/vendor/wifi/hostapd/hostapd_ap0.conf

# Read ap0's IPv4 by several methods — init's own context can behave differently than an adb shell,
# so don't rely on just one.
read_ap0() {
  a=$(ip -4 -o addr show ap0 2>/dev/null | sed -n 's#.*inet \([0-9.]*\)/.*#\1#p' | head -1)
  [ -z "$a" ] && a=$(ip addr show ap0 2>/dev/null | sed -n 's#.*inet \([0-9.]*\)/.*#\1#p' | head -1)
  [ -z "$a" ] && a=$(ifconfig ap0 2>/dev/null | sed -n 's/.*inet addr:\([0-9.]*\).*/\1/p' | head -1)
  [ -z "$a" ] && a=$(ifconfig ap0 2>/dev/null | sed -n 's/.*inet \([0-9.]*\).*/\1/p' | head -1)
  echo "$a"
}

# Starting a foreground service (am start-foreground-service) only works from the SU domain, NOT from
# init's context where this daemon runs — init-context am is refused ("Requires permission"). So drive
# am/pm/hostapd_cli through su. setprop works fine from init, so property sync stays direct.
SU=/system/xbin/su
run_su() { "$SU" 0 sh -c "$1" >/dev/null 2>&1; }
run_su_out() { "$SU" 0 sh -c "$1" 2>/dev/null; }

# Force the hotspot to channel 6 (iPhone refuses 13); VERIFY it took and retry, then advertise the
# ACTUAL channel so we never tell the phone to join a channel the AP isn't on (#5). The bridge prefers
# persist.cpbridge.channel over its own probe, so this prop must be true.
ensure_channel6() {
  ch=""; k=0
  while [ $k -lt 3 ]; do
    run_su 'for c in /system/bin/hostapd_cli /vendor/bin/hostapd_cli; do [ -x "$c" ] && "$c" -p /data/vendor/wifi/hostapd/ctrl -i ap0 chan_switch 5 2437 ht >/dev/null 2>&1 && break; done'
    sleep 1
    ch=$(run_su_out 'for c in /system/bin/hostapd_cli /vendor/bin/hostapd_cli; do [ -x "$c" ] && "$c" -p /data/vendor/wifi/hostapd/ctrl -i ap0 status 2>/dev/null | sed -n "s/^channel=//p" | head -1 && break; done')
    [ "$ch" = 6 ] && break
    k=$((k+1))
  done
  # returns 0 = ok to proceed (channel is 6, or couldn't be read at all), 1 = confirmed on a WRONG
  # channel (block the bridge and keep retrying; the iPhone would refuse that channel anyway). (#3/#5)
  if [ "$ch" = 6 ]; then
    setprop persist.cpbridge.channel 6; return 0
  elif echo "$ch" | grep -qE '^[0-9]+$'; then
    setprop persist.cpbridge.channel "$ch"; klog "WARN ap0 on channel $ch (not 6) -> holding bridge until it's 6"; return 1
  else
    setprop persist.cpbridge.channel 6; klog "WARN could not read ap0 channel -> assuming 6 and proceeding"; return 0
  fi
}

# Idempotent bridge start (#2). BridgeService.onStartCommand no-ops if a dialer is already running, so
# starting repeatedly is safe. We start on the first valid AP IP and re-ensure every ~30s. NO pgrep (an
# empty cached com.cpbridge process would falsely pass), and this is decoupled from the ap_ip pin/LAST,
# so a failed start is retried rather than masked by a stable IP.
ensure_bridge() {
  if [ "$BRIDGE_ON" != 1 ] || [ $((n % 10)) -eq 0 ]; then
    run_su 'am start-foreground-service -n com.cpbridge/.BridgeService'
    [ "$BRIDGE_ON" != 1 ] && klog "bridge start ensured"
    BRIDGE_ON=1
  fi
}

# The util apps can't call su, so their on-screen toggles DROP the desired state into a trigger file in
# their own external dir; we (root) read it, apply it, and delete it. Keys: wl_on=0|1 (CarPlay bridge,
# instant) and hotspot=on|off (reboot to flip the vendor hotspot mode via cp-hotspot-flip.sh). The
# toggles now live in the Head Unit Helper (app.restart); we also still watch the old CarPlay app.
TRIGS="/data/media/0/Android/data/app.restart/files/toggle.cmd /data/media/0/Android/data/app.carplayscreen/files/toggle.cmd"
handle_triggers() {
  for TRIG in $TRIGS; do
    [ -f "$TRIG" ] || continue
    wl=$(sed -n 's/^wl_on=//p' "$TRIG" | tail -1)
    hs=$(sed -n 's/^hotspot=//p' "$TRIG" | tail -1)
    rm -f "$TRIG"
    if [ "$wl" = 0 ] || [ "$wl" = 1 ]; then
      setprop persist.cpbridge.wl_on "$wl"; klog "app toggle: wl_on=$wl"
    fi
    if [ "$hs" = on ] || [ "$hs" = off ]; then
      want=0; [ "$hs" = on ] && want=1
      cur=$(getprop ro.atc.carplay.wireless)
      if [ "$cur" != "$want" ]; then
        klog "app toggle: hotspot=$hs -> flip ro.atc.carplay.wireless $cur->$want + reboot"
        run_su "/vendor/bin/sh /vendor/bin/cp-hotspot-flip.sh $want"
      fi
    fi
  done
}

# Station/wired mode (no hotspot to manage): stay alive but KEEP WATCHING the app toggle, so the hotspot
# can be turned back ON from the unit with no laptop. (Full wireless management is below, only when on.)
if [ "$(getprop ro.atc.carplay.wireless)" != "1" ]; then
  klog "station/wired mode -> stopping bridge (not needed; no hotspot), watching app toggle every 4s"
  run_su 'am force-stop com.cpbridge'   # (#7) don't let a stale enable dial BT in station mode
  while true; do handle_triggers; sleep 4; done
fi

PINNED_IP=""; CH_OK=0; n=0; STATE=""; BRIDGE_ON=0
while true; do
  handle_triggers   # apply any on-screen toggle request (wl_on / hotspot) from the util app
  # Runtime toggle: persist.cpbridge.wl_on=0 turns wireless CarPlay OFF (bridge stopped -> the unit is
  # just a normal Bluetooth stereo: A2DP music + calls). Empty/anything-but-0 = ON. Flip with
  # tools/wireless-carplay.sh on|off — no reboot, persists.
  if [ "$(getprop persist.cpbridge.wl_on)" = "0" ]; then
    if [ "$STATE" != off ]; then
      run_su 'am force-stop com.cpbridge'
      klog "wireless CarPlay DISABLED (persist.cpbridge.wl_on=0) -> bridge stopped, BT music only"
      STATE=off; PINNED_IP=""; CH_OK=0; BRIDGE_ON=0
    fi
    sleep 5; continue
  fi
  if [ "$STATE" != on ]; then
    run_su 'pm enable --user 0 com.cpbridge; am start-foreground-service -n app.carplayscreen/.Watcher'
    klog "wireless CarPlay ENABLED"
    STATE=on
  fi

  # keep the MFi signer alive
  "$AUTHD" status 2>/dev/null | grep -q running || { env CPAUTH_LIB=/system/lib64/libCoreUtils.so "$AUTHD" spawn >/dev/null 2>&1; klog "authd (re)spawned"; }

  AP=$(read_ap0)
  [ $n -lt 40 ] && klog "iter=$n ap0=[$AP] pinned=[$(getprop persist.cpbridge.ap_ip)]"

  if echo "$AP" | grep -qE '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$'; then
    # (Re)establish CONFIG READINESS before starting the bridge (#3): the CURRENT ap0 IP must be pinned
    # AND the channel confirmed, or we'd reintroduce the original wrong-IP / wrong-channel handoff. We do
    # NOT force-stop the bridge on an IP change -- it reads persist.cpbridge.ap_ip FRESH on every dial.
    if [ "$AP" != "$PINNED_IP" ]; then
      if setprop persist.cpbridge.ap_ip "$AP"; then
        if [ -f "$CONF" ]; then
          S=$(sed -n 's/^ssid=//p' "$CONF" | head -1);          [ -n "$S" ] && setprop persist.cpbridge.ssid "$S"
          P=$(sed -n 's/^wpa_passphrase=//p' "$CONF" | head -1); [ -n "$P" ] && setprop persist.cpbridge.passphrase "$P"
        fi
        PINNED_IP="$AP"; CH_OK=0
        klog "PINNED ap0=$AP (verifying channel before starting the bridge)"
      else
        klog "setprop ap_ip=$AP FAILED -> retrying; bridge held until a current pin succeeds"
      fi
    fi
    # Verify/force channel 6; retry on a stable IP until confirmed (or unreadable). Only when the current
    # IP is pinned AND the channel is OK do we start/keep the bridge -- a wrong channel holds it.
    if [ "$PINNED_IP" = "$AP" ] && [ "$CH_OK" != 1 ]; then
      if ensure_channel6; then CH_OK=1; klog "config ready ap0=$AP ch=$(getprop persist.cpbridge.channel)"; fi
    fi
    if [ "$PINNED_IP" = "$AP" ] && [ "$CH_OK" = 1 ]; then
      ensure_bridge
    fi
  fi
  n=$((n+1))
  sleep 3
done
