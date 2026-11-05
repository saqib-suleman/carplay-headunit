#!/usr/bin/env bash
# Installs build/CarplayApp.apk on the head unit and switches CarPlay on, then reboots the unit.
#
# Nothing is written to /system (the unit's eMMC driver write-protects it). The app is installed as
# an update to the factory "Auto Dialer" system app (com.example), which keeps it a system app, and
# the CarPlay screen size fix goes to the vendor's writable override at /data/vendor/carplay/.
# The unit's original state is saved once to ./backups/original (never overwritten by later
# installs); undo with ./rollback.sh.
#
# Usage: ./install.sh [--persist-wifi-adb]
#   --persist-wifi-adb  keep ADB over Wi-Fi on across reboots (testing only: this unit's ADB has
#                       no authorisation, so anyone on the same Wi-Fi gets a root shell)
set -euo pipefail

SHOULD_PERSIST_WIFI_ADB=false
for argument in "$@"; do
  case "$argument" in
    --persist-wifi-adb)
      SHOULD_PERSIST_WIFI_ADB=true
      ;;
    *)
      echo "Unknown option: $argument" >&2
      echo "Usage: ./install.sh [--persist-wifi-adb]" >&2
      exit 1
      ;;
  esac
done

PROJECT_DIR="$(cd "$(dirname "$0")" && pwd)"
export PATH="${ANDROID_HOME:-$HOME/Library/Android/sdk}/platform-tools:$PATH"
APK_PATH="$PROJECT_DIR/build/CarplayApp.apk"
ORIGINAL_BACKUP_DIR="$PROJECT_DIR/backups/original"
HOST_SYSTEM_PACKAGE=com.example
HOST_SYSTEM_APK_DIR=/system/app/AutoDialer
SYSTEM_ACCESSORY_INFO=/system/etc/carplay/carplayaccessoryinfo.xml
DATA_ACCESSORY_INFO=/data/vendor/carplay/carplayaccessoryinfo.xml
STAGING_DIR=/data/local/tmp/carplay-install
ADB_WIFI_PORT=5555

if [ ! -f "$APK_PATH" ]; then
  echo "No APK found. Run ./build.sh first." >&2
  exit 1
fi
if [ "$(adb get-state 2>/dev/null)" != "device" ]; then
  echo "No head unit connected. Run: adb connect <IP>:5555" >&2
  exit 1
fi
if [ "$(adb shell su 0 id -u | tr -d '\r')" != "0" ]; then
  echo "Root shell (su 0) is not working on the unit; nothing was changed." >&2
  exit 1
fi

host_package_code_path() {
  adb shell dumpsys package "$HOST_SYSTEM_PACKAGE" | tr -d '\r' | grep -m1 'codePath=' | sed 's/.*codePath=//'
}

does_unit_file_exist() {
  [ "$(adb shell su 0 sh -c "'test -f $1 && echo yes || echo no'" | tr -d '\r')" = "yes" ]
}

backup_original_state() {
  local partial_backup_dir="$ORIGINAL_BACKUP_DIR.partial"
  rm -rf "$partial_backup_dir"
  mkdir -p "$partial_backup_dir"
  if [ "$(host_package_code_path)" != "$HOST_SYSTEM_APK_DIR" ]; then
    echo "$HOST_SYSTEM_PACKAGE is not the untouched factory app at $HOST_SYSTEM_APK_DIR," >&2
    echo "so this is not the unit's original state. Not saving it as the original backup." >&2
    rm -rf "$partial_backup_dir"
    exit 1
  fi
  adb shell settings get system carplay_on | tr -d '\r' > "$partial_backup_dir/carplay_on.txt"
  adb shell getprop persist.adb.tcp.port | tr -d '\r' > "$partial_backup_dir/persist_adb_tcp_port.txt"
  adb pull "$SYSTEM_ACCESSORY_INFO" "$partial_backup_dir/system-carplayaccessoryinfo.xml" > /dev/null
  if does_unit_file_exist "$DATA_ACCESSORY_INFO"; then
    adb shell su 0 cat "$DATA_ACCESSORY_INFO" > "$partial_backup_dir/data-carplayaccessoryinfo.xml"
  fi
  mv "$partial_backup_dir" "$ORIGINAL_BACKUP_DIR"
}

# An earlier attempt may have left an old-style backup; it is still the unit's original state.
if [ -d "$ORIGINAL_BACKUP_DIR" ]; then
  echo "Keeping existing original backup in $ORIGINAL_BACKUP_DIR"
else
  echo "Backing up the unit's original state to $ORIGINAL_BACKUP_DIR..."
  backup_original_state
fi
echo "  carplay_on originally: $(cat "$ORIGINAL_BACKUP_DIR/carplay_on.txt")"
ls "$ORIGINAL_BACKUP_DIR" | sed 's/^/  saved /'

echo "Installing CarPlay as an update to the $HOST_SYSTEM_PACKAGE system app..."
INSTALL_OUTPUT="$(adb install -r "$APK_PATH" 2>&1 | tr -d '\r')"
echo "$INSTALL_OUTPUT" | sed 's/^/  /'
if ! echo "$INSTALL_OUTPUT" | grep -q '^Success'; then
  echo "Install failed; the unit is unchanged apart from the backup on this Mac." >&2
  exit 1
fi
INSTALLED_CODE_PATH="$(host_package_code_path)"
INSTALLED_FLAGS="$(adb shell dumpsys package "$HOST_SYSTEM_PACKAGE" | tr -d '\r' | grep -m1 'pkgFlags=')"
echo "  installed at: $INSTALLED_CODE_PATH"
echo "  $INSTALLED_FLAGS" | sed 's/^ *//;s/^/  /'
if ! echo "$INSTALLED_FLAGS" | grep -q ' SYSTEM '; then
  echo "The update did not keep system-app status, so CarplayService cannot start it." >&2
  echo "Run ./rollback.sh to restore the factory app." >&2
  exit 1
fi

echo "Writing the 1280x720 CarPlay screen config to $DATA_ACCESSORY_INFO..."
# The panel is 1280x720 but the shipped config says 1280x800 (220x137 mm). Match the pixel height
# and keep the physical size at the same 16:9 aspect ratio.
PATCHED_ACCESSORY_INFO="$(mktemp)"
sed -e 's/height="800"/height="720"/' -e 's/heightMM="137"/heightMM="124"/' \
  "$ORIGINAL_BACKUP_DIR/system-carplayaccessoryinfo.xml" > "$PATCHED_ACCESSORY_INFO"
adb shell su 0 rm -rf "$STAGING_DIR"
adb shell mkdir -p "$STAGING_DIR"
adb push "$PATCHED_ACCESSORY_INFO" "$STAGING_DIR/carplayaccessoryinfo.xml" > /dev/null
rm -f "$PATCHED_ACCESSORY_INFO"
adb shell su 0 cp "$STAGING_DIR/carplayaccessoryinfo.xml" "$DATA_ACCESSORY_INFO"
adb shell su 0 chown system:system "$DATA_ACCESSORY_INFO"
adb shell su 0 chmod 644 "$DATA_ACCESSORY_INFO"
adb shell su 0 grep -oE "'(width|height|widthMM|heightMM)=\"[0-9]+\"'" "$DATA_ACCESSORY_INFO" | tr -d '\r' | tr '\n' ' ' || true
echo

echo "Switching CarPlay on..."
adb shell su 0 settings put system carplay_on 1
CARPLAY_ON_NOW="$(adb shell settings get system carplay_on | tr -d '\r')"
echo "  carplay_on is now: $CARPLAY_ON_NOW"
if [ "$CARPLAY_ON_NOW" != "1" ]; then
  echo "carplay_on did not change. Not rebooting; run ./rollback.sh to undo." >&2
  exit 1
fi

if [ "$SHOULD_PERSIST_WIFI_ADB" = true ]; then
  echo "Keeping ADB over Wi-Fi on after reboot (port $ADB_WIFI_PORT)..."
  adb shell su 0 setprop persist.adb.tcp.port "$ADB_WIFI_PORT"
  echo "  persist.adb.tcp.port is now: $(adb shell getprop persist.adb.tcp.port | tr -d '\r')"
  echo "  WARNING: this unit's ADB needs no authorisation, so anyone on the same Wi-Fi can get a root"
  echo "  shell while this is on. Turn it off once testing is finished (see README)."
else
  echo "Leaving ADB over Wi-Fi settings unchanged. If 'adb connect' fails after the reboot, turn"
  echo "ADB over network back on in Developer options (or re-run with --persist-wifi-adb)."
fi

echo "Rebooting the head unit so CarPlay turns on at boot..."
adb reboot
echo
echo "Done. Original state saved in: $ORIGINAL_BACKUP_DIR"
echo "After the unit boots (~1 minute): adb connect <IP>:$ADB_WIFI_PORT && ./status.sh"
