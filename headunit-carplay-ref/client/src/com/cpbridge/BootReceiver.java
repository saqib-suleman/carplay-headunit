package com.cpbridge;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

/**
 * Starts the Phase B service after boot.
 *
 * The wireless-CarPlay hotspot window is short, so after a reboot the bridge
 * MUST come up on its own and dial immediately (persist.cpbridge.peer_mac
 * survives the reboot and the dialer reads it live).  It restarts only if the
 * "enabled" preference is set: BridgeService.onCreate sets it, and its
 * shutdown() clears it whenever the service stops (STOP or onDestroy).  A
 * power loss or process kill leaves it set.
 */
public final class BootReceiver extends BroadcastReceiver {

    @Override
    public void onReceive(Context context, Intent intent) {
        Cplog.init(context);
        if (intent == null || !Intent.ACTION_BOOT_COMPLETED.equals(intent.getAction())) {
            return;
        }
        boolean enabled = context.getSharedPreferences("cpbridge", Context.MODE_PRIVATE)
                .getBoolean("enabled", false);
        // Do NOT auto-start the bridge here anymore. The root boot daemon (carplay-boot.sh) owns
        // startup and starts the bridge only AFTER the hotspot (ap0) has a valid IP and only in
        // wireless mode with wl_on enabled. Starting here (on a saved pref) would dial before the AP
        // is ready (0x4301 defers to a dead address, #9) and would dial in station mode with the
        // hotspot off (#7). Left as a log so we can see the stale pref if needed.
        Cplog.i(BridgeConfig.TAG_SVC, "BOOT_COMPLETED: bridge enabled-pref=" + enabled
                + " (not auto-starting; the boot daemon starts it after AP readiness)");
    }
}
