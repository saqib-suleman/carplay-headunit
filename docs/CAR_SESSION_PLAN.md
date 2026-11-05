# Car session plan — 3 iterations max, then gather data and come back

Goal: confirm the connect fixes (A–E) and the on-unit toggles. Cap at 3 attempts. If it isn't clearly
better by then, run the collector and bring the `.tgz` back — don't keep poking.

Before you leave home Wi-Fi: both APKs are built and all scripts are staged. Nothing else to prep.
Keep the iPhone **unlocked, BT + Wi-Fi on, NOT on USB** the whole time (USB wedges `adb root`).

Each iteration = one connect attempt wrapped in a capture, so even a failure yields full data.

---

## Iteration 1 — full install + baseline

```bash
bash tools/push-fixes.sh      # installs both APKs + daemon + helper, then reboots (unattended ~2-4 min)
```
Wait for the unit to come back and its hotspot to appear, join the hotspot, then:
```bash
bash tools/collect.sh         # captures ~240s — attempt the connect during that window
```
Read `wireless-data/collect-*/cp-col-*/timeline.txt` and `net.txt`.

Decision from iteration 1:
- **Connects in ~10–20 s, screen + touch work** → success. Do one more connect to confirm it repeats,
  then you're done. Try the on-screen toggles (open the CarPlay app's connect screen).
- **Connects but slow (> ~40 s) or flaky** → go to Iteration 2 (tuning).
- **Never connects** → look at `net.txt` (and `logcat-pre.txt`, which holds any automatic first attempt
  from the boot before capture started):
  - iPhone got a DHCP lease AND port 7000 reached `ESTABLISHED` → it connected at the network layer.
    That alone does NOT prove the only problem is the screen — also check the logs for a CarPlay
    receiver/session event (grep `CARPLAY_SESSION`, `AirPlay session`, `CarPlayScreen`) before blaming
    the display. Note it, go to Iteration 2.
  - lease present but 7000 stays `0A` (LISTEN only) → handoff address/timing. Check `timeline.txt` for
    `apIp=` vs the live `ap0` in `net.txt`; they should match now (fix A). Go to Iteration 2.
  - no lease at all → phone never joined Wi-Fi (channel/hotspot). Check `timeline.txt` for a
    `WARN ap0 channel` line (fix #5 couldn't force channel 6). Go to Iteration 2.

---

## Iteration 2 — one targeted change (pick ONE from the table), then re-capture

Set the knob, no reboot needed (takes effect on the next dial), then re-run the connect + capture:
```bash
# examples — run only the one the iteration-1 table points to:
adb shell su 0 setprop persist.cpbridge.handoff_grace_ms 15000      # failed handoff retries sooner
adb shell su 0 setprop persist.cpbridge.negotiate_deadline_ms 10000 # drop a stuck link faster
bash tools/collect.sh
```

| Iteration-1 symptom | Change for iteration 2 |
|---|---|
| Slow because of long gaps between attempts | `handoff_grace_ms=15000` |
| Link reaches NEGOTIATING then stalls (timeline shows SYN retries, no NEGOTIATION COMPLETE) | `negotiate_deadline_ms=10000` |
| 7000 never ESTABLISHED, `apIp` ≠ live `ap0` in the logs | STOP — that means fix A didn't take; capture and bring back (don't burn iteration 3) |
| No DHCP lease (phone won't join) | re-run `bash tools/collect.sh` once after confirming the hotspot is really up (`net.txt` shows ap0 has an IP); if still none, capture + bring back |

---

## Iteration 3 — confirm or stop

- If iteration 2 improved it, repeat that connect once to confirm it's stable. Done.
- If not improved, **stop poking**. Run the collector so we have complete data:
```bash
bash tools/collect.sh 300
```
Bring back `wireless-data/collect-*.tgz`. That has: full logcat, the `+Nms` milestone timeline,
port-7000 state over time, DHCP leases, ap0 address, all `persist.cpbridge.*` + `ro.atc.carplay.*`
props, the daemon log, and the boot klog — everything needed to diagnose offline.

---

## Toggles to try (any iteration, on the unit, no laptop)

Open the **CarPlay** app → connect screen (shown when no iPhone attached):
- **Wireless CarPlay** switch — instant on/off.
- **Hotspot** switch — off frees the unit's Wi-Fi (confirms, then reboots). On brings it back.

## If wireless CarPlay DOES come up — the audio trial (bonus, needs a working session)

Only possible once screen + touch work over Wi-Fi. This tests whether CarPlay audio can reach the car and,
if not, which stage fails (likely the vendor stream-102 dispatch bug). On the hotspot (or wired IP:5555):

```bash
bash tools/audio-capture.sh arm      # sets debug.cp.cpaudio=1, restarts the screen app, starts logging
```
Then make sure CarPlay is up, play known music on the iPhone with output set to CarPlay, and while it
should be audible:
```bash
bash tools/audio-capture.sh grab     # snapshots audio state, pulls wireless-data/audio-*.tgz to send back
```
What it answers: does `onStreamStateChanged` fire for stream **102** (and is there no playing AudioTrack)?
That confirms the dispatch bug and points to a ~2-line vendor-APK fix. Send back the `.tgz`.

## If you need the unit's Wi-Fi during the session
`hotspot.sh off` (or the Hotspot switch) frees the radio; remember wireless CarPlay is then off until you
turn the hotspot back on.

## Move the CarPlay sidebar to the right (RHD) — one-off, independent of the wireless test
USB unplugged, on the hotspot (or wired with `IP:5555`):
```bash
bash tools/set-rhd.sh on
```
Flips `right-hand-drive` to 1 in `/system/etc/carplay/carplayaccessoryinfo.xml` (backup + read-back) and
reboots. After it boots, reconnect CarPlay — the dock/sidebar is on the right. `set-rhd.sh off` reverts.
Best done on its own reboot (it edits /system), e.g. right after you've confirmed the wireless behavior,
so a bad edit can't muddy the connect test.
