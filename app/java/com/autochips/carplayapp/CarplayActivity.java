package com.autochips.carplayapp;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.Point;
import android.os.Bundle;
import android.os.Handler;
import android.os.PowerManager;
import android.util.Log;
import android.view.KeyEvent;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.view.View;
import android.view.WindowManager;
import android.widget.TextView;
import com.autochips.carplay.CarplayCommon;

/**
 * Full-screen host for the iPhone's CarPlay video. Everything the driver sees while connected is
 * rendered by the iPhone; this activity only provides the surface and forwards input.
 */
public final class CarplayActivity extends Activity implements SurfaceHolder.Callback, CarplaySession.Listener {

    private static final int IMMERSIVE_FULL_SCREEN_FLAGS = View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY
            | View.SYSTEM_UI_FLAG_FULLSCREEN
            | View.SYSTEM_UI_FLAG_HIDE_NAVIGATION
            | View.SYSTEM_UI_FLAG_LAYOUT_STABLE
            | View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
            | View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION;

    // The vendor can drop a startVideo request without an error (e.g. while the reversing camera is
    // showing), so keep asking until it reports the screen stream as created. Repeats are ignored
    // by the vendor once video is running.
    private static final long VIDEO_START_RETRY_INTERVAL_MS = 2000;

    private final Handler mainThreadHandler = new Handler();
    private final Runnable retryVideoStartUntilStreaming = new Runnable() {
        @Override
        public void run() {
            requestVideoStartUnlessStreaming();
            mainThreadHandler.postDelayed(this, VIDEO_START_RETRY_INTERVAL_MS);
        }
    };

    private CarplaySession carplaySession;
    private SurfaceHolder videoSurfaceHolder;
    private boolean hasRequestedVideoOnCurrentSurface;
    private View waitingOverlay;
    private TextView waitingMessage;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON
                | WindowManager.LayoutParams.FLAG_FULLSCREEN);
        setContentView(R.layout.activity_carplay);

        waitingOverlay = findViewById(R.id.carplay_waiting_overlay);
        waitingMessage = findViewById(R.id.carplay_waiting_message);
        SurfaceView videoSurfaceView = findViewById(R.id.carplay_video_surface);
        videoSurfaceView.getHolder().addCallback(this);

        findViewById(R.id.carplay_restart_button).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View clickedView) {
                confirmHeadUnitRestart();
            }
        });

        carplaySession = CarplaySession.getOrCreate(this);
        if (carplaySession == null) {
            waitingMessage.setText(R.string.carplay_unavailable);
            return;
        }
        // Listen for the whole activity lifetime so a disconnect while in the background still closes it.
        carplaySession.setListener(this);
        // The vendor sets the CarPlay video resolution to the display's real size when CarPlay enables.
        Point displaySize = new Point();
        getWindowManager().getDefaultDisplay().getRealSize(displaySize);
        videoSurfaceView.setOnTouchListener(
                new CarplayTouchForwarder(carplaySession, displaySize.x, displaySize.y));
    }

    @Override
    protected void onResume() {
        super.onResume();
        enterImmersiveFullScreen();
        if (carplaySession == null) {
            return;
        }
        carplaySession.setCarplayScreenVisible(true);
        showWaitingOverlayUnlessConnected();
        mainThreadHandler.removeCallbacks(retryVideoStartUntilStreaming);
        mainThreadHandler.post(retryVideoStartUntilStreaming);
    }

    @Override
    protected void onPause() {
        mainThreadHandler.removeCallbacks(retryVideoStartUntilStreaming);
        if (carplaySession != null) {
            carplaySession.setCarplayScreenVisible(false);
        }
        super.onPause();
    }

    @Override
    protected void onDestroy() {
        if (carplaySession != null) {
            carplaySession.clearListener(this);
        }
        super.onDestroy();
    }

    @Override
    public void onWindowFocusChanged(boolean hasFocus) {
        super.onWindowFocusChanged(hasFocus);
        if (hasFocus) {
            enterImmersiveFullScreen();
        }
    }

    @Override
    public void onBackPressed() {
        // CarPlay has its own back controls; the car's back key returns to the head unit.
        moveTaskToBack(true);
    }

    @Override
    public void surfaceCreated(SurfaceHolder holder) {
        videoSurfaceHolder = holder;
        hasRequestedVideoOnCurrentSurface = false;
        requestVideoStartUnlessStreaming();
    }

    @Override
    public void surfaceChanged(SurfaceHolder holder, int format, int width, int height) {
        Log.i(CarplaySession.TAG, "Video surface " + width + "x" + height);
    }

    @Override
    public void surfaceDestroyed(SurfaceHolder holder) {
        videoSurfaceHolder = null;
        hasRequestedVideoOnCurrentSurface = false;
        // Always stop, even after a disconnect: the vendor only clears its "video started" flag on
        // stopVideo, and a stale flag makes it ignore startVideo for the next session (black screen).
        if (carplaySession != null) {
            carplaySession.stopVideo();
        }
    }

    @Override
    protected void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        // Brought to front by the session service while already visible.
        if (carplaySession == null) {
            return;
        }
        showWaitingOverlayUnlessConnected();
        requestVideoStartUnlessStreaming();
    }

    @Override
    public void onCarplayConnected() {
        // A reconnect inside one vendor session keeps its "video started" flag set and it would
        // ignore a plain startVideo, so stop first to reset it.
        if (hasRequestedVideoOnCurrentSurface) {
            carplaySession.stopVideo();
            hasRequestedVideoOnCurrentSurface = false;
        }
        showWaitingOverlayUnlessConnected();
        requestVideoStartUnlessStreaming();
    }

    @Override
    public void onIphoneScreenTakeoverEnded() {
        // Siri or a call pulled CarPlay over the car's own UI; hand the screen back to that UI.
        moveTaskToBack(true);
    }

    @Override
    public void onCarplaySessionEnded() {
        finish();
    }

    @Override
    public void onAccessoryScreenRequested() {
        Intent headUnitHomeIntent = new Intent(Intent.ACTION_MAIN)
                .addCategory(Intent.CATEGORY_HOME)
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        startActivity(headUnitHomeIntent);
    }

    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (carplaySession == null || !carplaySession.isConnected()) {
            return super.onKeyDown(keyCode, event);
        }
        if (isSiriKey(keyCode)) {
            if (event.getRepeatCount() == 0) {
                carplaySession.sendSiriButton(true);
            }
            return true;
        }
        int carplayMediaButton = toCarplayMediaButton(keyCode);
        if (carplayMediaButton != CarplayCommon.MEDIA_NONE) {
            if (event.getRepeatCount() == 0) {
                carplaySession.sendMediaButton(carplayMediaButton);
            }
            return true;
        }
        return super.onKeyDown(keyCode, event);
    }

    @Override
    public boolean onKeyUp(int keyCode, KeyEvent event) {
        if (carplaySession == null || !carplaySession.isConnected()) {
            return super.onKeyUp(keyCode, event);
        }
        if (isSiriKey(keyCode)) {
            carplaySession.sendSiriButton(false);
            return true;
        }
        if (toCarplayMediaButton(keyCode) != CarplayCommon.MEDIA_NONE) {
            return true;
        }
        return super.onKeyUp(keyCode, event);
    }

    private void requestVideoStartUnlessStreaming() {
        if (carplaySession == null || videoSurfaceHolder == null || carplaySession.isMainScreenStreaming()) {
            return;
        }
        if (!carplaySession.isConnected()) {
            return;
        }
        carplaySession.startVideo(videoSurfaceHolder.getSurface());
        hasRequestedVideoOnCurrentSurface = true;
    }

    private void showWaitingOverlayUnlessConnected() {
        boolean isConnected = carplaySession.isConnected();
        waitingOverlay.setVisibility(isConnected ? View.GONE : View.VISIBLE);
        if (!isConnected) {
            waitingMessage.setText(R.string.connect_iphone);
        }
    }

    /** A full restart is the only recovery that clears the vendor USB driver's stuck state. */
    private void confirmHeadUnitRestart() {
        new AlertDialog.Builder(this)
                .setTitle(R.string.restart_confirm_title)
                .setMessage(R.string.restart_confirm_message)
                .setNegativeButton(R.string.restart_cancel_action, null)
                .setPositiveButton(R.string.restart_confirm_action, new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        restartHeadUnit();
                    }
                })
                .show();
    }

    private void restartHeadUnit() {
        Log.w(CarplaySession.TAG, "Head unit restart requested from the CarPlay screen");
        try {
            PowerManager powerManager = (PowerManager) getSystemService(POWER_SERVICE);
            powerManager.reboot(null);
        } catch (SecurityException restartNotAllowed) {
            Log.e(CarplaySession.TAG, "Restart not allowed", restartNotAllowed);
            waitingMessage.setText(R.string.restart_failed);
        }
    }

    private void enterImmersiveFullScreen() {
        getWindow().getDecorView().setSystemUiVisibility(IMMERSIVE_FULL_SCREEN_FLAGS);
    }

    private static boolean isSiriKey(int keyCode) {
        switch (keyCode) {
            case KeyEvent.KEYCODE_VOICE_ASSIST:
            case KeyEvent.KEYCODE_ASSIST:
            case KeyEvent.KEYCODE_SEARCH:
                return true;
            default:
                return false;
        }
    }

    private static int toCarplayMediaButton(int keyCode) {
        switch (keyCode) {
            case KeyEvent.KEYCODE_MEDIA_PLAY:
                return CarplayCommon.MEDIA_PLAY;
            case KeyEvent.KEYCODE_MEDIA_PAUSE:
                return CarplayCommon.MEDIA_PAUSE;
            case KeyEvent.KEYCODE_MEDIA_PLAY_PAUSE:
            case KeyEvent.KEYCODE_HEADSETHOOK:
                return CarplayCommon.MEDIA_PALYPAUSE;
            case KeyEvent.KEYCODE_MEDIA_NEXT:
                return CarplayCommon.MEDIA_NEXT_TRACK;
            case KeyEvent.KEYCODE_MEDIA_PREVIOUS:
                return CarplayCommon.MEDIA_PRE_TRACK;
            default:
                return CarplayCommon.MEDIA_NONE;
        }
    }
}
