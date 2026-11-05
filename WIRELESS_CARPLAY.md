# Wireless CarPlay — plan for this unit (BWIC Yato1 A100, build V3.15.04_220506)

Based on the author's repo (`headunit-carplay-ref/`), adapted to **our** unit. Read this before a
car session; it lists what's different here, what's pre-gathered, and the exact at-the-car steps.

## How this unit differs from the repo's assumptions

1. **The `/vendor/build.prop` edit will NOT work here.** Our `/vendor` is write-protected by the
   storage driver (writes fail with I/O errors). So we can't make `ro.atc.carplay.wireless=1`
   permanent. **Substitute:** flip it in memory at runtime with our `tools/propflip` helper (already
   proven to bring up Bluetooth + the hotspot). It clears on every reboot, so wireless here means
   re-flip + re-spawn `authd` after each car start. Not install-and-forget.

2. **Keep our chip address at `0x11`. Do NOT apply the repo's `0x10` change.** Our chip answers at
   bus 6 / `0x11` and wired auth already works there. The auth helper's "Approach A" reuses the
   vendor MFi library, which resolves the address from the unit's own `persist.carplay.i2c.slave_addr`
   (= `17` / `0x11` here), so it uses our chip automatically. The repo's `0x10` was for THEIR
   misconfigured unit; applying it would break our working wired CarPlay.

3. **Verify the `libCoreUtils.so` offsets at the car (RISK).** `authd` Approach A calls two functions
   in `/system/lib64/libCoreUtils.so` at hardcoded offsets (`LIB_OFF_SIGN 0x63050`,
   `LIB_OFF_AUTH3 0x100588`) taken from the author's firmware build. Ours may differ. Before trusting
   `authd`, pull our `libCoreUtils.so` and check these offsets resolve to the same symbols; if not,
   find ours. `authd selftest` on the unit is the go/no-go.

4. **ADB over Wi-Fi has no auth here** (`ro.adb.secure` unset). In hotspot mode anyone on the hotspot
   gets a root shell. Use a strong hotspot password; turn network debugging off when done.

## Build toolchain — installed and verified

Unlike the wired app (which ships a prebuilt APK), the wireless build needs a specific toolchain.
All four pieces are now installed and verified:

| Need | Installed at |
|---|---|
| build-tools **35.0.1** | `~/Library/Android/sdk/build-tools/35.0.1` |
| platform **android-35** | `~/Library/Android/sdk/platforms/android-35` |
| **JDK 17** | `/opt/homebrew/opt/openjdk@17` (keg-only — exactly the path his `client/build.sh` defaults to) |
| **NDK 26.1.10909125** | `~/Library/Android/sdk/ndk/26.1.10909125` (auto-detected by `authd/build.sh`) |

Set these before building so his scripts use our SDK (they read `ANDROID_SDK_ROOT` / `JAVA_HOME`;
`authd/build.sh` finds the NDK on its own):

```bash
export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
export JAVA_HOME="/opt/homebrew/opt/openjdk@17"
```

Notes:
- `authd/build.sh` uses the NDK's **darwin-x86_64** clang, which runs under Rosetta 2 on Apple
  Silicon. If the `authd` build errors about a bad CPU type, install Rosetta once:
  `softwareupdate --install-rosetta --agree-to-license`.
- `client/build.sh` checks for the `build-tools/35.0.1` path specifically — that's why we installed
  that exact version rather than relying on 35.0.0.

## Pre-gathered config values (confirm at the car)

Set these on the unit with `setprop persist.cpbridge.<key> <value>`:

| Property | Value (from our captured data) | Confirm at car |
|---|---|---|
| `peer_mac` | `C0:A6:00:C7:3A:29` (the iPhone used in wired tests) | which iPhone you'll use |
| `bt_mac` | `00:00:A0:8A:C4:E4` (unit, "City") | `settings get secure bluetooth_address` |
| `ssid` | `AndroidAP_4723` | live, once hotspot is up |
| `passphrase` | `73d726806bec` | live |
| `source_version` | `320.17.3` (unit's own AirPlay mDNS record) | watch receiver log/Bonjour |
| `public_key` | (root read of `/data/vendor/carplay/default.keychain`, public half only) | at car |
| `bssid`, `channel`, `ap_ip` | leave unset — the bridge reads them live from `ap0` | — |

`ro.serialno` = `0123456789ABCDEF` (bridge reads it itself).

## At-the-car sequence

**0. Connect & build** (laptop on same Wi-Fi as the car, wired mode):
```bash
adb connect <UNIT-IP>:5555
# Apply our sound fix to the bridge first (reduces BT churn during the session; see WIRELESS_SOUND.md):
git apply --directory=headunit-carplay-ref -p1 patches/cpbridge-session-quiet.patch
./headunit-carplay-ref/client/build.sh      # bridge APK (uses ANDROID_SDK_ROOT / JAVA_HOME from above)
./headunit-carplay-ref/authd/build.sh       # authd + cpauth_client (NDK auto-detected)
```
Sound on wireless is screen+touch only by default; see **WIRELESS_SOUND.md** for the full diagnosis,
the prepared Fix 1 (above), and the at-car investigation for automating the audio-source switch.

**1. Flip the wireless flag in memory** (our substitute for the /vendor edit):
```bash
adb push tools/propflip/propflip.dex /data/local/tmp/
adb shell 'su 0 app_process -Djava.class.path=/data/local/tmp/propflip.dex /system/bin \
  PropertyAreaValueSetter "/dev/__properties__/u:object_r:mtk_default_prop:s0" \
  ro.atc.carplay.wireless 0 1'
# restart the vendor carplay service so it re-reads the flag (kill its process; it respawns)
adb shell su 0 kill $(adb shell pidof com.autochips.carplay)
```
The unit should raise its hotspot (`ip addr show ap0`) and leave your home Wi-Fi.

**2. Get ADB back via the hotspot:** join `AndroidAP_4723`, then `adb connect <AP-gateway-IP>:5555`
(read the gateway live — it's a random `192.168.43.x`).

**3. Verify the auth helper on OUR chip (go/no-go):**
```bash
adb push headunit-carplay-ref/authd/authd headunit-carplay-ref/authd/cpauth_client /data/local/tmp/
adb shell chmod 755 /data/local/tmp/authd /data/local/tmp/cpauth_client
adb shell 'CPAUTH_I2C_ADDR=0x11 /data/local/tmp/authd selftest'   # must PASS on our 0x11 chip
```
If selftest fails on the library offsets, stop and fix the offsets for our libCoreUtils.so first.

**4. Deploy & configure the bridge:**
```bash
adb install -r headunit-carplay-ref/client/CarPlayBridge.apk
# set the persist.cpbridge.* values from the table above
adb shell /data/local/tmp/authd spawn
adb shell am start-foreground-service -n com.cpbridge/.BridgeService
```

**5. Bring the iPhone in** (Bluetooth on, bonded, NOT plugged into USB) and watch:
```bash
adb logcat -v time | grep CPBRIDGE_DIAG
```
Expect: rfcomm connect → link sync → identification accepted → auth succeeded → credentials sent →
CarPlayStartSession → iPhone joins hotspot → AirPlay screen.

## Revert
- Reboot the unit: clears the in-memory flag, back to normal wired CarPlay.
- `adb uninstall com.cpbridge`; remove `authd` from `/data/local/tmp`.

## Honest status
Even on the author's unit, wireless gives **screen + touch only**; sound, Siri and calls go through
the car's Bluetooth as a manual workaround. On our unit it's additionally non-persistent (re-flip +
re-spawn each boot) and gated on the `libCoreUtils.so` offset check passing.
