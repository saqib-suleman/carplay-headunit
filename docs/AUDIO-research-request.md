# Research request — why wireless CarPlay has no sound on this unit (code-level, from existing data)

You are an independent researcher. Aftermarket Apple CarPlay on an Autochips AC8257 / BWIC "Yato1 A100"
head unit (Android 9, userdebug, root, SELinux permissive). **Wired** CarPlay plays audio through the car
speakers natively. **Wireless** CarPlay (screen + touch) works, but CarPlay's own audio does NOT come
through — today's workaround is to play everything over the phone↔car Bluetooth A2DP instead.

The previous owner of this problem (me) earlier classified wireless audio as "not achievable on this
unit / a hardware limit." I now think that verdict was premature and want an unanchored, evidence-based
root-cause analysis. **Do not assume it's unfixable, and do not assume my reasoning below is correct —
challenge it.**

## Why I think the capability exists (verify or refute each point)

1. CarPlay audio is AirPlay in BOTH modes — wired runs AirPlay over a USB network interface, wireless
   over Wi-Fi. Same vendor AirPlay receiver (`libAirPlay.so`), same decoder. If wired audio plays, the
   decode/playback path provably works.
2. The vendor audio machinery looks transport-agnostic: `com/autochips/carplay/av/AudioStream.java`,
   `av/a.java` (start/stop/setVolume for stream ids 100/101), `av/b.java`, `StreamController`, and
   `libcarplay_av_jni.so` (`AudioStreamAdapter`, `StreamControllerManager::getAudioStream`). It's driven
   by AirPlay stream events, not by USB vs Wi-Fi.
3. I found no obvious USB gating on the audio-stream start (unlike the screen's iAP2 bit). Confirm/deny.
4. A previous review found deliberate BT-teardown policy, not a silicon limit: `ro.atc.carplay.disable_bt`
   and `c/a.java` `ej()` disconnecting HFP + A2DP sink on a session-control message.
5. The reference author independently reports the same symptom and frames it as unsolved-but-solvable,
   blaming a "bridge ↔ head-unit Bluetooth conflict": `headunit-carplay-ref/README.md:18`,
   `headunit-carplay-ref/docs/GUIDE.md:126`.

## What to read (existing data only — no device needed)

- Audio path: `decompiled/CarplayService/sources/com/autochips/carplay/av/{AudioStream,a,b}.java`,
  and `service/n.java` (`sendAudioInfo`, `sendStreamStateChanged`), `service/o.java` + `CarplayService.java`
  (`getStreamState`, `updateAudioInfo`, `updateStreamState`, `setAudioEnable`), `service/p.java`
  (`CarplayResourceState` / `getMainAudio` — audio RESOURCE ownership/arbitration), `service/aa.java`
  (`RemoteDevices` set/getStreamState).
- Audio enable: trace `setAudioEnable` Java → native (`plugin/CarplayPluginInterface.java`, `plugin/a.java`)
  and what it actually gates. Our screen app toggles it in
  `headunit-carplay-ref/carplay-screen/src/app/carplayscreen/Watcher.java` (`enableCarplayAudio`); BOTH
  true and false were observed to fail (true → audio not on car; false → A2DP dropped, audio on phone).
- BT-teardown/"conflict": `c/a.java` (`disable_bt`, `ej()`), `service/r.java`, `service/i.java` — when and
  why A2DP gets disconnected on a CarPlay session.
- Native symbols/strings: `survey/20261026-215704/carplay-files/{libcarplay_av_jni.so,libAirPlay.so,
  libcarplay_plugin_jni.so}` (look for audio routing: `AudioTrack`, `AudioFlinger`, `setParameters`,
  audio patch/route, stream types, "audio" error strings, any USB/transport condition).
- Reference notes: `headunit-carplay-ref/README.md`, `docs/GUIDE.md` (search "audio", "sound", "Bluetooth").
- LIMITATION: the only saved session capture (`wireless-data/20261028-222218/`) is from a FAILED handoff
  (wrong AP IP, the phone never reached the receiver), so it has NO successful-wireless-session audio
  trace. Treat it as "what a failed run looks like," not as audio evidence.

## Questions, priority order

1. **What actually triggers CarPlay audio playback** (`AudioStream.start()` / stream-state → AudioTrack)?
   Is that trigger an AirPlay stream event that should fire regardless of transport, or is it tied to a
   USB/`setIAP2StateNative`/vendor-USB event our Bluetooth-bridge path never emits?
2. **Is the audio drop a routing/policy issue rather than a capability one?** Specifically evaluate the
   "bridge ↔ BT conflict" hypothesis: the unit is an A2DP **sink**; does having our iAP2-over-BT bridge +
   A2DP sink active prevent the CarPlay audio stream from being routed/started, or does the `disable_bt`/
   `ej()` teardown fire and kill it? Is audio RESOURCE ownership (`getMainAudio`/`CarplayResourceState`)
   arbitrated so that something else holds it?
3. **What does `setAudioEnable(true/false)` do natively,** and why would BOTH fail? Is there a THIRD state
   or a missing prerequisite (an audio route/patch, an output device selection, a focus request) that the
   vendor does on the USB path but not here?
4. **Minimal fix to try:** given the most likely root cause, what is the smallest change — a property
   (e.g. don't disable BT, force an audio route), a `CarplayManager`/`setAudioEnable` call sequence from
   our screen app, an audio-HAL route, or stopping our bridge from holding the BT radio — that would
   plausibly make CarPlay audio reach the speakers? Rank by likelihood and risk.
5. **The decisive capture:** define the exact logcat greps + `dumpsys audio` / `/proc` checks to run during
   a SUCCESSFUL wireless session next time at the car to confirm or kill the top hypothesis (e.g. does
   `AudioStream`/`StreamController` log a start? does `getStreamState` show active? does `ej()` fire? where
   does `dumpsys audio` route the CarPlay stream?).

## Ground rules
- All claims from the code/data in `/Users/saqibsuleman/code/personal/carplay`; cite `file:line` (or
  `.so`+symbol). Decompiled Java has reconstruction artifacts — don't over-read impossible-looking code.
- Genuine MFi chip only; never forge auth. Don't commit unit identity to git.
- Deliverable: a ranked list of root-cause hypotheses (each: evidence, confidence, fix-if-true, and the
  one capture/test that would confirm it), then a bottom line: is wireless audio plausibly achievable on
  this unit, and if so the single most promising thing to try first.
