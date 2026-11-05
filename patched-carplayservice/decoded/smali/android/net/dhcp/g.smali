.class final Landroid/net/dhcp/g;
.super Landroid/net/dhcp/p;


# instance fields
.field final synthetic dB:Landroid/net/dhcp/b;


# direct methods
.method public constructor <init>(Landroid/net/dhcp/b;)V
    .locals 0

    iput-object p1, p0, Landroid/net/dhcp/g;->dB:Landroid/net/dhcp/b;

    invoke-direct {p0, p1}, Landroid/net/dhcp/p;-><init>(Landroid/net/dhcp/b;)V

    return-void
.end method


# virtual methods
.method protected final O()Z
    .locals 1

    iget-object v0, p0, Landroid/net/dhcp/g;->dB:Landroid/net/dhcp/b;

    invoke-static {v0}, Landroid/net/dhcp/b;->q(Landroid/net/dhcp/b;)Z

    move-result v0

    return v0
.end method

.method protected final c(Landroid/net/dhcp/DhcpPacket;)V
    .locals 2

    iget-object v0, p0, Landroid/net/dhcp/g;->dB:Landroid/net/dhcp/b;

    invoke-virtual {v0, p1}, Landroid/net/dhcp/b;->a(Landroid/net/dhcp/DhcpPacket;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    instance-of v0, p1, Landroid/net/dhcp/z;

    if-nez v0, :cond_1

    return-void

    :cond_1
    iget-object v0, p0, Landroid/net/dhcp/g;->dB:Landroid/net/dhcp/b;

    invoke-virtual {p1}, Landroid/net/dhcp/DhcpPacket;->T()Landroid/net/DhcpResults;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/net/dhcp/b;->a(Landroid/net/dhcp/b;Landroid/net/DhcpResults;)Landroid/net/DhcpResults;

    iget-object p1, p0, Landroid/net/dhcp/g;->dB:Landroid/net/dhcp/b;

    invoke-static {p1}, Landroid/net/dhcp/b;->r(Landroid/net/dhcp/b;)Landroid/net/DhcpResults;

    move-result-object p1

    if-eqz p1, :cond_2

    const-string p1, "DhcpClient"

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Got pending lease: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Landroid/net/dhcp/g;->dB:Landroid/net/dhcp/b;

    invoke-static {v1}, Landroid/net/dhcp/b;->r(Landroid/net/dhcp/b;)Landroid/net/DhcpResults;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Landroid/net/dhcp/g;->dB:Landroid/net/dhcp/b;

    iget-object v0, p0, Landroid/net/dhcp/g;->dB:Landroid/net/dhcp/b;

    invoke-static {v0}, Landroid/net/dhcp/b;->s(Landroid/net/dhcp/b;)Lcom/android/internal/util/State;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/net/dhcp/b;->transitionTo(Lcom/android/internal/util/IState;)V

    :cond_2
    return-void
.end method

.method public final enter()V
    .locals 3

    invoke-super {p0}, Landroid/net/dhcp/p;->enter()V

    iget-object v0, p0, Landroid/net/dhcp/g;->dB:Landroid/net/dhcp/b;

    invoke-static {v0}, Landroid/net/dhcp/b;->p(Landroid/net/dhcp/b;)V

    iget-object v0, p0, Landroid/net/dhcp/g;->dB:Landroid/net/dhcp/b;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    invoke-static {v0, v1, v2}, Landroid/net/dhcp/b;->a(Landroid/net/dhcp/b;J)J

    return-void
.end method
