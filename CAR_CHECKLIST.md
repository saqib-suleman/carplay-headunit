# Wireless CarPlay — car-session checklist (minimal time)

Everything is pre-built and scripted. At the car it's ~5 commands. Full detail in WIRELESS_DEPLOY.md.

## Ready before you go (done)
- [x] `headunit-carplay-ref/client/CarPlayBridge.apk` (RSA + sound patches), `authd/authd`,
      `tools/propflip/propflip.dex` — all built & verified.
- [x] Per-unit config (BT MACs, serial, AirPlay public key) baked into `deploy-wireless.sh`.
- [x] MFi auth proven on our RSA chip (authd native mode).

## At the car

**0. Park. iPhone: Bluetooth ON, bonded to the unit, NOT plugged into USB.** Laptop on the car's
home Wi-Fi.

**1. Pre-stage (home Wi-Fi) — one command:**
```bash
./deploy-wireless.sh prestage 192.168.1.41
```
(Confirm the unit's IP first if it isn't `192.168.1.41`. If the unit shows "Install anyway?", tap it.)
This pushes everything, sets the known props, re-checks auth, flips wireless mode, and restarts the
vendor service. The unit then raises its own hotspot and **leaves your Wi-Fi** (ADB link drops — normal).
**Do not reboot the unit after this** (a reboot clears the in-memory flag).

**2. Join the unit's hotspot** from the Mac's Wi-Fi menu (name/password: unit Settings → Hotspot).
Your Mac loses internet on it — that's expected.

**3. Bring up authd + bridge — one command:**
```bash
./deploy-wireless.sh hotspot
```
It auto-detects the hotspot gateway, reads the live Wi-Fi values, then **auto-validates every
config value** (prints OK/BAD per field — especially bssid must be the ap0 MAC, not the BT MAC),
spawns authd (native RSA), and starts the bridge. If anything shows **BAD**, fix it and re-run
`./deploy-wireless.sh verify <AP-IP>`. If SSID/passphrase weren't auto-read, set them once (it prints
the two lines).

**4. Watch the handshake:**
```bash
./deploy-wireless.sh watch <AP-IP>      # AP-IP is printed by step 3
```
Expected ladder:
```
a_rfcomm_connect  OK peer=C0:A6:00:C7:3A:29
b_link_sync       NEGOTIATION COMPLETE
d_session         IDENTIFICATION ACCEPTED (0x1D02)
e_auth            AUTH SUCCEEDED (0xAA05)        <- our RSA signature accepted
f_credentials     SENT 0x5703 ssid=... 
g_carplay         SENT 0x4301 CarPlayStartSession
```
Then the iPhone joins the hotspot and the CarPlay screen opens in `app.carplayscreen` (~a minute).

## If it stalls (where to look)
- **`e_auth` fails (0xAA04):** authd not running or chip contention — `authd status`; our sig is RSA
  so expect `signature length 128 != expected` as a *warning* only, not a failure.
- **Auth OK but phone never joins the AP:** the `0x5703` Wi-Fi handoff params (SSID/passphrase/channel/
  bssid) — the likeliest wire mismatch. Re-check what step 3 set.
- **Joins AP but no screen:** `source_version` — CONFIRMED `320.17.3` (the unit's own advertised
  record), already set; if the receiver still refuses, re-check the AirPlay port/receiver.

## Done / revert
```bash
./deploy-wireless.sh revert 192.168.1.41     # removes bridge, stops authd, reboots back to wired
```
Reboot alone also reverts (clears the in-memory flag). **Turn off network ADB** in Developer options
when fully finished (anyone on the Wi-Fi gets a root shell while it's on).

## Other quick tasks (independent of wireless; do on home Wi-Fi)

**Update the screen app for the new icon + Connect-to-CarPlay screen** (rebuilt into CarPlay.apk):
```bash
adb -s 192.168.1.41:5555 install -r headunit-carplay-ref/carplay-screen/CarPlay.apk   # tap "Install anyway"
```
The Apple-logo icon shows in the app list; the "Connect to CarPlay" screen shows when no iPhone is
attached. (Same package/key, so it updates in place.)

**Discover the BTMUSIC source-switch trigger** (so we can auto-select BTMUSIC on CarPlay connect).
With CarPlay connected but the source NOT on BTMUSIC:
```bash
./btmusic-autoswitch.sh discover 192.168.1.41     # press SOURCE->BTMUSIC when prompted; it captures what fired
# then test a candidate it found:
./btmusic-autoswitch.sh try 192.168.1.41 'am broadcast -a <ACTION-FOUND> ...'
# once one works, auto-apply it on every CarPlay connect:
./btmusic-autoswitch.sh watch 192.168.1.41 '<the working command>'
```
If `discover` shows nothing useful, pull `BwMediaPlayer.apk` (`adb pull /system/app/BwMediaPlayer/
BwMediaPlayer.apk`) so we can decompile the tab-switch path offline.

**Install the Head Unit Helper app** (platform-signed; restart button + call accept/reject):
```bash
adb -s 192.168.1.41:5555 install -r restart-app/HeadUnitHelper.apk
# phone perms are runtime (not auto-granted by signature) — grant them for call control:
adb -s 192.168.1.41:5555 shell pm grant app.restart android.permission.READ_PHONE_STATE
adb -s 192.168.1.41:5555 shell pm grant app.restart android.permission.ANSWER_PHONE_CALLS
# launch once so the call-control service starts (and arms on every boot):
adb -s 192.168.1.41:5555 shell am start -n app.restart/.MainActivity
# verify REBOOT granted (platform signature):
adb -s 192.168.1.41:5555 shell dumpsys package app.restart | grep -iE "REBOOT|ANSWER_PHONE"
```
"Head Unit Helper" appears in the app list. Tap it → Restart Now (confirm) to reboot. The call
feature runs in the background: **while a call rings, steering Vol-Up = answer, Vol-Down = reject**.
Reboot caveat: PowerManager.reboot is the only reliable reboot here, but no software reboot recovers a
fully *wedged* USB state — that still needs a full power-down.

**Call feature — VERIFIED 2026-10-28** (answer/reject both work). To re-check after a reinstall:
```bash
adb -s 192.168.1.41:5555 logcat -v time -s CallVol:E   # NOTE :E — this unit drops Info-level logs
```
Expect on a ring: `volume keys grabbed for ringing call`, then `key during ring: keyCode=24` +
`answered call (volume up)` on Vol-Up, or `keyCode=25` + `rejected call (volume down)` on Vol-Down.
(The APK now carries the `bw.car.proxy` uses-library fix; without it the service NoClassDefFounds.)
