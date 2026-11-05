.class public final Landroid/support/v4/media/a;
.super Ljava/lang/Object;


# static fields
.field private static final SDK_USAGES:[I

.field private static final SUPPRESSIBLE_USAGES:Landroid/util/SparseIntArray;

.field private static kd:Z


# instance fields
.field ke:I

.field kf:Ljava/lang/Integer;

.field private kg:Landroid/support/v4/media/c;

.field mFlags:I

.field mUsage:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    new-instance v0, Landroid/util/SparseIntArray;

    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    sput-object v0, Landroid/support/v4/media/a;->SUPPRESSIBLE_USAGES:Landroid/util/SparseIntArray;

    const/4 v1, 0x1

    const/4 v2, 0x5

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseIntArray;->put(II)V

    sget-object v0, Landroid/support/v4/media/a;->SUPPRESSIBLE_USAGES:Landroid/util/SparseIntArray;

    const/4 v2, 0x2

    const/4 v3, 0x6

    invoke-virtual {v0, v3, v2}, Landroid/util/SparseIntArray;->put(II)V

    sget-object v0, Landroid/support/v4/media/a;->SUPPRESSIBLE_USAGES:Landroid/util/SparseIntArray;

    const/4 v3, 0x7

    invoke-virtual {v0, v3, v2}, Landroid/util/SparseIntArray;->put(II)V

    sget-object v0, Landroid/support/v4/media/a;->SUPPRESSIBLE_USAGES:Landroid/util/SparseIntArray;

    const/16 v2, 0x8

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseIntArray;->put(II)V

    sget-object v0, Landroid/support/v4/media/a;->SUPPRESSIBLE_USAGES:Landroid/util/SparseIntArray;

    const/16 v2, 0x9

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseIntArray;->put(II)V

    sget-object v0, Landroid/support/v4/media/a;->SUPPRESSIBLE_USAGES:Landroid/util/SparseIntArray;

    const/16 v2, 0xa

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseIntArray;->put(II)V

    const/16 v0, 0x10

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Landroid/support/v4/media/a;->SDK_USAGES:[I

    return-void

    :array_0
    .array-data 4
        0x0
        0x1
        0x2
        0x3
        0x4
        0x5
        0x6
        0x7
        0x8
        0x9
        0xa
        0xb
        0xc
        0xd
        0xe
        0x10
    .end array-data
.end method

.method private constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v4/media/a;->mUsage:I

    iput v0, p0, Landroid/support/v4/media/a;->ke:I

    iput v0, p0, Landroid/support/v4/media/a;->mFlags:I

    return-void
.end method

.method public static b(Landroid/os/Bundle;)Landroid/support/v4/media/a;
    .locals 5

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    :cond_0
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v1, v2, :cond_2

    const-string v1, "android.support.v4.media.audio_attrs.FRAMEWORKS"

    invoke-virtual {p0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p0

    check-cast p0, Landroid/media/AudioAttributes;

    if-eqz p0, :cond_1

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v1, v2, :cond_1

    sget-boolean v1, Landroid/support/v4/media/a;->kd:Z

    if-nez v1, :cond_1

    new-instance v0, Landroid/support/v4/media/a;

    invoke-direct {v0}, Landroid/support/v4/media/a;-><init>()V

    check-cast p0, Landroid/media/AudioAttributes;

    invoke-static {p0}, Landroid/support/v4/media/c;->a(Landroid/media/AudioAttributes;)Landroid/support/v4/media/c;

    move-result-object p0

    iput-object p0, v0, Landroid/support/v4/media/a;->kg:Landroid/support/v4/media/c;

    :cond_1
    return-object v0

    :cond_2
    const-string v1, "android.support.v4.media.audio_attrs.USAGE"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    const-string v3, "android.support.v4.media.audio_attrs.CONTENT_TYPE"

    invoke-virtual {p0, v3, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v3

    const-string v4, "android.support.v4.media.audio_attrs.FLAGS"

    invoke-virtual {p0, v4, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v2

    new-instance v4, Landroid/support/v4/media/a;

    invoke-direct {v4}, Landroid/support/v4/media/a;-><init>()V

    iput v1, v4, Landroid/support/v4/media/a;->mUsage:I

    iput v3, v4, Landroid/support/v4/media/a;->ke:I

    iput v2, v4, Landroid/support/v4/media/a;->mFlags:I

    const-string v1, "android.support.v4.media.audio_attrs.LEGACY_STREAM_TYPE"

    invoke-virtual {p0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    const-string v0, "android.support.v4.media.audio_attrs.LEGACY_STREAM_TYPE"

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    :cond_3
    iput-object v0, v4, Landroid/support/v4/media/a;->kf:Ljava/lang/Integer;

    return-object v4
.end method

.method private bK()Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/media/a;->kg:Landroid/support/v4/media/c;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/media/a;->kg:Landroid/support/v4/media/c;

    invoke-virtual {v0}, Landroid/support/v4/media/c;->bL()Landroid/media/AudioAttributes;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 12

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_d

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    return v1

    :cond_1
    check-cast p1, Landroid/support/v4/media/a;

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x15

    if-lt v2, v3, :cond_2

    sget-boolean v2, Landroid/support/v4/media/a;->kd:Z

    if-nez v2, :cond_2

    iget-object v2, p0, Landroid/support/v4/media/a;->kg:Landroid/support/v4/media/c;

    if-eqz v2, :cond_2

    iget-object v0, p0, Landroid/support/v4/media/a;->kg:Landroid/support/v4/media/c;

    invoke-virtual {v0}, Landroid/support/v4/media/c;->bL()Landroid/media/AudioAttributes;

    move-result-object v0

    invoke-direct {p1}, Landroid/support/v4/media/a;->bK()Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/media/AudioAttributes;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1

    :cond_2
    iget v2, p0, Landroid/support/v4/media/a;->ke:I

    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v4, v3, :cond_3

    sget-boolean v4, Landroid/support/v4/media/a;->kd:Z

    if-nez v4, :cond_3

    iget-object v4, p1, Landroid/support/v4/media/a;->kg:Landroid/support/v4/media/c;

    if-eqz v4, :cond_3

    iget-object v4, p1, Landroid/support/v4/media/a;->kg:Landroid/support/v4/media/c;

    invoke-virtual {v4}, Landroid/support/v4/media/c;->bL()Landroid/media/AudioAttributes;

    move-result-object v4

    invoke-virtual {v4}, Landroid/media/AudioAttributes;->getContentType()I

    move-result v4

    goto :goto_0

    :cond_3
    iget v4, p1, Landroid/support/v4/media/a;->ke:I

    :goto_0
    if-ne v2, v4, :cond_d

    iget v2, p0, Landroid/support/v4/media/a;->mFlags:I

    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v4, v3, :cond_4

    sget-boolean v4, Landroid/support/v4/media/a;->kd:Z

    if-nez v4, :cond_4

    iget-object v4, p1, Landroid/support/v4/media/a;->kg:Landroid/support/v4/media/c;

    if-eqz v4, :cond_4

    iget-object v4, p1, Landroid/support/v4/media/a;->kg:Landroid/support/v4/media/c;

    invoke-virtual {v4}, Landroid/support/v4/media/c;->bL()Landroid/media/AudioAttributes;

    move-result-object v4

    invoke-virtual {v4}, Landroid/media/AudioAttributes;->getFlags()I

    move-result v4

    goto :goto_3

    :cond_4
    iget v4, p1, Landroid/support/v4/media/a;->mFlags:I

    iget-object v5, p1, Landroid/support/v4/media/a;->kf:Ljava/lang/Integer;

    const/4 v6, 0x6

    const/4 v7, 0x7

    const/4 v8, 0x3

    const/4 v9, 0x4

    if-eqz v5, :cond_5

    iget-object v5, p1, Landroid/support/v4/media/a;->kf:Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    goto :goto_1

    :cond_5
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v5, v3, :cond_6

    sget-boolean v5, Landroid/support/v4/media/a;->kd:Z

    if-nez v5, :cond_6

    iget-object v5, p1, Landroid/support/v4/media/a;->kg:Landroid/support/v4/media/c;

    invoke-static {v5}, Landroid/support/v4/media/b;->a(Landroid/support/v4/media/c;)I

    move-result v5

    goto :goto_1

    :cond_6
    iget v5, p1, Landroid/support/v4/media/a;->mFlags:I

    iget v10, p1, Landroid/support/v4/media/a;->mUsage:I

    and-int/lit8 v11, v5, 0x1

    if-ne v11, v0, :cond_7

    move v5, v7

    goto :goto_1

    :cond_7
    and-int/2addr v5, v9

    if-ne v5, v9, :cond_8

    move v5, v6

    goto :goto_1

    :cond_8
    packed-switch v10, :pswitch_data_0

    :pswitch_0
    move v5, v8

    goto :goto_1

    :pswitch_1
    move v5, v0

    goto :goto_1

    :pswitch_2
    const/16 v5, 0xa

    goto :goto_1

    :pswitch_3
    const/4 v5, 0x2

    goto :goto_1

    :pswitch_4
    const/4 v5, 0x5

    goto :goto_1

    :pswitch_5
    move v5, v9

    goto :goto_1

    :pswitch_6
    const/16 v5, 0x8

    goto :goto_1

    :pswitch_7
    move v5, v1

    :goto_1
    if-ne v5, v6, :cond_9

    or-int/lit8 v4, v4, 0x4

    goto :goto_2

    :cond_9
    if-ne v5, v7, :cond_a

    or-int/lit8 v4, v4, 0x1

    :cond_a
    :goto_2
    and-int/lit16 v4, v4, 0x111

    :goto_3
    if-ne v2, v4, :cond_d

    iget v2, p0, Landroid/support/v4/media/a;->mUsage:I

    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v4, v3, :cond_b

    sget-boolean v3, Landroid/support/v4/media/a;->kd:Z

    if-nez v3, :cond_b

    iget-object v3, p1, Landroid/support/v4/media/a;->kg:Landroid/support/v4/media/c;

    if-eqz v3, :cond_b

    iget-object v3, p1, Landroid/support/v4/media/a;->kg:Landroid/support/v4/media/c;

    invoke-virtual {v3}, Landroid/support/v4/media/c;->bL()Landroid/media/AudioAttributes;

    move-result-object v3

    invoke-virtual {v3}, Landroid/media/AudioAttributes;->getUsage()I

    move-result v3

    goto :goto_4

    :cond_b
    iget v3, p1, Landroid/support/v4/media/a;->mUsage:I

    :goto_4
    if-ne v2, v3, :cond_d

    iget-object v2, p0, Landroid/support/v4/media/a;->kf:Ljava/lang/Integer;

    if-eqz v2, :cond_c

    iget-object v2, p0, Landroid/support/v4/media/a;->kf:Ljava/lang/Integer;

    iget-object p1, p1, Landroid/support/v4/media/a;->kf:Ljava/lang/Integer;

    invoke-virtual {v2, p1}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_d

    return v0

    :cond_c
    iget-object p1, p1, Landroid/support/v4/media/a;->kf:Ljava/lang/Integer;

    if-nez p1, :cond_d

    return v0

    :cond_d
    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_2
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public final hashCode()I
    .locals 3

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    sget-boolean v0, Landroid/support/v4/media/a;->kd:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/media/a;->kg:Landroid/support/v4/media/c;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/media/a;->kg:Landroid/support/v4/media/c;

    invoke-virtual {v0}, Landroid/support/v4/media/c;->bL()Landroid/media/AudioAttributes;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/AudioAttributes;->hashCode()I

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    iget v2, p0, Landroid/support/v4/media/a;->ke:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget v2, p0, Landroid/support/v4/media/a;->mFlags:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x2

    iget v2, p0, Landroid/support/v4/media/a;->mUsage:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x3

    iget-object v2, p0, Landroid/support/v4/media/a;->kf:Ljava/lang/Integer;

    aput-object v2, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 5

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "AudioAttributesCompat:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-direct {p0}, Landroid/support/v4/media/a;->bK()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    const-string v1, " audioattributes="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0}, Landroid/support/v4/media/a;->bK()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto/16 :goto_1

    :cond_0
    iget-object v1, p0, Landroid/support/v4/media/a;->kf:Ljava/lang/Integer;

    if-eqz v1, :cond_1

    const-string v1, " stream="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroid/support/v4/media/a;->kf:Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " derived"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1
    const-string v1, " usage="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroid/support/v4/media/a;->mUsage:I

    packed-switch v1, :pswitch_data_0

    :pswitch_0
    new-instance v2, Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "unknown usage "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    move-object v1, v2

    goto/16 :goto_0

    :pswitch_1
    new-instance v1, Ljava/lang/String;

    const-string v2, "USAGE_ASSISTANT"

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    goto/16 :goto_0

    :pswitch_2
    new-instance v1, Ljava/lang/String;

    const-string v2, "USAGE_GAME"

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    goto/16 :goto_0

    :pswitch_3
    new-instance v1, Ljava/lang/String;

    const-string v2, "USAGE_ASSISTANCE_SONIFICATION"

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    goto/16 :goto_0

    :pswitch_4
    new-instance v1, Ljava/lang/String;

    const-string v2, "USAGE_ASSISTANCE_NAVIGATION_GUIDANCE"

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :pswitch_5
    new-instance v1, Ljava/lang/String;

    const-string v2, "USAGE_ASSISTANCE_ACCESSIBILITY"

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :pswitch_6
    new-instance v1, Ljava/lang/String;

    const-string v2, "USAGE_NOTIFICATION_EVENT"

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :pswitch_7
    new-instance v1, Ljava/lang/String;

    const-string v2, "USAGE_NOTIFICATION_COMMUNICATION_DELAYED"

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :pswitch_8
    new-instance v1, Ljava/lang/String;

    const-string v2, "USAGE_NOTIFICATION_COMMUNICATION_INSTANT"

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :pswitch_9
    new-instance v1, Ljava/lang/String;

    const-string v2, "USAGE_NOTIFICATION_COMMUNICATION_REQUEST"

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :pswitch_a
    new-instance v1, Ljava/lang/String;

    const-string v2, "USAGE_NOTIFICATION_RINGTONE"

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :pswitch_b
    new-instance v1, Ljava/lang/String;

    const-string v2, "USAGE_NOTIFICATION"

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :pswitch_c
    new-instance v1, Ljava/lang/String;

    const-string v2, "USAGE_ALARM"

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :pswitch_d
    new-instance v1, Ljava/lang/String;

    const-string v2, "USAGE_VOICE_COMMUNICATION_SIGNALLING"

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :pswitch_e
    new-instance v1, Ljava/lang/String;

    const-string v2, "USAGE_VOICE_COMMUNICATION"

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :pswitch_f
    new-instance v1, Ljava/lang/String;

    const-string v2, "USAGE_MEDIA"

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :pswitch_10
    new-instance v1, Ljava/lang/String;

    const-string v2, "USAGE_UNKNOWN"

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " content="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroid/support/v4/media/a;->ke:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " flags=0x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroid/support/v4/media/a;->mFlags:I

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
