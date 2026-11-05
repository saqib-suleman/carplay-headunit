#!/usr/bin/env bash
# Undoes ./install.sh: removes the CarPlay update so the factory "Auto Dialer" system app comes
# back, restores carplay_on, persist.adb.tcp.port and the vendor screen config override from the
# original backup, then reboots the unit.
# Usage: ./rollback.sh [backup dir]   (defaults to backups/original)
set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "$0")" && pwd)"
export PATH="${ANDROID_HOME:-$HOME/Library/Android/sdk}/platform-tools:$PATH"
BACKUP_DIR="${1:-$PROJECT_DIR/backups/original}"
HOST_SYSTEM_PACKAGE=com.example
HOST_SYSTEM_APK_DIR=/system/app/AutoDialer
DATA_ACCESSORY_INFO=/data/vendor/carplay/carplayaccessoryinfo.xml
STAGING_DIR=/data/local/tmp/carplay-rollback

if [ ! -f "$BACKUP_DIR/carplay_on.txt" ]; then
  echo "No backup found in $BACKUP_DIR. Pass one: ./rollback.sh <backup dir>" >&2
  exit 1
fi
if [ "$(adb get-state 2>/dev/null)" != "device" ]; then
  echo "No head unit connected. Run: adb connect <IP>:5555" >&2
  exit 1
fi

host_package_code_path() {
  adb shell dumpsys package "$HOST_SYSTEM_PACKAGE" | tr -d '\r' | grep -m1 'codePath=' | sed 's/.*codePath=//'
}

echo "Rolling back using $BACKUP_DIR..."
if [ "$(host_package_code_path)" = "$HOST_SYSTEM_APK_DIR" ]; then
  echo "  $HOST_SYSTEM_PACKAGE is already the factory app"
else
  # For an updated system app, uninstall removes the update and restores the factory version.
  adb uninstall "$HOST_SYSTEM_PACKAGE" | tr -d '\r' | sed 's/^/  /'
  echo "  $HOST_SYSTEM_PACKAGE now at: $(host_package_code_path)"
fi

if [ -f "$BACKUP_DIR/data-carplayaccessoryinfo.xml" ]; then
  adb shell su 0 rm -rf "$STAGING_DIR"
  adb shell mkdir -p "$STAGING_DIR"
  adb push "$BACKUP_DIR/data-carplayaccessoryinfo.xml" "$STAGING_DIR/carplayaccessoryinfo.xml" > /dev/null
  adb shell su 0 cp "$STAGING_DIR/carplayaccessoryinfo.xml" "$DATA_ACCESSORY_INFO"
  adb shell su 0 chown system:system "$DATA_ACCESSORY_INFO"
  echo "  restored $DATA_ACCESSORY_INFO"
else
  adb shell su 0 rm -f "$DATA_ACCESSORY_INFO"
  echo "  removed $DATA_ACCESSORY_INFO (it did not exist before install)"
fi

ORIGINAL_CARPLAY_ON="$(cat "$BACKUP_DIR/carplay_on.txt")"
if [ "$ORIGINAL_CARPLAY_ON" = "null" ] || [ -z "$ORIGINAL_CARPLAY_ON" ]; then
  adb shell su 0 settings delete system carplay_on
else
  adb shell su 0 settings put system carplay_on "$ORIGINAL_CARPLAY_ON"
fi
echo "  carplay_on restored to: $(adb shell settings get system carplay_on | tr -d '\r')"

ORIGINAL_ADB_TCP_PORT="$(cat "$BACKUP_DIR/persist_adb_tcp_port.txt" 2>/dev/null || true)"
adb shell su 0 setprop persist.adb.tcp.port "\"$ORIGINAL_ADB_TCP_PORT\""
echo "  persist.adb.tcp.port restored to: '$(adb shell getprop persist.adb.tcp.port | tr -d '\r')'"
if [ -z "$ORIGINAL_ADB_TCP_PORT" ]; then
  echo "  ADB over Wi-Fi may be off after the reboot; turn it back on in Developer options if needed."
fi

echo "Rebooting the head unit..."
adb reboot
echo "Rollback done."
