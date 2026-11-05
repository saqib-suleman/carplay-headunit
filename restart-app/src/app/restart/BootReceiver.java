package app.restart;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

/** Starts the call-control service after boot so volume accept/reject is always armed. */
public class BootReceiver extends BroadcastReceiver {
    @Override
    public void onReceive(Context context, Intent intent) {
        try {
            context.startForegroundService(new Intent(context, CallControlService.class));
        } catch (Throwable ignored) {
        }
    }
}
