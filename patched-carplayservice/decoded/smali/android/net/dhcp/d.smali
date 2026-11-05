.class final Landroid/net/dhcp/d;
.super Landroid/net/dhcp/o;


# instance fields
.field final synthetic dB:Landroid/net/dhcp/b;


# direct methods
.method constructor <init>(Landroid/net/dhcp/b;)V
    .locals 0

    iput-object p1, p0, Landroid/net/dhcp/d;->dB:Landroid/net/dhcp/b;

    invoke-direct {p0, p1}, Landroid/net/dhcp/o;-><init>(Landroid/net/dhcp/b;)V

    return-void
.end method


# virtual methods
.method public final enter()V
    .locals 6

    invoke-super {p0}, Landroid/net/dhcp/o;->enter()V

    iget-object v0, p0, Landroid/net/dhcp/d;->dB:Landroid/net/dhcp/b;

    invoke-static {v0}, Landroid/net/dhcp/b;->x(Landroid/net/dhcp/b;)Landroid/net/DhcpResults;

    move-result-object v0

    iget-object v0, v0, Landroid/net/DhcpResults;->serverAddress:Ljava/net/Inet4Address;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/net/dhcp/d;->dB:Landroid/net/dhcp/b;

    iget-object v1, p0, Landroid/net/dhcp/d;->dB:Landroid/net/dhcp/b;

    invoke-static {v1}, Landroid/net/dhcp/b;->x(Landroid/net/dhcp/b;)Landroid/net/DhcpResults;

    move-result-object v1

    iget-object v1, v1, Landroid/net/DhcpResults;->serverAddress:Ljava/net/Inet4Address;

    invoke-static {v0, v1}, Landroid/net/dhcp/b;->a(Landroid/net/dhcp/b;Ljava/net/Inet4Address;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Landroid/net/dhcp/d;->dB:Landroid/net/dhcp/b;

    invoke-static {v0}, Landroid/net/dhcp/b;->k(Landroid/net/dhcp/b;)V

    iget-object v0, p0, Landroid/net/dhcp/d;->dB:Landroid/net/dhcp/b;

    iget-object v1, p0, Landroid/net/dhcp/d;->dB:Landroid/net/dhcp/b;

    invoke-static {v1}, Landroid/net/dhcp/b;->l(Landroid/net/dhcp/b;)Lcom/android/internal/util/State;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/net/dhcp/b;->transitionTo(Lcom/android/internal/util/IState;)V

    :cond_0
    iget-object v0, p0, Landroid/net/dhcp/d;->dB:Landroid/net/dhcp/b;

    invoke-static {v0}, Landroid/net/dhcp/b;->z(Landroid/net/dhcp/b;)V

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-object v2, p0, Landroid/net/dhcp/d;->dB:Landroid/net/dhcp/b;

    invoke-static {v2}, Landroid/net/dhcp/b;->C(Landroid/net/dhcp/b;)J

    move-result-wide v2

    iget-object v4, p0, Landroid/net/dhcp/d;->dB:Landroid/net/dhcp/b;

    invoke-static {v4}, Landroid/net/dhcp/b;->D(Landroid/net/dhcp/b;)J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-lez v2, :cond_1

    iget-object v2, p0, Landroid/net/dhcp/d;->dB:Landroid/net/dhcp/b;

    const-string v3, "RenewingBoundState"

    iget-object v4, p0, Landroid/net/dhcp/d;->dB:Landroid/net/dhcp/b;

    invoke-static {v4}, Landroid/net/dhcp/b;->C(Landroid/net/dhcp/b;)J

    move-result-wide v4

    :goto_0
    sub-long/2addr v0, v4

    long-to-int v0, v0

    invoke-static {v2, v3, v0}, Landroid/net/dhcp/b;->a(Landroid/net/dhcp/b;Ljava/lang/String;I)V

    return-void

    :cond_1
    iget-object v2, p0, Landroid/net/dhcp/d;->dB:Landroid/net/dhcp/b;

    const-string v3, "InitialBoundState"

    iget-object v4, p0, Landroid/net/dhcp/d;->dB:Landroid/net/dhcp/b;

    invoke-static {v4}, Landroid/net/dhcp/b;->D(Landroid/net/dhcp/b;)J

    move-result-wide v4

    goto :goto_0
.end method

.method public final exit()V
    .locals 3

    invoke-super {p0}, Landroid/net/dhcp/o;->exit()V

    iget-object v0, p0, Landroid/net/dhcp/d;->dB:Landroid/net/dhcp/b;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    invoke-static {v0, v1, v2}, Landroid/net/dhcp/b;->b(Landroid/net/dhcp/b;J)J

    return-void
.end method

.method public final processMessage(Landroid/os/Message;)Z
    .locals 1

    invoke-super {p0, p1}, Landroid/net/dhcp/o;->processMessage(Landroid/os/Message;)Z

    iget p1, p1, Landroid/os/Message;->what:I

    const v0, 0x30068

    if-eq p1, v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    iget-object p1, p0, Landroid/net/dhcp/d;->dB:Landroid/net/dhcp/b;

    invoke-static {p1}, Landroid/net/dhcp/b;->d(Landroid/net/dhcp/b;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Landroid/net/dhcp/d;->dB:Landroid/net/dhcp/b;

    iget-object v0, p0, Landroid/net/dhcp/d;->dB:Landroid/net/dhcp/b;

    invoke-static {v0}, Landroid/net/dhcp/b;->A(Landroid/net/dhcp/b;)Lcom/android/internal/util/State;

    move-result-object v0

    :goto_0
    invoke-virtual {p1, v0}, Landroid/net/dhcp/b;->transitionTo(Lcom/android/internal/util/IState;)V

    goto :goto_1

    :cond_1
    iget-object p1, p0, Landroid/net/dhcp/d;->dB:Landroid/net/dhcp/b;

    iget-object v0, p0, Landroid/net/dhcp/d;->dB:Landroid/net/dhcp/b;

    invoke-static {v0}, Landroid/net/dhcp/b;->B(Landroid/net/dhcp/b;)Lcom/android/internal/util/State;

    move-result-object v0

    goto :goto_0

    :goto_1
    const/4 p1, 0x1

    return p1
.end method
