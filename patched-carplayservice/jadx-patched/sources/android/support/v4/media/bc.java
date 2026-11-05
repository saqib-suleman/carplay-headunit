package android.support.v4.media;

import android.content.ComponentName;
import android.text.TextUtils;

/* JADX INFO: loaded from: classes.dex */
final class bc implements bb {
    private final String lG;
    private final String lH;
    private final h lI;
    private final ComponentName lJ;
    private final String mPackageName;
    private final int mType;
    private final int mUid;

    bc(int i, int i2, String str, String str2, String str3, h hVar) {
        this.mUid = i;
        this.mType = i2;
        this.mPackageName = str;
        this.lG = str2;
        this.lJ = this.mType == 0 ? null : new ComponentName(str, str2);
        this.lH = str3;
        this.lI = hVar;
    }

    public final boolean equals(Object obj) {
        boolean zEquals;
        if (!(obj instanceof bc)) {
            return false;
        }
        bc bcVar = (bc) obj;
        if (this.mUid == bcVar.mUid && TextUtils.equals(this.mPackageName, bcVar.mPackageName) && TextUtils.equals(this.lG, bcVar.lG) && TextUtils.equals(this.lH, bcVar.lH) && this.mType == bcVar.mType) {
            h hVar = this.lI;
            h hVar2 = bcVar.lI;
            if (hVar == null || hVar2 == null) {
                zEquals = hVar == hVar2;
            } else {
                zEquals = hVar.asBinder().equals(hVar2.asBinder());
            }
            if (zEquals) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return this.mType + (31 * (this.mUid + ((this.mPackageName.hashCode() + ((this.lH.hashCode() + ((this.lG != null ? this.lG.hashCode() : 0) * 31)) * 31)) * 31)));
    }

    public final String toString() {
        return "SessionToken {pkg=" + this.mPackageName + " id=" + this.lH + " type=" + this.mType + " service=" + this.lG + " IMediaSession2=" + this.lI + "}";
    }
}
