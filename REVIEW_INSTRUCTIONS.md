# Review instructions: CarPlay front-end app for an Autochips AC8257 head unit

You are reviewing a small Android app and its install scripts **before they are installed on a
real car head unit**. Your job is to find real defects. **Report only: do not edit files, and do
not run `adb`, `install.sh`, `rollback.sh` or `status.sh`.** You may run `./build.sh` (it only
writes to `./build`).

Project root: `/Users/saqibsuleman/code/personal/carplay`

## Background

- **Head unit:**
  - Autochips AC8257, Android 9 (API 28), `userdebug` build with SELinux permissive.
  - System-as-root: `/dev/root` is mounted read-only at `/`. dm-verity is disabled.
  - Root is via `/system/xbin/su` with AOSP syntax (`su 0 <cmd> [args]`; `su -c` does not work).
  - Signed with the AOSP public test keys. ADB runs over Wi-Fi on port 5555 with no key authorisation.
- **Vendor CarPlay stack** (shipped in the firmware):
  - `CarplayService` (`com.autochips.carplay`, `sharedUserId=android.uid.system`) and a
    `carplay_manager` system service in `system_server`.
  - The client API is `com.autochips.carplay.CarplayManager`, from `autochips-framework.jar` on the
    boot classpath.
  - The CarPlay on/off switch is the `Settings.System` key `carplay_on`.
- **The missing piece:** the firmware never shipped the front-end app that CarplayService launches
  (`ro.atc.carplay.client.package=com.autochips.carplayapp`,
  `ro.atc.carplay.client.action=com.autochips.carplay.START_CARPLAY_SERVICE`). This project builds it.
- **How CarplayService treats the app:**
  - When an iPhone connects, it un-hides the package and calls `startForegroundService` with
    that action, resolved via `Intent.resolveSystemService`.
  - When CarPlay becomes enabled, it hides the package again.
- **What the app does:** it shows the iPhone's video on a `SurfaceView` and forwards touch, Siri
  and media keys. The iPhone renders the whole CarPlay UI, and the vendor service handles all
  audio.
- **The panel is 1280x720,** but the shipped `carplayaccessoryinfo.xml` says 1280x800 (220x137 mm).

## Files to review (all of them)

- `app/AndroidManifest.xml`, `app/res/**`
- `app/java/com/autochips/carplayapp/*.java`
- `stubs/com/autochips/carplay/*.java`: compile-only stubs of vendor classes. They must not end up in the APK.
- `build.sh`, `install.sh`, `rollback.sh`, `status.sh`, `device/install-on-unit.sh`, `device/rollback-on-unit.sh`
- `README.md`

## Ground truth (decompiled with jadx; vendor names are partly obfuscated)

Verify every claim you make against these files, and mark a claim "unverified" if you can't.

- `decompiled/autochips-framework/sources/com/autochips/carplay/`: the real `CarplayManager`, `CarplayCommon`, `ICarplay`, `CarplayResourceState`, and so on.
- `decompiled/CarplayService/sources/com/autochips/carplay/`: the vendor service. Key files:
  - `service/CarplayService.java`
  - `service/n.java`: client launch, callbacks, client-death handling.
  - `service/m.java`: death recipient.
  - `service/p.java`, `r.java`, `s.java`, `t.java`, `v.java`, `w.java`: the session state machine and the video start/stop flags.
  - `plugin/a.java`, `b/*.java`: the resource/screen controller and audio.
- `decompiled/autochips_services_net/sources/com/autochips/server/carplay/`: the `carplay_manager` service and `CarplaySettingsStore`.
- `decompiled/framework-classes/`: AOSP `ApplicationInfo` (hidden-API exemption) and `ActivityManager` (`checkComponentPermission`) from the unit's own `framework.jar`.
- `survey/20261026-215704/info/`: `getprop.txt`, `settings_*.txt`, `mounts.txt`, `partitions.txt`, `logcat.txt`, `services.txt` and `dmesg.txt` captured from the unit.
- `survey/20261026-215704/carplay-files/`: the original `carplayaccessoryinfo.xml`, `carplay.conf` and the native CarPlay libraries (use `strings` on them).
- `survey/20261026-215704/framework/framework/`: the unit's `/system/framework` jars.

## What to check

1. **Vendor API correctness.**
   - Signatures, return codes, null returns and the exceptions each vendor method can throw. Read the vendor bodies, not just the signatures.
   - Which thread each callback arrives on.
   - Events that fire before this app's process exists or before its callback registration lands.
2. **Session lifecycle.** Walk through each of these scenarios step by step, against the vendor state machine:
   - First connect with the app not running.
   - Unplug while CarPlay is on screen, then re-plug.
   - Unplug while the head-unit UI is in front.
   - Quick drop-and-reconnect.
   - Driver taps the car's own icon inside CarPlay (`onRequestAccessoryUI`).
   - Incoming call or Siri while the head-unit UI is in front.
   - Car power-off and power-on (quick-boot `QB_POWEROFF`/`QB_POWERON`).
   - Reversing camera active.
   - App process killed by the low-memory killer.
   - App opened from the launcher with no phone connected.

   For each one, say whether the result is correct. Look especially for a black screen, being stuck in or yanked back into CarPlay, a leaked foreground service, a vendor restart of CarPlay, or a crash.
3. **Android 9 platform rules.**
   - Foreground-service start timing.
   - Background activity starts.
   - Hidden-API access for a platform-signed priv-app calling boot-classpath vendor classes.
   - `resolveSystemService` requirements.
   - Signature-permission enforcement when the caller is the system uid.
   - `SurfaceView` lifecycle.
   - Immersive mode on a unit with a custom status bar.
   - Manifest attributes.
4. **Build.**
   - Does `./build.sh` produce an APK that installs and runs on API 28?
   - Packaging and alignment, and v1/v2 signing with `keys/platform.*`.
   - The certificate must match the unit's `android` package (`survey/.../apks/android.apk`).
   - No vendor stub classes may be in the dex.
   - No APIs above level 28.
5. **Script safety.**
   - Quoting through `adb shell` and `su 0`.
   - `set -euo pipefail` behaviour.
   - What state the unit is left in if each step fails part-way.
   - Whether rollback truly restores the pre-install state, including a second install run.
   - Anything that could stop the unit from booting, or lock the user out of ADB.
6. **Security.** Anything the install leaves more exposed than it found it.

## Output format

List findings ranked most severe first. For each one give:

- `file:line`
- what's wrong
- a concrete failure scenario (inputs or state, then the wrong result)
- severity: **Blocking** (don't install until fixed), **Should fix**, or **Nit**
- a suggested fix
- verified / unverified, citing the ground-truth file you checked

End with a short "Checked and OK" list of the areas you looked at and found sound. Say plainly if you found nothing blocking. Skip style comments unless they hide a bug.
