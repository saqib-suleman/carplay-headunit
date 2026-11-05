#!/usr/bin/env bash
# Move the unit's SoftAP off channel 13 -> channel 6 (via hostapd live chan_switch), then re-run the
# wireless CarPlay handshake. Run while your Mac is joined to the unit's hotspot (offline).
#
#   ./wireless-ch6.sh
#
# channel 13 is a 2.4GHz regulatory channel iPhones refuse for CarPlay; the reference unit used ch6.
# Safe: if the switch doesn't take, the AP stays on 13 and the log shows hostapd's config for plan B.
set -uo pipefail
DIR="$(cd "$(dirname "$0")" && pwd)"
LOG="$DIR/wireless-session.log"; : > "$LOG"; exec > >(tee -a "$LOG") 2>&1
export PATH="${ANDROID_HOME:-$HOME/Library/Android/sdk}/platform-tools:$PATH"
REF="$DIR/headunit-carplay-ref"

mac_channel() { system_profiler SPAirPortDataType 2>/dev/null \
  | awk '/Current Network Information:/{f=1} f&&/Channel:/{print $2; exit}'; }

echo "================ wireless-ch6 $(date) ================"
echo ">>> Mac channel now=$(mac_channel)"
# Robust connect: clear stale adb state, then retry ~45s, re-detecting the gateway each time
adb kill-server >/dev/null 2>&1 || true; adb start-server >/dev/null 2>&1 || true
ADDR=""
for i in $(seq 1 15); do
  AP_IP=$(netstat -nr 2>/dev/null | awk '/^default/{print $2; exit}')
  if [ -z "$AP_IP" ]; then echo "   [$i] no default gateway yet (are you on the hotspot?)"; sleep 3; continue; fi
  ADDR="$AP_IP:5555"; export ANDROID_SERIAL="$ADDR"
  adb disconnect "$ADDR" >/dev/null 2>&1 || true
  adb connect "$ADDR" >/dev/null 2>&1
  sleep 2
  st=$(adb get-state 2>/dev/null)
  echo "   [$i] gw=$AP_IP state=${st:-none}"
  [ "$st" = device ] && break
  sleep 1
done
if [ "$(adb get-state 2>/dev/null)" != device ]; then
  echo "!! not connected to ${ADDR:-?}. adb devices:"; adb devices -l 2>&1 | sed 's/^/   /'
  echo "!! Make sure Wi-Fi shows the unit's hotspot (channel read above) and try again."
  exit 1
fi
[ "$(adb shell su 0 id -u 2>/dev/null|tr -d '\r')" = 0 ] || echo "   (warning: su root not confirmed)"
echo ">>> connected to $ADDR"

echo; echo ">>> Inspecting hostapd, switching to channel 6, and pinning the REAL ssid/passphrase/channel"
adb push "$DIR/tools/apfix.sh" /data/local/tmp/apfix.sh >/dev/null
adb shell su 0 sh /data/local/tmp/apfix.sh fixall 2>&1 | tr -d '\r' | sed 's/^/   /'
# reconnect ADB in case the channel switch bounced the link
adb connect "$ADDR" >/dev/null 2>&1 || true
sleep 1
echo; echo ">>> cpbridge props now (passphrase shown as length only):"
echo "   ssid       = $(adb shell getprop persist.cpbridge.ssid | tr -d '\r')"
echo "   channel    = $(adb shell getprop persist.cpbridge.channel | tr -d '\r')"
echo "   passphrase = len $(adb shell 'getprop persist.cpbridge.passphrase | wc -c' | tr -d '\r')"
echo "   Mac is on channel $(mac_channel)"

# ensure authd, restart bridge
adb shell su 0 env CPAUTH_LIB=/system/lib64/libCoreUtils.so /data/local/tmp/authd spawn >/dev/null 2>&1 || true
echo; echo ">>> authd: $(adb shell su 0 /data/local/tmp/authd status 2>&1 | tr -d '\r')"
echo ">>> restarting bridge"
adb shell am force-stop com.cpbridge >/dev/null 2>&1 || true; sleep 1
adb shell am start-foreground-service -n com.cpbridge/.BridgeService 2>&1 | tr -d '\r' | sed 's/^/   /'

echo; echo ">>> iPhone: Bluetooth ON, bonded, OFF USB, UNLOCKED. Watching ~2.5 min for the AP join + CarPlay screen."
echo
END=$(( $(date +%s) + 150 ))
while [ "$(date +%s)" -lt "$END" ]; do
  echo "---- $(date +%H:%M:%S) ----"
  TAIL=120 "$REF/scripts/bridge-log.sh" "$ADDR" 2>&1 | grep -aE 'stage=e_auth|stage=f_credentials|stage=g_carplay|channel=|0x4301|AUTH SUCCEEDED|associat|join' || echo "(no stage lines yet)"
  sleep 10
done
echo; echo "================ DONE ================"
echo "CarPlay screen on the unit? Either way, rejoin home Wi-Fi and tell Claude 'done'.  Log: $LOG"
