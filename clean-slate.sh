#!/usr/bin/env bash
# Returns the head unit to its factory CarPlay baseline BEFORE installing the reference app, so the
# reference app is the only CarPlay client and nothing of ours is left to fight it for the screen.
#
# It undoes everything we put on the unit:
#   - our CarPlay app        (the update to the factory "Auto Dialer", com.example)  -> uninstall update
#   - the vendor CarPlay svc  (com.autochips.carplay) IF we ever patched it over /data -> uninstall update
#   - our screen-size override (/data/vendor/carplay/carplayaccessoryinfo.xml)        -> delete (was ours)
#   - carplay_on                                                                       -> clear (factory = 0/off)
#   - tools we pushed to /data/local/tmp (propflip.dex, staging dirs)                  -> delete
#   - any in-memory property flips (e.g. ro.atc.carplay.wireless)                      -> cleared by the reboot
# It never touches a package that is still the factory /system version, so the vendor CarPlay stack
# stays intact. ADB over Wi-Fi is left ON (port 5555) so you can reconnect after the reboot to
# install the reference app; turn it off when you are done (see README).
#
# DRY RUN by default: it prints what it finds and exactly what it would remove, and changes nothing.
# Re-run with --apply to actually do it.
#
# Usage:
#   ./clean-slate.sh            # assess only, print the plan
#   ./clean-slate.sh --apply    # perform the reset, then reboot
set -euo pipefail

APPLY=false
for argument in "$@"; do
  case "$argument" in
    --apply) APPLY=true ;;
    *) echo "Unknown option: $argument" >&2; echo "Usage: ./clean-slate.sh [--apply]" >&2; exit 1 ;;
  esac
done

export PATH="${ANDROID_HOME:-$HOME/Library/Android/sdk}/platform-tools:$PATH"
OUR_APP_PACKAGE=com.example
VENDOR_CARPLAY_PACKAGE=com.autochips.carplay
DATA_ACCESSORY_INFO=/data/vendor/carplay/carplayaccessoryinfo.xml
STAGING_DIRS=(/data/local/tmp/carplay-install /data/local/tmp/carplay-rollback)
PUSHED_TOOLS=(/data/local/tmp/propflip.dex /data/local/tmp/authd /data/local/tmp/cpauth_client)
ADB_WIFI_PORT=5555

if [ "$(adb get-state 2>/dev/null)" != "device" ]; then
  echo "No head unit connected. Run: adb connect <IP>:5555" >&2
  exit 1
fi
if [ "$(adb shell su 0 id -u | tr -d '\r')" != "0" ]; then
  echo "Root shell (su 0) is not working on the unit; nothing was changed." >&2
  exit 1
fi

package_code_path() {
  adb shell dumpsys package "$1" | tr -d '\r' | grep -m1 'codePath=' | sed 's/.*codePath=//'
}
unit_file_exists() {
  [ "$(adb shell su 0 sh -c "'test -e $1 && echo yes || echo no'" | tr -d '\r')" = "yes" ]
}
# A package is a removable update only when its code lives under /data (the factory copy is in /system).
is_data_update() {
  case "$(package_code_path "$1")" in
    /data/*) return 0 ;;
    *) return 1 ;;
  esac
}

echo "=============================================================="
echo " Head unit CarPlay clean slate  ($([ "$APPLY" = true ] && echo APPLY || echo 'DRY RUN'))"
echo "=============================================================="

echo
echo "Current state:"
echo "  $OUR_APP_PACKAGE      codePath = $(package_code_path "$OUR_APP_PACKAGE")"
echo "  $VENDOR_CARPLAY_PACKAGE codePath = $(package_code_path "$VENDOR_CARPLAY_PACKAGE")"
echo "  carplay_on             = $(adb shell settings get system carplay_on | tr -d '\r')"
echo "  $DATA_ACCESSORY_INFO: $(unit_file_exists "$DATA_ACCESSORY_INFO" && echo present || echo absent)"
echo
echo "  Updated (non-factory) packages under /data/app:"
adb shell pm list packages -3 2>/dev/null | tr -d '\r' | sed 's/^package://' | sort | sed 's/^/    /' || true
echo "  (expected: only $OUR_APP_PACKAGE if it is still our update; anything else is a surprise — check it)"
echo
echo "  /data/local/tmp contents:"
adb shell ls -la /data/local/tmp 2>/dev/null | tr -d '\r' | sed 's/^/    /' || true

run() {
  # Echo the action; run it only in --apply mode.
  echo "  \$ $*"
  if [ "$APPLY" = true ]; then
    "$@"
  fi
}

echo
echo "Plan$([ "$APPLY" = true ] || echo ' (dry run — nothing below is executed)'):"

# 1. Our CarPlay app -> back to the factory Auto Dialer.
if is_data_update "$OUR_APP_PACKAGE"; then
  echo "- Remove our CarPlay app (restores factory Auto Dialer):"
  run adb uninstall "$OUR_APP_PACKAGE"
else
  echo "- Our CarPlay app: already the factory version at $(package_code_path "$OUR_APP_PACKAGE") — nothing to remove."
fi

# 2. Vendor CarPlay service -> only revert it if WE patched it over /data. Never touch the factory one.
if is_data_update "$VENDOR_CARPLAY_PACKAGE"; then
  echo "- Vendor CarPlay service is a /data update (we patched it) — revert to factory:"
  run adb uninstall "$VENDOR_CARPLAY_PACKAGE"
else
  echo "- Vendor CarPlay service is factory ($(package_code_path "$VENDOR_CARPLAY_PACKAGE")) — leaving it untouched."
fi

# 3. Our screen-size override (there was none before our install).
if unit_file_exists "$DATA_ACCESSORY_INFO"; then
  echo "- Remove our screen-size override $DATA_ACCESSORY_INFO:"
  run adb shell su 0 rm -f "$DATA_ACCESSORY_INFO"
else
  echo "- Screen-size override already absent — nothing to remove."
fi

# 4. carplay_on -> factory baseline (off). The reference app's install step turns it back on.
echo "- Clear carplay_on (factory baseline is off; turn it on when installing the reference app):"
run adb shell su 0 settings delete system carplay_on

# 5. Tools and staging we pushed to /data/local/tmp.
echo "- Remove the tools and staging dirs we pushed:"
for leftover in "${STAGING_DIRS[@]}" "${PUSHED_TOOLS[@]}"; do
  if unit_file_exists "$leftover"; then
    run adb shell su 0 rm -rf "$leftover"
  fi
done

# 6. Keep ADB over Wi-Fi so we can reconnect after the reboot to install the reference app.
echo "- Keep ADB over Wi-Fi on (port $ADB_WIFI_PORT) so you can reconnect after the reboot:"
run adb shell su 0 setprop persist.adb.tcp.port "$ADB_WIFI_PORT"
echo "    SECURITY: this unit's ADB needs no authorisation, so anyone on the same Wi-Fi gets a root"
echo "    shell while this is on. Turn it off once you are finished (see README)."

# 7. Reboot: fresh vendor CarPlay service + clears any in-memory property flips.
echo "- Reboot the unit (fresh CarPlay service; clears in-memory prop flips):"
run adb reboot

echo
if [ "$APPLY" = true ]; then
  echo "Clean slate applied. After the unit boots (~1 min):"
  echo "  adb connect <IP>:$ADB_WIFI_PORT"
  echo "  ./clean-slate.sh            # re-run to confirm: our app gone, vendor service factory, carplay_on null"
  echo "Then install the reference app (see REFERENCE_APP_SWITCH.md)."
else
  echo "Dry run only — nothing was changed. Re-run with --apply to perform the reset."
fi
