.class public final Landroid/support/v4/media/ba;
.super Ljava/lang/Object;


# instance fields
.field private final lF:Landroid/support/v4/media/bb;


# direct methods
.method private constructor <init>(Landroid/support/v4/media/bb;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroid/support/v4/media/ba;->lF:Landroid/support/v4/media/bb;

    return-void
.end method

.method public static p(Landroid/os/Bundle;)Landroid/support/v4/media/ba;
    .locals 10

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    :cond_0
    const-string v1, "android.media.token.type"

    const/4 v2, -0x1

    invoke-virtual {p0, v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    const/16 v3, 0x64

    if-ne v1, v3, :cond_1

    new-instance v0, Landroid/support/v4/media/ba;

    const-string v1, "android.media.token.LEGACY"

    invoke-virtual {p0, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p0

    new-instance v1, Landroid/support/v4/media/bd;

    invoke-static {p0}, Landroid/support/v4/media/session/MediaSessionCompat$Token;->q(Landroid/os/Bundle;)Landroid/support/v4/media/session/MediaSessionCompat$Token;

    move-result-object p0

    invoke-direct {v1, p0}, Landroid/support/v4/media/bd;-><init>(Landroid/support/v4/media/session/MediaSessionCompat$Token;)V

    invoke-direct {v0, v1}, Landroid/support/v4/media/ba;-><init>(Landroid/support/v4/media/bb;)V

    return-object v0

    :cond_1
    new-instance v1, Landroid/support/v4/media/ba;

    if-nez p0, :cond_2

    move-object p0, v0

    goto :goto_1

    :cond_2
    const-string v0, "android.media.token.uid"

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v4

    const-string v0, "android.media.token.type"

    invoke-virtual {p0, v0, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v5

    const-string v0, "android.media.token.package_name"

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v0, "android.media.token.service_name"

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v0, "android.media.token.session_id"

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v0, "android.media.token.session_binder"

    invoke-static {p0, v0}, Landroid/support/v4/app/f;->a(Landroid/os/Bundle;Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object p0

    invoke-static {p0}, Landroid/support/v4/media/i;->b(Landroid/os/IBinder;)Landroid/support/v4/media/h;

    move-result-object v9

    packed-switch v5, :pswitch_data_0

    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Invalid type"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :pswitch_0
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_3

    goto :goto_0

    :cond_3
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Session service needs service name"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :pswitch_1
    if-eqz v9, :cond_5

    :goto_0
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_4

    if-eqz v8, :cond_4

    new-instance p0, Landroid/support/v4/media/bc;

    move-object v3, p0

    invoke-direct/range {v3 .. v9}, Landroid/support/v4/media/bc;-><init>(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/support/v4/media/h;)V

    :goto_1
    invoke-direct {v1, p0}, Landroid/support/v4/media/ba;-><init>(Landroid/support/v4/media/bb;)V

    return-object v1

    :cond_4
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Package name nor ID cannot be null."

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_5
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Unexpected token for session, binder="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 1

    instance-of v0, p1, Landroid/support/v4/media/ba;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    check-cast p1, Landroid/support/v4/media/ba;

    iget-object v0, p0, Landroid/support/v4/media/ba;->lF:Landroid/support/v4/media/bb;

    iget-object p1, p1, Landroid/support/v4/media/ba;->lF:Landroid/support/v4/media/bb;

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public final hashCode()I
    .locals 1

    iget-object v0, p0, Landroid/support/v4/media/ba;->lF:Landroid/support/v4/media/bb;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/media/ba;->lF:Landroid/support/v4/media/bb;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
