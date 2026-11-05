#!/usr/bin/env bash
# Builds build/CarplayApp.apk with the Android SDK tools directly (no Gradle) and signs it with the
# AOSP platform test key, which matches the head unit's system signature.
#
# The unit's eMMC driver write-protects the system partition, so the app cannot be added to
# /system. Instead it is installed as an update to an existing platform-signed system app (the
# factory "Auto Dialer" test tool, package com.example). Updated system apps keep FLAG_SYSTEM, which
# is what the vendor CarplayService needs to find and start the app.
set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "$0")" && pwd)"
SDK_DIR="${ANDROID_HOME:-$HOME/Library/Android/sdk}"
BUILD_TOOLS_DIR="$SDK_DIR/build-tools/35.0.0"
ANDROID_JAR="$SDK_DIR/platforms/android-34/android.jar"
BUILD_DIR="$PROJECT_DIR/build"
APP_DIR="$PROJECT_DIR/app"
MIN_AND_TARGET_SDK=28
HOST_SYSTEM_PACKAGE=com.example
SOURCE_PACKAGE=com.autochips.carplayapp
# Minutes since the epoch: every build gets a higher versionCode, so the unit rescans the system app.
VERSION_CODE=$(( $(date +%s) / 60 ))

rm -rf "$BUILD_DIR"
mkdir -p "$BUILD_DIR/generated" "$BUILD_DIR/stub-classes" "$BUILD_DIR/classes" "$BUILD_DIR/dex"

echo "Compiling resources..."
"$BUILD_TOOLS_DIR/aapt2" compile --dir "$APP_DIR/res" -o "$BUILD_DIR/resources.zip"
"$BUILD_TOOLS_DIR/aapt2" link \
  -I "$ANDROID_JAR" \
  --manifest "$APP_DIR/AndroidManifest.xml" \
  --min-sdk-version "$MIN_AND_TARGET_SDK" \
  --target-sdk-version "$MIN_AND_TARGET_SDK" \
  --version-code "$VERSION_CODE" \
  --version-name 1.0 \
  --rename-manifest-package "$HOST_SYSTEM_PACKAGE" \
  --custom-package "$SOURCE_PACKAGE" \
  --java "$BUILD_DIR/generated" \
  -o "$BUILD_DIR/unsigned.apk" \
  "$BUILD_DIR/resources.zip"

echo "Compiling Java..."
javac -nowarn -Xlint:-options -source 8 -target 8 -bootclasspath "$ANDROID_JAR" \
  -d "$BUILD_DIR/stub-classes" \
  $(find "$PROJECT_DIR/stubs" -name '*.java')
javac -Xlint:-options -source 8 -target 8 -bootclasspath "$ANDROID_JAR" \
  -classpath "$BUILD_DIR/stub-classes" \
  -d "$BUILD_DIR/classes" \
  $(find "$APP_DIR/java" "$BUILD_DIR/generated" -name '*.java')

echo "Dexing..."
"$BUILD_TOOLS_DIR/d8" --release --min-api "$MIN_AND_TARGET_SDK" \
  --lib "$ANDROID_JAR" \
  --classpath "$BUILD_DIR/stub-classes" \
  --output "$BUILD_DIR/dex" \
  $(find "$BUILD_DIR/classes" -name '*.class')
(cd "$BUILD_DIR/dex" && zip -q "$BUILD_DIR/unsigned.apk" classes.dex)

echo "Aligning and signing..."
"$BUILD_TOOLS_DIR/zipalign" -f -p 4 "$BUILD_DIR/unsigned.apk" "$BUILD_DIR/aligned.apk"
"$BUILD_TOOLS_DIR/apksigner" sign \
  --key "$PROJECT_DIR/keys/platform.pk8" \
  --cert "$PROJECT_DIR/keys/platform.x509.pem" \
  --out "$BUILD_DIR/CarplayApp.apk" \
  "$BUILD_DIR/aligned.apk"
"$BUILD_TOOLS_DIR/apksigner" verify "$BUILD_DIR/CarplayApp.apk"

echo "Built $BUILD_DIR/CarplayApp.apk"
