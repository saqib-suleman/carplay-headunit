.class abstract Landroid/net/dhcp/h;
.super Landroid/net/dhcp/p;


# instance fields
.field final synthetic dB:Landroid/net/dhcp/b;

.field protected dC:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/net/dhcp/b;)V
    .locals 0

    iput-object p1, p0, Landroid/net/dhcp/h;->dB:Landroid/net/dhcp/b;

    invoke-direct {p0, p1}, Landroid/net/dhcp/p;-><init>(Landroid/net/dhcp/b;)V

    return-void
.end method


# virtual methods
.method protected final O()Z
    .locals 5

    iget-object v0, p0, Landroid/net/dhcp/h;->dB:Landroid/net/dhcp/b;

    iget-object v1, p0, Landroid/net/dhcp/h;->dB:Landroid/net/dhcp/b;

    invoke-static {v1}, Landroid/net/dhcp/b;->x(Landroid/net/dhcp/b;)Landroid/net/DhcpResults;

    move-result-object v1

    iget-object v1, v1, Landroid/net/DhcpResults;->ipAddress:Landroid/net/LinkAddress;

    invoke-virtual {v1}, Landroid/net/LinkAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v1

    check-cast v1, Ljava/net/Inet4Address;

    sget-object v2, Landroid/net/dhcp/DhcpPacket;->dH:Ljava/net/Inet4Address;

    invoke-virtual {p0}, Landroid/net/dhcp/h;->P()Ljava/net/Inet4Address;

    move-result-object v3

    const/4 v4, 0x0

    invoke-static {v0, v1, v2, v4, v3}, Landroid/net/dhcp/b;->a(Landroid/net/dhcp/b;Ljava/net/Inet4Address;Ljava/net/Inet4Address;Ljava/net/Inet4Address;Ljava/net/Inet4Address;)Z

    move-result v0

    return v0
.end method

.method protected abstract P()Ljava/net/Inet4Address;
.end method

.method protected final c(Landroid/net/dhcp/DhcpPacket;)V
    .locals 3

    iget-object v0, p0, Landroid/net/dhcp/h;->dB:Landroid/net/dhcp/b;

    invoke-virtual {v0, p1}, Landroid/net/dhcp/b;->a(Landroid/net/dhcp/DhcpPacket;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    instance-of v0, p1, Landroid/net/dhcp/a;

    if-eqz v0, :cond_3

    invoke-virtual {p1}, Landroid/net/dhcp/DhcpPacket;->T()Landroid/net/DhcpResults;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v1, p0, Landroid/net/dhcp/h;->dB:Landroid/net/dhcp/b;

    invoke-static {v1}, Landroid/net/dhcp/b;->x(Landroid/net/dhcp/b;)Landroid/net/DhcpResults;

    move-result-object v1

    iget-object v1, v1, Landroid/net/DhcpResults;->ipAddress:Landroid/net/LinkAddress;

    iget-object v2, v0, Landroid/net/DhcpResults;->ipAddress:Landroid/net/LinkAddress;

    invoke-virtual {v1, v2}, Landroid/net/LinkAddress;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "DhcpClient"

    const-string v2, "Renewed lease not for our current IP address!"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, p0, Landroid/net/dhcp/h;->dB:Landroid/net/dhcp/b;

    invoke-static {v1}, Landroid/net/dhcp/b;->k(Landroid/net/dhcp/b;)V

    iget-object v1, p0, Landroid/net/dhcp/h;->dB:Landroid/net/dhcp/b;

    iget-object v2, p0, Landroid/net/dhcp/h;->dB:Landroid/net/dhcp/b;

    invoke-static {v2}, Landroid/net/dhcp/b;->f(Landroid/net/dhcp/b;)Lcom/android/internal/util/State;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/net/dhcp/b;->transitionTo(Lcom/android/internal/util/IState;)V

    :cond_1
    iget-object v1, p0, Landroid/net/dhcp/h;->dB:Landroid/net/dhcp/b;

    invoke-virtual {v1, p1}, Landroid/net/dhcp/b;->b(Landroid/net/dhcp/DhcpPacket;)V

    iget-object p1, p0, Landroid/net/dhcp/h;->dB:Landroid/net/dhcp/b;

    iget-object v1, p0, Landroid/net/dhcp/h;->dC:Ljava/lang/String;

    invoke-static {p1, v0, v1}, Landroid/net/dhcp/b;->a(Landroid/net/dhcp/b;Landroid/net/DhcpResults;Ljava/lang/String;)V

    iget-object p1, p0, Landroid/net/dhcp/h;->dB:Landroid/net/dhcp/b;

    iget-object v0, p0, Landroid/net/dhcp/h;->dB:Landroid/net/dhcp/b;

    invoke-static {v0}, Landroid/net/dhcp/b;->y(Landroid/net/dhcp/b;)Lcom/android/internal/util/State;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/net/dhcp/b;->transitionTo(Lcom/android/internal/util/IState;)V

    :cond_2
    return-void

    :cond_3
    instance-of p1, p1, Landroid/net/dhcp/y;

    if-eqz p1, :cond_4

    const-string p1, "DhcpClient"

    const-string v0, "Received NAK, returning to INIT"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Landroid/net/dhcp/h;->dB:Landroid/net/dhcp/b;

    invoke-static {p1}, Landroid/net/dhcp/b;->k(Landroid/net/dhcp/b;)V

    iget-object p1, p0, Landroid/net/dhcp/h;->dB:Landroid/net/dhcp/b;

    iget-object v0, p0, Landroid/net/dhcp/h;->dB:Landroid/net/dhcp/b;

    invoke-static {v0}, Landroid/net/dhcp/b;->f(Landroid/net/dhcp/b;)Lcom/android/internal/util/State;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/net/dhcp/b;->transitionTo(Lcom/android/internal/util/IState;)V

    :cond_4
    return-void
.end method

.method public enter()V
    .locals 1

    invoke-super {p0}, Landroid/net/dhcp/p;->enter()V

    iget-object v0, p0, Landroid/net/dhcp/h;->dB:Landroid/net/dhcp/b;

    invoke-static {v0}, Landroid/net/dhcp/b;->p(Landroid/net/dhcp/b;)V

    return-void
.end method
