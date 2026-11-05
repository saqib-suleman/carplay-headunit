package app.carplayscreen;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Intent;
import android.os.Bundle;
import android.content.DialogInterface;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.view.View;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.Toast;
import com.autochips.carplay.CarplayManager;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

/**
 * Full-screen surface the unit's CarPlay service renders the iPhone's video into. A
 * "Connect to CarPlay" screen (res/layout/connect_screen.xml) sits on top and is shown whenever no
 * iPhone is attached, so the app never shows a blank surface or a bare toast.
 *
 * Steering-button handling (SOURCE + media keys) lives in the always-running Watcher service, not
 * here, so it works even when this screen isn't foreground.
 */
public class MainActivity extends Activity implements SurfaceHolder.Callback, View.OnTouchListener {
    private static final int URL_ID_EMPTY = 1; // CarplayCommon.URL_ID_EMPTY: bring up CarPlay's last screen

    private CarplayManager cp;
    private SurfaceView video;
    private View connectScreen;
    private static java.lang.ref.WeakReference<MainActivity> sInstance;

    @Override
    protected void onCreate(Bundle state) {
        super.onCreate(state);
        sInstance = new java.lang.ref.WeakReference<>(this);
        startForegroundService(new Intent(this, Watcher.class));
        cp = CarplayManager.getDefaultManager();

        FrameLayout root = new FrameLayout(this);
        video = new SurfaceView(this);
        video.getHolder().addCallback(this);
        video.setOnTouchListener(this);
        root.addView(video, new FrameLayout.LayoutParams(
                FrameLayout.LayoutParams.MATCH_PARENT, FrameLayout.LayoutParams.MATCH_PARENT));
        connectScreen = getLayoutInflater().inflate(R.layout.connect_screen, root, false);
        root.addView(connectScreen);
        setContentView(root);
    }

    @Override
    protected void onResume() {
        super.onResume();
        sInstance = new java.lang.ref.WeakReference<>(this);
        getWindow().getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_FULLSCREEN
                | View.SYSTEM_UI_FLAG_HIDE_NAVIGATION | View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY);
        List<?> devices = cp == null ? null : cp.getConnectedDevices();
        boolean connected = devices != null && !devices.isEmpty();
        connectScreen.setVisibility(connected ? View.GONE : View.VISIBLE);
        if (connected) {
            cp.requestDeviceUI(URL_ID_EMPTY, ""); // ask the iPhone to take the screen
        }
    }

    @Override
    protected void onDestroy() {
        if (sInstance != null && sInstance.get() == this) sInstance = null;
        super.onDestroy();
    }

    /** Called by the Watcher when CarPlay disconnects so the (now dead) CarPlay screen goes away and the
     *  unit returns to whatever was behind it. Finishing works whether we're foreground or backgrounded. */
    static void finishIfShowing() {
        final MainActivity a = sInstance != null ? sInstance.get() : null;
        if (a == null) return;
        try { a.runOnUiThread(new Runnable() { @Override public void run() { a.finish(); } }); }
        catch (Throwable ignored) {}
    }

    // ------------------------------------------------------------------
    // On-unit toggles (no laptop in normal use). We can't call su from an app, so we read current state
    // from system properties and WRITE the desired state to a trigger file in our own external dir; the
    // root boot daemon (carplay-boot.sh) applies it -- CarPlay instantly, hotspot via a guarded reboot.
    // ------------------------------------------------------------------
    private void addGearButton(FrameLayout root) {
        Button gear = new Button(this);
        gear.setText("⚙");   // gear icon
        gear.setTextSize(22);
        gear.setAlpha(0.6f);
        gear.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View v) { showSettings(); }
        });
        float d = getResources().getDisplayMetrics().density;
        int sz = (int) (64 * d);
        FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(sz, sz);
        lp.gravity = Gravity.TOP | Gravity.END;
        int m = (int) (6 * d);
        lp.setMargins(0, m, m, 0);
        root.addView(gear, lp);
    }

    /** Settings dialog with the on-unit toggles. A real dialog is clearly visible (the dark Switch on the
     *  black screen wasn't) and works even while CarPlay is connected, drawn over the video surface. */
    private void showSettings() {
        final boolean wlOn = !"0".equals(getprop("persist.cpbridge.wl_on", "1"));   // empty/1 = on
        final boolean hsOn = "1".equals(getprop("ro.atc.carplay.wireless", "0"));
        String[] items = new String[] {
            "Wireless CarPlay:  " + (wlOn ? "ON  —  tap to turn OFF" : "OFF  —  tap to turn ON"),
            "Hotspot:  " + (hsOn ? "ON  —  tap for OFF (use unit Wi-Fi, restarts)"
                                 : "OFF  —  tap for ON (restarts)")
        };
        new AlertDialog.Builder(this)
                .setTitle("CarPlay settings")
                .setItems(items, new DialogInterface.OnClickListener() {
                    @Override public void onClick(DialogInterface d, int which) {
                        if (which == 0) {
                            boolean want = !wlOn;
                            setprop("persist.cpbridge.wl_on", want ? "1" : "0");
                            boolean ok = writeTrigger("wl_on=" + (want ? "1" : "0"));
                            toast(ok ? ("Wireless CarPlay " + (want ? "ON" : "OFF"))
                                     : "Couldn't save — try again");
                        } else {
                            confirmHotspot(!hsOn);
                        }
                    }
                })
                .setNegativeButton("Close", null)
                .show();
    }

    private void confirmHotspot(final boolean want) {
        new AlertDialog.Builder(this)
                .setTitle("Hotspot")
                .setMessage(want ? "Turn the hotspot ON for wireless CarPlay? The unit will restart."
                                 : "Turn the hotspot OFF so the unit can use Wi-Fi? The unit will restart.")
                .setPositiveButton("Restart", new DialogInterface.OnClickListener() {
                    @Override public void onClick(DialogInterface d, int w) {
                        toast(writeTrigger("hotspot=" + (want ? "on" : "off"))
                                ? "Restarting…" : "Couldn't save — try again");
                    }
                })
                .setNegativeButton("Cancel", null)
                .show();
    }

    private void toast(String s) {
        try { Toast.makeText(this, s, Toast.LENGTH_SHORT).show(); } catch (Throwable ignored) {}
    }

    /**
     * Write ONLY the control the user just changed (#8), one "key=value" line, via a temp file renamed
     * into place (atomic). Writing only the changed key means a Wireless-CarPlay toggle never emits a
     * hotspot= line -- so a failed state read can't make the daemon reboot without the confirm dialog.
     * The daemon acts only on keys present in the file.
     */
    private boolean writeTrigger(String line) {
        try {
            File dir = getExternalFilesDir(null);
            if (dir == null) {
                return false;
            }
            File tmp = new File(dir, "toggle.cmd.tmp");
            File dst = new File(dir, "toggle.cmd");
            FileOutputStream os = new FileOutputStream(tmp);
            try {
                os.write((line + "\n").getBytes("UTF-8"));
                os.getFD().sync();
            } finally {
                os.close();
            }
            if (tmp.renameTo(dst)) {
                return true;
            }
            // Do NOT fall back to a direct write: that truncates toggle.cmd and the daemon could read a
            // partial request (#5). Report failure so the caller surfaces it and the switch reverts.
            tmp.delete();
            return false;
        } catch (Throwable t) {
            return false;   // caller surfaces the failure instead of a false success note
        }
    }

    private static String getprop(String key, String def) {
        try {
            Class<?> sp = Class.forName("android.os.SystemProperties");
            Object v = sp.getMethod("get", String.class, String.class).invoke(null, key, def);
            return v == null ? def : (String) v;
        } catch (Throwable t) {
            return def;
        }
    }

    private static void setprop(String key, String val) {
        try {
            Class<?> sp = Class.forName("android.os.SystemProperties");
            sp.getMethod("set", String.class, String.class).invoke(null, key, val);
        } catch (Throwable ignored) {
            // many builds block app setprop; the trigger file is the reliable path, this is just a shortcut
        }
    }

    @Override
    public void surfaceCreated(SurfaceHolder holder) {
        if (cp != null) cp.startVideo(holder.getSurface());
    }

    @Override
    public void surfaceChanged(SurfaceHolder holder, int format, int width, int height) {}

    @Override
    public void surfaceDestroyed(SurfaceHolder holder) {
        if (cp != null) cp.stopVideo(true); // true = user left CarPlay, screen goes back to the unit
    }

    // single finger only; the service API takes one point
    @Override
    public boolean onTouch(View v, MotionEvent e) {
        int action = e.getActionMasked();
        if (cp == null || action == MotionEvent.ACTION_POINTER_DOWN || action == MotionEvent.ACTION_POINTER_UP) return true;
        boolean pressed = action != MotionEvent.ACTION_UP && action != MotionEvent.ACTION_CANCEL;
        cp.updateTouchScreen(pressed, (int) e.getX(), (int) e.getY());
        return true;
    }
}
