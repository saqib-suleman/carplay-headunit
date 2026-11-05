#!/usr/bin/env bash
# Read-only survey of the head unit over ADB.
# Copies system info, APKs, configs and CarPlay-related files to ./survey/<timestamp>.
# Changes nothing on the head unit.
set -u

OUT="$(cd "$(dirname "$0")" && pwd)/survey/$(date +%Y%m%d-%H%M%S)"
KEYWORD_PATTERN='carplay|carlink|zlink|autokit|easyconn|androidauto|android_auto|projection|iap2|mfi|airplay'
SEARCH_ROOTS='/system /system_ext /vendor /product /odm /oem'

if [ "$(adb get-state 2>/dev/null)" != "device" ]; then
  echo "No head unit connected. Run: adb connect <IP>:5555" >&2
  exit 1
fi

mkdir -p "$OUT/info" "$OUT/apks" "$OUT/configs" "$OUT/carplay-files"

save_shell_output() {
  echo "  $1"
  adb shell "$2" > "$OUT/info/$1.txt" 2>&1
}

echo "Collecting system info..."
save_shell_output getprop 'getprop'
save_shell_output root_access 'id; which su; su -c id'
save_shell_output cpuinfo 'cat /proc/cpuinfo'
save_shell_output meminfo 'cat /proc/meminfo'
save_shell_output kernel 'uname -a'
save_shell_output partitions 'ls -l /dev/block/by-name /dev/block/platform/*/by-name; cat /proc/partitions; df -h'
save_shell_output mounts 'cat /proc/mounts'
save_shell_output packages 'pm list packages -f'
save_shell_output packages_disabled 'pm list packages -d'
save_shell_output features 'pm list features'
save_shell_output services 'service list'
save_shell_output processes 'ps -A'
save_shell_output i2c_devices 'for device in /sys/bus/i2c/devices/*; do echo "$device $(cat $device/name 2>/dev/null)"; done'
save_shell_output usb 'ls -l /sys/class/udc; cat /sys/kernel/config/usb_gadget/*/UDC; dumpsys usb'
save_shell_output wifi 'dumpsys wifi | head -300; ls -l /vendor/etc/wifi /system/etc/wifi'
save_shell_output bluetooth 'dumpsys bluetooth_manager | head -300'
save_shell_output audio_policy 'dumpsys media.audio_policy | head -400'
save_shell_output settings_global 'settings list global'
save_shell_output settings_system 'settings list system'
save_shell_output settings_secure 'settings list secure'
save_shell_output logcat 'logcat -d -v time'
save_shell_output dmesg 'dmesg'
save_shell_output carplay_file_paths "find $SEARCH_ROOTS 2>/dev/null | grep -iE '$KEYWORD_PATTERN'"
adb exec-out screencap -p > "$OUT/info/screen.png" 2>/dev/null

echo "Copying configs..."
for config_path in /system/build.prop /vendor/build.prop /product/build.prop /odm/build.prop /system/etc /vendor/etc; do
  adb pull "$config_path" "$OUT/configs/" > /dev/null 2>&1
done

echo "Copying CarPlay-related files..."
while IFS= read -r device_path; do
  [ -z "$device_path" ] && continue
  adb pull "$device_path" "$OUT/carplay-files/" > /dev/null 2>&1
done < <(tr -d '\r' < "$OUT/info/carplay_file_paths.txt")

echo "Copying every installed APK (this takes a few minutes)..."
while IFS= read -r package_line; do
  package_line="${package_line#package:}"
  package_name="${package_line##*=}"
  apk_path="${package_line%=*}"
  [ -z "$package_name" ] && continue
  adb pull "$apk_path" "$OUT/apks/$package_name.apk" > /dev/null 2>&1
done < <(tr -d '\r' < "$OUT/info/packages.txt")

echo
echo "Done: $OUT"
echo "Model:    $(adb shell getprop ro.product.model | tr -d '\r')"
echo "Android:  $(adb shell getprop ro.build.version.release | tr -d '\r')"
echo "Build:    $(adb shell getprop ro.build.display.id | tr -d '\r')"
echo "APKs:     $(ls "$OUT/apks" | wc -l | tr -d ' ')"
echo "CarPlay-related packages:"
grep -iE "$KEYWORD_PATTERN" "$OUT/info/packages.txt" || echo "  (none matched by name)"
