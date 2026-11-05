#!/system/bin/sh
# On-device: inspect the running hostapd, live-switch the SoftAP to channel 6, and pin the REAL
# SoftAP SSID/passphrase/channel into persist.cpbridge.* so the bridge stops sending placeholder creds.
# Usage:  sh apfix.sh            # inspect only (read-only)
#         sh apfix.sh switch6    # inspect + chan_switch to channel 6
#         sh apfix.sh fixall     # chan_switch to 6, then set persist.cpbridge.ssid/passphrase/channel
# The passphrase is NEVER printed (only its length). Nothing is restarted here.
log() { echo "[apfix] $*"; }

HPID=$(pidof hostapd 2>/dev/null)
log "hostapd pid=$HPID  cmdline=$(tr '\0' ' ' < /proc/$HPID/cmdline 2>/dev/null)"

CONF=/data/vendor/wifi/hostapd/hostapd_ap0.conf
[ -f "$CONF" ] || CONF=$(find /data/vendor/wifi /data/misc/wifi -iname 'hostapd*ap0*.conf' -o -iname 'hostapd.conf' 2>/dev/null | head -1)
log "conf=$CONF"
if [ -f "$CONF" ]; then
  log "conf (passphrase redacted):"
  grep -iE '^(interface|ssid|channel|hw_mode|acs|country_code|ieee80211)' "$CONF" 2>/dev/null | sed 's/^/    /'
fi

CLI=""
for c in /system/bin/hostapd_cli /vendor/bin/hostapd_cli /system/xbin/hostapd_cli; do
  [ -x "$c" ] && { CLI="$c"; break; }
done
CDIR=""
for d in /data/vendor/wifi/hostapd/ctrl /data/vendor/wifi/hostapd/sockets /data/misc/wifi/hostapd/ctrl /data/misc/wifi/hostapd; do
  [ -e "$d" ] && { CDIR="$d"; break; }
done
log "hostapd_cli=${CLI:-none}  ctrl=${CDIR:-none}"
run_cli() { [ -z "$CLI" ] && return 1; if [ -n "$CDIR" ]; then "$CLI" -p "$CDIR" -i ap0 "$@" 2>&1; else "$CLI" -i ap0 "$@" 2>&1; fi; }

log "STATUS before:"; run_cli status 2>/dev/null | grep -iE 'state|channel|freq|ssid|bssid' | sed 's/^/    /'

if [ "$1" = "switch6" ] || [ "$1" = "fixall" ]; then
  if [ -n "$CLI" ]; then
    log "chan_switch -> channel 6 (2437 MHz, HT20)"
    run_cli chan_switch 5 2437 ht | sed 's/^/    /'
    sleep 4
    log "STATUS after:"; run_cli status 2>/dev/null | grep -iE 'state|channel|freq|ssid|bssid' | sed 's/^/    /'
  fi
fi

if [ "$1" = "fixall" ]; then
  REAL_SSID=$(run_cli status 2>/dev/null | sed -n 's/^ssid\[0\]=//p' | head -1)
  REAL_CH=$(run_cli status 2>/dev/null | sed -n 's/^channel=//p' | head -1)
  [ -z "$REAL_SSID" ] && [ -f "$CONF" ] && REAL_SSID=$(sed -n 's/^ssid=//p' "$CONF" | head -1)
  [ -z "$REAL_CH" ] && [ -f "$CONF" ] && REAL_CH=$(sed -n 's/^channel=//p' "$CONF" | head -1)
  REAL_PASS=""
  [ -f "$CONF" ] && REAL_PASS=$(sed -n 's/^wpa_passphrase=//p' "$CONF" | head -1)
  # The AP interface IP (ap0) that the bridge must put in 0x4301 CarPlayStartSession. ap0's IP changes
  # every hotspot start, and the bridge keeps ANY non-empty persist.cpbridge.ap_ip forever, so a stale
  # value is worse than none. Read it live here (genuinely different fallbacks) and ABORT if we can't,
  # rather than leaving a stale/wrong value for the bridge to send.
  REAL_APIP=$(ip -4 -o addr show ap0 2>/dev/null | sed -n 's#.*inet \([0-9.]*\)/.*#\1#p' | head -1)
  [ -z "$REAL_APIP" ] && REAL_APIP=$(ip addr show ap0 2>/dev/null | sed -n 's/.*inet \([0-9.]*\).*/\1/p' | head -1)
  [ -z "$REAL_APIP" ] && REAL_APIP=$(ifconfig ap0 2>/dev/null | sed -n 's/.*inet addr:\([0-9.]*\).*/\1/p' | head -1)
  if ! echo "$REAL_APIP" | grep -qE '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$'; then
    log "FATAL: could not read ap0 IPv4 (got '$REAL_APIP'); clearing stale ap_ip and ABORTING (do not start the bridge)"
    setprop persist.cpbridge.ap_ip ""
    exit 2
  fi
  [ -n "$REAL_SSID" ] && setprop persist.cpbridge.ssid "$REAL_SSID"
  [ -n "$REAL_PASS" ] && setprop persist.cpbridge.passphrase "$REAL_PASS"
  [ -n "$REAL_CH" ]   && setprop persist.cpbridge.channel "$REAL_CH"
  setprop persist.cpbridge.ap_ip "$REAL_APIP"
  # verify the readback actually took, or abort
  if [ "$(getprop persist.cpbridge.ap_ip)" != "$REAL_APIP" ]; then
    log "FATAL: ap_ip readback mismatch (wanted $REAL_APIP, got '$(getprop persist.cpbridge.ap_ip)'); ABORTING"
    exit 2
  fi
  log "PINNED persist.cpbridge: ssid='$REAL_SSID' channel='$REAL_CH' ap_ip='$REAL_APIP' passphrase_len=${#REAL_PASS}"
  log "verify: ssid=$(getprop persist.cpbridge.ssid) channel=$(getprop persist.cpbridge.channel) ap_ip=$(getprop persist.cpbridge.ap_ip) pass_len_set=$(getprop persist.cpbridge.passphrase | wc -c)"
fi
log "done"
