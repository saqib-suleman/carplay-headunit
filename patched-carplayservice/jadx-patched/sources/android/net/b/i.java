package android.net.b;

/* JADX INFO: loaded from: classes.dex */
public final class i {
    public int error;
    public j gf;

    public final String toString() {
        StringBuilder sb = new StringBuilder("StructNlMsgErr{ error{");
        sb.append(this.error);
        sb.append("}, msg{");
        sb.append(this.gf == null ? "" : this.gf.toString());
        sb.append("} }");
        return sb.toString();
    }
}
