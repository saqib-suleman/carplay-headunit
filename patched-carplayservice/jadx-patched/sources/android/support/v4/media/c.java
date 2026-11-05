package android.support.v4.media;

import android.media.AudioAttributes;

/* JADX INFO: loaded from: classes.dex */
final class c {
    private AudioAttributes ki;

    private c(AudioAttributes audioAttributes) {
        this.ki = audioAttributes;
    }

    public static c a(AudioAttributes audioAttributes) {
        if (audioAttributes != null) {
            return new c(audioAttributes);
        }
        throw new IllegalArgumentException("AudioAttributesApi21.Wrapper cannot wrap null");
    }

    public final AudioAttributes bL() {
        return this.ki;
    }
}
