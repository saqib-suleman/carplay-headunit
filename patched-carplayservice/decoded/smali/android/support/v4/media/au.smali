.class public final Landroid/support/v4/media/au;
.super Ljava/lang/Object;


# instance fields
.field private en:Ljava/lang/String;

.field private lx:Landroid/support/v4/media/ay;

.field private ly:I

.field private mEnabled:Z

.field private mExtras:Landroid/os/Bundle;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/support/v4/media/ay;)Landroid/support/v4/media/au;
    .locals 0

    iput-object p1, p0, Landroid/support/v4/media/au;->lx:Landroid/support/v4/media/ay;

    return-object p0
.end method

.method public final bO()Landroid/support/v4/media/at;
    .locals 8

    new-instance v7, Landroid/support/v4/media/at;

    iget-object v1, p0, Landroid/support/v4/media/au;->lx:Landroid/support/v4/media/ay;

    iget v2, p0, Landroid/support/v4/media/au;->ly:I

    iget-object v3, p0, Landroid/support/v4/media/au;->en:Ljava/lang/String;

    iget-object v4, p0, Landroid/support/v4/media/au;->mExtras:Landroid/os/Bundle;

    iget-boolean v5, p0, Landroid/support/v4/media/au;->mEnabled:Z

    const/4 v6, 0x0

    move-object v0, v7

    invoke-direct/range {v0 .. v6}, Landroid/support/v4/media/at;-><init>(Landroid/support/v4/media/ay;ILjava/lang/String;Landroid/os/Bundle;ZB)V

    return-object v7
.end method

.method public final f(Z)Landroid/support/v4/media/au;
    .locals 0

    iput-boolean p1, p0, Landroid/support/v4/media/au;->mEnabled:Z

    return-object p0
.end method

.method public final m(Landroid/os/Bundle;)Landroid/support/v4/media/au;
    .locals 0

    iput-object p1, p0, Landroid/support/v4/media/au;->mExtras:Landroid/os/Bundle;

    return-object p0
.end method

.method public final u(Ljava/lang/String;)Landroid/support/v4/media/au;
    .locals 0

    iput-object p1, p0, Landroid/support/v4/media/au;->en:Ljava/lang/String;

    return-object p0
.end method

.method public final w(I)Landroid/support/v4/media/au;
    .locals 0

    iput p1, p0, Landroid/support/v4/media/au;->ly:I

    return-object p0
.end method
