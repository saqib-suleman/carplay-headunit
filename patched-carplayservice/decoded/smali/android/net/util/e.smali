.class final Landroid/net/util/e;
.super Landroid/database/ContentObserver;


# instance fields
.field final synthetic gu:Landroid/net/util/c;


# direct methods
.method public constructor <init>(Landroid/net/util/c;)V
    .locals 0

    iput-object p1, p0, Landroid/net/util/e;->gu:Landroid/net/util/c;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method public final onChange(Z)V
    .locals 1

    invoke-static {}, Landroid/net/util/c;->aB()Ljava/lang/String;

    move-result-object p1

    const-string v0, "Should never be reached."

    invoke-static {p1, v0}, Landroid/util/Slog;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public final onChange(ZLandroid/net/Uri;)V
    .locals 2

    iget-object p1, p0, Landroid/net/util/e;->gu:Landroid/net/util/c;

    invoke-static {p1}, Landroid/net/util/c;->a(Landroid/net/util/c;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    invoke-static {}, Landroid/net/util/c;->aB()Ljava/lang/String;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Unexpected settings observation: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Slog;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    iget-object p1, p0, Landroid/net/util/e;->gu:Landroid/net/util/c;

    invoke-virtual {p1}, Landroid/net/util/c;->reevaluate()V

    return-void
.end method
