package app.restart;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.Service;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothProfile;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.IBinder;
import android.telecom.TelecomManager;
import android.telephony.PhoneStateListener;
import android.telephony.TelephonyManager;
import android.util.Log;
import android.view.KeyEvent;

import java.lang.reflect.Method;
import java.util.List;

import bw.car.Car;
import bw.car.input.CarInputManager;

/**
 * Steering-wheel call controls, grabbed through the vendor Car input API (which consumes a key before
 * it becomes a normal action). Keys are grabbed ONLY during a call, and the set depends on the state:
 *
 *   RINGING  -> Volume Up = answer, Volume Down = reject.
 *   OFFHOOK  -> SOURCE button = move call audio between the phone and the head unit (toggles the
 *               Bluetooth HFP SCO audio, i.e. what the unit's own in-call "switch" button does).
 *
 * Volume is untouched outside a ring, and SOURCE is untouched outside an active call (so the CarPlay
 * screen app can use SOURCE for play/pause + Siri when it is foreground). SOURCE is a vendor "car key"
 * whose exact code is unconfirmed, so we register the plausible CarKeyEvent candidates and log which
 * fires. Diagnostics log at ERROR level (this ROM drops Info/Warn).
 */
public class CallControlService extends Service {
    private static final String TAG = "CallVol";
    private static final int VOL_UP_VENDOR = 1202;
    private static final int VOL_DOWN_VENDOR = 1203;
    private static final int[] RING_KEYS = {
            VOL_UP_VENDOR, VOL_DOWN_VENDOR,
            KeyEvent.KEYCODE_VOLUME_UP, KeyEvent.KEYCODE_VOLUME_DOWN
    };
    // Candidate vendor car-key codes for the SOURCE/MODE button (bw.car.input.CarKeyEvent). Logged so
    // we can narrow to the real one after the first in-call SOURCE press.
    private static final int[] SOURCE_KEYS = {
            1043, 1035, 1046, 1006, 1100, 1101, 1102, 1103, 1104, 1105
    };

    private static final int HEADSET_CLIENT = 16;        // BluetoothProfile.HEADSET_CLIENT (hidden)
    private static final int AUDIO_STATE_CONNECTED = 2;  // BluetoothHeadsetClient.STATE_AUDIO_CONNECTED

    private TelecomManager telecom;
    private TelephonyManager telephony;
    private Car car;
    private CarInputManager carInput;
    private int[] registeredSet;                 // which key set is currently grabbed (null = none)
    private BluetoothProfile hfClient;           // actually a BluetoothHeadsetClient (reflection)

    private final CarInputManager.CarInputListener keyListener = new CarInputManager.CarInputListener() {
        @Override
        public void onKeyEvent(KeyEvent event) {
            if (event == null) return;
            int keyCode = event.getKeyCode();
            Log.e(TAG, "[ev] action=" + event.getAction() + " keyCode=" + keyCode
                    + " repeat=" + event.getRepeatCount());
            if (event.getAction() != KeyEvent.ACTION_DOWN) return;
            int state = (telephony != null) ? telephony.getCallState() : -1;
            try {
                if (state == TelephonyManager.CALL_STATE_RINGING) {
                    if (keyCode == VOL_UP_VENDOR || keyCode == KeyEvent.KEYCODE_VOLUME_UP) {
                        telecom.acceptRingingCall();
                        Log.e(TAG, "[ok] answered call (volume up)");
                    } else if (keyCode == VOL_DOWN_VENDOR || keyCode == KeyEvent.KEYCODE_VOLUME_DOWN) {
                        telecom.endCall();
                        Log.e(TAG, "[ok] rejected call (volume down)");
                    }
                } else if (state == TelephonyManager.CALL_STATE_OFFHOOK && isSourceKey(keyCode)) {
                    toggleCallAudio();
                }
            } catch (Throwable t) {
                Log.e(TAG, "call action failed", t);
            }
        }
    };

    private boolean isSourceKey(int code) {
        for (int k : SOURCE_KEYS) if (k == code) return true;
        return false;
    }

    private final PhoneStateListener phoneListener = new PhoneStateListener() {
        @Override
        public void onCallStateChanged(int state, String number) {
            Log.e(TAG, "[ok] call state changed: " + state + " (1=ringing,2=offhook,0=idle)");
            if (state == TelephonyManager.CALL_STATE_RINGING) {
                registerKeys(RING_KEYS);
            } else if (state == TelephonyManager.CALL_STATE_OFFHOOK) {
                registerKeys(SOURCE_KEYS);   // answered call: SOURCE moves the audio
            } else {
                unregisterKeys();            // IDLE -> release everything, volume/SOURCE back to normal
            }
        }
    };

    private final ServiceConnection carConn = new ServiceConnection() {
        @Override
        public void onServiceConnected(ComponentName name, IBinder binder) {
            try {
                carInput = (CarInputManager) car.getCarManager(Car.CAR_INPUT_SERVICE);
                Log.e(TAG, "[ok] car input service connected, carInput=" + (carInput != null));
            } catch (Throwable t) {
                Log.e(TAG, "getCarManager failed", t);
            }
        }
        @Override
        public void onServiceDisconnected(ComponentName name) {
            carInput = null;
            registeredSet = null;
        }
    };

    private final BluetoothProfile.ServiceListener btListener = new BluetoothProfile.ServiceListener() {
        @Override
        public void onServiceConnected(int profile, BluetoothProfile proxy) {
            if (profile == HEADSET_CLIENT) {
                hfClient = proxy;
                Log.e(TAG, "[ok] HFP client proxy connected (call-audio transfer ready)");
            }
        }
        @Override
        public void onServiceDisconnected(int profile) {
            if (profile == HEADSET_CLIENT) hfClient = null;
        }
    };

    @Override
    public void onCreate() {
        super.onCreate();
        startForeground(1, buildNotification());
        telecom = (TelecomManager) getSystemService(Context.TELECOM_SERVICE);
        telephony = (TelephonyManager) getSystemService(Context.TELEPHONY_SERVICE);
        try {
            telephony.listen(phoneListener, PhoneStateListener.LISTEN_CALL_STATE);
        } catch (Throwable t) {
            Log.e(TAG, "phone listen failed (READ_PHONE_STATE?)", t);
        }
        try {
            car = Car.createCar(this, carConn);
            car.connect();
            Log.e(TAG, "[ok] onCreate done, car.connect() issued");
        } catch (Throwable t) {
            Log.e(TAG, "car connect failed", t);
        }
        try {
            BluetoothAdapter adapter = BluetoothAdapter.getDefaultAdapter();
            if (adapter != null) adapter.getProfileProxy(this, btListener, HEADSET_CLIENT);
        } catch (Throwable t) {
            Log.e(TAG, "HFP client proxy request failed", t);
        }
    }

    /** Move call audio between the phone and the head unit (toggle HFP SCO), like the unit's own switch. */
    private void toggleCallAudio() {
        if (hfClient == null) { Log.e(TAG, "SOURCE in call: no HFP client proxy yet"); return; }
        try {
            List<BluetoothDevice> devs = hfClient.getConnectedDevices();
            if (devs == null || devs.isEmpty()) { Log.e(TAG, "SOURCE in call: no connected HFP device"); return; }
            BluetoothDevice dev = devs.get(0);
            Class<?> c = hfClient.getClass();
            int audioState = AUDIO_STATE_CONNECTED + 1; // unknown
            try {
                Method get = c.getMethod("getAudioState", BluetoothDevice.class);
                Object r = get.invoke(hfClient, dev);
                if (r instanceof Integer) audioState = (Integer) r;
            } catch (Throwable ignored) {}
            if (audioState == AUDIO_STATE_CONNECTED) {
                invokeAudio(c, "disconnectAudio", dev);
                Log.e(TAG, "[ok] SOURCE in call -> audio to PHONE (disconnectAudio)");
            } else {
                invokeAudio(c, "connectAudio", dev);
                Log.e(TAG, "[ok] SOURCE in call -> audio to HEAD UNIT (connectAudio)");
            }
        } catch (Throwable t) {
            Log.e(TAG, "toggleCallAudio failed", t);
        }
    }

    /** Call connectAudio/disconnectAudio, which take (BluetoothDevice) on some builds and () on others. */
    private void invokeAudio(Class<?> c, String method, BluetoothDevice dev) throws Exception {
        try {
            Method m = c.getMethod(method, BluetoothDevice.class);
            m.invoke(hfClient, dev);
        } catch (NoSuchMethodException noArgDevice) {
            Method m = c.getMethod(method);
            m.invoke(hfClient);
        }
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        return START_STICKY;
    }

    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }

    private void registerKeys(int[] keys) {
        if (carInput == null) return;
        if (registeredSet == keys) return;        // already on this set
        unregisterKeys();
        try {
            carInput.registerInputListener(keyListener, keys, CarInputManager.PRIORITY_HIGH);
            registeredSet = keys;
            Log.e(TAG, "[ok] keys grabbed: " + (keys == RING_KEYS ? "RING (answer/reject)" : "SOURCE (call-audio)"));
        } catch (Throwable t) {
            Log.e(TAG, "registerInputListener failed", t);
        }
    }

    private void unregisterKeys() {
        if (carInput == null || registeredSet == null) return;
        try {
            carInput.unregisterInputListener(keyListener);
        } catch (Throwable ignored) {
        }
        registeredSet = null;
    }

    @Override
    public void onDestroy() {
        unregisterKeys();
        try {
            if (telephony != null) telephony.listen(phoneListener, PhoneStateListener.LISTEN_NONE);
        } catch (Throwable ignored) {
        }
        try {
            if (hfClient != null) {
                BluetoothAdapter a = BluetoothAdapter.getDefaultAdapter();
                if (a != null) a.closeProfileProxy(HEADSET_CLIENT, hfClient);
            }
        } catch (Throwable ignored) {
        }
        try {
            if (car != null) car.disconnect();
        } catch (Throwable ignored) {
        }
        super.onDestroy();
    }

    private Notification buildNotification() {
        NotificationManager nm = (NotificationManager) getSystemService(NOTIFICATION_SERVICE);
        nm.createNotificationChannel(new NotificationChannel(
                "callvol", "Call Controls", NotificationManager.IMPORTANCE_MIN));
        return new Notification.Builder(this, "callvol")
                .setSmallIcon(R.drawable.ic_restart)
                .setContentTitle("Call controls active")
                .setContentText("Ring: Vol +/- answer/reject. In call: SOURCE moves audio phone/unit")
                .setOngoing(true)
                .build();
    }
}
