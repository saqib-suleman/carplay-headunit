# Car runbook — WIRELESS CARPLAY FIRST

Priority this visit: **get the wireless CarPlay screen up.** Everything else (SOURCE/media/calls) is
Phase 2 and only after wireless is working or parked. The unit is in persistent wireless mode (boots to
its own hotspot), so it all happens on the hotspot — no mode flips, no `/vendor` writes. Your laptop is
offline from Claude while on the hotspot; every step is a local script. Run from
`/Users/saqibsuleman/code/personal/carplay`.

====================================================================
## PHASE 1 — WIRELESS CARPLAY (the priority)
====================================================================

### 1.0  Prep
- iPhone: **Bluetooth ON, Wi-Fi ON, unlocked, bonded, NOT on USB.**
- Laptop: join the **unit's hotspot** (lose internet — expected).

### 1.1  Install what wireless needs (≈30 s)
```bash
./car-setup.sh
```
Installs the screen app (its `Watcher` is what opens CarPlay when the session connects) + the bridge
(+ Head Unit Helper, harmless for now). Must say Success.

### 1.2  Bring up wireless + capture  ← THE MAIN ACTION
```bash
./wireless-capture.sh start
```
Pins the **correct ap_ip + ch6 + creds**, **starts the screen app `Watcher` AND the bridge**, spawns
authd, and records everything (logcat + ARP/TCP, pcap if present) for ~6 min, surviving the ADB drop.

### 1.3  Watch the unit's screen for 2–3 minutes
Keep the iPhone **unlocked**. 
- **CarPlay appears → wireless works.** 🎉 Go to Phase 2 to try the buttons/calls.
- **Nothing after ~3 min →** that's fine, the capture is the point:
```bash
./wireless-capture.sh browse      # pick the UNIT's _airplay._tcp / _carplay-ctrl records, not the Mac's
./wireless-capture.sh pull        # copies the capture to wireless-data/
```
Then rejoin home Wi-Fi and tell Claude **"captured"** — I read it and say exactly what's blocking.

### 1.4  Contingency (only if the capture/logs show the Bluetooth link dropping mid-handoff)
The bridge's link-watchdog is now tunable. If `CPBRIDGE_DIAG` shows `LINK WATCHDOG ... closing` within
a few seconds of the iPhone associating, keep the link alive longer and retry — no reinstall:
```bash
adb -s <AP-IP>:5555 shell setprop persist.cpbridge.watchdog_ms 60000
adb -s <AP-IP>:5555 shell am force-stop com.cpbridge
./wireless-capture.sh start
```
(Default is 8 s; `60000` = 60 s. Only do this if the log points to the watchdog.)

====================================================================
## PHASE 2 — features (only once wireless is up or parked)
====================================================================

- **SOURCE on BTMUSIC first** (works even without CarPlay): play music, press SOURCE once → should
  play/pause, and the log shows `[ev] keyCode=NNNN` (confirms the button + its real code).
- **In CarPlay:** SOURCE 1× = Play/Pause, 2× = Siri; steering **next/prev/play** control CarPlay.
- **Calls:** Vol-Up answer, Vol-Down reject; during a call, SOURCE moves audio phone↔unit.
- **Audio:** play music in CarPlay → is there wireless sound?

Feature logs (your own terminal, on the hotspot):
```bash
adb logcat -v time -s CarPlayScreen:E CallVol:E
```
- `CarPlayScreen` — `[cp] connection state 2 (CONNECTED -> show)` = session connected + screen opened;
  `[ev] keyCode=` = a steering button's real code; `SOURCE -> ...`, `steering media -> updateMedia`.
- `CallVol` — `answered/rejected`, `SOURCE in call -> audio to PHONE/HEAD UNIT`.

====================================================================
## Status (honest)
====================================================================
- **The wireless screen is the open item.** Phase 1 either brings it up (we fixed the wrong ap_ip and
  the never-started screen app, and made the Watcher register reliably) or the capture pinpoints the
  real remaining blocker (native iAP2 gate / pairing / the link-watchdog — contingency 1.4 covers the
  last one in-trip).
- **Ready the moment CarPlay is up:** SOURCE (works outside CarPlay too), steering media, calls.
- **Not needed for buttons:** auto-switching to BTMUSIC — only relevant later for routing wireless
  *audio* through the speakers (`./btmusic-autoswitch.sh discover`, Phase 2+, only if audio is silent).

## Revert to wired (optional, one /vendor write)
```bash
adb -s <AP-IP>:5555 shell su 0 sh -c 'sed "s/^ro.atc.carplay.wireless=1\$/ro.atc.carplay.wireless=0/" /vendor/build.prop > /data/local/tmp/bp && cat /data/local/tmp/bp > /vendor/build.prop && sync'
adb -s <AP-IP>:5555 shell su 0 svc power reboot
```
