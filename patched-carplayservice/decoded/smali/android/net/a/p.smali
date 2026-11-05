.class final Landroid/net/a/p;
.super Lcom/android/internal/util/State;


# instance fields
.field final synthetic eX:Landroid/net/a/d;


# direct methods
.method constructor <init>(Landroid/net/a/d;)V
    .locals 0

    iput-object p1, p0, Landroid/net/a/p;->eX:Landroid/net/a/d;

    invoke-direct {p0}, Lcom/android/internal/util/State;-><init>()V

    return-void
.end method

.method private al()Z
    .locals 1

    iget-object v0, p0, Landroid/net/a/p;->eX:Landroid/net/a/d;

    invoke-static {v0}, Landroid/net/a/d;->u(Landroid/net/a/d;)Landroid/net/LinkProperties;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/LinkProperties;->hasIPv4Address()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Landroid/net/a/p;->eX:Landroid/net/a/d;

    invoke-static {v0}, Landroid/net/a/d;->u(Landroid/net/a/d;)Landroid/net/LinkProperties;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/LinkProperties;->hasGlobalIPv6Address()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method


# virtual methods
.method public final enter()V
    .locals 4

    iget-object v0, p0, Landroid/net/a/p;->eX:Landroid/net/a/d;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    invoke-static {v0, v1, v2}, Landroid/net/a/d;->a(Landroid/net/a/d;J)J

    iget-object v0, p0, Landroid/net/a/p;->eX:Landroid/net/a/d;

    invoke-static {v0}, Landroid/net/a/d;->p(Landroid/net/a/d;)Landroid/net/a/n;

    move-result-object v0

    iget v0, v0, Landroid/net/a/n;->fm:I

    if-lez v0, :cond_0

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-object v2, p0, Landroid/net/a/p;->eX:Landroid/net/a/d;

    invoke-static {v2}, Landroid/net/a/d;->p(Landroid/net/a/d;)Landroid/net/a/n;

    move-result-object v2

    iget v2, v2, Landroid/net/a/n;->fm:I

    int-to-long v2, v2

    add-long/2addr v0, v2

    iget-object v2, p0, Landroid/net/a/p;->eX:Landroid/net/a/d;

    invoke-static {v2}, Landroid/net/a/d;->q(Landroid/net/a/d;)Lcom/android/internal/util/WakeupMessage;

    move-result-object v2

    invoke-virtual {v2, v0, v1}, Lcom/android/internal/util/WakeupMessage;->schedule(J)V

    :cond_0
    invoke-direct {p0}, Landroid/net/a/p;->al()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/net/a/p;->eX:Landroid/net/a/d;

    iget-object v1, p0, Landroid/net/a/p;->eX:Landroid/net/a/d;

    invoke-static {v1}, Landroid/net/a/d;->r(Landroid/net/a/d;)Lcom/android/internal/util/State;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/net/a/d;->transitionTo(Lcom/android/internal/util/IState;)V

    return-void

    :cond_1
    iget-object v0, p0, Landroid/net/a/p;->eX:Landroid/net/a/d;

    invoke-static {v0}, Landroid/net/a/d;->e(Landroid/net/a/d;)V

    return-void
.end method

.method public final exit()V
    .locals 1

    iget-object v0, p0, Landroid/net/a/p;->eX:Landroid/net/a/d;

    invoke-static {v0}, Landroid/net/a/d;->q(Landroid/net/a/d;)Lcom/android/internal/util/WakeupMessage;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/util/WakeupMessage;->cancel()V

    return-void
.end method

.method public final processMessage(Landroid/os/Message;)Z
    .locals 2

    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_2

    const/4 v1, 0x6

    if-eq v0, v1, :cond_1

    const/16 v1, 0xa

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Landroid/net/a/p;->eX:Landroid/net/a/d;

    invoke-virtual {v0, p1}, Landroid/net/a/d;->deferMessage(Landroid/os/Message;)V

    goto :goto_1

    :cond_0
    iget-object p1, p0, Landroid/net/a/p;->eX:Landroid/net/a/d;

    invoke-static {p1}, Landroid/net/a/d;->t(Landroid/net/a/d;)V

    goto :goto_1

    :cond_1
    iget-object p1, p0, Landroid/net/a/p;->eX:Landroid/net/a/d;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Landroid/net/a/d;->a(Landroid/net/a/d;Z)Z

    invoke-direct {p0}, Landroid/net/a/p;->al()Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Landroid/net/a/p;->eX:Landroid/net/a/d;

    iget-object v0, p0, Landroid/net/a/p;->eX:Landroid/net/a/d;

    invoke-static {v0}, Landroid/net/a/d;->r(Landroid/net/a/d;)Lcom/android/internal/util/State;

    move-result-object v0

    goto :goto_0

    :cond_2
    iget-object p1, p0, Landroid/net/a/p;->eX:Landroid/net/a/d;

    iget-object v0, p0, Landroid/net/a/p;->eX:Landroid/net/a/d;

    invoke-static {v0}, Landroid/net/a/d;->s(Landroid/net/a/d;)Lcom/android/internal/util/State;

    move-result-object v0

    :goto_0
    invoke-virtual {p1, v0}, Landroid/net/a/d;->transitionTo(Lcom/android/internal/util/IState;)V

    :cond_3
    :goto_1
    iget-object p1, p0, Landroid/net/a/p;->eX:Landroid/net/a/d;

    invoke-static {p1}, Landroid/net/a/d;->k(Landroid/net/a/d;)Landroid/net/a/m;

    move-result-object p1

    iget-object v0, p0, Landroid/net/a/p;->eX:Landroid/net/a/d;

    invoke-virtual {v0}, Landroid/net/a/d;->getCurrentState()Lcom/android/internal/util/IState;

    move-result-object v0

    invoke-virtual {p1, p0, v0}, Landroid/net/a/m;->a(Lcom/android/internal/util/State;Lcom/android/internal/util/IState;)V

    const/4 p1, 0x1

    return p1
.end method
