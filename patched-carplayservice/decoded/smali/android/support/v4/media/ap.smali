.class public final Landroid/support/v4/media/ap;
.super Ljava/lang/Object;


# instance fields
.field private final ln:Ljava/util/UUID;

.field private lo:Landroid/support/v4/media/aq;

.field private lp:Landroid/support/v4/media/d;

.field private final mFlags:I

.field private final mId:Ljava/lang/String;


# direct methods
.method private constructor <init>(Ljava/lang/String;Landroid/support/v4/media/aq;ILjava/util/UUID;)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_4

    const/4 v0, 0x0

    if-eqz p2, :cond_2

    const-string v1, "android.media.metadata.MEDIA_ID"

    iget-object v2, p2, Landroid/support/v4/media/aq;->lu:Landroid/os/Bundle;

    invoke-virtual {v2, v1}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, v0

    :goto_0
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_1

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "metadata\'s id should be matched with the mediaid"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    :goto_1
    iput-object p1, p0, Landroid/support/v4/media/ap;->mId:Ljava/lang/String;

    iput-object v0, p0, Landroid/support/v4/media/ap;->lp:Landroid/support/v4/media/d;

    iput-object p2, p0, Landroid/support/v4/media/ap;->lo:Landroid/support/v4/media/aq;

    iput p3, p0, Landroid/support/v4/media/ap;->mFlags:I

    if-nez p4, :cond_3

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object p4

    :cond_3
    iput-object p4, p0, Landroid/support/v4/media/ap;->ln:Ljava/util/UUID;

    return-void

    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "mediaId shouldn\'t be null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static j(Landroid/os/Bundle;)Landroid/support/v4/media/ap;
    .locals 4

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    :cond_0
    const-string v1, "android.media.mediaitem2.uuid"

    invoke-virtual {p0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v1

    if-nez p0, :cond_1

    return-object v0

    :cond_1
    const-string v2, "android.media.mediaitem2.id"

    invoke-virtual {p0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "android.media.mediaitem2.metadata"

    invoke-virtual {p0, v3}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v3

    if-eqz v3, :cond_2

    invoke-static {v3}, Landroid/support/v4/media/aq;->k(Landroid/os/Bundle;)Landroid/support/v4/media/aq;

    move-result-object v0

    :cond_2
    const-string v3, "android.media.mediaitem2.flags"

    invoke-virtual {p0, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result p0

    new-instance v3, Landroid/support/v4/media/ap;

    invoke-direct {v3, v2, v0, p0, v1}, Landroid/support/v4/media/ap;-><init>(Ljava/lang/String;Landroid/support/v4/media/aq;ILjava/util/UUID;)V

    return-object v3
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 1

    instance-of v0, p1, Landroid/support/v4/media/ap;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    check-cast p1, Landroid/support/v4/media/ap;

    iget-object v0, p0, Landroid/support/v4/media/ap;->ln:Ljava/util/UUID;

    iget-object p1, p1, Landroid/support/v4/media/ap;->ln:Ljava/util/UUID;

    invoke-virtual {v0, p1}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public final hashCode()I
    .locals 1

    iget-object v0, p0, Landroid/support/v4/media/ap;->ln:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->hashCode()I

    move-result v0

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "MediaItem2{"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "mFlags="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroid/support/v4/media/ap;->mFlags:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", mMetadata="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroid/support/v4/media/ap;->lo:Landroid/support/v4/media/aq;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
