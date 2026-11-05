# Repurpose the steering SOURCE button (feasibility + what's built)

Goal (user): while CarPlay is active, make the mostly-useless SOURCE button do:
1. **Single press → Play/Pause** of CarPlay media.
2. **Double press → Siri.**
3. **Press during a call → transfer call audio between phone and head unit.**

## Feasibility — all three are feasible with existing APIs (no new protocol RE)

- Play/Pause and Siri: the vendor `CarplayService` exposes `updateMedia(int)` and `requestSiri(int)`
  (decompiled: `service/o.java`, `CarplayService.java`), and the client `CarplayManager` (boot
  classpath) wraps them — the reference's own steering patch calls `cp.updateMedia(3 /*PLAY_PAUSE*/)`
  and `cp.requestSiri(2/3)`. So the actions are proven-available.
- Call-audio transfer: we are the Bluetooth HFP hands-free (HeadsetClient). `BluetoothHeadsetClient.
  connectAudio()` routes call audio to the car (SCO), `disconnectAudio()` hands it back to the phone —
  that's the phone↔unit toggle. Platform-signed app can call it (hidden API, via reflection).

## The one unknown: the SOURCE button's key code

The steering buttons arrive as vendor "car keys" (`bw.car.input.CarKeyEvent`), not standard keycodes,
and `ro.bwic.multi_fingers_keys` is the TOUCHPAD gesture map, not the wheel. SOURCE is handled by the
`com.bw.source` app and is almost certainly one of: `KEYCODE_CAR_MODE=1043`, `KEYCODE_CAR_MEDIA=1035`,
`KEYCODE_CAR_NAVI=1046`, `KEYCODE_CAR_SETUP=1006`, or `KEYCODE_CAR_CUSTOM_KEY0..5=1100-1105`. We grab
it the proven way (same as volume): register the candidate codes with `CarInputManager` at
`PRIORITY_HIGH` so our handler consumes it before the vendor cycles the source. The first SOURCE press
is logged, revealing the real code.

## Also built — steering next/prev/play forwarded to CarPlay on ANY source (replaces the BTMUSIC trick)

User insight: steering next/prev/play only controlled CarPlay when the active source was BTMUSIC (the
vendor routed media keys to the active source → iPhone over AVRCP). Instead of chasing an automatic
source-switch, `carplay-screen/MainActivity` now grabs the standard steering media keycodes
(`MEDIA_NEXT 87`, `MEDIA_PREVIOUS 88`, `MEDIA_PLAY_PAUSE 85`, `PLAY 126`, `PAUSE 127`, `HEADSETHOOK 79`)
through the same `CarInputManager` registration (only while CarPlay is foreground) and forwards them to
`cp.updateMedia(NEXT_TRACK/PREVIOUS_TRACK/PLAY_PAUSE)`. So media control works regardless of the active
source — no manual BTMUSIC juggling. The exact keycodes are logged (`[ev] keyCode=`), so if a button
doesn't fire we see its code and adjust. (Auto-switching to BTMUSIC is still wanted *only* for the
wireless A2DP audio-through-speakers case — a separate at-car `btmusic-autoswitch.sh discover` task.)

## SOURCE now works EVERYWHERE (owned by the always-on Watcher) — and this is the better test

Moved the SOURCE grab from the CarPlay activity into the screen app's always-running `Watcher` service,
so it works inside *and* outside CarPlay. Routing: **in a call** → ignored (Head Unit Helper owns
SOURCE for call-audio); **CarPlay connected** → `cp.updateMedia(PLAY_PAUSE)` (double = Siri) and
next/prev/play → `updateMedia`; **CarPlay not connected** → inject a generic `MEDIA_PLAY_PAUSE` so it
toggles the active source (e.g. BTMUSIC). Media keys are only grabbed while CarPlay is connected, so
they reach the active source natively otherwise and the inject can't loop back.

Why this is the more informative test: the one real unknown is *whether SOURCE reaches CarInputManager
and its keycode* — which is independent of CarPlay and is logged (`[ev] keyCode=`). Testing SOURCE
**outside CarPlay** (e.g. on BTMUSIC) confirms the grab + code even if the wireless screen never comes
up, and that same grab then applies inside CarPlay. Testing inside-only would teach us nothing unless
CarPlay first works. So: **press SOURCE on BTMUSIC first** — if music toggles (and `[ev] keyCode=`
appears), the foundation is proven regardless of the wireless screen.

## (superseded) earlier design — Play/Pause + Siri in the activity

`carplay-screen/CarPlay.apk` rebuilt. `MainActivity` now:
- Connects to the vendor Car input API (added `uses-library bw.car.proxy`, bw.car stubs), and
  **registers the SOURCE candidate codes only while CarPlay is foreground** (onResume), unregistering
  on pause — so SOURCE is untouched everywhere else (incl. during a call, leaving it free for #3).
- Single SOURCE → `cp.updateMedia(PLAY_PAUSE)`; double (≤500 ms) → `cp.requestSiri(DOWN/UP)`.
- Logs every key at ERROR level under tag `CarPlaySrc` (this ROM drops Info/Warn).

**Test at the car** (CarPlay active, screen foreground):
```bash
adb -s <ip>:5555 install -r headunit-carplay-ref/carplay-screen/CarPlay.apk
adb -s <ip>:5555 logcat -v time -s CarPlaySrc:E
# press SOURCE once  -> expect "[ev] keyCode=NNNN" then "[ok] SOURCE single -> play/pause"
# press SOURCE twice -> expect "[ok] SOURCE double -> Siri"
```
From the logged `keyCode=NNNN` we confirm the real SOURCE code and can narrow `SOURCE_KEYS` to just
that one. If no `[ev]` line appears on a SOURCE press, SOURCE isn't delivered through CarInputManager
(it's consumed lower down) — then we capture more candidates or fall back.

## Built (ready to test) — #3 call-audio transfer, in HeadUnitHelper

`restart-app/HeadUnitHelper.apk` rebuilt. `CallControlService` now grabs keys by call state:
- **RINGING** → RING_KEYS (Vol-Up answer / Vol-Down reject) — unchanged.
- **OFFHOOK** (answered call) → SOURCE_KEYS; a SOURCE press calls `toggleCallAudio()`, which flips the
  HFP SCO route via `BluetoothHeadsetClient.getAudioState/connectAudio/disconnectAudio` (reflection,
  `BluetoothProfile.HEADSET_CLIENT=16`, handling both the `(BluetoothDevice)` and no-arg signatures)
  for the connected iPhone — audio to head unit when it was on the phone, and back. This is the HFP
  audio-routing the unit's own in-call switch button does.
- **IDLE** → release everything.

Added manifest perms `BLUETOOTH`, `BLUETOOTH_ADMIN`, `BLUETOOTH_PRIVILEGED` (platform signature grants
PRIVILEGED). No conflict with the screen app's SOURCE grab: that unregisters SOURCE on pause, and the
vendor call UI covers CarPlay during a call, so only `CallControlService` holds SOURCE while OFFHOOK.

**Test at the car** (during an active hands-free call):
```bash
adb -s <ip>:5555 install -r restart-app/HeadUnitHelper.apk   # re-grant phone perms if prompted
adb -s <ip>:5555 logcat -v time -s CallVol:E
# answer a call, then press SOURCE -> "[ok] SOURCE in call -> audio to PHONE/HEAD UNIT"; hear it switch
```
If `toggleCallAudio` logs "no HFP client proxy" or the audio doesn't move, that's the reflection /
privileged-call path to tweak; the `[ev] keyCode=` lines still confirm which SOURCE code arrived.
