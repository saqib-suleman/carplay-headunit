# Wireless CarPlay sound — diagnosis and what we can actually fix

The author's own summary: on wireless, **screen and touch work, but CarPlay's own audio does not play
over the Wi-Fi session** — *"the bridge and the head unit's Bluetooth conflict"* — so his workaround is
to connect the iPhone to the car's Bluetooth (A2DP) and set the head unit's audio source to Bluetooth.
He lists making it seamless as "in progress." This is his open problem, not a solved one, so treat
everything below as experiments to run at the car, not guarantees.

## It's two problems, not one

**Problem A — REVISED 2026-10-28 after decompiling the vendor receiver: there IS a wireless audio
path.** The earlier claim here ("no audio path, hard ceiling") was an assumption from the author's
note, made before we had `com.autochips.carplay` decompiled. The receiver actually contains a complete
audio path: `com.autochips.carplay.av.AudioStream` (native `native_setup/start/stop/setVolume` in
`libcarplay_av_jni.so`) and `av/b.java` (`AudioStreamController`), which **creates audio streams on
demand by stream ID (100/102 = main media, 101 = Siri/calls)** when the CarPlay session signals them
via the plugin's native callbacks (`onStreamStateChanged`, `service/n.java`). So once the Wi-Fi
CarPlay session fully establishes, the receiver creates these audio streams — but **"it will then play
automatically" is too strong** (adversarial review 2026-10-28). The real path is stream creation →
`StreamController` → vendor resource/audio state machines → **focus / audio-mode / routing** decisions
→ native playback, and any of those can leave it silent. Caveats: (1) **stream 102 has a dispatch
defect** — `av/a.java` handles only IDs 100/101, so `start(102)`/`stop(102)` return -2 (bites only if
102 is negotiated); (2) the **Bluetooth disconnect may be deliberate vendor behaviour** — session
event 1 → `c/a.java` disconnects HFP+A2DP, and `ro.atc.carplay.disable_bt=0` does not stop that
per-device path, so the session-quiet dialer patch can't prevent it; the author's "BT conflict" is a
hypothesis, not established; (3) IDs aren't "media vs Siri": 100 = duplex call/recognition, 101 =
alternate output. So treat native Wi-Fi audio as **plausible but unproven**. Confirm at the car with
`dumpsys audio` / `media.audio_flinger` / `media.audio_policy` while music should play (the capture
script collects these), plus `AudioStreamController: created, streamID:` lines. Keep the BT A2DP
workaround (Fix 2) as the tested media fallback; calls/mic over HFP need separate verification.

**Problem B — the Bluetooth (A2DP) audio workaround isn't seamless (partly fixable).**
Because of A, the practical path is the "dongle" approach: video over Wi-Fi, audio over Bluetooth
A2DP. Two things make that clumsy today, and we can improve both:

1. **The bridge churns the Bluetooth radio during the whole session.** After the handoff the iPhone
   drops Bluetooth and CarPlay runs over Wi-Fi, but the bridge's dialer sees "no link" and **re-dials
   the iPhone's RFCOMM every 5 s forever** ([BridgeService.java:262](headunit-carplay-ref/client/src/com/cpbridge/BridgeService.java:262),
   `DIAL_RETRY_INTERVAL_MS`). There is one BT radio; those constant RFCOMM/SDP attempts contend with
   the A2DP stream and are the most likely cause of the "conflict" he describes (stutter/dropouts, or
   A2DP never settling). **This is the one part we can fix in code** — see Fix 1.
2. **The audio source must be switched to Bluetooth by hand** every time. We can try to automate that
   — see Fix 2 (needs an at-car discovery step first).

## Fix 1 — stop the bridge churning Bluetooth during the session (prepared patch)

`patches/cpbridge-session-quiet.patch` adds a **post-handoff quiet period**: once the Wi-Fi
credentials are sent (the session is handed to Wi-Fi), the dialer holds off re-dialing for
`persist.cpbridge.session_quiet_ms` (default **120000 ms = 2 min**), so the BT radio is left free for
A2DP. It resumes dialing after that window so a failed handoff still recovers. Set it to `0` to restore
the original continuous 5 s re-dial.

Apply it to his (otherwise pristine) repo, then build the bridge as usual:

```bash
cd /Users/saqibsuleman/code/personal/carplay
git apply --directory=headunit-carplay-ref -p1 patches/cpbridge-session-quiet.patch
ANDROID_SDK_ROOT="$HOME/Library/Android/sdk" ./headunit-carplay-ref/client/build.sh   # -> client/CarPlayBridge.apk
```

Tune or disable the window on the unit (no rebuild needed):

```bash
adb shell setprop persist.cpbridge.session_quiet_ms 300000   # 5 min, e.g. for a long drive
adb shell setprop persist.cpbridge.session_quiet_ms 0        # back to continuous re-dial
```

**How to tell if it helped:** with the A2DP workaround connected, play music and compare the patched
build (quiet period on) against the stock build (`session_quiet_ms 0`). If the audio stutter/dropouts
go away, the RFCOMM churn was the conflict. **This does not give Wi-Fi audio** (Problem A) — it only
makes the Bluetooth workaround stable.

## Fix 2 — make the audio-source switch automatic (at-car discovery first)

His manual step is "set the head unit's audio source to Bluetooth." If we can find how the unit does
that, the screen app's `Watcher` (which already gets `onConnectionStateChanged`) could do it
automatically when CarPlay comes up. We can't know the mechanism offline — run this at the car **while
manually switching the source to Bluetooth**, and capture what changes:

```bash
# 1) Snapshot audio routing + settings before and after the manual switch:
adb shell dumpsys audio > /tmp/audio_before.txt
#   ... now switch the head unit's audio source to Bluetooth by hand ...
adb shell dumpsys audio > /tmp/audio_after.txt
diff /tmp/audio_before.txt /tmp/audio_after.txt

# 2) Watch for the broadcast/activity the source switch fires:
adb shell logcat -v time | grep -iE 'audio|source|a2dp|media|avrcp|route' &
#   ... switch source to Bluetooth, then back ...

# 3) See which settings key (if any) tracks the audio source:
adb shell 'settings list system; settings list global' | grep -iE 'audio|source|bt|media'
```

If the switch turns out to be a `settings put` key or a broadcast intent, automating it is a few lines
in `Watcher` (or a one-line `adb` you run). If it's an in-app-only control with no external hook, it
stays manual — report that and stop. Also worth checking in the same session: whether the iPhone's
A2DP even auto-connects to the unit when CarPlay starts, or whether that too is manual.

## Fix 3 — native Wi-Fi audio (not available)

Covered under Problem A. Record it as a known limitation: the vendor AirPlay receiver doesn't play
CarPlay audio, and we can neither patch it safely nor substitute our own receiver for the encrypted
CarPlay audio session. If a future firmware or a safe vendor flag ever enables the receiver's audio
path, this reopens — nothing on our side blocks it.

## Honest expectation to set before the car

- Wireless gives **screen + touch**. Audio is the **Bluetooth A2DP workaround**, not CarPlay's native
  Wi-Fi audio, and that's a firmware limit we can't remove.
- Fix 1 (prepared) should make that workaround **stable** by stopping the bridge from fighting the BT
  radio — the most defensible read of his "conflict."
- Fix 2 may let us **automate the manual source switch**, pending what the at-car discovery finds.

## CONFIRMED at the car 2026-10-29 (wireless screen works; audio does not)
- Wireless CarPlay **screen + touch work**. Audio plays on the **iPhone's own speaker**.
- `cp.setAudioEnable(true)` returns 0 (success) but **no CarPlay audio streams are created** on the
  unit (AudioFlinger 0 tracks; no AirPlay/AudioStream events). So iOS is NOT sending CarPlay audio to
  the car over Wi-Fi — vendor-side enable is not the missing piece.
- Bluetooth: **A2DP Sink Disconnected, HFP Disconnected, only AVRCP connected**; active source =
  `MUSIC_BT`. No BT audio path either -> sound stays on the phone.
- Matches the reference author's known limit. Realistic path = the **A2DP workaround**, currently
  blocked because the bridge churns Bluetooth (re-dials ~every 2 min), so A2DP never stays up.

### Next-trip experiment (free Bluetooth for A2DP)
Once wireless CarPlay screen is up:
1. Stop the bridge to free the BT radio (the Wi-Fi session stays up; BT link was already torn down):
   `adb -s <AP-IP>:5555 shell am force-stop com.cpbridge`
2. On the iPhone, connect Bluetooth **media/A2DP** to the unit (Settings > Bluetooth > unit, enable;
   or Control Center audio-output > the car). Confirm head-unit source = BT/MUSIC_BT.
3. Play music -> should come through the car over A2DP. Re-capture `./wireless-capture.sh audio`.
If A2DP still won't connect with the bridge stopped, the bridge/BT conflict is deeper (bonding/role);
if it connects and plays, make the bridge stop re-dialing whenever a CarPlay session is active.
