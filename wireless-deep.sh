#!/usr/bin/env bash
# Deep "where does it break" probe. Run on the unit's hotspot (offline). Pins ch6 + real creds,
# restarts the bridge, then each cycle shows: bridge stages, AP station list (did the iPhone
# associate?), port-7000 AirPlay listener/connections, and DHCP leases. Saves to wireless-session.log.
set -uo pipefail
DIR="$(cd "$(dirname "$0")" && pwd)"
LOG="$DIR/wireless-session.log"; : > "$LOG"; exec > >(tee -a "$LOG") 2>&1
export PATH="${ANDROID_HOME:-$HOME/Library/Android/sdk}/platform-tools:$PATH"
REF="$DIR/headunit-carplay-ref"
mac_channel() { system_profiler SPAirPortDataType 2>/dev/null | awk '/Current Network Information:/{f=1} f&&/Channel:/{print $2; exit}'; }

echo "================ wireless-deep $(date) ================"
echo ">>> Mac channel now=$(mac_channel)"
adb kill-server >/dev/null 2>&1 || true; adb start-server >/dev/null 2>&1 || true
ADDR=""
for i in $(seq 1 15); do
  AP_IP=$(netstat -nr 2>/dev/null | awk '/^default/{print $2; exit}')
  [ -z "$AP_IP" ] && { echo "   [$i] no gateway yet"; sleep 3; continue; }
  ADDR="$AP_IP:5555"; export ANDROID_SERIAL="$ADDR"
  adb disconnect "$ADDR" >/dev/null 2>&1 || true; adb connect "$ADDR" >/dev/null 2>&1; sleep 2
  st=$(adb get-state 2>/dev/null); echo "   [$i] gw=$AP_IP state=${st:-none}"
  [ "$st" = device ] && break; sleep 1
done
[ "$(adb get-state 2>/dev/null)" = device ] || { echo "!! not connected"; adb devices -l; exit 1; }
echo ">>> connected to $ADDR"

echo; echo ">>> Pinning ch6 + real creds (idempotent)"
adb push "$DIR/tools/apfix.sh" /data/local/tmp/apfix.sh >/dev/null
adb shell su 0 sh /data/local/tmp/apfix.sh fixall 2>&1 | tr -d '\r' | sed 's/^/   /'
adb connect "$ADDR" >/dev/null 2>&1 || true; sleep 1

echo; echo ">>> Is there an AirPlay/CarPlay receiver LISTENING on port 7000 + mDNS _airplay._tcp?"
adb shell su 0 sh -c 'netstat -tlnp 2>/dev/null | grep -E ":7000|:5000|:7100" ; echo "--- any airplay/carplay process:"; ps -A 2>/dev/null | grep -iE "airplay|airtunes|carplay|mdns|receiver" | grep -v grep' 2>&1 | tr -d '\r' | sed 's/^/   /'

echo; echo ">>> restarting bridge"
adb shell su 0 env CPAUTH_LIB=/system/lib64/libCoreUtils.so /data/local/tmp/authd spawn >/dev/null 2>&1 || true
adb shell am force-stop com.cpbridge >/dev/null 2>&1 || true; sleep 1
adb shell am start-foreground-service -n com.cpbridge/.BridgeService 2>&1 | tr -d '\r' | sed 's/^/   /'

echo; echo ">>> iPhone: Wi-Fi ON, Bluetooth ON, bonded, OFF USB, UNLOCKED."
echo ">>> Deep watch ~2.5 min. KEY: does the iPhone show up as an associated STATION below?"
echo
END=$(( $(date +%s) + 150 ))
while [ "$(date +%s)" -lt "$END" ]; do
  echo "======== $(date +%H:%M:%S) ========"
  echo "-- bridge stages (last 6):"
  TAIL=60 "$REF/scripts/bridge-log.sh" "$ADDR" 2>&1 | grep -aE 'stage=f_credentials|stage=g_carplay|AUTH SUCCEEDED|channel=' | tail -6 | sed 's/^/   /'
  echo "-- AP stations (iPhone associated? MAC + state):"
  adb shell su 0 sh -c 'c=/data/vendor/wifi/hostapd/ctrl; hostapd_cli -p $c -i ap0 all_sta 2>/dev/null | grep -iE "^[0-9a-f]{2}:|flags|rx_pack|connected_time|dot11|AUTH|ASSOC" | head -20; echo "(station count: $(hostapd_cli -p $c -i ap0 all_sta 2>/dev/null | grep -cE "^[0-9a-f]{2}:"))"' 2>&1 | tr -d '\r' | sed 's/^/   /'
  echo "-- port 7000 connections (iPhone connected to AirPlay?):"
  adb shell su 0 sh -c 'netstat -tnp 2>/dev/null | grep ":7000" | head' 2>&1 | tr -d '\r' | sed 's/^/   /'
  echo "-- DHCP leases (did a client get an IP?):"
  adb shell su 0 sh -c 'for f in /data/misc/dhcp/dnsmasq.leases /data/misc/dhcp*/dnsmasq.leases /data/vendor/wifi/*/dnsmasq.leases; do [ -f "$f" ] && { echo "$f:"; cat "$f"; }; done' 2>&1 | tr -d '\r' | sed 's/^/   /'
  sleep 12
done
echo; echo "================ DONE ================"
echo "Rejoin home Wi-Fi and tell Claude 'done'.  Log: $LOG"
