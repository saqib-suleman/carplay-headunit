# CarPlay for the Honda City head unit (Autochips AC8257, Android 9)

The unit ships Apple CarPlay support (`CarplayService`, `iapd`, MFi chip on I2C bus 6 @ 0x11) but
CarPlay is switched off (`carplay_on=0`) and the front-end app it launches was never installed.
This project provides that app.

The app only hosts the video surface and forwards touch/Siri/media keys; the iPhone renders the
entire CarPlay UI. Audio and audio focus are handled by the unit's `CarplayService`.

## How it is installed

The unit's eMMC driver write-protects the system partition (`cmdq in sw wp area` in the kernel
log), so nothing can be added to `/system`. Instead, the APK is built with the package name
`com.example` and signed with the platform key, so it installs as an **update to the factory
"Auto Dialer" test app**. Updated system apps keep system-app status, which is what the vendor
`CarplayService` needs to find and start the app by its intent action. `adb uninstall com.example`
removes the update and brings the factory Auto Dialer back.

## Scripts

| Script | What it does |
| --- | --- |
| `./survey.sh` | Read-only dump of the unit into `survey/<timestamp>/` |
| `./build.sh` | Builds `build/CarplayApp.apk` with the SDK tools, as package `com.example`, signed with the AOSP platform test key (the unit's system signature) |
| `./install.sh [--persist-wifi-adb]` | Saves the unit's original state once to `backups/original/`, installs the app as an Auto Dialer update, writes the 1280x720 screen config to `/data/vendor/carplay/`, sets `carplay_on=1`, reboots |
| `./status.sh` | Read-only: app installed, CarPlay manager state, video resolution, recent CarPlay logs |
| `./rollback.sh [backup dir]` | Restores the factory Auto Dialer, the screen config override, `carplay_on` and `persist.adb.tcp.port` from `backups/original/`, reboots |

## In the car

```bash
adb connect <IP>:5555
./install.sh --persist-wifi-adb
# wait ~1 minute for the reboot
adb connect <IP>:5555
./status.sh
```

Then plug the iPhone into the dashboard USB cable. A "CarPlay" icon replaces "Auto Dialer" in the
app drawer.

## Security: ADB over Wi-Fi

This unit's adbd does not require key authorisation (`ro.adb.secure` is unset), and `su` gives
root, so anyone on the same Wi-Fi network as the unit can get a root shell while ADB over Wi-Fi is
on. `install.sh` leaves that setting alone by default. `./install.sh --persist-wifi-adb` sets
`persist.adb.tcp.port=5555` so the connection survives reboots during testing. Once CarPlay works:

```bash
adb shell su 0 setprop persist.adb.tcp.port '""'
```

and switch off ADB over network / USB debugging in the unit's Developer options.
