package android.arch.lifecycle;

/* JADX INFO: loaded from: classes.dex */
final class m implements Runnable {
    final /* synthetic */ LiveData ac;

    m(LiveData liveData) {
        this.ac = liveData;
    }

    @Override // java.lang.Runnable
    public final void run() {
        Object obj;
        synchronized (this.ac.U) {
            obj = this.ac.Y;
            this.ac.Y = LiveData.V;
        }
        this.ac.setValue(obj);
    }
}
