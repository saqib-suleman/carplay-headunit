# Wireless deployment — gathered config + plan (ready to execute at the car)

Feasibility: **GO.** The hard unknown (MFi auth on our RSA chip) is solved and verified; the bridge
forwards it as-is. What remains is the deployment (disruptive: unit leaves Wi-Fi, raises a hotspot).
Local-only notes — contains this unit's identity; do not publish.

## Per-unit config (gathered at the car)

| value | where it goes | value |
|---|---|---|
| Unit Bluetooth MAC | `persist.cpbridge.bt_mac` | `00:00:A0:8A:C4:E4` |
| iPhone (peer) BT MAC | `persist.cpbridge.peer_mac` | `C0:A6:00:C7:3A:29` ("iPhone") |
| AirPlay public key | `persist.cpbridge.public_key` | `1ab724d026d90b1db96fdf2056b444a3fda673390fb6712e9ae14d48eb5df9fe` |
| ro.serialno | (bridge reads itself) | `0123456789ABCDEF` |
| MFi certificate | (chip, via authd) | 908-byte RSA, saved to scratch `mfi_cert.p7b` |

Still to read **live in wireless mode** (only exist once the hotspot is up):
`persist.cpbridge.ssid`, `persist.cpbridge.passphrase` (unit Settings → Hotspot),
`persist.cpbridge.bssid` / `channel` (from `ap0`), `source_version` is **confirmed `320.17.3`** (the unit's own advertised AirPlay record in the
captured logs), already set by the script. Leave `ap_ip` empty (bridge reads it live).

## The chip: MFi Auth 2.0C (RSA-1024), not ECDSA v3

This unit's chip differs from the author's. Confirmed:
- 908-byte RSA cert, `sha1WithRSAEncryption`, 1024-bit. Signature is **128 bytes**, deterministic.
- authd signs it **natively** (no force): `CPAUTH_LIB=/system/lib64/libCoreUtils.so authd sign
  <20-byte challenge>` → valid 128-byte RSA-PKCS1-SHA1 sig, verified against the cert's public key.
- The iPhone sends a 20-byte challenge for an RSA cert; the bridge passes it through; authd signs it.
- **Run the daemon native, with the lib, no force:**
  `CPAUTH_LIB=/system/lib64/libCoreUtils.so /data/local/tmp/authd spawn`
- `CPAUTH_FORCE_AUTH3` was added to authd.c for a v3 experiment — **do not set it** for this chip.

### Optional offline tweak (cosmetic, bridge works without it)
`client/src/com/cpbridge/Iap2Constants.java`: `AUTH_EXPECTED_CERT_LENGTH 607→908`,
`AUTH_EXPECTED_SIGNATURE_LENGTH 64→128` so the bridge stops logging length-mismatch warnings. These
are warnings only — the bridge already returns/uses the real cert and sig, so this is not required
for function.

## At-the-car deployment steps (next focused session)

Prereq: iPhone unplugged from USB. Helpers already built: `client/CarPlayBridge.apk`,
`authd/authd` (both current).

1. **Flip wireless mode in memory** (our substitute for the /vendor edit; proven to raise the hotspot):
   ```bash
   adb push tools/propflip/propflip.dex /data/local/tmp/
   adb shell 'su 0 app_process -Djava.class.path=/data/local/tmp/propflip.dex /system/bin \
     PropertyAreaValueSetter "/dev/__properties__/u:object_r:mtk_default_prop:s0" \
     ro.atc.carplay.wireless 0 1'
   adb shell su 0 kill $(adb shell pidof com.autochips.carplay)   # vendor service re-reads the flag
   ```
   Unit raises `ap0` and leaves home Wi-Fi.
2. **Reconnect ADB via the hotspot** — join the unit's AP from the Mac (loses internet on it), read
   the gateway (`netstat -nr | grep default`), `adb connect <AP-IP>:5555`, `adb -s <AP-IP>:5555 root`.
3. **Deploy + spawn authd (native):**
   ```bash
   adb push authd/authd /data/local/tmp/ ; adb shell su 0 chmod 755 /data/local/tmp/authd
   adb shell su 0 env CPAUTH_LIB=/system/lib64/libCoreUtils.so /data/local/tmp/authd spawn
   adb shell su 0 /data/local/tmp/authd status      # running
   ```
4. **Install the bridge + set the per-unit values:**
   ```bash
   adb install -r client/CarPlayBridge.apk
   adb shell setprop persist.cpbridge.bt_mac 00:00:A0:8A:C4:E4
   adb shell setprop persist.cpbridge.peer_mac C0:A6:00:C7:3A:29
   adb shell setprop persist.cpbridge.public_key 1ab724d026d90b1db96fdf2056b444a3fda673390fb6712e9ae14d48eb5df9fe
   # ssid / passphrase at the unit's own prompt; bssid / channel from ap0; source_version if != 320.17.3
   adb shell am start-foreground-service -n com.cpbridge/.BridgeService
   ```
5. **Bring the iPhone in over Bluetooth** (bonded, NOT plugged into USB) and watch the handshake:
   ```bash
   ./headunit-carplay-ref/scripts/bridge-log.sh <AP-IP>:5555
   ```
   Expect the ladder: rfcomm → link sync → identification → **auth (0xAA05 with our RSA sig)** →
   0x5703 Wi-Fi creds → CarPlayStartSession → iPhone joins AP → AirPlay screen in app.carplayscreen.

## Remaining risk — small, and mostly value-correctness

Reassessed: the `0x5703`/`0x4301` wire structure is **not** a real unknown for us. The author's wireless
works end-to-end with these exact params (GUIDE.md), and the handoff is **chip-independent** (our RSA
vs his ECDSA only changes the `0xAA0x` auth messages). Same hardware family, same vendor AirPlay
receiver. So once our auth succeeds, the rest is his verified path.

What actually bites is getting the VALUES right — the author's documented gotchas, each handled by
`deploy-wireless.sh hotspot`:
- **Device-ID / BSSID = the AP interface MAC** (`ap0`), never the Bluetooth MAC — the bridge's
  `device_id` uses `persist.cpbridge.bssid`, which the script sets from `/sys/class/net/ap0/address`.
- **Channel pinned** to the AP's real channel — script reads it from `iw dev ap0`.
- **SSID/passphrase** exact — script reads the running hostapd config.
- **srcvers** must match the unit's live AirPlay record (default `320.17.3`; confirm live if the
  receiver refuses the session).

So the only thing the live run really proves is that our values are right and the iPhone completes the
(chip-independent) handoff — not that any wire format is still unknown. Audio stays the Bluetooth
workaround; screen+touch over Wi-Fi.

## Revert
Reboot clears the in-memory flag (back to wired). `adb uninstall com.cpbridge`; `authd stop`;
remove `/data/local/tmp/authd`.
