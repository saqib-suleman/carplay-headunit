# At the car — minimal steps

Everything below runs on the Mac over the unit's **hotspot** (join it first; scripts auto-detect the
gateway) or over **wired home Wi-Fi** (append the unit's `IP:5555`). Keep the **iPhone unlocked, BT +
Wi-Fi on, and NOT plugged into USB** (USB wedges `adb root` on this unit).

The connect fixes (A/B/C/E) are in the bridge APK; the daemon fix (D) and the on/off toggle are in the
boot daemon. Pick the path that costs the least car time.

## Fastest — validate the core fixes (no root, no reboot, ~15 s)

```bash
bash tools/install-bridge.sh
```

Installs the rebuilt bridge APK (A live-IP + defer, B bounded handoff grace, C timing logs, E
negotiation deadline) and restarts it. Then watch one connect:

```bash
bash tools/wireless-diag.sh
```

The log now stamps each milestone with `+Nms` from RFCOMM connect: negotiation complete → `0x5703`
creds → `0x4301` → screen up. That gives the real warm-reconnect time. Send me that diag output.

## One-time full install — daemon fix (D) + on-unit toggles (root, one reboot)

```bash
bash tools/push-fixes.sh
```

Installs both APKs (bridge + util app with the on-screen toggles), pushes the daemon and the hotspot
helper to `/vendor`, and reboots for a clean cold start. Do this once; the reboot is unattended (walk
away ~2–4 min while the hotspot comes back up). Pass `IP:5555` if wired.

## On-unit toggles (no laptop) — in the CarPlay app's connect screen

Open the **CarPlay** app on the unit; when no iPhone is attached, the connect screen shows two switches:

- **Wireless CarPlay** — bridge on/off, instant (no reboot).
- **Hotspot (off = use unit Wi-Fi)** — asks to confirm, then the unit restarts to switch modes. Turning
  it back **on** is also here, so you never need the laptop to recover the hotspot.

How it works: the app can't call `su`, so it writes the desired state to a trigger file the root boot
daemon reads and applies (CarPlay instantly; hotspot via a guarded `/vendor/build.prop` flip + reboot).

## Two toggles (different layers)

**1. CarPlay bridge — instant, no reboot.** Stops the BT→Wi-Fi dialing. The hotspot stays up, so this
does NOT free the unit's Wi-Fi radio; it just gives you plain Bluetooth stereo with CarPlay one command
away.

```bash
bash tools/wireless-carplay.sh off   # plain Bluetooth stereo: music + calls through the car, no CarPlay
bash tools/wireless-carplay.sh on    # wireless CarPlay back
```

**2. Hotspot / Wi-Fi mode — needs a reboot, needs root (USB unplugged).** Turns the hotspot off at the
vendor level so the single Wi-Fi radio is freed for station mode — use this when you want the unit on
your home/phone Wi-Fi. Wired USB CarPlay still works; wireless CarPlay does not while the hotspot is off.

```bash
bash tools/hotspot.sh off    # disable hotspot -> unit can use its own Wi-Fi (reboots)
bash tools/hotspot.sh on     # hotspot + wireless CarPlay back (reboots)
```

After `hotspot.sh off`, the hotspot is gone — to turn it back on later, reach the unit over the home
Wi-Fi it now joins, over USB, or in the boot window (`headunit-carplay-ref/scripts/wireless-recovery.sh`).

Quick guide: want plain BT audio but CarPlay back fast → toggle 1 off. Want to actually use the unit's
Wi-Fi/internet → toggle 2 off.

## Tuning knobs (no rebuild; take effect on the next dial)

```bash
adb shell su 0 setprop persist.cpbridge.handoff_grace_ms 20000      # default 30000; lower = faster retry after a failed handoff
adb shell su 0 setprop persist.cpbridge.negotiate_deadline_ms 15000 # default 15000
```

## What to send back

The `wireless-data/diag-*.txt` file from `wireless-diag.sh` after one connect — the `+Nms` stamps and
whether port 7000 reached `ESTABLISHED` tell us if the fixes landed and the real timing.
