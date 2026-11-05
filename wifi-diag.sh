#!/usr/bin/env bash
# READ-ONLY diagnostic of the unit's SoftAP / Wi-Fi, to design the channel fix (move off ch13).
# Run while your Mac is joined to the unit's hotspot. It changes NOTHING on the unit. ~30s.
#
#   ./wifi-diag.sh
#
# When it finishes, rejoin home Wi-Fi and tell Claude 'diag done'. Claude reads wifi-diag.log.
set -uo pipefail

DIR="$(cd "$(dirname "$0")" && pwd)"
LOG="$DIR/wifi-diag.log"
: > "$LOG"
exec > >(tee -a "$LOG") 2>&1
export PATH="${ANDROID_HOME:-$HOME/Library/Android/sdk}/platform-tools:$PATH"

echo "================ wifi-diag $(date) ================"
AP_IP=$(netstat -nr 2>/dev/null | awk '/^default/{print $2; exit}')
[ -n "$AP_IP" ] || { echo "!! No default gateway — are you on the unit's hotspot?"; exit 1; }
ADDR="$AP_IP:5555"; export ANDROID_SERIAL="$ADDR"
echo ">>> unit = $ADDR"
adb disconnect >/dev/null 2>&1 || true
for i in 1 2 3 4 5 6; do adb connect "$ADDR" >/dev/null 2>&1; [ "$(adb get-state 2>/dev/null)" = device ] && break; sleep 2; done
[ "$(adb get-state 2>/dev/null)" = device ] || { echo "!! not connected"; exit 1; }
echo ">>> connected"

sh_su() { adb shell su 0 sh -c "$1" 2>&1 | tr -d '\r'; }

echo; echo "===== [Mac] current Wi-Fi ====="
system_profiler SPAirPortDataType 2>/dev/null | sed -n '/Current Network Information:/,/Other Local/p' | head -20

echo; echo "===== ap0 interface ====="
sh_su 'ip addr show ap0 2>/dev/null; echo "--- ap0 MAC:"; cat /sys/class/net/ap0/address 2>/dev/null'

echo; echo "===== iw dev (all interfaces + channels) ====="
sh_su 'iw dev 2>/dev/null'

echo; echo "===== iw phy channel capabilities (2.4 + 5GHz support?) ====="
sh_su 'iw phy 2>/dev/null | grep -iE "Band|MHz|disabled|no IR|radar|Frequencies:" | head -80'

echo; echo "===== hostapd process + its config file(s) ====="
sh_su 'for p in $(pidof hostapd 2>/dev/null); do echo "hostapd pid=$p cmdline:"; tr "\0" " " < /proc/$p/cmdline; echo; done'
sh_su 'ls -l /data/misc/wifi/hostapd.conf /data/vendor/wifi/hostapd/hostapd.conf /data/misc/wifi/softap.conf 2>/dev/null'
echo "--- any hostapd*.conf on the system (paths only): ---"
sh_su 'find /data /vendor /system -iname "hostapd*.conf" -o -iname "*softap*.conf" 2>/dev/null | head'
echo "--- contents of the first hostapd conf found (channel/hw_mode/acs lines): ---"
sh_su 'f=$(find /data /vendor -iname "hostapd*.conf" 2>/dev/null | head -1); [ -n "$f" ] && { echo "FILE: $f"; grep -iE "channel|hw_mode|acs|ieee80211|country|ssid=" "$f"; }'

echo; echo "===== wificond / SoftAp via framework ====="
sh_su 'cmd wifi status 2>/dev/null | head; echo "---"; dumpsys wifi 2>/dev/null | grep -iE "SoftAp|ApConfig|channel|band|apChannel|frequency|CountryCode" | head -20'

echo; echo "===== vendor props that might pin channel/band ====="
sh_su 'getprop | grep -iE "softap|hotspot|ap_?channel|ap_?band|wifi.*channel|carplay.*wifi|wlan.*chan|\.ap\." ' | head -40

echo; echo "===== how the vendor raises the AP (carplay service) ====="
sh_su 'getprop | grep -iE "atc.carplay|cpbridge|wireless" ' | head
sh_su 'ps -A 2>/dev/null | grep -iE "hostapd|wpa_suppl|wificond|carplay" | grep -v grep'

echo; echo "================ DIAG DONE ================"
echo "Rejoin home Wi-Fi and tell Claude 'diag done'. Claude reads: $LOG"
