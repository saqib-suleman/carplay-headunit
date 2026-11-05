package android.support.v4.media;

import android.os.Bundle;
import android.os.Parcelable;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
final class aw {
    static final n lz = new n("android.media.MediaLibraryService2");

    static List a(Parcelable[] parcelableArr) {
        ap apVarJ;
        ArrayList arrayList = new ArrayList();
        if (parcelableArr != null) {
            for (int i = 0; i < parcelableArr.length; i++) {
                if ((parcelableArr[i] instanceof Bundle) && (apVarJ = ap.j((Bundle) parcelableArr[i])) != null) {
                    arrayList.add(apVarJ);
                }
            }
        }
        return arrayList;
    }

    static List b(Parcelable[] parcelableArr) {
        if (parcelableArr == null) {
            return null;
        }
        ArrayList arrayList = new ArrayList();
        for (Parcelable parcelable : parcelableArr) {
            arrayList.add((Bundle) parcelable);
        }
        return arrayList;
    }

    static List c(Parcelable[] parcelableArr) {
        at atVarL;
        ArrayList arrayList = new ArrayList();
        for (int i = 0; i < parcelableArr.length; i++) {
            if ((parcelableArr[i] instanceof Bundle) && (atVarL = at.l((Bundle) parcelableArr[i])) != null) {
                arrayList.add(atVarL);
            }
        }
        return arrayList;
    }
}
