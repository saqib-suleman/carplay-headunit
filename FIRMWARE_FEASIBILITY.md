# How far can we push it — firmware & deep-software feasibility

Short answer: **most of the hurdles are addressable if we go into the weeds — and two of them turn
out to be much softer than I first called them.** One (native wireless audio) likely stays a
workaround. The unlock for the *permanent, seamless* versions of the fixes is early-boot root
(Magisk via a patched boot image), which is feasible on this unit but carries real brick risk, with
mtkclient / SP Flash Tool as the recovery net.

## Ground truth from the survey (what this unit actually allows)

- **Bootloader unlocked**: `ro.boot.vbmeta.device_state = unlocked`, `verifiedbootstate = green`,
  `ro.boot.veritymode = disabled`. So **dm-verity is off** and a modified/Magisk boot should boot.
- **Standard MediaTek AC8257**, USB controller `musb-hdrc`, configfs gadget at
  `/config/usb_gadget/g1`. Full MTK partition set (`boot` p26, `recovery` p2, `vendor` p30,
  `vbmeta` p32, `lk`, preloader) → **SP Flash Tool / mtkclient (BROM) can back up and un-brick it.**
- SELinux permissive, test-keys `userdebug`, root over ADB.
- The one real barrier to editing `/system` and `/vendor` at runtime is the **eMMC write-protect**
  (`cmdq in sw wp area` I/O errors). That is **bypassed by flashing** (SP Flash Tool/mtkclient write
  below the running OS) or **sidestepped by Magisk systemless overlays** (no partition write at all).
  It is not a dead end.

## Hurdle by hurdle

### 1. Wired replug stuck-state — ADDRESSABLE (and I was too pessimistic before)
I'd called this an unfixable kernel bug. The init script shows otherwise — it's **configfs gadget
rebind driven from `init.ac8257.usb.rc`**:

```
on property:sys.usb.config=carplay ...
    write .../UDC "none"
    symlink .../ncm.gs1  .../configs/b.1/f6
    symlink .../iap2.gs0 .../configs/b.1/f7
    write .../UDC musb-hdrc
on property:sys.usb.config=nocarplay ...
    write .../UDC "none"            # unbinds, but NEVER removes f6/f7
```

The `nocarplay` transition tears down the UDC but leaves the `f6`/`f7` symlinks in place, so the
next `carplay` bind re-`symlink`s paths that already exist and can leave the gadget half-configured —
a very plausible cause of "fails ~4 of 5 replugs." Two fixes:

- **Fix A — userspace rebind, no flash, low risk.** A root helper re-runs the bind cleanly:
  ```sh
  echo none > /config/usb_gadget/g1/UDC
  rm -f /config/usb_gadget/g1/configs/b.1/f6 /config/usb_gadget/g1/configs/b.1/f7
  ln -s /config/usb_gadget/g1/functions/ncm.gs1  /config/usb_gadget/g1/configs/b.1/f6
  ln -s /config/usb_gadget/g1/functions/iap2.gs0 /config/usb_gadget/g1/configs/b.1/f7
  echo musb-hdrc > /config/usb_gadget/g1/UDC
  ```
  Instant recovery, no reboot, fully reversible. Can be a button (via a small root helper like the
  authd pattern) or an automatic watchdog that fires when it sees the stuck `nocarplay` state.
- **Fix B — permanent, via Magisk.** Overlay a corrected `.usb.rc` that removes `f6`/`f7` on the
  `nocarplay`→`carplay` transition, fixing the root cause so replug just works. Needs early-boot root
  (below), no partition write.

Still a hypothesis until confirmed on the unit: when stuck, inspect `/config/usb_gadget/g1/configs/b.1/`
and the UDC, and test the Fix A sequence live.

### 2. Native wireless audio — HARD, likely stays a workaround
The vendor AirPlay receiver renders video but has no audio path. Options, all steep:
- **Patch the closed receiver** to enable audio — we tried patching that process before and it
  crashed (`UnsatisfiedLinkError`); deep closed-binary RE, and it may simply have no audio code.
- **Build our own CarPlay audio receiver** — reimplement the encrypted AirPlay-2 audio streams plus
  the MFi-SAP key exchange. Very large reverse-engineering project.
- **Pragmatic:** automate the Bluetooth A2DP workaround (seamless to use, not CarPlay's native
  audio). This is the realistic win.

Flashing/Magisk does **not** help here — it's an RE problem, not an access problem. This is the one
hurdle I would not promise.

### 3. Wireless non-persistence (flag clears on reboot) — SOLVED by early-boot root
`resetprop ro.atc.carplay.wireless=1` in a Magisk `post-fs-data` script (before the vendor service
starts) makes it permanent, and a Magisk service script can auto-spawn `authd` at boot. Clean, and it
removes the "re-flip + re-spawn every boot" caveat entirely.

### 4. eMMC write-protection — NOT a wall
Either Magisk systemless overlays (no write) or SP Flash Tool/mtkclient partition writes (below the
running OS) get past it. So permanent `/vendor`, init, and audio-policy changes become possible.

### 5. Steering-wheel controls — already fixed at the app level
`patches/carplay-screen-steering.patch` (compiles). No firmware work needed.

### 6. First-connect reliability / blank screen — stock app + (if needed) the gadget-rebind fix
The reference app's self-listening `Watcher` already fixes most of this; anything left overlaps with
hurdle 1.

### 7. Spotify play-then-pause — diagnose at the car
If it's the vendor's audio-focus policy, it may be tunable via an `audio_policy` config we overlay
with Magisk. Needs the live log first (`AudioManager`/`AUDIOFOCUS`).

## The linchpin: early-boot root (Magisk via patched boot)

Hurdles 1B, 3, 4, 7 (permanent forms) all ride on being able to run our code / overlays **before the
vendor stack starts**. The path:

1. Back up `boot` while the system is up (reads are allowed):
   `adb shell su 0 dd if=/dev/block/by-name/boot of=/data/local/tmp/boot.img` → pull it.
2. Patch it with Magisk (Magisk app "patch boot image", or `magiskboot`).
3. Flash it: `fastboot flash boot magisk_patched.img` (bootloader is unlocked) — or via SP Flash
   Tool / mtkclient.
4. Verify it boots and `su` works; then layer the overlays (resetprop, init `.rc`, authd service).

**Risk, stated plainly:** flashing `boot` on a car head unit can brick it. It's recoverable on this
SoC with mtkclient / SP Flash Tool over BROM download mode, **but** that needs the stock `boot`
backup (step 1), the matching DA/firmware, and physical access to the board's USB in download mode.
That recovery path is the serious commitment here — everything in the "no flash" column is reversible
from an ADB shell.

## Recommended sequence (lowest risk first)

1. **No-flash userspace wins** — do these first, big seamlessness gain, fully reversible:
   - the gadget-rebind recovery for the replug stuck-state (Fix A),
   - the A2DP automation for wireless audio,
   - the steering patch (done).
2. **Early-boot root (Magisk)** — only if you want the permanent/seamless versions (persistent
   wireless, root-cause replug fix, authd autostart), and only after backing up `boot` and lining up
   the mtkclient recovery kit.
3. **Native wireless audio** — treat as the A2DP workaround unless someone wants to take on a large
   reverse-engineering project with low odds.

Net: wired can get genuinely seamless (opens on plug-in, touch + steering, speaker audio, and replug
recoverable or fixed). Wireless can get seamless for screen/touch and persistent across boots; its
audio stays the Bluetooth workaround. The only true wall is CarPlay's *native* wireless audio.
