# Adversarial review request: wired-CarPlay USB "replug wedge" on an Autochips AC8257 head unit

You are a skeptical Linux USB-gadget / Android init expert. We have a *wired* Apple CarPlay reliability
bug and a proposed fix I want you to challenge before we test it at the car (each trip is costly).
**Try to break my theory and my fix; tell me what I've missed.** Read the real files listed at the
end — don't take my summary on trust.

## System

- BWIC "Yato1 A100", Autochips **AC8257**, Android 9, `userdebug`, test-keys, root via `su 0` /
  `adb root`, SELinux permissive, dm-verity disabled, bootloader unlocked. eMMC has a write-protect
  region (`cmdq in sw wp area` I/O errors) so runtime writes to `/system`,`/vendor` fail, but configfs
  (`/config`) and `/data` are writable; Magisk-style overlays and SP-Flash/mtkclient are available.
- USB controller `musb-hdrc`; configfs gadget at `/config/usb_gadget/g1`. CarPlay uses an `ncm` +
  `iap2` function combo. The gadget is switched by `sys.usb.config` (`carplay` / `nocarplay` / `adb` …)
  driven from `init.ac8257.usb.rc`.

## Symptom

Wired CarPlay works on the **first** plug after a clean boot. On **replug** it fails roughly 4 of 5
times: either the USB appears wedged (no CarPlay, and nothing we do recovers it **except a full
power-down** — `adb reboot`/`svc power reboot` do NOT fix it), or the iPhone enumerates as **"IPOD"**
(iAP audio / iPod mode) instead of CarPlay. The reference project's screen app makes the *first*
connection reliable; the stuck replug is a separate, unsolved rough edge.

## My theory (challenge it)

From `init.ac8257.usb.rc`: the `sys.usb.config=carplay` block does `write .../UDC "none"`, creates the
`ncm`/`iap2` function **symlinks** into `configs/b.1/` (f6, f7), then `write .../UDC musb-hdrc` to bind.
The `nocarplay` (and other) transitions tear the UDC down but **never remove the f6/f7 symlinks**. So a
subsequent `carplay` bind re-`symlink`s paths that already exist — `init`'s `symlink` on an existing
path fails — leaving the gadget half-configured and the bind flaky. Hence "fails ~4 of 5 replugs."

## My proposed fix (challenge it — is it correct AND complete?)

**Fix A — userspace rebind, no flash, low risk** (run as root when stuck, or as a watchdog):
```sh
echo none > /config/usb_gadget/g1/UDC
rm -f /config/usb_gadget/g1/configs/b.1/f6 /config/usb_gadget/g1/configs/b.1/f7
ln -s /config/usb_gadget/g1/functions/ncm.gs1  /config/usb_gadget/g1/configs/b.1/f6
ln -s /config/usb_gadget/g1/functions/iap2.gs0 /config/usb_gadget/g1/configs/b.1/f7
echo musb-hdrc > /config/usb_gadget/g1/UDC
```
**Fix B — permanent, via Magisk overlay** of a corrected `.usb.rc` that removes f6/f7 on the
`nocarplay`→`carplay` transition.

## What I need you to do

1. **Verify or refute the half-configured-gadget theory against the actual rc file** — quote the exact
   lines. Does `init`'s `symlink` really fail on an existing link (vs. overwrite/no-op)? Are the f6/f7
   names right, and are they the only functions involved (there's also `accessory`, `audio_source`,
   `ean`, `mtp`, `ptp`, `rndis`, `acm*`, `mass_storage`, `hid`, `via_*`)? Is the real wedge maybe
   elsewhere — UDC bind ordering, the `android.hardware.usb@1.1-service-mediatek` HAL, a function
   instance left in a bad state, or the musb controller itself?
2. **Explain the "enumerates as IPOD not CarPlay" case** — is that the same gadget wedge, or the host
   (iPhone) falling back to iAP2 audio because the CarPlay/ncm interface never came up? Does the fix
   address both, or only the dead-USB case?
3. **Is Fix A correct and complete?** Will that exact sequence reliably rebind, or does it need more
   (e.g. clearing/recreating the function instances, writing `sys.usb.config` instead of poking
   configfs directly, a settle delay, disconnecting/reconnecting the data role, re-adding the config
   to the gadget)? Could it make things worse / brick the port until power-down? Is driving configfs
   by hand while the vendor USB HAL also manages it a conflict — is `setprop sys.usb.config carplay`
   (let init do it) safer than hand-editing symlinks?
4. **Confirm Fix B is the right permanent approach** and sketch the minimal corrected rc diff, noting
   whether Magisk overlay of an init `.rc` on `/vendor` (or wherever this lives) actually takes effect
   given the WP/overlay constraints.
5. **What to capture during a LIVE wedge to prove the cause** — exact commands (configfs tree state,
   `UDC` contents, `dmesg`/kmsg around the replug, `getprop sys.usb.*`, the USB HAL log) for a GOOD
   plug vs a WEDGED plug, so one car trip settles it.

## Files to read (all local, real)

- `survey/20261026-215704/configs/etc/init/hw/init.ac8257.usb.rc` — the actual gadget/`sys.usb.config`
  logic (this is the source of the theory; ~48 KB).
- `survey/20261026-215704/configs/etc/init/android.hardware.usb@1.1-service-mediatek.rc` — the USB HAL
  service init.
- `survey/replug-test/kmsg-carplay.txt` and `survey/session-logs/kmsg.txt` — kernel logs captured
  around replug attempts (look for musb/gadget/enumeration errors).
- `FIRMWARE_FEASIBILITY.md` §1 "Wired replug stuck-state" — my full write-up of theory + Fix A/B.
- (Optional) `getprop` dump at `wireless-data/20261028-222218/11_getprop.txt` for `sys.usb.*` and
  `vendor.usb.*` current values.

## What I need back

A verdict on whether the theory is right (with evidence from the rc/kmsg), whether Fix A is safe and
sufficient or what to change, the right permanent fix, and the exact live-wedge capture commands. If
you think the real cause is elsewhere, say so and point to it in the files.
