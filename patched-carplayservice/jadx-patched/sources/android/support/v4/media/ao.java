package android.support.v4.media;

import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Bundle;

/* JADX INFO: loaded from: classes.dex */
public final class ao {
    private String li;
    private CharSequence lj;
    private Uri lk;
    private Uri ll;
    private CharSequence mDescription;
    private Bundle mExtras;
    private Bitmap mIcon;
    private CharSequence mTitle;

    public final ao a(Bitmap bitmap) {
        this.mIcon = bitmap;
        return this;
    }

    public final ao a(Uri uri) {
        this.lk = uri;
        return this;
    }

    public final ao a(CharSequence charSequence) {
        this.mTitle = charSequence;
        return this;
    }

    public final ao b(Uri uri) {
        this.ll = uri;
        return this;
    }

    public final ao b(CharSequence charSequence) {
        this.lj = charSequence;
        return this;
    }

    public final MediaDescriptionCompat bN() {
        return new MediaDescriptionCompat(this.li, this.mTitle, this.lj, this.mDescription, this.mIcon, this.lk, this.mExtras, this.ll);
    }

    public final ao c(CharSequence charSequence) {
        this.mDescription = charSequence;
        return this;
    }

    public final ao i(Bundle bundle) {
        this.mExtras = bundle;
        return this;
    }

    public final ao t(String str) {
        this.li = str;
        return this;
    }
}
