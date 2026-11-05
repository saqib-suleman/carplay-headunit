package android.support.v4.media;

import android.os.Bundle;
import android.os.Parcelable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

/* JADX INFO: loaded from: classes.dex */
public final class az {
    private Set lE = new HashSet();

    public static az o(Bundle bundle) {
        ArrayList parcelableArrayList;
        ay ayVarN;
        if (bundle == null || (parcelableArrayList = bundle.getParcelableArrayList("android.media.mediasession2.commandgroup.commands")) == null) {
            return null;
        }
        az azVar = new az();
        for (int i = 0; i < parcelableArrayList.size(); i++) {
            Parcelable parcelable = (Parcelable) parcelableArrayList.get(i);
            if ((parcelable instanceof Bundle) && (ayVarN = ay.n((Bundle) parcelable)) != null) {
                if (ayVarN == null) {
                    throw new IllegalArgumentException("command shouldn't be null");
                }
                azVar.lE.add(ayVarN);
            }
        }
        return azVar;
    }
}
