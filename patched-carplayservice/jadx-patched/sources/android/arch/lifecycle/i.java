package android.arch.lifecycle;

/* JADX INFO: loaded from: classes.dex */
final /* synthetic */ class i {
    static final /* synthetic */ int[] C;
    static final /* synthetic */ int[] Q = new int[Lifecycle.State.values().length];

    static {
        try {
            Q[Lifecycle.State.INITIALIZED.ordinal()] = 1;
        } catch (NoSuchFieldError e) {
        }
        try {
            Q[Lifecycle.State.CREATED.ordinal()] = 2;
        } catch (NoSuchFieldError e2) {
        }
        try {
            Q[Lifecycle.State.STARTED.ordinal()] = 3;
        } catch (NoSuchFieldError e3) {
        }
        try {
            Q[Lifecycle.State.RESUMED.ordinal()] = 4;
        } catch (NoSuchFieldError e4) {
        }
        try {
            Q[Lifecycle.State.DESTROYED.ordinal()] = 5;
        } catch (NoSuchFieldError e5) {
        }
        C = new int[Lifecycle.Event.values().length];
        try {
            C[Lifecycle.Event.ON_CREATE.ordinal()] = 1;
        } catch (NoSuchFieldError e6) {
        }
        try {
            C[Lifecycle.Event.ON_STOP.ordinal()] = 2;
        } catch (NoSuchFieldError e7) {
        }
        try {
            C[Lifecycle.Event.ON_START.ordinal()] = 3;
        } catch (NoSuchFieldError e8) {
        }
        try {
            C[Lifecycle.Event.ON_PAUSE.ordinal()] = 4;
        } catch (NoSuchFieldError e9) {
        }
        try {
            C[Lifecycle.Event.ON_RESUME.ordinal()] = 5;
        } catch (NoSuchFieldError e10) {
        }
        try {
            C[Lifecycle.Event.ON_DESTROY.ordinal()] = 6;
        } catch (NoSuchFieldError e11) {
        }
        try {
            C[Lifecycle.Event.ON_ANY.ordinal()] = 7;
        } catch (NoSuchFieldError e12) {
        }
    }
}
