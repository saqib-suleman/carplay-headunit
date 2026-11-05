package bw.car;
import android.content.Context;
import android.content.ServiceConnection;
// Compile-only stub: real class loads on-device from BwCarProxy.jar.
public final class Car {
    public static final String CAR_INPUT_SERVICE = "car_input";
    public static Car createCar(Context context, ServiceConnection conn) { throw new RuntimeException("stub"); }
    public void connect() { throw new RuntimeException("stub"); }
    public void disconnect() { throw new RuntimeException("stub"); }
    public boolean isConnected() { throw new RuntimeException("stub"); }
    public Object getCarManager(String serviceName) throws CarNotConnectedException { throw new RuntimeException("stub"); }
}
