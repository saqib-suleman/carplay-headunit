# Volume buttons = call accept/reject (feature design — build-ready)

> **STATUS: VERIFIED AT THE CAR (2026-10-28).** Merged into the platform-signed Head Unit Helper app
> (`restart-app/`, `HeadUnitHelper.apk`) as `CallControlService` + `BootReceiver`. Confirmed working
> across 5 test calls: `RINGING → volume keys grabbed → keyCode=24 → acceptRingingCall()` (answer) and
> `keyCode=25 → endCall()` (reject), keys released after each call so normal volume is untouched.
>
> **Two unit-specific fixes were required and are now baked into the APK:**
> 1. **`<uses-library android:name="bw.car.proxy" android:required="false"/>`** in the manifest — the
>    vendor shared library is named `bw.car.proxy` (declared in `/system/etc/permissions/bw.car.proxy.xml`,
>    file `/system/framework/BwCarProxy.jar`), NOT `bw.car`. Without it the service crashed with
>    `NoClassDefFoundError: bw.car.input.CarInputManager$CarInputListener` and never grabbed keys.
> 2. **Diagnostics log at ERROR level** — this unit's logd silently drops everything below Error
>    (`log.tag=M`; per-tag `log.tag.<T>=V` does NOT override it). `Log.i/Log.w` are invisible. Verify
>    with `adb logcat -s CallVol:E`. The delivered keycodes are the mapped **24/25** (VOLUME_UP/DOWN),
>    not the pre-map vendor codes 1202/1203 — we register both, 24/25 is what arrives.

Goal: while a call is ringing (CarPlay on), steering **Volume Up = answer**, **Volume Down = reject**.
Your steering has no call buttons, and the unit's own call UI covers CarPlay's accept/reject buttons,
so this gives you hardware call control. Verdict after investigation: **feasible**, all pieces confirmed
from our captured data — no new reverse-engineering needed, just a build + one at-car verification.

## How it works (all confirmed offline)

- **Steering volume keycodes are known.** `ro.bwic.multi_fingers_keys` maps `1202 → 24
  (KEYCODE_VOLUME_UP)` and `1203 → 25 (KEYCODE_VOLUME_DOWN)`. The vendor keycodes are **1202 / 1203**.
- **The vendor has a key-interception API.** `bw.car.input.CarInputManager.registerInputListener(
  CarInputListener, int[] keys, int priority)` (from `BwCarProxy.jar`, decompiled). When a key we
  registered is pressed, `CarInputService.handleKeyEvent` calls our listener **before** mapping it to
  a volume action and **returns true (consumes it)** — so registering for `1202/1203` lets us take
  the press with no volume side-effect.
- **Register ONLY while ringing, unregister after.** So normal volume works at all other times; only
  during the ring do the buttons mean accept/reject. (During a ring you don't need volume anyway.)
- **Ring detection:** `TelecomManager.isRinging()` / `PhoneStateListener.onCallStateChanged` — the
  vendor's own `isInCallSource()` uses exactly this, so the BT-HFP call is visible to it.
- **Accept/reject:** `TelecomManager.acceptRingingCall()` (answer) and `TelecomManager.endCall()`
  (reject). Needs `ANSWER_PHONE_CALLS` — granted because the app is platform-signed (same keys as the
  Restart app).

## The app

A tiny platform-signed background app `callvol-app` (foreground service + boot start):

1. Service holds a `PhoneStateListener`.
2. `onCallStateChanged(RINGING)` → `Car.createCar(...).connect()`, get `CarInputManager`
   (`Car.CAR_INPUT_SERVICE`), `registerInputListener(listener, new int[]{1202,1203}, PRIORITY_HIGH)`.
3. `CarInputListener.onKeyEvent(e)` (ACTION_DOWN): `1202` → `telecom.acceptRingingCall()`;
   `1203` → `telecom.endCall()`.
4. `onCallStateChanged(OFFHOOK | IDLE)` → `unregisterInputListener(...)` (volume back to normal).

Permissions: `READ_PHONE_STATE`, `ANSWER_PHONE_CALLS`, `FOREGROUND_SERVICE`,
`RECEIVE_BOOT_COMPLETED` (+ any `bw.car` input permission — covered by the platform signature).
Compiled against `android.jar` + compile-only `bw.car` stubs (Car / CarInputManager / CarInputListener);
the real classes load on-device from `BwCarProxy.jar`.

## The one at-car verification (and fallbacks)

- **Does `acceptRingingCall()` actually answer the BT-HFP call?** The unit is the hands-free (HF)
  role; the call is a Bluetooth HFP-client call surfaced through Telecom, so `acceptRingingCall()` /
  `endCall()` should route to it — but this is the single thing we confirm live.
  - Fallback 1: inject `KEYCODE_HEADSETHOOK` (answer) / `KEYCODE_ENDCALL` (reject).
  - Fallback 2: `BluetoothHeadsetClient.acceptCall(device, flag)` / `rejectCall(device)` (the proper
    HF-role API).
- **Does the registered listener receive `1202/1203` or the mapped `24/25`?** `handleKeyEvent` checks
  the custom handler on the pre-map vendor code, so `1202/1203` — but we'll register for both
  `{1202,1203,24,25}` to be safe, and the log will show which arrives.
- **Is `BwCarProxy.jar` on the boot classpath or a `<uses-library>`?** If our app can't resolve the
  `bw.car` classes at runtime, add `<uses-library android:name="bw.car" android:required="false"/>`
  (check how `com.bw.carsetting` declares it). We have the jar to pull the exact name.

## Note on the covered call UI
This feature does not fix the unit's call UI covering CarPlay (that's the vendor phone app taking the
screen) — it sidesteps it by giving hardware accept/reject, which is what you asked for.
