.class public final Landroid/support/v4/media/ao;
.super Ljava/lang/Object;


# instance fields
.field private li:Ljava/lang/String;

.field private lj:Ljava/lang/CharSequence;

.field private lk:Landroid/net/Uri;

.field private ll:Landroid/net/Uri;

.field private mDescription:Ljava/lang/CharSequence;

.field private mExtras:Landroid/os/Bundle;

.field private mIcon:Landroid/graphics/Bitmap;

.field private mTitle:Ljava/lang/CharSequence;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/graphics/Bitmap;)Landroid/support/v4/media/ao;
    .locals 0

    iput-object p1, p0, Landroid/support/v4/media/ao;->mIcon:Landroid/graphics/Bitmap;

    return-object p0
.end method

.method public final a(Landroid/net/Uri;)Landroid/support/v4/media/ao;
    .locals 0

    iput-object p1, p0, Landroid/support/v4/media/ao;->lk:Landroid/net/Uri;

    return-object p0
.end method

.method public final a(Ljava/lang/CharSequence;)Landroid/support/v4/media/ao;
    .locals 0

    iput-object p1, p0, Landroid/support/v4/media/ao;->mTitle:Ljava/lang/CharSequence;

    return-object p0
.end method

.method public final b(Landroid/net/Uri;)Landroid/support/v4/media/ao;
    .locals 0

    iput-object p1, p0, Landroid/support/v4/media/ao;->ll:Landroid/net/Uri;

    return-object p0
.end method

.method public final b(Ljava/lang/CharSequence;)Landroid/support/v4/media/ao;
    .locals 0

    iput-object p1, p0, Landroid/support/v4/media/ao;->lj:Ljava/lang/CharSequence;

    return-object p0
.end method

.method public final bN()Landroid/support/v4/media/MediaDescriptionCompat;
    .locals 10

    new-instance v9, Landroid/support/v4/media/MediaDescriptionCompat;

    iget-object v1, p0, Landroid/support/v4/media/ao;->li:Ljava/lang/String;

    iget-object v2, p0, Landroid/support/v4/media/ao;->mTitle:Ljava/lang/CharSequence;

    iget-object v3, p0, Landroid/support/v4/media/ao;->lj:Ljava/lang/CharSequence;

    iget-object v4, p0, Landroid/support/v4/media/ao;->mDescription:Ljava/lang/CharSequence;

    iget-object v5, p0, Landroid/support/v4/media/ao;->mIcon:Landroid/graphics/Bitmap;

    iget-object v6, p0, Landroid/support/v4/media/ao;->lk:Landroid/net/Uri;

    iget-object v7, p0, Landroid/support/v4/media/ao;->mExtras:Landroid/os/Bundle;

    iget-object v8, p0, Landroid/support/v4/media/ao;->ll:Landroid/net/Uri;

    move-object v0, v9

    invoke-direct/range {v0 .. v8}, Landroid/support/v4/media/MediaDescriptionCompat;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/graphics/Bitmap;Landroid/net/Uri;Landroid/os/Bundle;Landroid/net/Uri;)V

    return-object v9
.end method

.method public final c(Ljava/lang/CharSequence;)Landroid/support/v4/media/ao;
    .locals 0

    iput-object p1, p0, Landroid/support/v4/media/ao;->mDescription:Ljava/lang/CharSequence;

    return-object p0
.end method

.method public final i(Landroid/os/Bundle;)Landroid/support/v4/media/ao;
    .locals 0

    iput-object p1, p0, Landroid/support/v4/media/ao;->mExtras:Landroid/os/Bundle;

    return-object p0
.end method

.method public final t(Ljava/lang/String;)Landroid/support/v4/media/ao;
    .locals 0

    iput-object p1, p0, Landroid/support/v4/media/ao;->li:Ljava/lang/String;

    return-object p0
.end method
