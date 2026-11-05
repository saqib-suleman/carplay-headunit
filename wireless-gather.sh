#!/usr/bin/env bash
# FAST, non-hanging data-grab (v2). Fixes the broken awk port check (uses grep) and skips the
# hostapd_cli step that hung. Run on the unit's hotspot. ~45s. Captures to wireless-data/<ts>/.
set -uo pipefail
DIR="$(cd "$(dirname "$0")" && pwd)"
TS=$(date +%Y%m%d-%H%M%S); OUT="$DIR/wireless-data/$TS"; mkdir -p "$OUT"
LOG="$DIR/wireless-session.log"; : > "$LOG"; exec > >(tee -a "$LOG") 2>&1
export PATH="${ANDROID_HOME:-$HOME/Library/Android/sdk}/platform-tools:$PATH"
REF="$DIR/headunit-carplay-ref"

echo "================ wireless-gather v2 $(date) -> $OUT ================"
adb kill-server >/dev/null 2>&1 || true; adb start-server >/dev/null 2>&1 || true
ADDR=""
for i in $(seq 1 20); do
  AP_IP=$(netstat -nr 2>/dev/null | awk '/^default/{print $2; exit}')
  [ -z "$AP_IP" ] && { echo "   [$i] no gateway yet (join the unit's hotspot)"; sleep 3; continue; }
  ADDR="$AP_IP:5555"; export ANDROID_SERIAL="$ADDR"
  adb disconnect "$ADDR" >/dev/null 2>&1 || true; adb connect "$ADDR" >/dev/null 2>&1; sleep 2
  st=$(adb get-state 2>/dev/null); echo "   [$i] gw=$AP_IP state=${st:-none}"
  [ "$st" = device ] && break; sleep 1
done
[ "$(adb get-state 2>/dev/null)" = device ] || { echo "!! not connected"; adb devices -l; exit 1; }
echo ">>> connected to $ADDR"

# All device reads use simple grep/cat (NO awk) so adb-shell quoting can't break them.
P7="7000.*LISTEN|:1B58"
echo ">>> [before] port 7000 listener? (grep /proc/net/tcp for 1B58)"
adb shell su 0 grep -i 1B58 /proc/net/tcp /proc/net/tcp6 2>/dev/null | tr -d '\r' | tee "$OUT/03_port7000_before.txt"
echo "   (01=ESTABLISHED, 0A=LISTEN in the 4th field; empty above = nothing on 7000)"
echo ">>> receiver process?"
adb shell su 0 ps -A 2>/dev/null | tr -d '\r' | grep -iE "app_process64|autochips.carplay|airplay" | tee "$OUT/02_procs.txt"

echo ">>> kick a fresh attempt: authd + bridge (NO channel switch — that hung)"
adb shell su 0 env CPAUTH_LIB=/system/lib64/libCoreUtils.so /data/local/tmp/authd spawn >/dev/null 2>&1 || true
sleep 2
adb shell su 0 /data/local/tmp/authd status 2>&1 | tr -d '\r' | tee "$OUT/05_authd.txt"
adb shell am force-stop com.cpbridge >/dev/null 2>&1 || true; sleep 1
adb shell am start-foreground-service -n com.cpbridge/.BridgeService >/dev/null 2>&1 || true
echo ">>> iPhone: Wi-Fi ON, bonded, off USB, UNLOCKED."
echo ">>> letting it run 40s (this is NOT stuck — capturing at the end)..."
sleep 20; echo "   ...20s..."; sleep 20; echo "   ...40s, capturing now."

echo ">>> CAPTURING (full logcat + state)"
adb shell logcat -d -v time > "$OUT/10_logcat_full.txt" 2>&1 || true
echo "   logcat: $(wc -l < "$OUT/10_logcat_full.txt" 2>/dev/null) lines"
adb shell su 0 getprop > "$OUT/11_getprop.txt" 2>&1 || true
adb shell su 0 ps -A > "$OUT/12_ps.txt" 2>&1 || true
adb shell su 0 cat /proc/net/tcp > "$OUT/13_tcp.txt" 2>&1 || true
adb shell su 0 cat /proc/net/tcp6 > "$OUT/13_tcp6.txt" 2>&1 || true
adb shell su 0 cat /proc/net/arp > "$OUT/14_arp.txt" 2>&1 || true
adb shell su 0 ip addr > "$OUT/14_ipaddr.txt" 2>&1 || true
adb shell su 0 ls -la /data/misc/dhcp /data/vendor/wifi 2>/dev/null > "$OUT/15_dhcp_ls.txt" 2>&1 || true
adb shell su 0 cat /data/misc/dhcp/dnsmasq.leases > "$OUT/15_leases.txt" 2>&1 || true
# receiver (native app_process64) pid + its listening sockets
RXPID=$(adb shell su 0 pidof app_process64 2>/dev/null | tr -d '\r')
echo "app_process64 pid=$RXPID" > "$OUT/16_receiver.txt"
for p in $RXPID; do echo "== pid $p cmdline:" >> "$OUT/16_receiver.txt"; adb shell su 0 cat /proc/$p/cmdline 2>/dev/null | tr '\0' ' ' >> "$OUT/16_receiver.txt"; echo >> "$OUT/16_receiver.txt"; echo "-- its tcp (grep 1B58):" >> "$OUT/16_receiver.txt"; adb shell su 0 grep -i 1B58 /proc/$p/net/tcp 2>/dev/null >> "$OUT/16_receiver.txt"; done
"$REF/scripts/bridge-log.sh" "$ADDR" all > "$OUT/18_bridge_log.txt" 2>&1 || true
echo ">>> [after] port 7000 listener?"
adb shell su 0 grep -i 1B58 /proc/net/tcp /proc/net/tcp6 2>/dev/null | tr -d '\r' | tee "$OUT/19_port7000_after.txt"

echo; echo "================ GATHERED to $OUT ================"
ls -la "$OUT" | sed 's/^/   /'
echo "Drive off and tell Claude 'gathered'."
