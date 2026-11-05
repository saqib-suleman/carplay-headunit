#!/usr/bin/env bash
# Wireless CarPlay deployment, split to minimise time on the unit's hotspot.
#
#   ./deploy-wireless.sh prestage <UNIT-IP>   # on HOME Wi-Fi: push everything, set known props, flip
#                                             #   wireless mode (unit then raises its hotspot + leaves Wi-Fi)
#   ./deploy-wireless.sh hotspot  [AP-IP]     # after your Mac JOINS the unit's hotspot: read live Wi-Fi
#                                             #   values, spawn authd (native RSA), start the bridge
#   ./deploy-wireless.sh watch    <AP-IP>     # tail the handshake ladder
#   ./deploy-wireless.sh verify   <AP-IP>     # re-check all config values
#   ./deploy-wireless.sh revert   <IP>        # undo (reboot clears the in-memory flag)
#
# Our chip is MFi Auth 2.0C (RSA-1024): authd runs NATIVE (CPAUTH_LIB, no force). See WIRELESS_DEPLOY.md.
set -uo pipefail

PROJECT_DIR="$(cd "$(dirname "$0")" && pwd)"
export PATH="${ANDROID_HOME:-$HOME/Library/Android/sdk}/platform-tools:$PATH"
REF="$PROJECT_DIR/headunit-carplay-ref"
LIB="/system/lib64/libCoreUtils.so"

# -- per-unit config gathered 2026-10-28 (this unit's identity; local only) --
BT_MAC="00:00:A0:8A:C4:E4"
PEER_MAC="C0:A6:00:C7:3A:29"
PUBLIC_KEY="1ab724d026d90b1db96fdf2056b444a3fda673390fb6712e9ae14d48eb5df9fe"
SOURCE_VERSION="320.17.3"   # CONFIRMED: unit advertises srcvers=320.17.3 (captured mDNS record)

say()  { printf '\n\033[1m== %s\033[0m\n' "$*"; }
die()  { printf '\n!! %s\n' "$*" >&2; exit 1; }

connect_root() {   # $1 = ip:port ; sets ANDROID_SERIAL, ensures root shell
  local addr="$1"
  adb connect "$addr" >/dev/null 2>&1
  export ANDROID_SERIAL="$addr"
  [ "$(adb get-state 2>/dev/null)" = "device" ] || die "not connected to $addr"
  [ "$(adb shell su 0 id -u 2>/dev/null | tr -d '\r')" = "0" ] || die "no root shell on $addr"
}

ismac() { echo "$1" | grep -qiE '^([0-9a-f]{2}:){5}[0-9a-f]{2}$'; }

verify_config() {   # requires ANDROID_SERIAL set; checks every persist.cpbridge.* value
  local ok=1 bt pm pk sv bs ch ss pp ap
  gp() { adb shell getprop "persist.cpbridge.$1" 2>/dev/null | tr -d '\r'; }
  bt=$(gp bt_mac); pm=$(gp peer_mac); pk=$(gp public_key); sv=$(gp source_version)
  bs=$(gp bssid); ch=$(gp channel); ss=$(gp ssid); pp=$(gp passphrase); ap=$(gp ap_ip)
  say "Config check (fix any BAD before bringing the iPhone in)"
  [ -n "$bt" ]         && echo "  OK  bt_mac       $bt" || { echo "  BAD bt_mac       empty"; ok=0; }
  ismac "$pm"          && echo "  OK  peer_mac     $pm" || { echo "  BAD peer_mac     not a MAC: '$pm'"; ok=0; }
  [ ${#pk} -eq 64 ]    && echo "  OK  public_key   (64 hex)" || { echo "  BAD public_key   len ${#pk} (need 64)"; ok=0; }
  [ -n "$sv" ]         && echo "  OK  source_ver   $sv" || { echo "  BAD source_version empty"; ok=0; }
  if ismac "$bs"; then
    if [ "$(echo "$bs" | tr a-f A-F)" = "$(echo "$bt" | tr a-f A-F)" ]; then
      echo "  BAD bssid        $bs  <- equals bt_mac! must be the ap0 MAC (device_id gotcha)"; ok=0
    else echo "  OK  bssid        $bs  (ap0 MAC, != bt_mac)"; fi
  else echo "  BAD bssid        not a MAC: '$bs'  (set from /sys/class/net/ap0/address)"; ok=0; fi
  { [ -n "$ch" ] && [ "$ch" -gt 0 ] 2>/dev/null; } && echo "  OK  channel      $ch" || { echo "  BAD channel      '$ch' (need >0, pinned)"; ok=0; }
  [ -n "$ss" ]         && echo "  OK  ssid         $ss" || { echo "  BAD ssid         empty"; ok=0; }
  [ -n "$pp" ]         && echo "  OK  passphrase   (set, len ${#pp})" || { echo "  BAD passphrase   empty"; ok=0; }
  [ -z "$ap" ]         && echo "  OK  ap_ip        (empty; bridge reads live)" || echo "  ..  ap_ip=$ap (usually empty)"
  [ $ok = 1 ] && echo "  ==> ALL GOOD" || echo "  ==> FIX the BAD items, then re-run: ./deploy-wireless.sh verify <AP-IP>"
}

phase_prestage() {   # $1 = UNIT-IP (home Wi-Fi)
  local ip="${1:?usage: prestage <UNIT-IP>}"; local addr="$ip:5555"
  say "Pre-stage on home Wi-Fi ($addr) — everything that needs internet/LAN"
  connect_root "$addr"
  adb shell getprop ro.build.fingerprint | tr -d '\r' | grep -q ac8257 || die "not the expected unit"

  say "Pushing helpers"
  adb push "$PROJECT_DIR/tools/propflip/propflip.dex" /data/local/tmp/ >/dev/null
  adb push "$REF/authd/authd" /data/local/tmp/authd >/dev/null
  adb push "$REF/authd/cpauth_client" /data/local/tmp/cpauth_client >/dev/null
  adb shell su 0 chmod 755 /data/local/tmp/authd /data/local/tmp/cpauth_client

  say "Installing the bridge (tap 'Install anyway' on the unit if prompted)"
  adb install -r "$REF/client/CarPlayBridge.apk" 2>&1 | tr -d '\r' | grep -iE 'Success|Failure' || true

  say "Setting the known per-unit values"
  adb shell setprop persist.cpbridge.bt_mac "$BT_MAC"
  adb shell setprop persist.cpbridge.peer_mac "$PEER_MAC"
  adb shell setprop persist.cpbridge.public_key "$PUBLIC_KEY"
  adb shell setprop persist.cpbridge.source_version "$SOURCE_VERSION"
  for p in bt_mac peer_mac public_key source_version; do
    printf '   persist.cpbridge.%s = %s\n' "$p" "$(adb shell getprop persist.cpbridge.$p | tr -d '\r')"
  done

  say "Quick auth re-check on the chip (native RSA)"
  local sig
  sig=$(adb shell su 0 env CPAUTH_LIB="$LIB" /data/local/tmp/authd sign 00112233445566778899aabbccddeeff00112233 2>/dev/null | tr -d '\r')
  [ "${#sig}" = 256 ] && echo "   authd sign OK (128-byte RSA sig)" || echo "   WARNING: unexpected sig len ${#sig} (expected 256 hex); check authd/CPAUTH_LIB"

  say "Flipping wireless mode in memory (ro.atc.carplay.wireless 0 -> 1)"
  # Derive the property-area file from the property's own selinux context (robust: grep does not
  # reliably match these mmap'd trie files). On this unit it is mtk_default_prop.
  local area ctx
  ctx=$(adb shell su 0 getprop -Z ro.atc.carplay.wireless 2>/dev/null | tr -d '\r')
  [ -n "$ctx" ] || die "could not read the selinux context of ro.atc.carplay.wireless"
  area="/dev/__properties__/$ctx"
  echo "   area file: $area  (context $ctx)"
  adb shell su 0 app_process -Djava.class.path=/data/local/tmp/propflip.dex /system/bin \
      PropertyAreaValueSetter "$area" ro.atc.carplay.wireless 0 1 2>&1 | tr -d '\r' | sed 's/^/   /'
  local now; now=$(adb shell getprop ro.atc.carplay.wireless | tr -d '\r')
  [ "$now" = 1 ] || die "flag is still '$now' (expected 1) — do NOT continue; reboot to reset and retry"
  echo "   ro.atc.carplay.wireless = 1"

  say "Restarting the vendor CarPlay service so it re-reads the flag and raises the hotspot"
  adb shell su 0 kill "$(adb shell pidof com.autochips.carplay | tr -d '\r')" 2>/dev/null || true

  cat <<EOF

  PRE-STAGE DONE. The unit is switching to wireless mode:
   - it will raise its own Wi-Fi hotspot and LEAVE your home Wi-Fi (this ADB link will drop)
   - do NOT reboot the unit (a reboot clears the in-memory flag)

  NEXT, on your Mac:
   1. Join the unit's hotspot from the Wi-Fi menu (its name/password: unit Settings -> Hotspot).
   2. Run:  ./deploy-wireless.sh hotspot
EOF
}

phase_hotspot() {   # $1 = AP-IP (optional; auto-detected from the default route)
  local ip="${1:-}"
  if [ -z "$ip" ]; then
    ip=$(netstat -nr 2>/dev/null | awk '/^default/{print $2; exit}')
    [ -n "$ip" ] || die "could not auto-detect the hotspot gateway; pass it: hotspot <AP-IP>"
    echo "auto-detected hotspot gateway: $ip"
  fi
  local addr="$ip:5555"
  say "Reconnecting ADB over the hotspot ($addr)"
  adb disconnect >/dev/null 2>&1 || true
  adb connect "$addr" >/dev/null 2>&1
  export ANDROID_SERIAL="$addr"
  adb -s "$addr" root >/dev/null 2>&1 || true
  sleep 1 2>/dev/null || true
  connect_root "$addr"
  adb shell getprop ro.atc.carplay.wireless | tr -d '\r' | grep -q 1 || die "wireless flag is not 1 — hotspot mode is not active"

  say "Reading live hotspot values"
  local bssid channel ssid pass
  bssid=$(adb shell su 0 cat /sys/class/net/ap0/address 2>/dev/null | tr -d '\r')
  channel=$(adb shell su 0 iw dev ap0 info 2>/dev/null | tr -d '\r' | sed -n 's/.*channel \([0-9]*\).*/\1/p' | head -1)
  # SSID / passphrase: try the SoftAP config, then dumpsys
  # read the RUNNING hostapd's own config file (robust across ROMs) via its cmdline
  local hconf
  hconf=$(adb shell su 0 sh -c 'p=$(pidof hostapd); [ -n "$p" ] && tr "\0" "\n" < /proc/$p/cmdline | grep "\.conf$" | head -1' | tr -d '\r')
  if [ -n "$hconf" ]; then
    echo "   hostapd conf: $hconf"
    ssid=$(adb shell su 0 sed -n 's/^ssid=//p' "$hconf" 2>/dev/null | tr -d '\r' | head -1)
    pass=$(adb shell su 0 sed -n 's/^wpa_passphrase=//p' "$hconf" 2>/dev/null | tr -d '\r' | head -1)
  fi
  [ -n "$bssid" ]   && adb shell setprop persist.cpbridge.bssid "$bssid"     && echo "   bssid   = $bssid"   || echo "   bssid   = (ap0 not found)"
  [ -n "$channel" ] && adb shell setprop persist.cpbridge.channel "$channel" && echo "   channel = $channel" || echo "   channel = (unknown)"
  adb shell setprop persist.cpbridge.ap_ip ""   # bridge reads it live
  if [ -n "${ssid:-}" ]; then
    adb shell setprop persist.cpbridge.ssid "$ssid"
    [ -n "${pass:-}" ] && adb shell setprop persist.cpbridge.passphrase "$pass"
    echo "   ssid    = $ssid  (passphrase ${pass:+set}${pass:-NOT found})"
  fi
  if [ -z "$(adb shell getprop persist.cpbridge.ssid | tr -d '\r')" ] || [ -z "$(adb shell getprop persist.cpbridge.passphrase | tr -d '\r')" ]; then
    cat <<EOF
   !! SSID/passphrase not auto-read. Set them from the unit's Settings -> Hotspot:
        adb shell setprop persist.cpbridge.ssid '<HOTSPOT-SSID>'
        adb shell setprop persist.cpbridge.passphrase '<HOTSPOT-PASSPHRASE>'
EOF
  fi

  verify_config

  say "Spawning authd (native RSA path) + starting the bridge"
  adb shell su 0 env CPAUTH_LIB="$LIB" /data/local/tmp/authd spawn >/dev/null 2>&1 || true
  sleep 3 2>/dev/null || true
  adb shell su 0 /data/local/tmp/authd status 2>&1 | tr -d '\r' | sed 's/^/   authd: /' || true
  adb shell am start-foreground-service -n com.cpbridge/.BridgeService 2>&1 | tr -d '\r' | sed 's/^/   /'

  cat <<EOF

  BRIDGE RUNNING. Now bring the iPhone in:
   - Bluetooth ON, bonded to the unit, NOT plugged into USB.
   Watch the handshake ladder:
     ./deploy-wireless.sh watch $ip
EOF
}

phase_watch() {   # $1 = AP-IP
  local ip="${1:?usage: watch <AP-IP>}"
  say "Handshake ladder (Ctrl-C to stop)"
  "$REF/scripts/bridge-log.sh" "$ip:5555"
}

phase_revert() {   # $1 = IP
  local ip="${1:?usage: revert <IP>}"; local addr="$ip:5555"
  connect_root "$addr"
  say "Reverting"
  adb shell su 0 /data/local/tmp/authd stop 2>/dev/null || true
  adb uninstall com.cpbridge 2>&1 | tr -d '\r' | sed 's/^/   /' || true
  adb shell 'for p in $(getprop | grep -o "persist\.cpbridge\.[a-z_]*"); do setprop "$p" ""; done' 2>/dev/null || true
  echo "   rebooting to clear the in-memory wireless flag (back to wired)"
  adb reboot 2>/dev/null || adb shell su 0 svc power reboot 2>/dev/null || true
}

cmd="${1:-}"; shift || true
case "$cmd" in
  prestage) phase_prestage "$@" ;;
  hotspot)  phase_hotspot  "$@" ;;
  watch)    phase_watch    "$@" ;;
  verify)   connect_root "${1:?usage: verify <AP-IP>}:5555"; verify_config ;;
  revert)   phase_revert   "$@" ;;
  *) cat <<EOF
usage:
  ./deploy-wireless.sh prestage <UNIT-IP>   # on home Wi-Fi
  ./deploy-wireless.sh hotspot  [AP-IP]     # after joining the unit's hotspot
  ./deploy-wireless.sh watch    <AP-IP>     # tail the handshake
  ./deploy-wireless.sh verify   <AP-IP>     # re-check all config values
  ./deploy-wireless.sh revert   <IP>        # undo
EOF
     exit 2 ;;
esac
