.class public final Landroid/support/v4/media/at;
.super Ljava/lang/Object;


# instance fields
.field private en:Ljava/lang/String;

.field private lx:Landroid/support/v4/media/ay;

.field private ly:I

.field private mEnabled:Z

.field private mExtras:Landroid/os/Bundle;


# direct methods
.method private constructor <init>(Landroid/support/v4/media/ay;ILjava/lang/String;Landroid/os/Bundle;Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroid/support/v4/media/at;->lx:Landroid/support/v4/media/ay;

    iput p2, p0, Landroid/support/v4/media/at;->ly:I

    iput-object p3, p0, Landroid/support/v4/media/at;->en:Ljava/lang/String;

    iput-object p4, p0, Landroid/support/v4/media/at;->mExtras:Landroid/os/Bundle;

    iput-boolean p5, p0, Landroid/support/v4/media/at;->mEnabled:Z

    return-void
.end method

.method synthetic constructor <init>(Landroid/support/v4/media/ay;ILjava/lang/String;Landroid/os/Bundle;ZB)V
    .locals 0

    invoke-direct/range {p0 .. p5}, Landroid/support/v4/media/at;-><init>(Landroid/support/v4/media/ay;ILjava/lang/String;Landroid/os/Bundle;Z)V

    return-void
.end method

.method public static l(Landroid/os/Bundle;)Landroid/support/v4/media/at;
    .locals 4

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    :cond_0
    new-instance v1, Landroid/support/v4/media/au;

    invoke-direct {v1}, Landroid/support/v4/media/au;-><init>()V

    const-string v2, "android.media.media_session2.command_button.command"

    invoke-virtual {p0, v2}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v2

    invoke-static {v2}, Landroid/support/v4/media/ay;->n(Landroid/os/Bundle;)Landroid/support/v4/media/ay;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/support/v4/media/au;->a(Landroid/support/v4/media/ay;)Landroid/support/v4/media/au;

    const-string v2, "android.media.media_session2.command_button.icon_res_id"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/support/v4/media/au;->w(I)Landroid/support/v4/media/au;

    const-string v2, "android.media.media_session2.command_button.display_name"

    invoke-virtual {p0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/support/v4/media/au;->u(Ljava/lang/String;)Landroid/support/v4/media/au;

    const-string v2, "android.media.media_session2.command_button.extras"

    invoke-virtual {p0, v2}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/support/v4/media/au;->m(Landroid/os/Bundle;)Landroid/support/v4/media/au;

    const-string v2, "android.media.media_session2.command_button.enabled"

    invoke-virtual {p0, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result p0

    invoke-virtual {v1, p0}, Landroid/support/v4/media/au;->f(Z)Landroid/support/v4/media/au;

    :try_start_0
    invoke-virtual {v1}, Landroid/support/v4/media/au;->bO()Landroid/support/v4/media/at;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    return-object v0
.end method
