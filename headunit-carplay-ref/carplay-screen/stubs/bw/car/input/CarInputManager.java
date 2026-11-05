package bw.car.input;
import android.view.KeyEvent;
import bw.car.CarManagerBase;
import bw.car.CarNotConnectedException;
// Compile-only stub.
public final class CarInputManager implements CarManagerBase {
    public static final int PRIORITY_DEFAULT = 0, PRIORITY_LOW = 1, PRIORITY_MIDDLE = 2, PRIORITY_HIGH = 3, PRIORITY_FACTORY = 4;
    public interface CarInputListener { void onKeyEvent(KeyEvent keyEvent); }
    public void registerInputListener(CarInputListener l, int[] handledKeys, int priority) throws CarNotConnectedException { throw new RuntimeException("stub"); }
    public void unregisterInputListener(CarInputListener l) throws CarNotConnectedException { throw new RuntimeException("stub"); }
    public void injectKeyEvent(KeyEvent event) throws CarNotConnectedException { throw new RuntimeException("stub"); }
    public void onCarDisconnected() {}
}
