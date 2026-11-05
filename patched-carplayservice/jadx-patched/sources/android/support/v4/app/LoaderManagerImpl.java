package android.support.v4.app;

import java.io.PrintWriter;

/* JADX INFO: loaded from: classes.dex */
final class LoaderManagerImpl extends bf {
    static boolean DEBUG = false;
    private final android.arch.lifecycle.g jR;
    private final LoaderViewModel jS;

    class LoaderViewModel extends android.arch.lifecycle.u {
        private static final android.arch.lifecycle.w jX = new bj();
        private android.support.v4.c.t jY = new android.support.v4.c.t();
        private boolean mCreatingLoader = false;

        LoaderViewModel() {
        }

        static LoaderViewModel a(android.arch.lifecycle.x xVar) {
            return (LoaderViewModel) new android.arch.lifecycle.v(xVar, jX).g(LoaderViewModel.class);
        }

        public final void a(String str, PrintWriter printWriter) {
            if (this.jY.size() > 0) {
                printWriter.print(str);
                printWriter.println("Loaders:");
                String str2 = str + "    ";
                for (int i = 0; i < this.jY.size(); i++) {
                    bh bhVar = (bh) this.jY.valueAt(i);
                    printWriter.print(str);
                    printWriter.print("  #");
                    printWriter.print(this.jY.keyAt(i));
                    printWriter.print(": ");
                    printWriter.println(bhVar.toString());
                    bhVar.a(str2, printWriter);
                }
            }
        }

        final void bI() {
            int size = this.jY.size();
            for (int i = 0; i < size; i++) {
                ((bh) this.jY.valueAt(i)).bI();
            }
        }

        @Override // android.arch.lifecycle.u
        protected final void p() {
            super.p();
            int size = this.jY.size();
            for (int i = 0; i < size; i++) {
                ((bh) this.jY.valueAt(i)).bJ();
            }
            this.jY.clear();
        }
    }

    LoaderManagerImpl(android.arch.lifecycle.g gVar, android.arch.lifecycle.x xVar) {
        this.jR = gVar;
        this.jS = LoaderViewModel.a(xVar);
    }

    @Override // android.support.v4.app.bf
    @Deprecated
    public final void a(String str, PrintWriter printWriter) {
        this.jS.a(str, printWriter);
    }

    @Override // android.support.v4.app.bf
    public final void bI() {
        this.jS.bI();
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder(128);
        sb.append("LoaderManager{");
        sb.append(Integer.toHexString(System.identityHashCode(this)));
        sb.append(" in ");
        android.support.v4.c.f.buildShortClassTag(this.jR, sb);
        sb.append("}}");
        return sb.toString();
    }
}
