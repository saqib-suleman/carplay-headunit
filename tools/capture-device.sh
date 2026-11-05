#!/system/bin/sh
# Runs on the unit as root. Captures a full wireless-CarPlay handoff for offline analysis.
#   sh capture-device.sh start   # pin config (abort if ap0 IP missing), start capture+screen+bridge
#   sh capture-device.sh dir     # print the latest capture dir
#   sh capture-device.sh stop    # stop the background captures
# Captures (survive adb disconnect, auto-stop after 6 min): full logcat (all buffers), ARP/TCP
# snapshots, and an ap0 pcap if a tcpdump binary is present. Pins ch6 + real ssid/pass + CORRECT ap_ip.
LATEST=/data/local/tmp/cp-cap.latest
ACT=${1:-start}

if [ "$ACT" = dir ]; then cat "$LATEST" 2>/dev/null; exit 0; fi
if [ "$ACT" = stop ]; then
  D=$(cat "$LATEST" 2>/dev/null)
  [ -n "$D" ] && [ -f "$D/pids" ] && kill $(cat "$D/pids") 2>/dev/null
  echo "stopped ${D:-?}"; exit 0
fi

export D=/data/local/tmp/cp-cap-$(date +%s)
mkdir -p "$D"; echo "$D" > "$LATEST"

# ---- config: the CORRECT ap0 IP is mandatory (a stale/wrong one is the whole bug) ----
ip addr show ap0 > "$D/ap0-ipaddr.txt" 2>&1
AP=$(ip -4 -o addr show ap0 2>/dev/null | sed -n 's#.*inet \([0-9.]*\)/.*#\1#p' | head -1)
[ -z "$AP" ] && AP=$(ip addr show ap0 2>/dev/null | sed -n 's/.*inet \([0-9.]*\).*/\1/p' | head -1)
if ! echo "$AP" | grep -qE '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$'; then
  echo "FATAL: no ap0 IPv4 (got '$AP') — not starting the bridge"; setprop persist.cpbridge.ap_ip ""; exit 1
fi
setprop persist.cpbridge.ap_ip "$AP"
CONF=/data/vendor/wifi/hostapd/hostapd_ap0.conf
if [ -f "$CONF" ]; then
  S=$(sed -n 's/^ssid=//p' "$CONF" | head -1);  [ -n "$S" ] && setprop persist.cpbridge.ssid "$S"
  P=$(sed -n 's/^wpa_passphrase=//p' "$CONF" | head -1); [ -n "$P" ] && setprop persist.cpbridge.passphrase "$P"
fi
# channel 6 (iPhone refuses 13); bounded so a hung hostapd_cli can't stall the capture
CLI=""; for c in /system/bin/hostapd_cli /vendor/bin/hostapd_cli; do [ -x "$c" ] && CLI="$c" && break; done
[ -n "$CLI" ] && timeout 8 "$CLI" -p /data/vendor/wifi/hostapd/ctrl -i ap0 chan_switch 5 2437 ht > "$D/chan.txt" 2>&1
setprop persist.cpbridge.channel 6
echo "ap_ip=$AP ssid=$(getprop persist.cpbridge.ssid) ch=$(getprop persist.cpbridge.channel) pass_len=$(getprop persist.cpbridge.passphrase | wc -c)" > "$D/config.txt"

: > "$D/pids"
# ---- packet capture (only if a tcpdump binary is present; otherwise logcat+snapshots carry it) ----
TD=""; for t in /system/bin/tcpdump /system/xbin/tcpdump /vendor/bin/tcpdump /data/local/tmp/tcpdump; do [ -x "$t" ] && TD="$t" && break; done
if [ -n "$TD" ]; then
  nohup "$TD" -i ap0 -p -nn -s 0 -U -w "$D/ap0.pcap" not port 5555 > "$D/tcpdump.log" 2>&1 </dev/null &
  echo $! >> "$D/pids"; echo "tcpdump=$TD" >> "$D/config.txt"
else
  echo "tcpdump=NONE (relying on logcat + /proc/net snapshots)" >> "$D/config.txt"
fi
# ---- continuous logcat (all buffers) — the vendor iap2/CarPlayControl lines live here ----
logcat -c 2>/dev/null
nohup logcat -b all -v threadtime > "$D/logcat.txt" 2>&1 </dev/null &
echo $! >> "$D/pids"
# ---- periodic ARP + port-7000 snapshots (did the phone appear / connect to :7000?) ----
nohup sh -c 'i=0; while [ $i -lt 70 ]; do { echo "== $(date) =="; cat /proc/net/arp; grep -i 1B58 /proc/net/tcp /proc/net/tcp6; } >> "$D/net.txt" 2>/dev/null; i=$((i+1)); sleep 6; done' >/dev/null 2>&1 </dev/null &
echo $! >> "$D/pids"

# ---- authd (needed each boot) ----
env CPAUTH_LIB=/system/lib64/libCoreUtils.so /data/local/tmp/authd spawn > "$D/authd.txt" 2>&1
sleep 2; /data/local/tmp/authd status >> "$D/authd.txt" 2>&1

# ---- start the SCREEN APP (never started in earlier runs!) + the bridge ----
am force-stop com.cpbridge 2>/dev/null
am start-foreground-service -n app.carplayscreen/.Watcher > "$D/watcher.txt" 2>&1
am start-foreground-service -n com.cpbridge/.BridgeService > "$D/bridge.txt" 2>&1

# ---- auto-stop after 6 min, surviving an adb/Wi-Fi drop ----
nohup sh -c 'sleep 360; kill $(cat "$D/pids") 2>/dev/null' >/dev/null 2>&1 </dev/null &
echo "CAPTURE-STARTED $D"
