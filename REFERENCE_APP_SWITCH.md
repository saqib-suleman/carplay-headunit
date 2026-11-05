# Switching to the reference app (clean slate → install his wired CarPlay app)

Goal: wipe our CarPlay footprint back to the factory baseline, then install the post author's wired
CarPlay app so it is the **only** CarPlay client on the unit (no two apps racing for the screen).

His app (`headunit-carplay-ref/carplay-screen/`) is a **normal app** (`app.carplayscreen`, its own
LAUNCHER icon), unlike ours, which was an update to the factory Auto Dialer (`com.example`). It ships
a prebuilt, debug-signed `CarPlay.apk`, and it re-arms itself on every boot via a `BOOT_COMPLETED`
receiver. It depends on the vendor's `com.autochips.carplay` framework classes, which our unit has.

All steps are run from the laptop while on the same Wi-Fi as the car. Nothing here is run until you
are at the car.

## 1. Clean slate (remove everything of ours)

```bash
adb connect <UNIT-IP>:5555
./clean-slate.sh            # DRY RUN: prints what it finds and what it would remove
./clean-slate.sh --apply    # performs the reset, then reboots the unit
```

What it does: uninstalls our app (restores the factory Auto Dialer), reverts the vendor CarPlay
service only if we ever patched it, deletes our `/data/vendor/carplay` screen override, clears
`carplay_on`, sweeps our `/data/local/tmp` tools, and reboots (which also clears any in-memory prop
flips). It never touches a package that is still the factory `/system` version. It leaves ADB over
Wi-Fi on so you can reconnect after the reboot.

After it reboots (~1 min), reconnect and confirm the baseline:

```bash
adb connect <UNIT-IP>:5555
./clean-slate.sh            # dry run again — expect: our app gone, vendor service factory, carplay_on null
```

## 2. Install his wired app

`carplay-screen/CarPlay.apk` is now **our stock build from his source** (built here, signed with our
debug keystore at `~/.android/debug.keystore`; functionally identical to his prebuilt). Install it as
the baseline — do **not** apply the steering patch yet; we want to see what the stock app already does:

```bash
adb install -r headunit-carplay-ref/carplay-screen/CarPlay.apk
```

To rebuild it from source (same debug key, so `adb install -r` updates in place):

```bash
ANDROID_HOME="$HOME/Library/Android/sdk" JAVA_HOME=/opt/homebrew/opt/openjdk@17 \
  PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH" ./headunit-carplay-ref/carplay-screen/build.sh
adb install -r headunit-carplay-ref/carplay-screen/CarPlay.apk
```

For steering-wheel controls, see **SEAMLESS_CARPLAY.md** — test the stock app first, then apply
`patches/carplay-screen-steering.patch` only if the buttons don't already work.

## 3. Turn CarPlay on

The vendor CarPlay service is what actually connects to the iPhone; his app is its display client.
It needs the master switch on:

```bash
adb shell su 0 settings put system carplay_on 1
adb reboot    # lets his BOOT_COMPLETED receiver arm and carplay_on take effect cleanly
```

## 4. Screen size (only if the video looks squished)

The clean slate removed our 1280x720 override, so the vendor falls back to its shipped 1280x800. The
panel is actually 1280x720, so the iPhone image may look slightly tall. This is **app-independent** —
re-apply the same fix if needed (the original config is saved in `backups/original/`):

```bash
sed -e 's/height="800"/height="720"/' -e 's/heightMM="137"/heightMM="124"/' \
  backups/original/system-carplayaccessoryinfo.xml > /tmp/carplayaccessoryinfo.xml
adb push /tmp/carplayaccessoryinfo.xml /data/local/tmp/carplayaccessoryinfo.xml
adb shell su 0 cp /data/local/tmp/carplayaccessoryinfo.xml /data/vendor/carplay/carplayaccessoryinfo.xml
adb shell su 0 chown system:system /data/vendor/carplay/carplayaccessoryinfo.xml
adb shell su 0 chmod 644 /data/vendor/carplay/carplayaccessoryinfo.xml
adb reboot
```

## 5. Test

Plug the iPhone into the OTG port. His `Watcher` should launch the CarPlay screen on connect; if not,
tap the **CarPlay** icon in the unit's app list. Watch what it's doing:

```bash
adb logcat -v time -s CarPlayScreen CarplayService CarplayManager AndroidRuntime
```

Compare against our app on the four problems: shows without a restart, no blank screen, steering
next/prev, and Spotify play staying played.

## Going back to our app

The clean slate fully removes ours, so reverting is a reinstall, not a toggle:

```bash
adb uninstall app.carplayscreen
./build.sh && ./install.sh      # rebuilds and reinstalls our app, switches CarPlay on, reboots
```

## When finished for the day

Turn ADB over Wi-Fi back off (this unit's ADB has no authorisation — see README):

```bash
adb shell su 0 setprop persist.adb.tcp.port ""
# then disable "ADB over network" / "USB debugging" in Developer options
```
