.class final Landroid/net/a/f;
.super Lcom/android/server/net/NetlinkTracker;


# instance fields
.field final synthetic eX:Landroid/net/a/d;


# direct methods
.method constructor <init>(Landroid/net/a/d;Ljava/lang/String;Lcom/android/server/net/NetlinkTracker$Callback;)V
    .locals 0

    iput-object p1, p0, Landroid/net/a/f;->eX:Landroid/net/a/d;

    invoke-direct {p0, p2, p3}, Lcom/android/server/net/NetlinkTracker;-><init>(Ljava/lang/String;Lcom/android/server/net/NetlinkTracker$Callback;)V

    return-void
.end method

.method private h(Ljava/lang/String;)V
    .locals 2

    iget-object v0, p0, Landroid/net/a/f;->eX:Landroid/net/a/d;

    invoke-static {v0}, Landroid/net/a/d;->d(Landroid/net/a/d;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Landroid/net/a/f;->eX:Landroid/net/a/d;

    invoke-virtual {v0}, Landroid/net/a/d;->getHandler()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Landroid/net/a/-$$Lambda$f$1dXYau8bUy8w2RRxh8ykG1LP_fw;

    invoke-direct {v1, p0, p1}, Landroid/net/a/-$$Lambda$f$1dXYau8bUy8w2RRxh8ykG1LP_fw;-><init>(Landroid/net/a/f;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method private synthetic i(Ljava/lang/String;)V
    .locals 3

    iget-object v0, p0, Landroid/net/a/f;->eX:Landroid/net/a/d;

    invoke-static {v0}, Landroid/net/a/d;->a(Landroid/net/a/d;)Landroid/net/util/SharedLog;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "OBSERVED "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/net/util/SharedLog;->log(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic lambda$1dXYau8bUy8w2RRxh8ykG1LP_fw(Landroid/net/a/f;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/net/a/f;->i(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final interfaceAdded(Ljava/lang/String;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/android/server/net/NetlinkTracker;->interfaceAdded(Ljava/lang/String;)V

    iget-object v0, p0, Landroid/net/a/f;->eX:Landroid/net/a/d;

    invoke-static {v0}, Landroid/net/a/d;->b(Landroid/net/a/d;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/net/a/f;->eX:Landroid/net/a/d;

    iget-object v0, v0, Landroid/net/a/d;->mCallback:Landroid/net/a/i;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/net/a/i;->d(Z)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Landroid/net/a/f;->eX:Landroid/net/a/d;

    invoke-static {v0}, Landroid/net/a/d;->c(Landroid/net/a/d;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    return-void

    :cond_1
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "interfaceAdded("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ")"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Landroid/net/a/f;->h(Ljava/lang/String;)V

    return-void
.end method

.method public final interfaceRemoved(Ljava/lang/String;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/android/server/net/NetlinkTracker;->interfaceRemoved(Ljava/lang/String;)V

    iget-object v0, p0, Landroid/net/a/f;->eX:Landroid/net/a/d;

    invoke-static {v0}, Landroid/net/a/d;->b(Landroid/net/a/d;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/net/a/f;->eX:Landroid/net/a/d;

    iget-object v0, v0, Landroid/net/a/d;->mCallback:Landroid/net/a/i;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/net/a/i;->d(Z)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Landroid/net/a/f;->eX:Landroid/net/a/d;

    invoke-static {v0}, Landroid/net/a/d;->c(Landroid/net/a/d;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    return-void

    :cond_1
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "interfaceRemoved("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ")"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Landroid/net/a/f;->h(Ljava/lang/String;)V

    return-void
.end method
