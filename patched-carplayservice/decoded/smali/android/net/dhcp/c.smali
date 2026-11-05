.class final Landroid/net/dhcp/c;
.super Landroid/net/dhcp/o;


# instance fields
.field final synthetic dB:Landroid/net/dhcp/b;


# direct methods
.method constructor <init>(Landroid/net/dhcp/b;)V
    .locals 0

    iput-object p1, p0, Landroid/net/dhcp/c;->dB:Landroid/net/dhcp/b;

    invoke-direct {p0, p1}, Landroid/net/dhcp/o;-><init>(Landroid/net/dhcp/b;)V

    return-void
.end method


# virtual methods
.method public final enter()V
    .locals 3

    invoke-super {p0}, Landroid/net/dhcp/o;->enter()V

    iget-object v0, p0, Landroid/net/dhcp/c;->dB:Landroid/net/dhcp/b;

    invoke-static {v0}, Landroid/net/dhcp/b;->c(Landroid/net/dhcp/b;)Lcom/android/internal/util/StateMachine;

    move-result-object v0

    iget-object v1, p0, Landroid/net/dhcp/c;->dB:Landroid/net/dhcp/b;

    invoke-static {v1}, Landroid/net/dhcp/b;->x(Landroid/net/dhcp/b;)Landroid/net/DhcpResults;

    move-result-object v1

    iget-object v1, v1, Landroid/net/DhcpResults;->ipAddress:Landroid/net/LinkAddress;

    const v2, 0x30008

    invoke-virtual {v0, v2, v1}, Lcom/android/internal/util/StateMachine;->sendMessage(ILjava/lang/Object;)V

    return-void
.end method

.method public final processMessage(Landroid/os/Message;)Z
    .locals 1

    invoke-super {p0, p1}, Landroid/net/dhcp/o;->processMessage(Landroid/os/Message;)Z

    iget p1, p1, Landroid/os/Message;->what:I

    const v0, 0x30009

    if-eq p1, v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    iget-object p1, p0, Landroid/net/dhcp/c;->dB:Landroid/net/dhcp/b;

    iget-object v0, p0, Landroid/net/dhcp/c;->dB:Landroid/net/dhcp/b;

    invoke-static {v0}, Landroid/net/dhcp/b;->y(Landroid/net/dhcp/b;)Lcom/android/internal/util/State;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/net/dhcp/b;->transitionTo(Lcom/android/internal/util/IState;)V

    const/4 p1, 0x1

    return p1
.end method
