package android.arch.lifecycle;

/* JADX INFO: loaded from: classes.dex */
final /* synthetic */ class d {
    static final /* synthetic */ int[] C = new int[Lifecycle.Event.values().length];

    static {
        try {
            C[Lifecycle.Event.ON_CREATE.ordinal()] = 1;
        } catch (NoSuchFieldError e) {
        }
        try {
            C[Lifecycle.Event.ON_START.ordinal()] = 2;
        } catch (NoSuchFieldError e2) {
        }
        try {
            C[Lifecycle.Event.ON_RESUME.ordinal()] = 3;
        } catch (NoSuchFieldError e3) {
        }
        try {
            C[Lifecycle.Event.ON_PAUSE.ordinal()] = 4;
        } catch (NoSuchFieldError e4) {
        }
        try {
            C[Lifecycle.Event.ON_STOP.ordinal()] = 5;
        } catch (NoSuchFieldError e5) {
        }
        try {
            C[Lifecycle.Event.ON_DESTROY.ordinal()] = 6;
        } catch (NoSuchFieldError e6) {
        }
        try {
            C[Lifecycle.Event.ON_ANY.ordinal()] = 7;
        } catch (NoSuchFieldError e7) {
        }
    }
}
