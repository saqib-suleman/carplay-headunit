# At-car findings (stock reference app session)

Hard-won learnings from testing the stock reference app on the real unit. Keep these — several were
surprising and cost real time.

## Wired CarPlay with the stock app — what works
- **Screen, touch, volume, auto-show** all work on a clean first-plug after boot. The stock app's
  Watcher brings the screen up by itself once it's been launched once (so it's out of the
  "stopped" state and gets `BOOT_COMPLETED`).
- **Audio works** when the unit's source is **BTMUSIC** (see below).

## The big insight: steering + audio depend on the unit's audio SOURCE
- The steering **◄ ►** (and play/pause) are **not** Android key events — `getevent` never sees them.
  The vendor routes them to the **currently selected audio source**.
- Only when the source is **BTMUSIC** do they reach the iPhone (as Bluetooth AVRCP) and control
  CarPlay's now-playing. On any other source (IPOD/MUSIC/RADIO/AUX) they drive that local source.
- Audio is the same story: on this unit CarPlay is effectively a **hybrid** — screen/touch over
  CarPlay (USB), **audio + track controls over Bluetooth** (A2DP/AVRCP), which only lines up on
  BTMUSIC. That's why "Spotify played then paused" before: wrong source.
- **The center SOURCE steering button cycles sources.** Manual workaround = press SOURCE until BTMUSIC.

## TODO: auto-select BTMUSIC on CarPlay connect
The source switch mechanism (reverse-engineered from `BwCarService.apk` / `com.bw.car`):
- `CarGlobalKeyReceiver` (`GLOBAL_BUTTON`) → `CarInputService.handleCarGlobalKey(event)` for the
  SOURCE key.
- Actual switch: `CarAudioService.setSourceChannel(channel)` → `AudioHalService.setSourceChannel`
  → vehicle HAL property `AUDIO_SETTING_SOURCE` (id 557846753). Channels come from a
  `CarAudioSource.SourceChannel` enum (has e.g. `CALL`; BT channel # still to pin down).
- **The `bw_current_source_name` / `bw_front_source_statck` system settings are only a status
  mirror — writing them does NOT switch the source** (tested on device: wrote MUSIC_BT while on
  IPOD, nothing switched).
- So auto-switch needs invoking the car-service path (or the HAL property) on CarPlay connect — a
  root helper/watchdog that calls into the car service, not a settings write. Separate task.

## Reboot reliability (important and unexpected)
- `adb reboot`, `setprop sys.powerctl reboot`, and even sysrq **did not reliably reboot** the unit,
  especially with the iPhone plugged in and USB wedged — they hung or were ignored.
- **`svc power reboot` (PowerManager path) is the one that worked** — but even it stalled once with
  USB wedged, killing the UI (black screen) without completing the reboot.
- Recovery from that half-shutdown black screen required a **full power-down** (car off several
  minutes); ignition-off alone did NOT cut SoC power (uptime kept climbing).
- **The replug is the trap:** first plug after boot connects; unplug/replug wedges the USB
  (`sys.usb.config=nocarplay` vs `state=carplay`), and in that state reboots fail. Avoid replugging;
  if wedged, unplug the phone first, then reboot, or full power-down.

## Clean-slate / install notes
- Stock `carplay-screen/CarPlay.apk` targets old API → the unit shows "built for older Android,
  install anyway?" on `adb install`; tap Install.
- After install, launch the app once (`am start -n app.carplayscreen/.MainActivity`) so the Watcher
  arms for future boots.

## Wireless MFi auth (authd) — partial, blocked on signing
Tested the built `authd` on the real unit (chip at `/dev/i2c-6`, addr `0x11`):
- `authd` direct-I2C mode → **Remote I/O error (121)** on registers 0x30+ (our chip's register map
  differs from the author's).
- **Approach A works for cert**: `CPAUTH_LIB=/system/lib64/libCoreUtils.so authd cert` returns a
  valid **908-byte** MFi certificate (author's was 607 — different chip revision). `libCoreUtils.so`
  is at `/system/lib64/` (not `/vendor`).
- **Signing FAILS**: `authd sign` → ret=-1, len=0. selftest: `chip version: unavailable (ERMOTEIO
  contention)`, `sign 1/1 ret=-1`, RESULT: **FAIL**.
- Diagnosis: the MFi chip is **contended/held by the running vendor CarPlay service**; authd can't
  get exclusive access to sign. Freeing it means disabling vendor CarPlay (`carplay_on=0`) or killing
  iapd — but `carplay_on=0` is a KNOWN-risky op on this unit (earlier: CarPlay off → Bluetooth hang →
  system instability). And wireless needs the vendor service running for AirPlay, so there may be an
  inherent chip-contention conflict between authd and the vendor.
- `authd`/`cpauth_client` left at `/data/local/tmp/` (remove with `rm` to clean up).

## WIRELESS AUTH SOLVED — our chip is RSA (MFi Auth 2.0C), not ECDSA v3
Root cause of the sign failure: **our MFi chip is a different, older variant than the author's.**
- Our cert: **RSA-1024**, `sha1WithRSAEncryption`, subject `CN=IPA_2222AA211210AA06AA0122AA229897`,
  issuer "Apple iPod Accessories Certification Authority" → **MFi Auth 2.0C (RSA)**.
- Author's chip: ECDSA P-256 (Auth 3.0), 607-byte cert, 64-byte sig.
- That's why: cert is 908 bytes (RSA), signature is **128 bytes** (RSA-1024) and **deterministic**
  (RSA PKCS#1 is deterministic). The vendor lib correctly reported "Auth v.2 chip".
- The whole bridge/authd stack was built for ECDSA v3 (32-byte challenge, 64-byte sig). Our chip
  wants a **20-byte challenge → 128-byte RSA sig**.

**Verified working (clean, native path — no hacks):**
- `CPAUTH_LIB=/system/lib64/libCoreUtils.so authd sign <20-byte-hex>` (NO force) → valid 128-byte sig.
- Raw RSA-verify against the cert's public key recovers a textbook PKCS#1 v1.5 block:
  `0001 ff..ff 00 | SHA1-DigestInfo(3021 3009 0605 2b0e03021a 0500 0414) | <the 20-byte challenge>`.
  i.e. the chip RSA-PKCS1-v1.5-signs the iPhone's 20-byte challenge (treated as the SHA-1 digest).
- Wired CarPlay already authenticates with this chip, so the iPhone accepts this RSA auth.

**What this means for wireless:** auth is feasible. authd works natively for our RSA chip; the iPhone
will send a 20-byte challenge for the RSA cert, the bridge passes it through, authd returns the
128-byte sig. (Added `CPAUTH_FORCE_AUTH3` to authd.c for the v3-forcing experiment — NOT needed for
the real RSA flow; the daemon runs native with just `CPAUTH_LIB` set.)

**Remaining for a wireless handshake (next focused session):**
1. Flip wireless mode (propflip `ro.atc.carplay.wireless=1`) → unit raises hotspot, leaves Wi-Fi.
2. Reconnect ADB via the hotspot; deploy `CarPlayBridge.apk`; `authd spawn` (native, CPAUTH_LIB).
3. Set per-unit `persist.cpbridge.*` values incl. AirPlay public key.
4. Bring iPhone in over Bluetooth; watch the handshake. Verify the bridge handles the 20-byte
   challenge / 128-byte RSA sig end-to-end (it passes challenge/sig "as-is", so likely OK).
