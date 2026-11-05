package app.carplayscreen;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.Service;
import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.media.AudioManager;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import android.view.KeyEvent;
import com.autochips.carplay.CarplayAppState;
import com.autochips.carplay.CarplayAudioInfo;
import com.autochips.carplay.CarplayCall;
import com.autochips.carplay.CarplayDevice;
import com.autochips.carplay.CarplayManager;
import com.autochips.carplay.CarplayResourceState;
import java.util.List;

import bw.car.Car;
import bw.car.input.CarInputManager;

/**
 * Always-running service that (a) opens the CarPlay screen when the iPhone connects and (b) owns the
 * steering SOURCE button (and, while CarPlay is up, the media next/prev/play keys) GLOBALLY — so SOURCE
 * = Play/Pause works everywhere, not just inside CarPlay.
 *
 * Routing of SOURCE / media keys, grabbed via the vendor Car input API:
 *   - in a call            -> ignore (Head Unit Helper owns SOURCE then, for call-audio switching)
 *   - CarPlay connected     -> forward to CarPlay: SOURCE 1x = Play/Pause, 2x = Siri; next/prev/play = updateMedia
 *   - CarPlay NOT connected -> SOURCE 1x = inject a generic MEDIA_PLAY_PAUSE (toggles the active source,
 *                              e.g. BTMUSIC). Media keys aren't grabbed when disconnected, so they reach
 *                              the active source natively (and injecting can't loop back to us).
 * Logs at ERROR level (this ROM drops Info/Warn).
 */
public class Watcher extends Service implements CarplayManager.CarplayCallback {
    private static final String TAG = "CarPlayScreen";
    private static final int CONNECTION_STATE_CONNECTED = 2; // CarplayCommon
    private static final int ENTITY_CONTROLLER = 1; // CarplayCommon: the iPhone owns the screen
    private static final long RETRY_MS = 2000;
    private static final int MAX_TRIES = 60;

    // updateMedia / requestSiri action codes (reference steering patch)
    // vendor CarplayCommon media-button codes: PLAY=1, PAUSE=2, PLAY/PAUSE-toggle=3, NEXT=4, PREV=5
    private static final int MEDIA_PLAY = 1, MEDIA_PAUSE = 2, MEDIA_PLAY_PAUSE = 3,
            MEDIA_NEXT_TRACK = 4, MEDIA_PREVIOUS_TRACK = 5;
    private static final int SIRI_DOWN = 2, SIRI_UP = 3;
    private static final long DOUBLE_MS = 500;

    // SOURCE candidates (bw.car.input.CarKeyEvent); real code confirmed from the logged [ev] line.
    private static final int[] SOURCE_KEYS = {1043, 1035, 1046, 1006, 1100, 1101, 1102, 1103, 1104, 1105};
    private static final int[] MEDIA_KEYS = {
            KeyEvent.KEYCODE_MEDIA_NEXT, KeyEvent.KEYCODE_MEDIA_PREVIOUS,
            KeyEvent.KEYCODE_MEDIA_PLAY_PAUSE, KeyEvent.KEYCODE_MEDIA_PLAY,
            KeyEvent.KEYCODE_MEDIA_PAUSE, KeyEvent.KEYCODE_HEADSETHOOK
    };
    // MEDIA + SOURCE grabbed together while CarPlay is up when debug.cp.source_pp != 0 (default on): the
    // SOURCE button then toggles CarPlay play/pause (onSourcePress -> updateMedia 3) instead of the
    // vendor source-cycle. Turn off with: setprop debug.cp.source_pp 0 (if the vendor also still cycles).
    private static int[] concat(int[] a, int[] b) {
        int[] r = new int[a.length + b.length];
        System.arraycopy(a, 0, r, 0, a.length);
        System.arraycopy(b, 0, r, a.length, b.length);
        return r;
    }
    private static final int[] MEDIA_PLUS_SOURCE = concat(MEDIA_KEYS, SOURCE_KEYS);

    private final Handler handler = new Handler(Looper.getMainLooper());
    private CarplayManager cp;
    private AudioManager audio;
    private Car car;
    private CarInputManager carInput;
    private boolean callbackRegistered;
    private int tries;
    private boolean carplayConnected;
    private int[] grabbedSet;            // which key set is currently registered (null = none)
    private long lastSourceMs;
    private long lastMediaMs;
    private final Runnable retryRunnable = new Runnable() { @Override public void run() { tryRegister(); } };
    private final Runnable sourceSingle = new Runnable() { @Override public void run() { sourcePlayPause(); } };

    @Override
    public void onCreate() {
        super.onCreate();
        NotificationManager nm = getSystemService(NotificationManager.class);
        nm.createNotificationChannel(new NotificationChannel("carplay", "CarPlay", NotificationManager.IMPORTANCE_MIN));
        // high-importance channel for the full-screen-intent launch (forces the screen to the foreground)
        nm.createNotificationChannel(new NotificationChannel("carplay_launch", "CarPlay launch", NotificationManager.IMPORTANCE_HIGH));
        startForeground(1, new Notification.Builder(this, "carplay")
                .setSmallIcon(android.R.drawable.ic_media_play).setContentTitle("CarPlay ready").build());
        audio = (AudioManager) getSystemService(Context.AUDIO_SERVICE);
        tryRegister();
        try {
            car = Car.createCar(this, carConn);
            car.connect();
        } catch (Throwable t) {
            Log.e(TAG, "[cp] car connect failed (SOURCE button won't work)", t);
        }
        startConnWatch();
    }

    // Poll the connection state as a FALLBACK for a missed onConnectionStateChanged callback (a
    // registration race, or the vendor firing connect before we're listening) -- that was why the
    // screen sometimes didn't open by itself. On a false->true transition we open the screen; it only
    // acts on a TRANSITION, so it never fights the user or re-pops a screen they left on purpose.
    private boolean pollStarted;
    private final Runnable connWatch = new Runnable() {
        @Override public void run() {
            try {
                boolean now = isCarplayConnected();
                if (now && !carplayConnected) {
                    Log.e(TAG, "[cp] poll: CarPlay connected (callback missed?) -> opening screen");
                    carplayConnected = true;
                    updateGrab();
                    setBridgeDial(true);
                    show();
                    enableCarplayAudio();
                    scheduleBtReconnect();
                } else if (!now && carplayConnected) {
                    Log.e(TAG, "[cp] poll: CarPlay disconnected -> dismiss screen");
                    carplayConnected = false;
                    updateGrab();
                    setBridgeDial(false);
                    MainActivity.finishIfShowing();
                }
            } catch (Throwable t) {
                Log.e(TAG, "[cp] poll error: " + t);
            }
            handler.postDelayed(this, 2000);
        }
    };
    private void startConnWatch() {
        if (pollStarted) return;
        pollStarted = true;
        handler.postDelayed(connWatch, 2000);
    }

    // ---- CarplayManager callback registration (opens the screen on connect) ----
    private void tryRegister() {
        if (callbackRegistered) return;
        cp = CarplayManager.getDefaultManager();
        int result = -1;
        try { if (cp != null) result = cp.registerCallback(this, null); }
        catch (Throwable t) { Log.e(TAG, "[cp] registerCallback threw", t); }
        if (result == 0) {
            callbackRegistered = true;
            Log.e(TAG, "[cp] registerCallback OK after " + tries + " tries");
            showIfAlreadyConnected();
            return;
        }
        if (++tries <= MAX_TRIES) {
            if (tries == 1 || tries % 5 == 0) Log.e(TAG, "[cp] not ready (cp=" + (cp != null)
                    + " result=" + result + "), retrying (" + tries + "/" + MAX_TRIES + ")");
            handler.postDelayed(retryRunnable, RETRY_MS);
        } else {
            Log.e(TAG, "[cp] gave up registering after " + MAX_TRIES + " tries");
        }
    }

    private void showIfAlreadyConnected() {
        if (isCarplayConnected()) { carplayConnected = true; Log.e(TAG, "[cp] already connected -> show"); show(); updateGrab(); enableCarplayAudio(); setBridgeDial(true); scheduleBtReconnect(); }
    }

    /** Tell the bridge to pause dialing while CarPlay is up (frees the BT radio so A2DP audio works),
     * and resume when it disconnects. Explicit broadcast to the bridge package. */
    private void setBridgeDial(boolean pause) {
        try {
            Intent i = new Intent(pause ? "com.cpbridge.PAUSE_DIAL" : "com.cpbridge.RESUME_DIAL");
            i.setPackage("com.cpbridge");
            sendBroadcast(i);
            Log.e(TAG, "[cp] bridge dial " + (pause ? "PAUSE" : "RESUME"));
        } catch (Throwable t) { Log.e(TAG, "[cp] dial-control broadcast failed", t); }
    }

    /**
     * Turn on the vendor CarPlay audio path (setAudioEnable). In WIRED CarPlay this is needed. Wireless
     * audio was thought impossible here, but research (docs/AUDIO-research-findings.md) found that's
     * likely a fixable vendor bug (stream 102 can't be dispatched), NOT a hardware limit. Note:
     * setAudioEnable only QUEUES a mode request (returning 0 != playing), so this call alone proves
     * nothing. To TRY wireless audio, set debug.cp.cpaudio=1 BEFORE connecting so this claims the route;
     * then watch the [audio] onStreamStateChanged logs (is stream 102 negotiated?). Default: off in
     * wireless (ro.atc.carplay.wireless=1), on in wired.
     */
    private void enableCarplayAudio() {
        if (cp == null) return;
        int wireless = prop("ro.atc.carplay.wireless", 0);
        int want = prop("debug.cp.cpaudio", wireless == 1 ? 0 : 1);
        // want!=0 -> claim CarPlay audio (wired: USB audio plays). want==0 -> RELEASE it (wireless:
        // the Wi-Fi audio path is dead here, and claiming it drops the A2DP that plays on the car).
        Boolean arg = (want != 0) ? Boolean.TRUE : Boolean.FALSE;
        try {
            java.lang.reflect.Method m = cp.getClass().getMethod("setAudioEnable", boolean.class);
            Object r = m.invoke(cp, arg);
            Log.e(TAG, "[ok] setAudioEnable(" + arg + ") -> " + r + " (wireless=" + wireless + ")");
        } catch (Throwable t) {
            Log.e(TAG, "[cp] setAudioEnable not available / failed: " + t);
        }
    }

    private boolean isCarplayConnected() {
        try { List<?> d = cp == null ? null : cp.getConnectedDevices(); return d != null && !d.isEmpty(); }
        catch (Throwable t) { return false; }
    }

    // ---- vendor Car input: grab SOURCE always, media keys only while CarPlay is connected ----
    private final ServiceConnection carConn = new ServiceConnection() {
        @Override public void onServiceConnected(ComponentName name, IBinder b) {
            try {
                carInput = (CarInputManager) car.getCarManager(Car.CAR_INPUT_SERVICE);
                Log.e(TAG, "[cp] car input connected=" + (carInput != null));
                updateGrab();
            } catch (Throwable t) { Log.e(TAG, "[cp] getCarManager failed", t); }
        }
        @Override public void onServiceDisconnected(ComponentName name) { carInput = null; grabbedSet = null; }
    };

    /**
     * Grab the steering MEDIA next/prev/play keys and forward them to CarPlay via updateMedia, so they
     * work on any source without Bluetooth/BTMUSIC. SOURCE is NOT grabbed (the vendor owns it, can't be
     * preempted even at FACTORY). The updateMedia codes are tunable live via debug.cp.next/prev/pp
     * because "4"/"5" may mean seek vs track-skip on this firmware.
     */
    private void updateGrab() {
        if (carInput == null) return;
        if (carplayConnected) {
            int[] want = (prop("debug.cp.source_pp", 1) != 0) ? MEDIA_PLUS_SOURCE : MEDIA_KEYS;
            if (grabbedSet == want) return;
            try { carInput.unregisterInputListener(keyListener); } catch (Throwable ignored) {}
            try {
                carInput.registerInputListener(keyListener, want, CarInputManager.PRIORITY_HIGH);
                grabbedSet = want;
                Log.e(TAG, "[cp] grab set = " + (want == MEDIA_PLUS_SOURCE
                        ? "MEDIA + SOURCE (SOURCE = CarPlay play/pause)" : "MEDIA keys"));
            } catch (Throwable t) { Log.e(TAG, "[cp] registerInputListener failed", t); }
        } else {
            // CarPlay down: release the keys so the vendor handles SOURCE (source-cycle) + next/prev as before.
            if (grabbedSet == null) return;
            try { carInput.unregisterInputListener(keyListener); } catch (Throwable ignored) {}
            grabbedSet = null;
            Log.e(TAG, "[cp] grab released (CarPlay down) -> vendor owns keys");
        }
    }

    private final CarInputManager.CarInputListener keyListener = new CarInputManager.CarInputListener() {
        @Override public void onKeyEvent(final KeyEvent e) {
            if (e == null) return;
            final int keyCode = e.getKeyCode();
            Log.e(TAG, "[ev] action=" + e.getAction() + " keyCode=" + keyCode + " repeat=" + e.getRepeatCount());
            if (e.getAction() != KeyEvent.ACTION_DOWN) return;
            if (e.getRepeatCount() > 0) return;            // ignore auto-repeat of a held button
            if (inCall()) { Log.e(TAG, "[ev] in call -> leaving SOURCE to Head Unit Helper"); return; }
            if (isSourceKey(keyCode)) { handler.post(new Runnable() { @Override public void run() { onSourcePress(); } }); return; }
            final int a = mediaActionFor(keyCode);
            if (a == 0) return;
            long now = SystemClock.uptimeMillis();           // debounce: one media action per ~400ms
            if (now - lastMediaMs < 400) { Log.e(TAG, "[ev] media debounced"); return; }
            lastMediaMs = now;
            handler.post(new Runnable() { @Override public void run() { forwardMedia(a); } });
        }
    };

    private boolean inCall() {
        if (audio == null) return false;
        int m = audio.getMode();
        return m == AudioManager.MODE_IN_CALL || m == AudioManager.MODE_IN_COMMUNICATION;
    }

    private boolean isSourceKey(int c) { for (int k : SOURCE_KEYS) if (k == c) return true; return false; }

    private int mediaActionFor(int c) {
        switch (c) {
            case KeyEvent.KEYCODE_MEDIA_NEXT: return prop("debug.cp.next", MEDIA_NEXT_TRACK);
            case KeyEvent.KEYCODE_MEDIA_PREVIOUS: return prop("debug.cp.prev", MEDIA_PREVIOUS_TRACK);
            case KeyEvent.KEYCODE_MEDIA_PLAY_PAUSE: case KeyEvent.KEYCODE_MEDIA_PLAY:
            case KeyEvent.KEYCODE_MEDIA_PAUSE: case KeyEvent.KEYCODE_HEADSETHOOK: return prop("debug.cp.pp", MEDIA_PLAY_PAUSE);
            default: return 0;
        }
    }

    // updateMedia code sent for each key, tunable live without a rebuild: the vendor's native
    // updateMediaButton(u16) interprets the number, and "4"/"5" may be seek rather than track-skip
    // on this firmware. Find the right value at the car with e.g.  setprop debug.cp.prev 8
    private int prop(String k, int def) {
        try {
            Class<?> sp = Class.forName("android.os.SystemProperties");
            return (Integer) sp.getMethod("getInt", String.class, int.class).invoke(null, k, def);
        } catch (Throwable t) { return def; }
    }

    private String propStr(String k) {
        try {
            Class<?> sp = Class.forName("android.os.SystemProperties");
            Object v = sp.getMethod("get", String.class).invoke(null, k);
            return v == null ? "" : (String) v;
        } catch (Throwable t) { return ""; }
    }

    // ---- Bluetooth A2DP auto-reconnect (the wireless-audio fix) ----------------------------------
    // Confirmed by capture: iOS NEVER opens a CarPlay audio stream over Wi-Fi on this unit (only the
    // screen stream is created; mainAudio stays inactive). Audio only ever plays over the phone's A2DP to
    // the unit -- but wireless CarPlay DROPS that A2DP on connect, so there's silence until it reconnects.
    // So when CarPlay comes up, re-initiate the A2DP SINK connection to the iPhone from the unit side,
    // with retries (the drop happens around connect time). Disable with debug.cp.btaudio=0.
    private void scheduleBtReconnect() {
        if (prop("ro.atc.carplay.wireless", 0) != 1) return;   // wired CarPlay plays its own audio
        if (prop("debug.cp.btaudio", 1) == 0) return;
        for (int i = 1; i <= 6; i++) {
            final int attempt = i;
            handler.postDelayed(new Runnable() {
                @Override public void run() { if (carplayConnected) tryBtSinkConnect(attempt); }
            }, i * 4000L);   // 4,8,...,24s after CarPlay connects
        }
    }

    private void tryBtSinkConnect(final int attempt) {
        try {
            final android.bluetooth.BluetoothAdapter ad = android.bluetooth.BluetoothAdapter.getDefaultAdapter();
            if (ad == null || !ad.isEnabled()) { Log.e(TAG, "[btaudio] attempt " + attempt + ": adapter off"); return; }
            String mac = propStr("persist.cpbridge.peer_mac");
            android.bluetooth.BluetoothDevice dev = null;
            if (mac != null && mac.length() == 17) {
                try { dev = ad.getRemoteDevice(mac); } catch (Throwable ignored) {}
            }
            if (dev == null) dev = pickApple(ad);
            if (dev == null) { Log.e(TAG, "[btaudio] attempt " + attempt + ": no iPhone device (peer_mac=" + mac + ")"); return; }
            final android.bluetooth.BluetoothDevice device = dev;
            ad.getProfileProxy(this, new android.bluetooth.BluetoothProfile.ServiceListener() {
                @Override public void onServiceConnected(int profile, android.bluetooth.BluetoothProfile proxy) {
                    try {
                        java.lang.reflect.Method m = proxy.getClass().getMethod("connect", android.bluetooth.BluetoothDevice.class);
                        Object r = m.invoke(proxy, device);
                        Log.e(TAG, "[btaudio] A2DP_SINK connect(" + device.getAddress() + ") attempt " + attempt + " -> " + r);
                    } catch (Throwable t) {
                        Log.e(TAG, "[btaudio] connect reflect failed (attempt " + attempt + "): " + t);
                    } finally {
                        try { ad.closeProfileProxy(11, proxy); } catch (Throwable ignored) {}
                    }
                }
                @Override public void onServiceDisconnected(int profile) {}
            }, 11 /* BluetoothProfile.A2DP_SINK */);
        } catch (Throwable t) { Log.e(TAG, "[btaudio] tryBtSinkConnect failed (attempt " + attempt + "): " + t); }
    }

    private android.bluetooth.BluetoothDevice pickApple(android.bluetooth.BluetoothAdapter ad) {
        try {
            for (android.bluetooth.BluetoothDevice d : ad.getBondedDevices()) {
                String n = null;
                try { n = d.getName(); } catch (Throwable ignored) {}
                if (n != null) { String l = n.toLowerCase(); if (l.contains("iphone") || l.contains("ipad")) return d; }
            }
        } catch (Throwable ignored) {}
        return null;
    }

    private void onSourcePress() {
        // Single press = play/pause toggle. No double-press/Siri (removed per request), so it fires
        // immediately and we never fall through to the vendor's source-cycle.
        sourcePlayPause();
    }

    private void sourcePlayPause() {
        if (carplayConnected && cp != null) {
            // The combined toggle (3) was unreliable at RESUMING play on this firmware, so by default use
            // the SEPARATE codes based on play state: PAUSE(2) if music is playing, else PLAY(1). Pin a
            // fixed code with debug.cp.source_code (1=play, 2=pause, 3=toggle) if you prefer.
            // Use the PLAY/PAUSE TOGGLE (3) by default. It sets the HID Play/Pause usage; forwardMedia
            // then RELEASES it (updateMedia(0)) so each press is a clean edge = one toggle. The toggle
            // paused-but-never-resumed before ONLY because there was no release (the bit stayed set, so
            // the next press was not a new edge). PLAY=1/PAUSE=2 exist but need the exact play state,
            // which isMusicActive() can't tell for CarPlay audio here. Override with debug.cp.source_code.
            int code = prop("debug.cp.source_code", MEDIA_PLAY_PAUSE);  // 1=play, 2=pause, 3=toggle
            Log.e(TAG, "[ok] SOURCE -> CarPlay play/pause code=" + code);
            forwardMedia(code);
        } else {
            inject(KeyEvent.KEYCODE_MEDIA_PLAY_PAUSE);
            Log.e(TAG, "[ok] SOURCE -> generic MEDIA_PLAY_PAUSE (active source)");
        }
    }

    // The vendor's updateMedia maps to Apple's HID media-button report and SENDS IT ONCE with no
    // auto-release (confirmed in libcarplay_plugin_jni: _mediaButtonUpdate -> HIDMediaButtonsFillReport
    // -> AirPlayReceiverSessionSendHIDReport, one report per call). So a bare press of fast-forward
    // scans until something clears it, and a track-skip usage never gets its press->release edge.
    // We therefore send the button, then send 0 (all bits cleared = release) a moment later.
    // debug.cp.release=0 disables the release; debug.cp.relms tunes the gap.
    private void forwardMedia(final int action) {   // only reached while CarPlay connected (media grabbed then)
        if (prop("debug.cp.release", 1) != 0) {
            final int ms = prop("debug.cp.relms", 120);
            handler.postDelayed(new Runnable() { @Override public void run() {
                try { if (cp != null) cp.updateMedia(0); } catch (Throwable ignored) {}
            } }, ms);
        }
        try { Log.e(TAG, "[ok] steering media -> updateMedia(" + action + ")+release, ret=" + (cp != null ? cp.updateMedia(action) : -1)); }
        catch (Throwable t) { Log.e(TAG, "updateMedia failed", t); }
    }

    private void inject(int keyCode) {
        if (carInput == null) return;
        try {
            carInput.injectKeyEvent(new KeyEvent(KeyEvent.ACTION_DOWN, keyCode));
            carInput.injectKeyEvent(new KeyEvent(KeyEvent.ACTION_UP, keyCode));
        } catch (Throwable t) { Log.e(TAG, "injectKeyEvent failed", t); }
    }

    @Override public int onStartCommand(Intent intent, int flags, int startId) {
        if (!callbackRegistered) tryRegister();
        return START_STICKY;
    }

    @Override public IBinder onBind(Intent intent) { return null; }

    @Override public void onDestroy() {
        handler.removeCallbacksAndMessages(null);
        try { if (carInput != null) carInput.unregisterInputListener(keyListener); } catch (Throwable ignored) {}
        try { if (car != null) car.disconnect(); } catch (Throwable ignored) {}
        super.onDestroy();
    }

    private void show() {
        final Intent i = new Intent(this, MainActivity.class)
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_SINGLE_TOP);
        // (1) direct start -- works most of the time
        try { startActivity(i); } catch (Throwable t) { Log.e(TAG, "[cp] startActivity failed: " + t); }
        // (2) full-screen-intent notification -- the sanctioned way to force an activity to the
        // foreground from a background service (like an incoming-call screen). This is what makes the
        // open RELIABLE: a plain startActivity from the background doesn't always foreground on this unit.
        try {
            android.app.PendingIntent pi = android.app.PendingIntent.getActivity(
                    this, 1, i, android.app.PendingIntent.FLAG_UPDATE_CURRENT);
            Notification n = new Notification.Builder(this, "carplay_launch")
                    .setSmallIcon(android.R.drawable.ic_media_play)
                    .setContentTitle("CarPlay")
                    .setContentText("Tap to open CarPlay")
                    .setContentIntent(pi)
                    .setFullScreenIntent(pi, true)
                    .setAutoCancel(true)
                    .build();
            NotificationManager nm = getSystemService(NotificationManager.class);
            nm.notify(2, n);
            // clear it shortly after so it doesn't linger in the shade
            handler.postDelayed(new Runnable() {
                @Override public void run() {
                    try { getSystemService(NotificationManager.class).cancel(2); } catch (Throwable ignored) {}
                }
            }, 4000);
            Log.e(TAG, "[cp] show(): startActivity + full-screen-intent launch");
        } catch (Throwable t) {
            Log.e(TAG, "[cp] full-screen-intent launch failed: " + t);
        }
    }

    @Override public void onConnectionStateChanged(CarplayDevice device, int state) {
        Log.e(TAG, "[cp] connection state " + state + (state == CONNECTION_STATE_CONNECTED ? " (CONNECTED -> show)" : ""));
        carplayConnected = (state == CONNECTION_STATE_CONNECTED);
        updateGrab();
        setBridgeDial(carplayConnected);   // pause bridge dialing while CarPlay is up (frees BT for A2DP audio)
        if (carplayConnected) { show(); enableCarplayAudio(); scheduleBtReconnect(); }
        else { MainActivity.finishIfShowing(); }   // CarPlay gone -> close the screen
    }

    @Override public void onResourceStateChanged(CarplayResourceState state) {
        Log.e(TAG, "[audio] resource owner: mainScreen=" + state.getMainScreen()
                + " mainAudio=" + safeMainAudio(state) + "  (1=controller/unit, 2=accessory/phone)");
        if (state.getMainScreen() == ENTITY_CONTROLLER) show();
    }

    private static int safeMainAudio(CarplayResourceState s) {
        try { return s.getMainAudio(); } catch (Throwable t) { return -99; }
    }

    @Override public void onRequestAccessoryUI(int url) {
        Log.e(TAG, "[cp] iPhone asked for the car's own UI");
        startActivity(new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_HOME)
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
    }

    @Override public void onAppStateChanged(CarplayAppState state) {}
    // Audio diagnostics (wireless-audio investigation): stream 100=MAIN, 101=ALT, 102=MAIN_HIGH. The
    // vendor's av/a.R() can't look up 102, so if wireless negotiates 102 its start() returns -2 and
    // there's no sound. These logs show which stream + state iOS actually drives over Wi-Fi.
    @Override public void onAudioInfo(int streamId, int audioType, CarplayAudioInfo info) {
        Log.e(TAG, "[audio] onAudioInfo streamId=" + streamId + " audioType=" + audioType
                + (streamId == 102 ? "  <-- MAIN_HIGH (102): vendor can't start this!" : ""));
    }
    @Override public void onCallStateChanged(CarplayCall call) {}
    @Override public void onEnableStateChanged(int prevState, int newState) {}
    @Override public void onStreamStateChanged(int streamId, int audioType, int streamState) {
        Log.e(TAG, "[audio] onStreamStateChanged streamId=" + streamId + " audioType=" + audioType
                + " streamState=" + streamState
                + (streamId == 102 ? "  <-- MAIN_HIGH (102): vendor av/a.R() can't start this!" : ""));
    }

    public static class Boot extends BroadcastReceiver {
        @Override public void onReceive(Context context, Intent intent) {
            context.startForegroundService(new Intent(context, Watcher.class));
        }
    }
}
