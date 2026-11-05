#!/usr/bin/env bash
# ONE-SHOT offline runner for the wireless CarPlay handshake (v2 — fixes the Wi-Fi channel).
#
# Run AFTER your Mac has joined the unit's hotspot (no internet then, so Claude can't drive it live).
#
#   ./wireless-offline.sh
#
# Last run got all the way to AUTH SUCCEEDED and sent the Wi-Fi creds, but with channel=0 (the unit's
# `iw dev` doesn't report it), so the iPhone had no channel to join. Your Mac is ON that hotspot, so it
# knows the channel — this script reads it from the Mac, pins it (persist.cpbridge.channel), restarts
# the bridge, and re-watches. Everything is saved to wireless-session.log for Claude to read after.
# Nothing destructive: a reboot (or ./deploy-wireless.sh revert <home-ip>) returns the unit to wired.
set -uo pipefail

DIR="$(cd "$(dirname "$0")" && pwd)"
LOG="$DIR/wireless-session.log"
: > "$LOG"
exec > >(tee -a "$LOG") 2>&1

export PATH="${ANDROID_HOME:-$HOME/Library/Android/sdk}/platform-tools:$PATH"
REF="$DIR/headunit-carplay-ref"

echo "================ wireless-offline v2 $(date) ================"

# --- find the unit on its hotspot ---
AP_IP=$(netstat -nr 2>/dev/null | awk '/^default/{print $2; exit}')
[ -n "$AP_IP" ] || { echo "!! No default gateway — are you on the unit's hotspot?"; exit 1; }
echo ">>> hotspot gateway (unit) = $AP_IP"
ADDR="$AP_IP:5555"
export ANDROID_SERIAL="$ADDR"
# This unit roots via `su 0` (NOT `adb root`), exactly like deploy-wireless.sh. Just (re)connect,
# retrying a few times since network ADB can take a couple of tries after the hotspot comes up.
adb disconnect >/dev/null 2>&1 || true
for i in 1 2 3 4 5 6; do
  adb connect "$ADDR" >/dev/null 2>&1
  [ "$(adb get-state 2>/dev/null)" = "device" ] && break
  echo "   connect attempt $i ..."; sleep 2
done
[ "$(adb get-state 2>/dev/null)" = "device" ] || { echo "!! Not connected to $ADDR (is the Mac on the unit's hotspot?)"; exit 1; }
[ "$(adb shell su 0 id -u 2>/dev/null | tr -d '\r')" = "0" ] || echo "   (warning: su root not confirmed; setprop may fail)"
echo ">>> ADB connected to the unit (root via su)."

# --- read the Wi-Fi channel from the MAC (it is joined to the hotspot) ---
echo
echo ">>> Reading the hotspot channel from this Mac"
MAC_SSID=$(system_profiler SPAirPortDataType 2>/dev/null \
  | awk '/Current Network Information:/{f=1} f&&/^ *[^ ].*:$/&&!/Current Network/{gsub(/^ +| *:$/,"",$0); print; exit}')
CH=$(system_profiler SPAirPortDataType 2>/dev/null \
  | awk '/Current Network Information:/{f=1} f&&/Channel:/{print $2; exit}')
echo "   Mac is on SSID: ${MAC_SSID:-<unknown>}"
echo "   detected channel: ${CH:-<none>}"
if ! [ "${CH:-0}" -gt 0 ] 2>/dev/null; then
  echo "   !! Could not read a channel from the Mac. Make sure Wi-Fi is connected to the unit's hotspot."
  echo "   !! You can also read it from the Wi-Fi menu (hold Option, click Wi-Fi -> 'Channel')."
  echo "   !! Then set it manually:  adb -s $ADDR shell setprop persist.cpbridge.channel <N>"
fi

# --- pin channel + BSSID on the unit ---
if [ "${CH:-0}" -gt 0 ] 2>/dev/null; then
  adb shell setprop persist.cpbridge.channel "$CH"
  echo "   set persist.cpbridge.channel = $(adb shell getprop persist.cpbridge.channel | tr -d '\r')"
fi
BSSID=$(adb shell su 0 cat /sys/class/net/ap0/address 2>/dev/null | tr -d '\r')
[ -n "$BSSID" ] && adb shell setprop persist.cpbridge.bssid "$BSSID"

# --- make sure authd is up (persists from prestage, but re-ensure) ---
adb shell su 0 env CPAUTH_LIB=/system/lib64/libCoreUtils.so /data/local/tmp/authd spawn >/dev/null 2>&1 || true
sleep 1
echo
echo ">>> authd: $(adb shell su 0 /data/local/tmp/authd status 2>&1 | tr -d '\r')"

# --- restart the bridge so it re-reads the (now correct) channel ---
echo
echo ">>> Restarting the bridge so it re-sends 0x5703 with channel=$CH"
adb shell am force-stop com.cpbridge >/dev/null 2>&1 || true
sleep 1
adb shell am start-foreground-service -n com.cpbridge/.BridgeService 2>&1 | tr -d '\r' | sed 's/^/   /'

echo
echo ">>> iPhone: Bluetooth ON, bonded, NOT on USB, screen UNLOCKED. It should auto-join now."
echo ">>> Watching the handshake for ~2.5 min (Ctrl-C to stop). Looking for channel!=0 and g_carplay 0x4301."
echo
END=$(( $(date +%s) + 150 ))
while [ "$(date +%s)" -lt "$END" ]; do
  echo "---- $(date +%H:%M:%S) ----"
  TAIL=120 "$REF/scripts/bridge-log.sh" "$ADDR" 2>&1 | grep -aE "stage=e_auth|stage=f_credentials|stage=g_carplay|0x5703|0x4301|AUTH SUCCEEDED|channel=|JOIN|associat" \
    || echo "(no stage lines yet)"
  sleep 10
done

echo
echo "================ DONE ================"
echo "Did the CarPlay screen open on the unit? Either way: REJOIN your home Wi-Fi and tell Claude 'done'."
echo "Claude will read: $LOG"
