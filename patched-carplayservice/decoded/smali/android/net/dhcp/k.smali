.class final Landroid/net/dhcp/k;
.super Landroid/net/dhcp/h;


# instance fields
.field final synthetic dB:Landroid/net/dhcp/b;


# direct methods
.method public constructor <init>(Landroid/net/dhcp/b;)V
    .locals 0

    iput-object p1, p0, Landroid/net/dhcp/k;->dB:Landroid/net/dhcp/b;

    invoke-direct {p0, p1}, Landroid/net/dhcp/h;-><init>(Landroid/net/dhcp/b;)V

    const-string p1, "Renewed"

    iput-object p1, p0, Landroid/net/dhcp/k;->dC:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected final P()Ljava/net/Inet4Address;
    .locals 1

    iget-object v0, p0, Landroid/net/dhcp/k;->dB:Landroid/net/dhcp/b;

    invoke-static {v0}, Landroid/net/dhcp/b;->x(Landroid/net/dhcp/b;)Landroid/net/DhcpResults;

    move-result-object v0

    iget-object v0, v0, Landroid/net/DhcpResults;->serverAddress:Ljava/net/Inet4Address;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/net/dhcp/k;->dB:Landroid/net/dhcp/b;

    invoke-static {v0}, Landroid/net/dhcp/b;->x(Landroid/net/dhcp/b;)Landroid/net/DhcpResults;

    move-result-object v0

    iget-object v0, v0, Landroid/net/DhcpResults;->serverAddress:Ljava/net/Inet4Address;

    return-object v0

    :cond_0
    sget-object v0, Landroid/net/dhcp/DhcpPacket;->dI:Ljava/net/Inet4Address;

    return-object v0
.end method

.method public final processMessage(Landroid/os/Message;)Z
    .locals 2

    invoke-super {p0, p1}, Landroid/net/dhcp/h;->processMessage(Landroid/os/Message;)Z

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    return v1

    :cond_0
    iget p1, p1, Landroid/os/Message;->what:I

    const v0, 0x30069

    if-eq p1, v0, :cond_1

    const/4 p1, 0x0

    return p1

    :cond_1
    iget-object p1, p0, Landroid/net/dhcp/k;->dB:Landroid/net/dhcp/b;

    iget-object v0, p0, Landroid/net/dhcp/k;->dB:Landroid/net/dhcp/b;

    invoke-static {v0}, Landroid/net/dhcp/b;->E(Landroid/net/dhcp/b;)Lcom/android/internal/util/State;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/net/dhcp/b;->transitionTo(Lcom/android/internal/util/IState;)V

    return v1
.end method
