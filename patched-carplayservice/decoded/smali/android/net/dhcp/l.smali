.class final Landroid/net/dhcp/l;
.super Landroid/net/dhcp/p;


# instance fields
.field final synthetic dB:Landroid/net/dhcp/b;


# direct methods
.method public constructor <init>(Landroid/net/dhcp/b;)V
    .locals 0

    iput-object p1, p0, Landroid/net/dhcp/l;->dB:Landroid/net/dhcp/b;

    invoke-direct {p0, p1}, Landroid/net/dhcp/p;-><init>(Landroid/net/dhcp/b;)V

    const/16 p1, 0x4650

    iput p1, p0, Landroid/net/dhcp/l;->dF:I

    return-void
.end method


# virtual methods
.method protected final O()Z
    .locals 5

    iget-object v0, p0, Landroid/net/dhcp/l;->dB:Landroid/net/dhcp/b;

    sget-object v1, Landroid/net/dhcp/DhcpPacket;->dH:Ljava/net/Inet4Address;

    iget-object v2, p0, Landroid/net/dhcp/l;->dB:Landroid/net/dhcp/b;

    invoke-static {v2}, Landroid/net/dhcp/b;->r(Landroid/net/dhcp/b;)Landroid/net/DhcpResults;

    move-result-object v2

    iget-object v2, v2, Landroid/net/DhcpResults;->ipAddress:Landroid/net/LinkAddress;

    invoke-virtual {v2}, Landroid/net/LinkAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v2

    check-cast v2, Ljava/net/Inet4Address;

    iget-object v3, p0, Landroid/net/dhcp/l;->dB:Landroid/net/dhcp/b;

    invoke-static {v3}, Landroid/net/dhcp/b;->r(Landroid/net/dhcp/b;)Landroid/net/DhcpResults;

    move-result-object v3

    iget-object v3, v3, Landroid/net/DhcpResults;->serverAddress:Ljava/net/Inet4Address;

    sget-object v4, Landroid/net/dhcp/DhcpPacket;->dI:Ljava/net/Inet4Address;

    invoke-static {v0, v1, v2, v3, v4}, Landroid/net/dhcp/b;->a(Landroid/net/dhcp/b;Ljava/net/Inet4Address;Ljava/net/Inet4Address;Ljava/net/Inet4Address;Ljava/net/Inet4Address;)Z

    move-result v0

    return v0
.end method

.method protected final Q()V
    .locals 2

    iget-object v0, p0, Landroid/net/dhcp/l;->dB:Landroid/net/dhcp/b;

    iget-object v1, p0, Landroid/net/dhcp/l;->dB:Landroid/net/dhcp/b;

    invoke-static {v1}, Landroid/net/dhcp/b;->f(Landroid/net/dhcp/b;)Lcom/android/internal/util/State;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/net/dhcp/b;->transitionTo(Lcom/android/internal/util/IState;)V

    return-void
.end method

.method protected final c(Landroid/net/dhcp/DhcpPacket;)V
    .locals 2

    iget-object v0, p0, Landroid/net/dhcp/l;->dB:Landroid/net/dhcp/b;

    invoke-virtual {v0, p1}, Landroid/net/dhcp/b;->a(Landroid/net/dhcp/DhcpPacket;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    instance-of v0, p1, Landroid/net/dhcp/a;

    if-eqz v0, :cond_2

    invoke-virtual {p1}, Landroid/net/dhcp/DhcpPacket;->T()Landroid/net/DhcpResults;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v1, p0, Landroid/net/dhcp/l;->dB:Landroid/net/dhcp/b;

    invoke-virtual {v1, p1}, Landroid/net/dhcp/b;->b(Landroid/net/dhcp/DhcpPacket;)V

    iget-object p1, p0, Landroid/net/dhcp/l;->dB:Landroid/net/dhcp/b;

    const-string v1, "Confirmed"

    invoke-static {p1, v0, v1}, Landroid/net/dhcp/b;->a(Landroid/net/dhcp/b;Landroid/net/DhcpResults;Ljava/lang/String;)V

    iget-object p1, p0, Landroid/net/dhcp/l;->dB:Landroid/net/dhcp/b;

    iget-object v0, p0, Landroid/net/dhcp/l;->dB:Landroid/net/dhcp/b;

    invoke-static {v0}, Landroid/net/dhcp/b;->t(Landroid/net/dhcp/b;)Lcom/android/internal/util/State;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/net/dhcp/b;->transitionTo(Lcom/android/internal/util/IState;)V

    :cond_1
    return-void

    :cond_2
    instance-of p1, p1, Landroid/net/dhcp/y;

    if-eqz p1, :cond_3

    const-string p1, "DhcpClient"

    const-string v0, "Received NAK, returning to INIT"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Landroid/net/dhcp/l;->dB:Landroid/net/dhcp/b;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Landroid/net/dhcp/b;->a(Landroid/net/dhcp/b;Landroid/net/DhcpResults;)Landroid/net/DhcpResults;

    iget-object p1, p0, Landroid/net/dhcp/l;->dB:Landroid/net/dhcp/b;

    iget-object v0, p0, Landroid/net/dhcp/l;->dB:Landroid/net/dhcp/b;

    invoke-static {v0}, Landroid/net/dhcp/b;->f(Landroid/net/dhcp/b;)Lcom/android/internal/util/State;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/net/dhcp/b;->transitionTo(Lcom/android/internal/util/IState;)V

    :cond_3
    return-void
.end method
