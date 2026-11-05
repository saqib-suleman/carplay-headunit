#!/usr/bin/env bash
# Run while this Mac is joined to the head unit's hotspot (AndroidAP_4723).
# Saves the wireless CarPlay test logs into survey/wireless-test-<time>/ and then reboots the unit,
# which clears the in-memory wireless flag and returns it to its normal Wi-Fi.
set -u

export PATH="${ANDROID_HOME:-$HOME/Library/Android/sdk}/platform-tools:$PATH"
PROJECT_DIR="$(cd "$(dirname "$0")" && pwd)"
OUT_DIR="$PROJECT_DIR/survey/wireless-test-$(date +%H%M%S)"
UNIT_IP="$(route -n get default 2>/dev/null | sed -n 's/.*gateway: //p')"
UNIT_IP="${UNIT_IP:-192.168.43.1}"
UNIT="$UNIT_IP:5555"

mkdir -p "$OUT_DIR"
echo "Head unit should be the hotspot gateway: $UNIT"
adb disconnect >/dev/null 2>&1
adb connect "$UNIT"
if [ "$(adb -s "$UNIT" get-state 2>/dev/null)" != "device" ]; then
  echo "Could not reach the head unit at $UNIT. Is this Mac connected to AndroidAP_4723?" >&2
  exit 1
fi

echo "Saving logs to $OUT_DIR ..."
adb -s "$UNIT" logcat -d -b all -v threadtime > "$OUT_DIR/logcat.txt"
adb -s "$UNIT" shell dumpsys carplay_manager > "$OUT_DIR/carplay_manager.txt"
adb -s "$UNIT" shell dumpsys wifi > "$OUT_DIR/wifi.txt"
adb -s "$UNIT" shell dumpsys bluetooth_manager > "$OUT_DIR/bluetooth.txt"
adb -s "$UNIT" shell 'getprop ro.atc.carplay.wireless; getprop sys.usb.config; cat /sys/carplay/carplaystatus; ip addr' > "$OUT_DIR/state.txt"
adb -s "$UNIT" shell 'su 0 dmesg' > "$OUT_DIR/dmesg.txt"
wc -l "$OUT_DIR"/*.txt

echo "Rebooting the head unit to clear the wireless flag..."
adb -s "$UNIT" reboot
echo
echo "Done. Now switch this Mac back to your home Wi-Fi (Saqib 5G) and tell Claude."
