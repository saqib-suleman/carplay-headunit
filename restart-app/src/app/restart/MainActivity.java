package app.restart;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.os.PowerManager;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;
import java.io.File;
import java.io.FileOutputStream;

/**
 * Head Unit Helper. The screen is the "Restart Head Unit" button (PowerManager.reboot — the one
 * reboot that works reliably here). It also starts the CallControlService, which maps the steering
 * volume buttons to answer/reject while a call is ringing. Platform-signed for REBOOT + call control.
 */
public class MainActivity extends Activity {

    private static final String[] PHONE_PERMS = {
            android.Manifest.permission.READ_PHONE_STATE,
            android.Manifest.permission.ANSWER_PHONE_CALLS
    };

    @Override
    protected void onCreate(Bundle state) {
        super.onCreate(state);
        setContentView(R.layout.main);
        findViewById(R.id.restart_button).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                confirmRestart();
            }
        });
        wireToggles();
        ensurePhonePermissions();
        startCallControls();
    }

    @Override
    protected void onResume() {
        super.onResume();
        refreshToggleLabels();
    }

    // ---- Wireless CarPlay / Hotspot toggles -----------------------------------------------------
    // Moved here from the CarPlay screen. We can't call su, so we WRITE the desired state to a trigger
    // file in our own external dir; the root boot daemon (carplay-boot.sh) reads it and applies it --
    // CarPlay instantly, hotspot via a guarded reboot.
    private void wireToggles() {
        findViewById(R.id.wl_toggle_button).setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View v) {
                boolean want = "0".equals(getprop("persist.cpbridge.wl_on", "1")); // currently off -> turn on
                setprop("persist.cpbridge.wl_on", want ? "1" : "0");
                boolean ok = writeTrigger("wl_on=" + (want ? "1" : "0"));
                Toast.makeText(MainActivity.this,
                        ok ? ("Wireless CarPlay " + (want ? "ON" : "OFF")) : getString(R.string.save_failed),
                        Toast.LENGTH_SHORT).show();
                refreshToggleLabels();
            }
        });
        findViewById(R.id.hs_toggle_button).setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View v) {
                final boolean want = !"1".equals(getprop("ro.atc.carplay.wireless", "0")); // flip
                new AlertDialog.Builder(MainActivity.this)
                        .setMessage(want ? R.string.hs_on_msg : R.string.hs_off_msg)
                        .setNegativeButton(R.string.cancel, null)
                        .setPositiveButton(R.string.restart_word, new DialogInterface.OnClickListener() {
                            @Override public void onClick(DialogInterface d, int w) {
                                boolean ok = writeTrigger("hotspot=" + (want ? "on" : "off"));
                                Toast.makeText(MainActivity.this,
                                        ok ? "Restarting…" : getString(R.string.save_failed),
                                        Toast.LENGTH_SHORT).show();
                            }
                        })
                        .show();
            }
        });
        refreshToggleLabels();
    }

    private void refreshToggleLabels() {
        try {
            boolean wlOn = !"0".equals(getprop("persist.cpbridge.wl_on", "1"));
            boolean hsOn = "1".equals(getprop("ro.atc.carplay.wireless", "0"));
            ((Button) findViewById(R.id.wl_toggle_button)).setText("Wireless CarPlay:  " + (wlOn ? "ON" : "OFF"));
            ((Button) findViewById(R.id.hs_toggle_button)).setText("Hotspot:  " + (hsOn ? "ON" : "OFF (unit Wi-Fi)"));
        } catch (Throwable ignored) {
        }
    }

    /** Write one "key=value" line to toggle.cmd via a temp file renamed into place (atomic). */
    private boolean writeTrigger(String line) {
        try {
            File dir = getExternalFilesDir(null);
            if (dir == null) return false;
            File tmp = new File(dir, "toggle.cmd.tmp");
            File dst = new File(dir, "toggle.cmd");
            FileOutputStream os = new FileOutputStream(tmp);
            try { os.write((line + "\n").getBytes("UTF-8")); os.getFD().sync(); }
            finally { os.close(); }
            if (tmp.renameTo(dst)) return true;
            tmp.delete();
            return false;
        } catch (Throwable t) {
            return false;
        }
    }

    private static String getprop(String key, String def) {
        try {
            Class<?> sp = Class.forName("android.os.SystemProperties");
            Object v = sp.getMethod("get", String.class, String.class).invoke(null, key, def);
            return v == null ? def : (String) v;
        } catch (Throwable t) { return def; }
    }

    private static void setprop(String key, String val) {
        try {
            Class<?> sp = Class.forName("android.os.SystemProperties");
            sp.getMethod("set", String.class, String.class).invoke(null, key, val);
        } catch (Throwable ignored) { }
    }

    private void ensurePhonePermissions() {
        try {
            boolean need = false;
            for (String p : PHONE_PERMS) {
                if (checkSelfPermission(p) != PackageManager.PERMISSION_GRANTED) need = true;
            }
            if (need) requestPermissions(PHONE_PERMS, 1);
        } catch (Throwable ignored) {
        }
    }

    private void startCallControls() {
        try {
            startForegroundService(new Intent(this, CallControlService.class));
        } catch (Throwable ignored) {
        }
    }

    private void confirmRestart() {
        new AlertDialog.Builder(this)
                .setTitle(R.string.confirm_title)
                .setMessage(R.string.confirm_message)
                .setNegativeButton(R.string.cancel, null)
                .setPositiveButton(R.string.restart, new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        doRestart();
                    }
                })
                .show();
    }

    private void doRestart() {
        try {
            PowerManager pm = (PowerManager) getSystemService(Context.POWER_SERVICE);
            pm.reboot(null);
        } catch (SecurityException notAllowed) {
            Toast.makeText(this, R.string.no_permission, Toast.LENGTH_LONG).show();
        } catch (Throwable failed) {
            Toast.makeText(this, "Restart failed: " + failed.getMessage(), Toast.LENGTH_LONG).show();
        }
    }
}
