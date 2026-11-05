#!/system/bin/sh
# PASSIVE capture on the unit -- makes NO state changes, so it records the real daemon/app-driven
# wireless connect. Invoked by tools/collect.sh.
#   start: clear + run logcat(all buffers) and a 5s ap0/port-7000/ARP/lease snapshot loop.
#   stop : kill those, gather the bridge log + daemon log + props + boot klog, make it adb-pullable.
LATEST=/data/local/tmp/cp-col.latest
case "${1:-start}" in
  start)
    D=/data/local/tmp/cp-col-$(date +%s); mkdir -p "$D"; echo "$D" > "$LATEST"
    # snapshot the EXISTING buffer first (#10): on a cold boot an automatic first connect may have
    # already happened; its vendor/Watcher events are only here, and would be lost by clearing.
    logcat -b all -d -v threadtime > "$D/logcat-pre.txt" 2>&1
    logcat -c 2>/dev/null
    nohup logcat -b all -v threadtime > "$D/logcat.txt" 2>&1 </dev/null & echo $! > "$D/pids"
    nohup sh -c 'i=0; while [ $i -lt 80 ]; do { echo "== $(date) uptime=$(cat /proc/uptime)"; \
        echo "-- ap0 --"; ip -4 -o addr show ap0 2>/dev/null; \
        echo "-- :1B58 port7000 (0A=LISTEN 01=ESTABLISHED) --"; grep -i 1B58 /proc/net/tcp /proc/net/tcp6 2>/dev/null; \
        echo "-- dhcp leases (did the iPhone join?) --"; cat /data/misc/dhcp/dnsmasq.leases 2>/dev/null; \
      } >> "'"$D"'/net.txt" 2>/dev/null; i=$((i+1)); sleep 5; done' >/dev/null 2>&1 </dev/null & echo $! >> "$D/pids"
    echo "COL-STARTED $D" ;;
  stop)
    D=$(cat "$LATEST" 2>/dev/null); [ -n "$D" ] || { echo "no capture dir"; exit 1; }
    [ -f "$D/pids" ] && kill $(cat "$D/pids") 2>/dev/null
    cp /data/media/0/Android/data/com.cpbridge/files/cpbridge.log "$D/cpbridge.log" 2>/dev/null
    cp /data/local/tmp/carplay-boot.log "$D/carplay-boot.log" 2>/dev/null
    cp /data/media/0/Android/data/app.carplayscreen/files/toggle.cmd "$D/toggle.cmd" 2>/dev/null
    getprop | grep -E 'cpbridge|atc\.carplay' > "$D/props.txt" 2>/dev/null
    grep -a carplay_wl /data/misc/bwlog/kernellog/kernel.log 2>/dev/null | tail -60 > "$D/bootklog.txt"
    # human-readable milestone timeline (bridge logs at Error, so these are in logcat too)
    grep -aE '\+[0-9-]+ms|stage=|RFCOMM|NEGOTIATION|0x4301|0x5703|WATCHDOG|DEADLINE|apIp=|DEFERRED|PINNED|STARTED|wl_on|hotspot' \
      "$D/logcat.txt" 2>/dev/null | tail -160 > "$D/timeline.txt"
    chmod -R 777 "$D" 2>/dev/null
    echo "COL-STOPPED $D" ;;
  *) echo "usage: collect-device.sh start|stop" ;;
esac
