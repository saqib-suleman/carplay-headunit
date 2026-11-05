package android.support.v4.media;

import android.media.AudioAttributes;
import android.os.Build;
import android.os.Bundle;
import android.util.SparseIntArray;
import java.util.Arrays;

/* JADX INFO: loaded from: classes.dex */
public final class a {
    private static final int[] SDK_USAGES;
    private static final SparseIntArray SUPPRESSIBLE_USAGES;
    private static boolean kd;
    Integer kf;
    private c kg;
    int mUsage = 0;
    int ke = 0;
    int mFlags = 0;

    static {
        SparseIntArray sparseIntArray = new SparseIntArray();
        SUPPRESSIBLE_USAGES = sparseIntArray;
        sparseIntArray.put(5, 1);
        SUPPRESSIBLE_USAGES.put(6, 2);
        SUPPRESSIBLE_USAGES.put(7, 2);
        SUPPRESSIBLE_USAGES.put(8, 1);
        SUPPRESSIBLE_USAGES.put(9, 1);
        SUPPRESSIBLE_USAGES.put(10, 1);
        SDK_USAGES = new int[]{0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 16};
    }

    private a() {
    }

    public static a b(Bundle bundle) {
        if (bundle == null) {
            return null;
        }
        if (Build.VERSION.SDK_INT >= 21) {
            AudioAttributes audioAttributes = (AudioAttributes) bundle.getParcelable("android.support.v4.media.audio_attrs.FRAMEWORKS");
            if (audioAttributes == null || Build.VERSION.SDK_INT < 21 || kd) {
                return null;
            }
            a aVar = new a();
            aVar.kg = c.a(audioAttributes);
            return aVar;
        }
        int i = bundle.getInt("android.support.v4.media.audio_attrs.USAGE", 0);
        int i2 = bundle.getInt("android.support.v4.media.audio_attrs.CONTENT_TYPE", 0);
        int i3 = bundle.getInt("android.support.v4.media.audio_attrs.FLAGS", 0);
        a aVar2 = new a();
        aVar2.mUsage = i;
        aVar2.ke = i2;
        aVar2.mFlags = i3;
        aVar2.kf = bundle.containsKey("android.support.v4.media.audio_attrs.LEGACY_STREAM_TYPE") ? Integer.valueOf(bundle.getInt("android.support.v4.media.audio_attrs.LEGACY_STREAM_TYPE")) : null;
        return aVar2;
    }

    private Object bK() {
        if (this.kg != null) {
            return this.kg.bL();
        }
        return null;
    }

    public final boolean equals(Object obj) {
        int iA;
        int flags;
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        a aVar = (a) obj;
        if (Build.VERSION.SDK_INT >= 21 && !kd && this.kg != null) {
            return this.kg.bL().equals(aVar.bK());
        }
        if (this.ke == ((Build.VERSION.SDK_INT < 21 || kd || aVar.kg == null) ? aVar.ke : aVar.kg.bL().getContentType())) {
            int i = this.mFlags;
            if (Build.VERSION.SDK_INT < 21 || kd || aVar.kg == null) {
                int i2 = aVar.mFlags;
                if (aVar.kf != null) {
                    iA = aVar.kf.intValue();
                } else if (Build.VERSION.SDK_INT < 21 || kd) {
                    int i3 = aVar.mFlags;
                    int i4 = aVar.mUsage;
                    if ((i3 & 1) != 1) {
                        if ((i3 & 4) != 4) {
                            switch (i4) {
                                case 0:
                                case 1:
                                case 12:
                                case 14:
                                case 15:
                                case 16:
                                default:
                                    iA = 3;
                                    break;
                                case 2:
                                    iA = 0;
                                    break;
                                case 3:
                                    iA = 8;
                                    break;
                                case 4:
                                    iA = 4;
                                    break;
                                case 5:
                                case 7:
                                case 8:
                                case 9:
                                case 10:
                                    iA = 5;
                                    break;
                                case 6:
                                    iA = 2;
                                    break;
                                case 11:
                                    iA = 10;
                                    break;
                                case 13:
                                    iA = 1;
                                    break;
                            }
                        } else {
                            iA = 6;
                        }
                    } else {
                        iA = 7;
                    }
                } else {
                    iA = b.a(aVar.kg);
                }
                if (iA == 6) {
                    i2 |= 4;
                } else if (iA == 7) {
                    i2 |= 1;
                }
                flags = i2 & 273;
            } else {
                flags = aVar.kg.bL().getFlags();
            }
            if (i == flags) {
                if (this.mUsage == ((Build.VERSION.SDK_INT < 21 || kd || aVar.kg == null) ? aVar.mUsage : aVar.kg.bL().getUsage())) {
                    if (this.kf != null) {
                        if (this.kf.equals(aVar.kf)) {
                            return true;
                        }
                    } else if (aVar.kf == null) {
                        return true;
                    }
                }
            }
        }
        return false;
    }

    public final int hashCode() {
        return (Build.VERSION.SDK_INT < 21 || kd || this.kg == null) ? Arrays.hashCode(new Object[]{Integer.valueOf(this.ke), Integer.valueOf(this.mFlags), Integer.valueOf(this.mUsage), this.kf}) : this.kg.bL().hashCode();
    }

    public final String toString() {
        String str;
        StringBuilder sb = new StringBuilder("AudioAttributesCompat:");
        if (bK() != null) {
            sb.append(" audioattributes=");
            sb.append(bK());
        } else {
            if (this.kf != null) {
                sb.append(" stream=");
                sb.append(this.kf);
                sb.append(" derived");
            }
            sb.append(" usage=");
            int i = this.mUsage;
            switch (i) {
                case 0:
                    str = new String("USAGE_UNKNOWN");
                    break;
                case 1:
                    str = new String("USAGE_MEDIA");
                    break;
                case 2:
                    str = new String("USAGE_VOICE_COMMUNICATION");
                    break;
                case 3:
                    str = new String("USAGE_VOICE_COMMUNICATION_SIGNALLING");
                    break;
                case 4:
                    str = new String("USAGE_ALARM");
                    break;
                case 5:
                    str = new String("USAGE_NOTIFICATION");
                    break;
                case 6:
                    str = new String("USAGE_NOTIFICATION_RINGTONE");
                    break;
                case 7:
                    str = new String("USAGE_NOTIFICATION_COMMUNICATION_REQUEST");
                    break;
                case 8:
                    str = new String("USAGE_NOTIFICATION_COMMUNICATION_INSTANT");
                    break;
                case 9:
                    str = new String("USAGE_NOTIFICATION_COMMUNICATION_DELAYED");
                    break;
                case 10:
                    str = new String("USAGE_NOTIFICATION_EVENT");
                    break;
                case 11:
                    str = new String("USAGE_ASSISTANCE_ACCESSIBILITY");
                    break;
                case 12:
                    str = new String("USAGE_ASSISTANCE_NAVIGATION_GUIDANCE");
                    break;
                case 13:
                    str = new String("USAGE_ASSISTANCE_SONIFICATION");
                    break;
                case 14:
                    str = new String("USAGE_GAME");
                    break;
                case 15:
                default:
                    str = new String("unknown usage " + i);
                    break;
                case 16:
                    str = new String("USAGE_ASSISTANT");
                    break;
            }
            sb.append(str);
            sb.append(" content=");
            sb.append(this.ke);
            sb.append(" flags=0x");
            sb.append(Integer.toHexString(this.mFlags).toUpperCase());
        }
        return sb.toString();
    }
}
