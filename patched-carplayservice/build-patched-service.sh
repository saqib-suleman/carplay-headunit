#!/usr/bin/env bash
# Rebuilds the vendor CarplayService (com.autochips.carplay) from its decoded smali with one change:
# the wireless flag is read from persist.carplay.wireless.enable (default 0, so it behaves like stock)
# instead of the read-only ro.atc.carplay.wireless. Signed with the AOSP platform key, the APK installs
# as an update to the system copy; `adb uninstall com.autochips.carplay` restores the original.
set -euo pipefail

PATCH_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIR="$(dirname "$PATCH_DIR")"
BUILD_TOOLS_DIR="${ANDROID_HOME:-$HOME/Library/Android/sdk}/build-tools/35.0.0"
OUT_DIR="$PATCH_DIR/build"

rm -rf "$OUT_DIR"
mkdir -p "$OUT_DIR"

if ! grep -q 'persist.carplay.wireless.enable' "$PATCH_DIR/decoded/smali/com/autochips/carplay/service/a.smali"; then
  echo "Patch missing from decoded smali; refusing to build an unpatched copy." >&2
  exit 1
fi

apktool b -o "$OUT_DIR/unsigned.apk" "$PATCH_DIR/decoded"
"$BUILD_TOOLS_DIR/zipalign" -f -p 4 "$OUT_DIR/unsigned.apk" "$OUT_DIR/aligned.apk"
"$BUILD_TOOLS_DIR/apksigner" sign \
  --key "$PROJECT_DIR/keys/platform.pk8" \
  --cert "$PROJECT_DIR/keys/platform.x509.pem" \
  --out "$OUT_DIR/CarplayService-wireless-switch.apk" \
  "$OUT_DIR/aligned.apk"
"$BUILD_TOOLS_DIR/apksigner" verify "$OUT_DIR/CarplayService-wireless-switch.apk"
echo "Built $OUT_DIR/CarplayService-wireless-switch.apk"
