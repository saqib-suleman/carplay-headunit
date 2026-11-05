#!/usr/bin/env bash
# COMPREHENSIVE, GENTLE, READ-ONLY diagnostic of the wireless CarPlay video stage.
# The handshake (BT/auth/creds) already works; this finds why no screen: is the vendor AirPlay
# receiver listening on port 7000, did the iPhone associate, and how is the receiver meant to start?
# Uses only light commands (/proc/net/*, ps, getprop, logcat -t) to avoid the Wi-Fi-stack stress
# that rebooted the unit earlier. Run on the hotspot. No chan_switch, no hostapd_cli, no netstat -p.
set -uo pipefail
DIR="$(cd "$(dirname "$0")" && pwd)"
LOG="$DIR/wireless-session.log"; : > "$LOG"; exec > >(tee -a "$LOG") 2>&1
export PATH="${ANDROID_HOME:-$HOME/Library/Android/sdk}/platform-tools:$PATH"
REF="$DIR/headunit-carplay-ref"

echo "================ wireless-check $(date) ================"
adb kill-server >/dev/null 2>&1 || true; adb start-server >/dev/null 2>&1 || true
ADDR=""
for i in $(seq 1 12); do
  AP_IP=$(netstat -nr 2>/dev/null | awk '/^default/{print $2; exit}')
  [ -z "$AP_IP" ] && { echo "   [$i] no gateway yet"; sleep 3; continue; }
  ADDR="$AP_IP:5555"; export ANDROID_SERIAL="$ADDR"
  adb disconnect "$ADDR" >/dev/null 2>&1 || true; adb connect "$ADDR" >/dev/null 2>&1; sleep 2
  st=$(adb get-state 2>/dev/null); echo "   [$i] gw=$AP_IP state=${st:-none}"
  [ "$st" = device ] && break; sleep 1
done
[ "$(adb get-state 2>/dev/null)" = device ] || { echo "!! not connected"; adb devices -l; exit 1; }
echo ">>> connected to $ADDR"
g() { adb shell su 0 sh -c "$1" 2>&1 | tr -d '\r' | sed 's/^/   /'; }

echo; echo "===== [1] wireless flag, hotspot, pinned creds ====="
g 'echo wireless=$(getprop ro.atc.carplay.wireless); echo ssid=$(getprop persist.cpbridge.ssid) ch=$(getprop persist.cpbridge.channel); cat /sys/class/net/ap0/operstate 2>/dev/null'

echo; echo "===== [2] IS ANYTHING LISTENING ON PORT 7000?  (0x1B58; st 0A=listen) ====="
g 'awk "NR>1{split(\$2,a,\":\"); split(\$3,b,\":\"); print \"local=\"a[2]\" rem=\"b[2]\" st=\"\$4}" /proc/net/tcp /proc/net/tcp6 2>/dev/null | grep -iE "1B58" | sort -u || echo "NONE on 7000"'

echo; echo "===== [3] vendor receiver / carplay processes ====="
g 'ps -A 2>/dev/null | grep -iE "autochips|carplay|airplay|airtunes|mediaserver" | grep -v grep'

echo; echo "===== [4] how is the receiver meant to start? init services + their state ====="
g 'getprop | grep -iE "init\.svc.*(carplay|airplay|iap)" '
g 'ls /system/etc/init /vendor/etc/init /odm/etc/init 2>/dev/null | grep -iE "carplay|airplay|iap" '
g 'grep -rilE "airplay|carplay|7000" /system/etc/init /vendor/etc/init 2>/dev/null | head'

echo; echo "===== [5] the 'plugin not enabled' tell + receiver bring-up (recent logcat) ====="
adb shell "logcat -d -t 1500 2>/dev/null | grep -iE 'carplay|airplay|plugin|receiver|7000|_airplay|not enabled|wireless' | grep -ivE 'cpbridge|CPBRIDGE' | tail -30" 2>&1 | tr -d '\r' | sed 's/^/   /'

echo; echo "===== [6] did the iPhone associate / get a DHCP lease? (arp + leases) ====="
g 'cat /proc/net/arp 2>/dev/null'
g 'for f in /data/misc/dhcp/dnsmasq.leases /data/misc/dhcp*/dnsmasq.leases /data/vendor/wifi/*/dnsmasq.leases; do [ -f "$f" ] && { echo "LEASES $f:"; cat "$f"; }; done'

echo; echo "===== [7] is the screen app present/running? ====="
g 'pm path app.carplayscreen 2>/dev/null; ps -A 2>/dev/null | grep -i carplayscreen | grep -v grep || echo "carplayscreen not running"'

echo; echo "===== [8] _airplay._tcp advertised? (mdns / Bonjour) ====="
g 'getprop | grep -iE "mdns|bonjour"; ps -A 2>/dev/null | grep -iE "mdns" | grep -v grep'

echo; echo "===== [9] recent bridge stages ====="
TAIL=40 "$REF/scripts/bridge-log.sh" "$ADDR" 2>&1 | grep -aE 'stage=f_credentials|stage=g_carplay|AUTH SUCCEEDED|channel=' | tail -6 | sed 's/^/   /'

echo; echo "================ CHECK DONE ================"
echo "Rejoin home Wi-Fi and tell Claude 'done'. Log: $LOG"
