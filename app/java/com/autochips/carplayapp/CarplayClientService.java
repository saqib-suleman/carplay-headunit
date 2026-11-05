package com.autochips.carplayapp;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.Service;
import android.content.Intent;
import android.os.Handler;
import android.os.IBinder;
import android.util.Log;

/**
 * Started by the head unit's CarplayService (via startForegroundService) once an iPhone has
 * connected. Its lifetime is the CarPlay session: it registers for CarPlay events, puts the CarPlay
 * screen in front, and stops when the session ends.
 */
public final class CarplayClientService extends Service {

    private static final String NOTIFICATION_CHANNEL_ID = "carplay_session";
    private static final int NOTIFICATION_ID = 1;

    // A disconnect that happens before our callback registration lands is never delivered to us,
    // so poll the connection after start until it is confirmed one way or the other.
    private static final long CONNECTION_CHECK_INTERVAL_MS = 3000;
    // The vendor's isEnabled()/getConnectionState() report "not connected" on a binder error, so
    // one such answer is not enough to tear down a live session.
    private static final int DISCONNECTED_CHECKS_BEFORE_ENDING_SESSION = 2;
    private static final int MAX_CONNECTION_CHECKS = 20;

    private final Handler mainThreadHandler = new Handler();
    private CarplaySession carplaySession;
    private int connectionChecksDone;
    private int consecutiveDisconnectedChecks;

    private final Runnable confirmIphoneStillConnected = new Runnable() {
        @Override
        public void run() {
            if (carplaySession == null) {
                return;
            }
            connectionChecksDone++;
            CarplayConnectionStatus connectionStatus = carplaySession.readConnectionStatus();
            switch (connectionStatus) {
                case CONNECTED:
                    // From here on, disconnects arrive through the registered callbacks.
                    return;
                case DISCONNECTED:
                    consecutiveDisconnectedChecks++;
                    if (consecutiveDisconnectedChecks >= DISCONNECTED_CHECKS_BEFORE_ENDING_SESSION) {
                        Log.i(CarplaySession.TAG, "No iPhone connected after start, ending session");
                        carplaySession.endSession();
                        return;
                    }
                    break;
                case UNKNOWN:
                    consecutiveDisconnectedChecks = 0;
                    break;
                default:
                    throw new IllegalStateException("Unhandled connection status: " + connectionStatus);
            }
            if (connectionChecksDone >= MAX_CONNECTION_CHECKS) {
                Log.w(CarplaySession.TAG, "CarPlay connection never confirmed, ending session");
                carplaySession.endSession();
                return;
            }
            mainThreadHandler.postDelayed(this, CONNECTION_CHECK_INTERVAL_MS);
        }
    };

    @Override
    public void onCreate() {
        super.onCreate();
        startForeground(NOTIFICATION_ID, buildSessionNotification());
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        Log.i(CarplaySession.TAG, "CarplayClientService started: " + intent);
        carplaySession = CarplaySession.getOrCreate(this);
        if (carplaySession == null) {
            stopSelf();
            return START_NOT_STICKY;
        }
        carplaySession.startNewEventsRegistration();
        carplaySession.bringCarplayScreenToFront();
        startConnectionChecks();
        return START_NOT_STICKY;
    }

    @Override
    public void onDestroy() {
        mainThreadHandler.removeCallbacks(confirmIphoneStillConnected);
        if (carplaySession != null) {
            carplaySession.stopListeningToCarplay();
        }
        super.onDestroy();
    }

    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }

    private void startConnectionChecks() {
        connectionChecksDone = 0;
        consecutiveDisconnectedChecks = 0;
        mainThreadHandler.removeCallbacks(confirmIphoneStillConnected);
        mainThreadHandler.postDelayed(confirmIphoneStillConnected, CONNECTION_CHECK_INTERVAL_MS);
    }

    private Notification buildSessionNotification() {
        NotificationManager notificationManager = getSystemService(NotificationManager.class);
        NotificationChannel sessionChannel = new NotificationChannel(
                NOTIFICATION_CHANNEL_ID,
                getString(R.string.notification_channel_name),
                NotificationManager.IMPORTANCE_MIN);
        notificationManager.createNotificationChannel(sessionChannel);
        return new Notification.Builder(this, NOTIFICATION_CHANNEL_ID)
                .setSmallIcon(R.drawable.ic_carplay_glyph)
                .setContentTitle(getString(R.string.app_name))
                .setContentText(getString(R.string.notification_text))
                .setOngoing(true)
                .build();
    }
}
