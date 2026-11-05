package android.arch.lifecycle;

/* JADX INFO: loaded from: classes.dex */
public abstract class Lifecycle {

    public enum Event {
        ON_CREATE,
        ON_START,
        ON_RESUME,
        ON_PAUSE,
        ON_STOP,
        ON_DESTROY,
        ON_ANY
    }

    public enum State {
        DESTROYED,
        INITIALIZED,
        CREATED,
        STARTED,
        RESUMED;

        public final boolean a(State state) {
            return compareTo(state) >= 0;
        }
    }

    public abstract void a(f fVar);

    public abstract void b(f fVar);

    public abstract State f();
}
