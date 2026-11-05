# Seamless CarPlay — the at-car plan (wired + wireless)

The goal is a CarPlay experience that just works: plug in (or start the car), the screen comes up,
touch and steering controls work, audio plays. This is the master plan for getting there. It assumes
the clean slate and the reference app from REFERENCE_APP_SWITCH.md.

## What "seamless" can and can't mean on this hardware

Two limits are below anything we can change from an app, and honesty up front saves a frustrating
session:

- **Wired replug stuck-state** — the vendor kernel's USB role-switch fails on many replugs (CarPlay
  comes up maybe 1 in 5 reconnects without a restart). This is a firmware/kernel bug, not the app.
  The reference app makes the *first* connection reliable; a stuck replug still needs a restart.
- **Native wireless audio** — the vendor AirPlay receiver has no audio path, so wireless audio is the
  Bluetooth A2DP workaround, not CarPlay's own audio (see WIRELESS_SOUND.md).

Everything else below we can push toward seamless. The method is: **establish the stock baseline
first, then close each remaining gap with a change we test on the spot** — never stack untested
changes onto the proven app blind.

## Order of operations at the car

1. **Clean slate + install the stock reference app** — REFERENCE_APP_SWITCH.md (clean-slate.sh →
   install `carplay-screen/CarPlay.apk` → `carplay_on 1` → reboot).
2. **Baseline test** — run the table below on the stock app and write down what already works. The
   author runs this same app on the identical unit, so expect several of our old problems to be gone.
3. **Close the gaps** — only for what's still broken, apply the matching fix below and re-test.

## Baseline test (stock reference app)

| # | Behaviour | How to test | If broken → |
|---|---|---|---|
| 1 | Screen appears on plug-in without a restart | Plug in iPhone; screen should open by itself | Connectivity (below) |
| 2 | No blank screen | Repeat plug/unplug ~5× | Connectivity (below) |
| 3 | Touch works | Tap around CarPlay | (stock app forwards touch) |
| 4 | Steering next / previous / play-pause | Press each steering button while CarPlay plays | **Steering fix (below)** |
| 5 | Steering voice button → Siri | Hold the voice button | **Steering fix (below)** |
| 6 | Spotify play stays playing | Hit play in Spotify | Audio-focus check (below) |
| 7 | Audio through car speakers | Play music | Wired: should work. Wireless: WIRELESS_SOUND.md |

## Steering-wheel controls (prepared fix)

**The finding (from the decompiled vendor framework):** `CarplayManager` exposes the exact API for
this — `updateMedia(int)` with `MEDIA_PLAY=1 / PAUSE=2 / PLAY_PAUSE=3 / NEXT_TRACK=4 / PRE_TRACK=5`,
and `requestSiri(int)` (button down=2 / up=3). **The stock screen app never calls them** — it only
forwards touch — so if steering buttons do nothing in CarPlay, this is why, and it's fixable.

**Step 1 — diagnose how the buttons arrive** (do this on the stock app, CarPlay showing):

```bash
adb shell getevent -lp                     # list input devices + their key capabilities
adb shell getevent -lt                     # live raw events; press each steering button, note the codes
#   in another shell, see how Android dispatches them to the app:
adb shell logcat -v time | grep -iE 'KeyEvent|MediaButton|KEYCODE_|dispatchKey|AudioManager'
```

This tells us three things: whether the buttons reach the app at all, what keycodes they use, and
whether they arrive as KeyEvents (our patch handles these) or as MediaSession/broadcasts (we'd adapt).

**Step 2 — apply the fix** (`patches/carplay-screen-steering.patch`, already compiles): it adds
`onKeyDown`/`onKeyUp` to the screen app that forward the media keys to `cp.updateMedia(...)` and the
voice button to `cp.requestSiri(...)`, and adds those two methods to the compile stub.

```bash
git apply --directory=headunit-carplay-ref -p1 patches/carplay-screen-steering.patch
ANDROID_HOME="$HOME/Library/Android/sdk" JAVA_HOME=/opt/homebrew/opt/openjdk@17 \
  PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH" ./headunit-carplay-ref/carplay-screen/build.sh
adb install -r headunit-carplay-ref/carplay-screen/CarPlay.apk   # same debug key -> updates in place
```

**Step 3 — adjust if the keycodes differ.** The patch uses the standard Android media keycodes
(`KEYCODE_MEDIA_NEXT/PREVIOUS/PLAY_PAUSE`, `KEYCODE_VOICE_ASSIST`). If Step 1 showed different codes
for your steering buttons, change the `case` labels in `MainActivity.onKeyDown` to match and rebuild.

**Scope:** this covers next / previous / play-pause and the voice button. Volume is normally handled
by the head unit itself (not sent to the phone), so leave it. If the diagnostic shows the buttons
never reach the app (a vendor app consumes them), that becomes the next thing to chase — tell me what
`getevent`/`logcat` showed.

## Connectivity

- **Stock already improves this:** the reference app's `Watcher` is a sticky foreground service that
  listens for the connection and launches the screen itself, and re-requests the iPhone's UI on
  resume — which is exactly our old "doesn't show until restart" and helps the blank screen. Test #1
  and #2 should be much better than our old app.
- **Wired replug stuck-state** is the kernel USB bug above — not app-fixable. If you hit it, the only
  recovery is a head-unit restart. If you want a one-tap restart like our old app had, say so and I'll
  prepare a small add-on (a reboot affordance) for the screen app — but it's a recovery, not
  seamlessness.
- **Wireless auto-open** on car start comes from the bridge + `authd` with boot persistence; the one
  caveat is that `authd` must be re-spawned after a full power cycle (WIRELESS_CARPLAY.md W4).

## Spotify play/pause (test #6)

If play immediately pauses, it's an audio-focus tug-of-war, which needs the car to diagnose. Capture
it and we'll chase it from the log:

```bash
adb shell logcat -v time | grep -iE 'AudioManager|audiofocus|AUDIOFOCUS|CarplayService|pause'
```

## Sound on wireless

See **WIRELESS_SOUND.md** — native Wi-Fi audio is blocked by the vendor receiver; the prepared
`cpbridge-session-quiet.patch` stabilises the Bluetooth A2DP workaround, and there's an at-car
investigation for automating the audio-source switch.

## Honest summary

Stock reference app + the steering patch + the sound patch should get wired CarPlay to: opens on
plug-in, touch and steering work, audio through the speakers — i.e. seamless in normal use, with the
kernel replug bug as the one rough edge. Wireless adds screen+touch over Wi-Fi with Bluetooth audio.
Getting the last 10% smooth is a test-and-adjust loop at the car, and I'll drive each fix live when
you're there.
