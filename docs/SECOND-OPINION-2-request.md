# Second-opinion request #2 — review the connect-fix bundle before a limited car test

You are an independent reviewer. Context: aftermarket Apple CarPlay on an Autochips AC8257 / BWIC
"Yato1 A100" head unit (Android 9, userdebug, root via `su 0`, SELinux **permissive**). Wireless CarPlay
currently takes 5–8 min and is unreliable. A first review (`docs/SECOND-OPINION-wireless-carplay-review.md`)
found the root cause and we implemented a fix bundle. **We get at most ~3 test attempts at the car and
cannot iterate quickly.** Your job: find anything in these changes that is wrong, racy, or would waste a
car attempt. Be skeptical; read the actual code. Do NOT assume it's correct.

Root cause already confirmed from a capture: the bridge advertised `apIp=192.168.43.1` in the `0x4301`
CarPlayStartSession while the real hotspot `ap0` was at a random `192.168.43.x` (Android assigns it via
stock `startTethering`), so the iPhone joined Wi-Fi, got a DHCP lease, then hit a dead address on port
7000 and never connected — and an old 120 s "quiet" window then froze retries.

## What changed (please read each in the repo)

Bridge app (`headunit-carplay-ref/client/src/com/cpbridge/`):
- **A — IP correctness.** `BridgeConfig.apIpv4Validated()` + `apIpv4Live()`: prefer the LIVE `ap0`
  interface address over the pinned `persist.cpbridge.ap_ip` (reverse of before), return `null` if
  neither is real. `Iap2Session.sendCarPlayStartSession()` now DEFERS `0x4301` (returns, keeps the link
  alive) when `apIpv4Validated()` is null, instead of sending the `192.168.43.1` guess.
- **B — bounded handoff grace.** `BridgeConfig.handoffGraceMs()` (default 30000) replaced the 120 s
  `sessionQuietMs`. `BridgeService.onWifiSent()` arms `mQuietDialUntilMs = now + handoffGraceMs()`; the
  dial loop honors it. The connected-session pause (`mDialPaused`, set by the screen app's PAUSE_DIAL
  broadcast) is unchanged.
- **C — timing.** `BridgeConfig.markHandshakeStart()/sinceHandshake()`; `Iap2Link.start()` calls
  markHandshakeStart(); milestone logs append `+Nms` (negotiation complete, 0x5703, 0x4301, PAUSE_DIAL).
- **E — negotiation deadline.** `Iap2Link.enterNegotiating()` stamps `mNegotiatingSinceMs`;
  `timerLoop()` closes the link (`notifyClosedOnce`) if NEGOTIATING longer than
  `BridgeConfig.negotiateDeadlineMs()` (default 15000). Previously it resent SYN forever.

Boot daemon (`tools/carplay-boot.sh`) — **D + toggle plumbing**:
- Removed the early "wired mode → idle forever" line.
- Added `handle_triggers()` (reads `/data/media/0/Android/data/app.carplayscreen/files/toggle.cmd`,
  applies `wl_on=` via setprop and `hotspot=` via `/vendor/bin/cp-hotspot-flip.sh`), called every loop
  AND in a new station/wired-mode watch loop (so the hotspot can be re-enabled from the unit).
- IP-sync block NO LONGER force-stops the bridge; it starts it only if absent (`pgrep -f com.cpbridge`),
  and only advances `LAST` after a successful `setprop`.

On-device toggles (util app `carplay-screen/` + helper):
- `MainActivity` adds two Switches on the connect screen. It reads state via reflection on
  `android.os.SystemProperties.get` (targetSdk 27), and WRITES desired state to the trigger file via
  `getExternalFilesDir` (because an app here cannot call `su`). Best-effort `SystemProperties.set` too.
- `tools/cp-hotspot-flip.sh` (installed to `/vendor/bin`): guarded `/vendor/build.prop` flip of
  `ro.atc.carplay.wireless` (backup, single char write, read-back, size check) + reboot. Invoked by the
  daemon as root.

## Questions, in priority order

1. **Would any of this waste a car attempt?** Highest priority. Think about first-boot behavior.
2. **Daemon restructure correctness.** With the early wired-idle removed and the bridge no longer
   force-stopped on IP change: on a normal cold boot in wireless mode, does the bridge actually get
   STARTED? (It's started only in the IP-sync block "if absent", gated on a valid `ap0` IP appearing.
   Trace it. Is there a boot where the bridge never starts?) Does `handle_triggers()` in the main loop
   interfere with the confirmed-working flow? Is `pgrep -f com.cpbridge` reliable on this toybox?
3. **Defer-0x4301 gate (A).** Could it deadlock — `0x4300` arrives, we defer because no IP, and the
   phone never re-sends `0x4300`, so `0x4301` is never sent even after the IP appears? How likely on a
   real boot (AP up before the phone connects)? Is there a safer fallback than silent defer?
4. **Handoff-grace vs session pause (B).** On a SUCCESSFUL handoff, does `mDialPaused` reliably get set
   (PAUSE_DIAL from the screen app) within the 30 s grace, so the dialer doesn't re-dial BT and disrupt
   the Wi-Fi session when the grace expires? What if the screen app never broadcasts PAUSE_DIAL?
5. **Negotiation deadline (E).** Is `mNegotiatingSinceMs` set on every path into NEGOTIATING (there are
   two: bootstrap and the FF5A "peer skipped detect" path)? Could the deadline fire spuriously during a
   slow-but-healthy negotiation? Default 15 s vs the SYN loop (8 × 500 ms) — any conflict?
6. **On-device toggle feasibility.** Will `SystemProperties.get` work from an untrusted app on this
   build (targetSdk 27, permissive SELinux)? Is `/data/media/0/Android/data/app.carplayscreen/files/`
   the right path, and can the init-context daemon read + delete a file the app wrote there? The app
   writes BOTH keys each time (to avoid clobber) and the daemon acts on `hotspot` only when it differs —
   is that logic sound (no accidental reboot loop)?
7. **`cp-hotspot-flip.sh` safety.** Any path that corrupts `/vendor/build.prop` or bricks boot? Is the
   `mount -o ro,remount /vendor` afterward correct/necessary? Does `svc power reboot` work from the
   daemon's `su 0` context?

## Ground rules

- All claims from the code in `/Users/saqibsuleman/code/personal/carplay`; cite `file:line`.
- Genuine MFi chip only; never propose forging auth. Don't propose committing unit identity to git.
- Deliverable: a ranked list of issues (each: evidence `file:line`, severity, would-it-waste-a-car-
  attempt yes/no, and the fix), then a one-line go / fix-first verdict for the car test.
