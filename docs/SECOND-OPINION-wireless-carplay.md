# Second-opinion request: why is our wireless CarPlay slow (5–8 min) and unreliable?

You are an independent reviewer. I have been working on this for days and I may be anchored
on my own design. **Do not assume my approach is correct.** Your job is to challenge the
architecture itself, find the root cause of the symptoms below, and tell me if I'm solving
this the wrong way. Read the actual code before concluding. Give me a ranked set of
hypotheses with the evidence for each, not a single confident answer.

## The hardware / platform

- Aftermarket Android head unit: Autochips **AC8257 / BWIC "Yato1 A100"**, Android 9,
  userdebug, test-keys, rootable (`su 0`), SELinux permissive.
- The unit ships with a **vendor CarPlay stack** (`com.autochips.carplay`, native
  `libcarplay_plugin_jni.so`, an AirPlay/CarPlay receiver on **port 7000**). The vendor sells
  this hardware with *wired* CarPlay working out of the box. Wireless is present in the
  firmware but was not enabled/working from the factory on this SKU.
- The unit is a **Bluetooth A2DP sink** (it's a BT speaker). Normal use: iPhone connects BT,
  music + calls play through the car.
- iPhone is a normal consumer iPhone running current iOS. Factory/OEM wireless CarPlay in
  other cars connects in **a few seconds**.

## The symptom I want explained

Our wireless CarPlay:
1. Takes **5–8 minutes** to connect — when it connects at all.
2. Is **unreliable** — often doesn't connect.
3. **Breaks existing Bluetooth audio** — the moment CarPlay comes up it disconnects the
   active A2DP, pauses the music, and audio ends up stuck on the phone (I currently believe
   wireless audio is simply not achievable on this unit; that is a *separate* question —
   focus on the connect-time and reliability problem, but tell me if the audio behavior is a
   clue to the root cause).

A factory wireless CarPlay head unit connects in seconds. **A 5–8 minute connect is not a
tuning problem, it smells architectural.** I want to know what we're doing that the factory
path doesn't.

## Our current approach (what's implemented) — critique this, don't trust it

We did NOT use the vendor's own wireless bring-up path. Instead we built a parallel bring-up:

1. **Custom Bluetooth iAP2 bridge app** `com.cpbridge` (source:
   `headunit-carplay-ref/client/src/com/cpbridge/` — read `Iap2Session.java`,
   `BridgeService.java`, `BridgeConfig.java`). It opens an RFCOMM channel to the iPhone, does
   the iAP2 link sync, runs MFi authentication, then sends **CarPlayStartSession (0x4301)**
   carrying the hotspot's ssid/passphrase/channel/**apIp**/port 7000/deviceId/publicKey/
   srcVers. The phone then joins the unit's Wi-Fi hotspot and is supposed to reach the
   receiver on `apIp:7000`.
2. **MFi auth helper** `authd` (genuine MFi chip at `/dev/i2c-6`, signs via
   `/system/lib64/libCoreUtils.so`). Must be run from `/data/local/tmp` (Treble namespace
   won't let a `/vendor` binary dlopen a `/system` lib).
3. **A root boot daemon** `tools/carplay-boot.sh` installed as an init service
   (`class late_start`, `seclabel u:r:init:s0`). It loops forever every 3 s: keeps `authd`
   alive, reads the hotspot `ap0` live IP, and whenever the IP changes it re-pins
   `persist.cpbridge.ap_ip`, forces the hotspot to channel 6, and **force-stops + restarts
   the bridge** so it re-dials with the fresh IP. (The hotspot `ap0` comes up *minutes* after
   boot and gets a different random IPv4 every boot — this is a known headache.)
4. **A screen app** `app.carplayscreen` (`headunit-carplay-ref/carplay-screen/src/app/
   carplayscreen/Watcher.java`) that shows the CarPlay surface on connect.

The vendor's own wireless path, which we bypassed, is a boot-time state machine:
`decompiled/CarplayService/sources/com/autochips/carplay/service/a.java`
(CarplayEnableStateMachine) sequences BT → Wi-Fi AP → iAP2 → CARPLAY_PLUGIN (binds 7000) →
NSD/Bonjour, gated on monitor + NET_IFACE events. The native plugin
(`.../carplay/plugin/a.java`, `libcarplay_plugin_jni.so`) logs "iap2 session not connected,
wait a moment" and dials OUT to the phone's `_carplay-ctrl._tcp`; its
`setIAP2StateNative(true)` is set only on the vendor's **USB** event — our Bluetooth bridge
never emits that event.

## Questions I most need answered (ranked)

1. **Is the whole parallel-bridge approach the reason it's slow?** Specifically: is our custom
   `com.cpbridge` doing the iAP2 + Wi-Fi handoff in a way that races or fights the vendor's
   native state machine, instead of driving the vendor path the way the factory does? Should
   we instead be making the vendor's `CarplayEnableStateMachine` run the wireless flow (e.g.
   feeding it the iAP2-over-BT session so `setIAP2StateNative(true)` gets set the way the USB
   path sets it)? Read `service/a.java` and `plugin/a.java` and say whether driving the native
   path is feasible and would be faster.
2. **Where do the 5–8 minutes actually go?** Walk the real timeline from the code and list the
   serialized waits. Prime suspects to confirm or kill: the `ap0` hotspot coming up minutes
   late; the daemon's 3 s poll loop + force-stop/restart of the bridge on every IP change
   (restart races / backoff); the iPhone's own wireless-CarPlay discovery/retry backoff once a
   first attempt fails; MFi auth retries; the receiver (port 7000) not being up when the phone
   first joins. Which of these are serial on the critical path?
3. **The ap_ip / hotspot design.** We pin `persist.cpbridge.ap_ip` to a hotspot IP that
   changes every boot and comes up late, then restart the bridge when it changes. Is this
   fundamentally fragile? Why does `ap0` get a random IP and come up so late — can the hotspot
   be brought up early with a fixed IP (as a factory unit would), removing the whole resync
   dance? Would that alone fix most of the slowness/unreliability?
4. **Does restarting the bridge on every IP change sabotage an in-progress connection?** The
   iPhone may be mid-handshake when the daemon force-stops `com.cpbridge`. Could our own
   daemon be the cause of the unreliability?
5. **Is the A2DP breakage a symptom of the same root cause** (e.g. we tear down/not reuse the
   existing BT link, or the handoff forces a BT role change), or genuinely separate?
6. **What does the reference/author repo do?** `headunit-carplay-ref/scripts/wireless-mode.sh`,
   `wireless-recovery.sh`, `docs/GUIDE.md`, `README.md` — did the author drive the vendor path
   or also bridge in parallel? Did they report connect times? Don't assume; read and quote.

## Constraints / ground truth you must respect

- Everything about diagnosis must come from the **code in this repo** and the decompiled
  vendor sources — you cannot touch the car (owner is away). Base claims on files, quote
  `path:line`.
- We use the **genuine MFi chip**; never propose forging auth.
- Don't propose anything that commits the unit's identity (MFi cert, MACs, hotspot creds,
  serial) to git.
- It is fine — expected, even — to conclude that my current approach is wrong and that we
  should re-architect around the vendor's native wireless path. If so, say exactly which code
  path to drive and what the minimal change is.

## Deliverable

A ranked list of root-cause hypotheses for the slow + unreliable connect, each with: the
evidence (file:line), how to confirm it at the car next visit (a concrete 1-line test or log
to grep), and the fix it implies. Then a bottom-line recommendation: keep the bridge and tune
it, or switch to driving the vendor state machine. Be concrete and skeptical.
