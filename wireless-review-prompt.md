# Adversarial review request: wireless CarPlay bring-up on an Autochips AC8257 head unit

You are a skeptical senior reverse-engineer. I (another AI agent) have spent many physical trips to a
car debugging wireless Apple CarPlay on an aftermarket Android head unit, and I believe I've found the
final bug. **Your job is to challenge my conclusion, not confirm it.** Each car trip is expensive
(the unit leaves Wi-Fi and the laptop goes offline), so before the next trip I need you to either
(a) find a flaw / missing piece in my fix, or (b) independently confirm it's correct AND complete, or
(c) tell me exactly what additional data to capture in ONE trip to be sure. Read the real files listed
at the end; don't take my word for anything.

## System

- Head unit: BWIC "Yato1 A100", Autochips AC8257, Android 9, `userdebug`, test-keys, root via `su 0`
  (adbd itself runs as `shell`; `adb root` also works). SELinux permissive.
- Goal: wireless CarPlay (screen + touch over Wi-Fi; audio is a known separate Bluetooth workaround).
- This builds on the open-source project `riazosama/headunit-carplay` (local clone at
  `headunit-carplay-ref/`). The vendor firmware ships the **receiver** half of wireless CarPlay
  (AirPlay receiver in `com.autochips.carplay`, hotspot, `_airplay._tcp` on port 7000) but NOT the
  client that brings the iPhone in. The project adds that client:
  - `com.cpbridge` (an unprivileged app): speaks iAP2 over Bluetooth to the iPhone — RFCOMM, link
    sync, identification, MFi auth, sends Wi-Fi credentials (`0x5703`), then `0x4301
    CarPlayStartSession`.
  - `authd` (root helper): signs Apple's challenge with the genuine MFi chip over a local socket.
  - `app.carplayscreen`: draws the CarPlay video surface.
- Our unit's MFi chip is RSA-1024 (Auth 2.0C), not the ECDSA v3 of the reference unit; `authd` signs
  natively. This part is solved and verified (iPhone accepts auth, `0xAA05`).

## What is PROVEN working (from on-device captures, not assumptions)

1. BT iAP2 handshake → `AUTH SUCCEEDED (0xAA05)` with the real 908-byte RSA cert + 128-byte sig.
2. `0x5703` Wi-Fi credential handoff is sent with the real SSID (`AndroidAP_4723`), real 12-char
   passphrase, `channel=6` (we moved the SoftAP off its default channel 13 via `hostapd_cli
   chan_switch`), `security=2`, correct BSSID (the `ap0` MAC).
3. The vendor AirPlay receiver **is listening on port 7000** (`/proc/net/tcp` shows `00000000:1B58`
   state `0A`=LISTEN, both v4 and v6). Boot log: `[HTTPServer] Listening on port 7000` and `[AirPlay]
   Registering Bonjour _airplay._tcp. port 7000`. This only happens after we set
   `ro.atc.carplay.wireless=1` **persistently in `/vendor/build.prop` and reboot** (a runtime prop
   flip + service restart did NOT start it — the receiver is started by a boot-time StateMachine,
   `service/a.java`, sequencing BT → Wi-Fi AP → iAP2 → CARPLAY_PLUGIN(7000) → NSD).
4. The iPhone **joins the hotspot**: DHCP lease `192.168.43.96 iPhone`, live ARP entry on `ap0`,
   hostapd `STA: <iphone-mac> is connected`.

So: auth ✓, creds ✓, receiver listening ✓, iPhone associates ✓ — but **no CarPlay screen appears**,
and port 7000 shows only LISTEN, never an ESTABLISHED connection from the iPhone.

## The bug I think I found (the fix I'm about to apply)

`com.cpbridge`'s `0x4301 CarPlayStartSession` carries the AirPlay host IP. The bridge computes it in
`BridgeConfig.apIpv4()` by running `ip -4 -o addr show ap0` — but the bridge is an **unprivileged
app**, that call returns nothing for it, and the method falls through to a hardcoded
`return "192.168.43.1"`. The real `ap0` IP is `192.168.43.10` (and it changes every hotspot start).
The captured bridge log confirms it sent `apIp=192.168.43.1`. So the iPhone, after joining Wi-Fi, is
told to reach the receiver at `192.168.43.1:7000` — the wrong host — and never connects.

**My fix:** pin `persist.cpbridge.ap_ip` to the live `ap0` IP each session, as root, in
`tools/apfix.sh` (which already pins ssid/passphrase/channel). `apIpv4()` returns the prop when set,
so `0x4301` will then carry the correct address. The reference GUIDE explicitly lists "the hotspot IP
must be read live … hardcoding it works exactly once" as one of four things that must match, which
supports this being real.

## Why I am NOT claiming 100% certainty (challenge these specifically)

I want you to attack each of these; this is where I could be wrong or incomplete:

1. **We never observed the iPhone actually try to connect to port 7000 — not even to the wrong
   `.1`.** The capture window ended the instant the iPhone joined Wi-Fi (STA connected at the very
   last second of a 40s capture), so "apIp=.1 is the blocker" is inference, not observation. Is it
   possible the iPhone was going to connect fine and we just stopped capturing too early? What single
   capture would prove the apIp theory before we commit a trip?
2. **Does iOS even use the `apIp` from `0x4301`, or does it discover the receiver via Bonjour
   `_airplay._tcp` on the AP subnet?** If Bonjour, then (a) apIp may be irrelevant and the real
   blocker is elsewhere, or (b) the `_airplay._tcp` record must advertise the correct IP/interface —
   check whether mDNS is actually reachable from a client on `ap0` and what address it resolves to.
   Read the vendor receiver's Bonjour registration and the `0x4301`/`0x5703` TLV semantics.
3. **Could the receiver tear itself down** if no `_carplay-ctrl._tcp` peer appears within a timeout?
   Boot log showed `[BonjourBrowser] Browsing for _carplay-ctrl._tcp` and `CarplayPluginImpl …
   setNightMode: not connected`. Does the iPhone need to advertise `_carplay-ctrl._tcp` (does an
   unmodified iPhone do that automatically once on the AP, or does something on the unit need to
   initiate)? Is there a handshake on 7000 that needs the public key / pairing that could still fail?
4. **The `0x4301` also carries `srcVers=320.17.3`, a 64-hex `publicKey`, `deviceId=<ap0 mac>`.** Are
   any of these still suspect? srcVers must match the running receiver's Bonjour `srcvers`; the public
   key is the unit's AirPlay pairing identity public half. Could a mismatch here cause the iPhone to
   silently not connect even with the right IP?
5. **The bridge goes "post-handoff quiet ~110s" after `0x4301`** (a patch to free BT for A2DP), and
   the BT link watchdog tears down after 8s of no RX (iPhone drops BT — expected). Is there any way
   this timing starves the AirPlay bring-up, or that the iPhone needs the BT/iAP2 link to STAY up
   during the Wi-Fi session on this firmware?
6. **`ap_ip` changes every boot.** My fix reads it live each session via `apfix`. Is pinning a prop
   the right layer, or should `apIpv4()` be fixed to read `ap0` reliably (and can an unprivileged app
   read it at all — via `NetworkInterface` in Java instead of exec'ing `ip`)? If the prop is stale
   from a previous boot and `apfix` runs before `ap0` has its new IP, does it silently send a stale
   address?
7. **Anything in the vendor StateMachine or plugin JNI** that I've misread about how a session on 7000
   is accepted/rendered, or an additional message the vendor expects (it was designed to be driven by
   the never-shipped `com.autochips.carplayapp` client; our bridge is a separate process and may not
   satisfy every expectation the receiver has).

## Also assess: wireless AUDIO (don't let me get the screen then be stuck on sound)

The reference author reports that on wireless, screen+touch work but **CarPlay audio does not play over
Wi-Fi** — his words: "the bridge and the head unit's Bluetooth conflict" — and his workaround is to run
audio over the car's Bluetooth A2DP with the head unit source set to Bluetooth. I want to avoid
discovering an audio wall only after the screen finally works. My current reading of the decompiled
receiver (`com/autochips/carplay/av/`): it HAS a full audio path — `AudioStream` (native
`native_setup/start/stop/setVolume` in `libcarplay_av_jni.so`) and `av/b.java` creates audio streams
on stream IDs 100/102 (main) and 101 (Siri/calls) when the session signals them (`onStreamStateChanged`
in `service/n.java`). So I believe native Wi-Fi audio SHOULD work automatically once the session is up,
and the author's "conflict" is the Bluetooth re-dial churn (which the bridge now suppresses for ~110s
post-handoff via `persist.cpbridge.session_quiet_ms`). **Challenge this:** From the `av/*` and plugin
JNI code, is the audio path actually driven end-to-end by the CarPlay session, or is there a reason it
would stay silent (e.g. the vendor half-shipped the audio renderer, an audio-HAL/focus conflict, a
stream the bridge must negotiate, or encryption/keying the receiver can't do without the missing vendor
client)? Is the author's "conflict" really the BT churn, or something the session-quiet patch won't
fix? If audio won't come over Wi-Fi, is the BT-A2DP workaround (and auto source-switch) the right
fallback, and is anything about it unsound? What should we watch in logcat to confirm audio the moment
the screen works?

## Files to read (all local, real)

- Bridge: `headunit-carplay-ref/client/src/com/cpbridge/BridgeConfig.java` (see `apIpv4()` ~line 327),
  `Iap2Session.java` (0x5703 / 0x4301 build, ~lines 560–660). `PHASE_B.md` for the wire format and the
  author's own "not verified" list (esp. `0x5703` param ids).
- Reference docs: `headunit-carplay-ref/docs/GUIDE.md` ("Wireless CarPlay", "How the handshake works",
  "The four things that must match", Troubleshooting) and
  `headunit-carplay-ref/.claude/skills/enable-carplay/wireless.md`.
- Decompiled vendor receiver: `vendor-dump/CarplayService/jadx-out/sources/com/autochips/carplay/`
  — `service/a.java` (CarplayEnableStateMachine), `service/{b,c,d,e,f,i}.java`, `plugin/a.java` and
  `plugin/CarplayPluginInterface.java` (native `startupCarplayNative`, `setIAP2StateNative`),
  `av/*` (AudioStream/VideoStream). Native libs: `vendor-dump/CarplayService/lib/arm64/` (unwind JNI
  symbol names if useful). Look for how the AirPlay/HTTP server on 7000 decides to accept a session,
  what Bonjour it registers, and whether it depends on `_carplay-ctrl._tcp` from the phone.
- Captured evidence from the last run: `wireless-data/20261028-222218/` —
  `18_bridge_log.txt` (the `0x4301 … apIp=192.168.43.1` line), `14_ipaddr.txt` (`ap0 =
  192.168.43.10`), `15_leases.txt` (iPhone lease), `13_tcp.txt`/`13_tcp6.txt` (7000 LISTEN only),
  `10_logcat_full.txt` (the AirPlay/CarPlay/receiver lines around `22:05:27` boot and `22:23:15` STA
  connect).
- The fix: `tools/apfix.sh` (the `fixall` branch now pins `persist.cpbridge.ap_ip`), and
  `wireless-go.sh` (the per-trip runner that pins + starts + watches 3 min with grep-based 7000
  checks).

## What I need back from you

1. A verdict: is the `ap_ip` fix **necessary**? Is it **sufficient**, or what else is likely still
   broken? Rank the remaining risks by likelihood.
2. Any concrete bug you find in `apfix.sh` / `wireless-go.sh` / `BridgeConfig.apIpv4()` / the vendor
   session acceptance path, with file:line.
3. The single most informative thing to capture or try on the NEXT trip so we don't need another —
   ideally a way to confirm (on the unit, over the hotspot, with root) whether the iPhone connects to
   `<ap0-ip>:7000` and what the receiver logs when it does/doesn't. Give exact commands.
4. If you think CarPlay still won't appear after the ap_ip fix, say so and why, with evidence from the
   files.
