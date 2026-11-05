# Third-opinion request — verify the round-2 fixes (regression-focused)

You are an independent reviewer. Same project: aftermarket wireless Apple CarPlay on an Autochips
AC8257 / BWIC "Yato1 A100" head unit (Android 9, userdebug, root via `su 0`, SELinux **permissive**).
Two prior reviews are in `docs/SECOND-OPINION-wireless-carplay-review.md` and
`docs/SECOND-OPINION-2-review.md`. Review #2 found real bugs; they were just fixed (round 2). **We have
at most ~3 car attempts and cannot iterate quickly.** Your job now is narrow: confirm the round-2 fixes
are correct AND that they did not introduce a new bug or regress the previously-confirmed cold-boot flow.
Read the actual code; cite `file:line`. Do NOT assume the fixes are correct.

Context that matters: wireless CarPlay screen+touch was once confirmed working end-to-end on a cold boot
(before these two rounds of changes). The root cause of the 5–8 min / unreliable behaviour was: the
bridge advertised the wrong AP IP (`192.168.43.1`) in the `0x4301` handoff while the real `ap0` had a
random `192.168.43.x`, and a 120 s "quiet" window then froze retries.

## Round-2 changes to verify (read each)

Bridge app (`headunit-carplay-ref/client/src/com/cpbridge/`):
- **A** `BridgeConfig.apIpv4Live()` now hard-codes `ap0` (was `apInterfaceName()`, which fell back to
  `swlan0`/`wlan0`/`wlan1` and could return a station address). `apIpv4Validated()` prefers live over a
  pinned prop; `sendCarPlayStartSession()` defers `0x4301` if neither yields a real IP.
- **#4** `BridgeConfig.carplayReceiverConnected()` parses `/proc/net/tcp` + `tcp6` for an ESTABLISHED
  (`st==01`) local port `7000` (`:1B58`). The dial loop pauses when `mDialPaused || carplayReceiverConnected()`.
- **#11** New deadline/grace timers use `SystemClock.elapsedRealtime()` (handshake epoch, `mQuietDialUntilMs`,
  `mNegotiatingSinceMs`). The EXISTING no-RX watchdog (`mLastRxAt`, `linkWatchdogMs`) and SYN-resend were
  left on `System.currentTimeMillis()` — deliberately isolated, never compared across clocks. Confirm that
  isolation holds (e.g. `timerLoop()` uses `now` for the watchdog and a separate `enow` for the deadline).
- **BootReceiver** no longer auto-starts `BridgeService` on boot (was starting from a saved pref before AP
  readiness). The daemon is now the only starter.

Daemon `tools/carplay-boot.sh`:
- **#2** bridge start is now `ensure_bridge()` (idempotent `am start-foreground-service` once a valid `ap0`
  IP exists, re-ensure every ~10th loop), decoupled from the `ap_ip` pin / `LAST`. No `pgrep`.
- **#5** `ensure_channel6()` forces channel 6, verifies via `hostapd_cli ... status`, retries up to 3×, and
  sets `persist.cpbridge.channel` to the ACTUAL channel.
- **#7** station/wired-mode branch now force-stops the bridge once, then watches the toggle file.

Scripts:
- **#3** `push-fixes.sh` / `install-bridge.sh` abort on failed install/push; `push-fixes.sh` verifies files
  on `/vendor` and the `carplay_wl` init service before reboot.
- **#6** `tools/cp-hotspot-flip.sh` (/vendor/build.prop) and the device script inside `tools/set-rhd.sh`
  (/system/.../carplayaccessoryinfo.xml): verified backup BEFORE edit, candidate built + verified in
  `/data` before overwriting the live file, restore only from a verified backup, verity refusal.

App (`headunit-carplay-ref/carplay-screen/src/app/carplayscreen/MainActivity.java`):
- **#8** `writeTrigger(String line)` writes ONLY the changed key, via temp file + `renameTo` (atomic), and
  returns success so the UI can surface a failed write; reverts the hotspot switch on failure.
- `collect-device.sh` now snapshots the existing logcat buffer to `logcat-pre.txt` before `logcat -c`.

## Questions, priority order

1. **Regression check (highest):** does the daemon restructure still bring wireless CarPlay up on a normal
   cold boot the way it did before? Trace the main loop: Watcher start, authd, AP IP pin, `ensure_channel6`,
   `ensure_bridge`. Any path where the bridge now never starts, starts too early, or starts in a loop?
   Is `ensure_bridge` correct given `n` starts at 0 (so `n % 10 == 0` on the first iteration)?
2. **`carplayReceiverConnected()` correctness:** are the `/proc/net/tcp` column indices and hex match right?
   False positives (some other ESTABLISHED `:7000`, or a lingering connection from a previous session that
   then blocks all future BT dials)? False negatives? Is reading `/proc/net/tcp` from an untrusted app on
   this permissive build actually going to work, and does a failure degrade safely (returns false → falls
   back to grace)?
3. **BootReceiver neuter side effects:** with only the daemon starting the bridge, is there any boot where
   the daemon doesn't run or doesn't reach `ensure_bridge`, leaving the bridge dead? (The init service is
   `class late_start`, `seclabel u:r:init:s0`.)
4. **Hardened flip scripts (#6):** walk the new `cp-hotspot-flip.sh` and `set-rhd` device script for any
   remaining path that can leave `/vendor/build.prop` or the `/system` XML truncated/corrupt, or that
   reboots after a bad edit. Is the "backup size == live size" guard sound across repeat runs?
5. **App atomic write (#8):** is `renameTo` atomic/replacing on this filesystem, and is only-changed-key
   writing free of the accidental-hotspot-reboot path review #2 found? Any case where the daemon reads a
   partially written file?
6. **Mixed monotonic/wall clocks (#11):** confirm no deadline compares an `elapsedRealtime` value against a
   `currentTimeMillis` value anywhere.
7. **Residuals left unfixed:** (a) rapid double-toggle can still clobber the mailbox; (b) `defer 0x4301`
   has no explicit resume (relying on BootReceiver-neuter making it rare + the 8 s watchdog). Are these
   acceptable to leave for a 3-attempt car test, or do they need fixing first?

## Ground rules
- Claims from the code in `/Users/saqibsuleman/code/personal/carplay`; cite `file:line`.
- Genuine MFi chip only; never forge auth. Don't commit unit identity to git.
- Deliverable: ranked list (evidence `file:line`, severity, would-it-waste-a-car-attempt yes/no, fix), then
  a one-line go / fix-first verdict. Call out explicitly anything the round-2 fixes newly broke.
