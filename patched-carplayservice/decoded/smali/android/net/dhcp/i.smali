.class final Landroid/net/dhcp/i;
.super Landroid/net/dhcp/h;


# instance fields
.field final synthetic dB:Landroid/net/dhcp/b;


# direct methods
.method public constructor <init>(Landroid/net/dhcp/b;)V
    .locals 0

    iput-object p1, p0, Landroid/net/dhcp/i;->dB:Landroid/net/dhcp/b;

    invoke-direct {p0, p1}, Landroid/net/dhcp/h;-><init>(Landroid/net/dhcp/b;)V

    const-string p1, "Rebound"

    iput-object p1, p0, Landroid/net/dhcp/i;->dC:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected final P()Ljava/net/Inet4Address;
    .locals 1

    sget-object v0, Landroid/net/dhcp/DhcpPacket;->dI:Ljava/net/Inet4Address;

    return-object v0
.end method

.method public final enter()V
    .locals 2

    invoke-super {p0}, Landroid/net/dhcp/h;->enter()V

    iget-object v0, p0, Landroid/net/dhcp/i;->dB:Landroid/net/dhcp/b;

    invoke-static {v0}, Landroid/net/dhcp/b;->F(Landroid/net/dhcp/b;)Ljava/io/FileDescriptor;

    move-result-object v0

    invoke-static {v0}, Landroid/net/dhcp/b;->a(Ljava/io/FileDescriptor;)V

    iget-object v0, p0, Landroid/net/dhcp/i;->dB:Landroid/net/dhcp/b;

    invoke-static {v0}, Landroid/net/dhcp/b;->G(Landroid/net/dhcp/b;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "DhcpClient"

    const-string v1, "Failed to recreate UDP socket"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Landroid/net/dhcp/i;->dB:Landroid/net/dhcp/b;

    iget-object v1, p0, Landroid/net/dhcp/i;->dB:Landroid/net/dhcp/b;

    invoke-static {v1}, Landroid/net/dhcp/b;->f(Landroid/net/dhcp/b;)Lcom/android/internal/util/State;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/net/dhcp/b;->transitionTo(Lcom/android/internal/util/IState;)V

    :cond_0
    return-void
.end method
