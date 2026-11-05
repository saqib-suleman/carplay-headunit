package android.support.v4.media;

import android.os.Bundle;

/* JADX INFO: loaded from: classes.dex */
public final class aq {
    static final android.support.v4.c.a lq;
    private static final String[] lr;
    private static final String[] ls;
    private static final String[] lt;
    final Bundle lu;

    static {
        android.support.v4.c.a aVar = new android.support.v4.c.a();
        lq = aVar;
        aVar.put("android.media.metadata.TITLE", 1);
        lq.put("android.media.metadata.ARTIST", 1);
        lq.put("android.media.metadata.DURATION", 0);
        lq.put("android.media.metadata.ALBUM", 1);
        lq.put("android.media.metadata.AUTHOR", 1);
        lq.put("android.media.metadata.WRITER", 1);
        lq.put("android.media.metadata.COMPOSER", 1);
        lq.put("android.media.metadata.COMPILATION", 1);
        lq.put("android.media.metadata.DATE", 1);
        lq.put("android.media.metadata.YEAR", 0);
        lq.put("android.media.metadata.GENRE", 1);
        lq.put("android.media.metadata.TRACK_NUMBER", 0);
        lq.put("android.media.metadata.NUM_TRACKS", 0);
        lq.put("android.media.metadata.DISC_NUMBER", 0);
        lq.put("android.media.metadata.ALBUM_ARTIST", 1);
        lq.put("android.media.metadata.ART", 2);
        lq.put("android.media.metadata.ART_URI", 1);
        lq.put("android.media.metadata.ALBUM_ART", 2);
        lq.put("android.media.metadata.ALBUM_ART_URI", 1);
        lq.put("android.media.metadata.USER_RATING", 3);
        lq.put("android.media.metadata.RATING", 3);
        lq.put("android.media.metadata.DISPLAY_TITLE", 1);
        lq.put("android.media.metadata.DISPLAY_SUBTITLE", 1);
        lq.put("android.media.metadata.DISPLAY_DESCRIPTION", 1);
        lq.put("android.media.metadata.DISPLAY_ICON", 2);
        lq.put("android.media.metadata.DISPLAY_ICON_URI", 1);
        lq.put("android.media.metadata.MEDIA_ID", 1);
        lq.put("android.media.metadata.MEDIA_URI", 1);
        lq.put("android.media.metadata.RADIO_FREQUENCY", 4);
        lq.put("android.media.metadata.RADIO_PROGRAM_NAME", 1);
        lq.put("android.media.metadata.BT_FOLDER_TYPE", 0);
        lq.put("android.media.metadata.ADVERTISEMENT", 0);
        lq.put("android.media.metadata.DOWNLOAD_STATUS", 0);
        lr = new String[]{"android.media.metadata.TITLE", "android.media.metadata.ARTIST", "android.media.metadata.ALBUM", "android.media.metadata.ALBUM_ARTIST", "android.media.metadata.WRITER", "android.media.metadata.AUTHOR", "android.media.metadata.COMPOSER"};
        ls = new String[]{"android.media.metadata.DISPLAY_ICON", "android.media.metadata.ART", "android.media.metadata.ALBUM_ART"};
        lt = new String[]{"android.media.metadata.DISPLAY_ICON_URI", "android.media.metadata.ART_URI", "android.media.metadata.ALBUM_ART_URI"};
    }

    private aq(Bundle bundle) {
        this.lu = new Bundle(bundle);
        this.lu.setClassLoader(aq.class.getClassLoader());
    }

    public static aq k(Bundle bundle) {
        if (bundle == null) {
            return null;
        }
        return new aq(bundle);
    }
}
