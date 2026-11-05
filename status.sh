#!/usr/bin/env bash
# Read-only check of CarPlay on the head unit: app installed, CarPlay enabled, video resolution,
# recent logs.
set -u

export PATH="${ANDROID_HOME:-$HOME/Library/Android/sdk}/platform-tools:$PATH"

if [ "$(adb get-state 2>/dev/null)" != "device" ]; then
  echo "No head unit connected. Run: adb connect <IP>:5555" >&2
  exit 1
fi

echo "== App (CarPlay is installed as an update to the factory Auto Dialer, com.example)"
adb shell dumpsys package com.example | tr -d '\r' | grep -E 'codePath=|versionCode|pkgFlags=' | head -3
echo "  (codePath under /data/app = CarPlay installed; /system/app/AutoDialer = factory app)"

echo "== CarPlay"
echo "  carplay_on=$(adb shell settings get system carplay_on | tr -d '\r')"
echo "  persist.adb.tcp.port=$(adb shell getprop persist.adb.tcp.port | tr -d '\r')"
adb shell dumpsys carplay_manager

echo "== Video resolution actually used"
adb shell logcat -d -v time | grep -iE 'setVideoResolution|setScreenSize|heightMM|videoHeight' | tail -8

echo "== Recent CarPlay log"
adb shell logcat -d -v time -s CarplayApp CarplayService CarplayManager CarplayPluginAdapter AndroidRuntime | tail -40
