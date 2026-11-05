.class final Landroid/net/dhcp/e;
.super Lcom/android/internal/util/State;


# instance fields
.field final synthetic dB:Landroid/net/dhcp/b;


# direct methods
.method constructor <init>(Landroid/net/dhcp/b;)V
    .locals 0

    iput-object p1, p0, Landroid/net/dhcp/e;->dB:Landroid/net/dhcp/b;

    invoke-direct {p0}, Lcom/android/internal/util/State;-><init>()V

    return-void
.end method


# virtual methods
.method public final exit()V
    .locals 2

    iget-object v0, p0, Landroid/net/dhcp/e;->dB:Landroid/net/dhcp/b;

    invoke-static {v0}, Landroid/net/dhcp/b;->u(Landroid/net/dhcp/b;)Lcom/android/internal/util/WakeupMessage;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/util/WakeupMessage;->cancel()V

    iget-object v0, p0, Landroid/net/dhcp/e;->dB:Landroid/net/dhcp/b;

    invoke-static {v0}, Landroid/net/dhcp/b;->v(Landroid/net/dhcp/b;)Lcom/android/internal/util/WakeupMessage;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/util/WakeupMessage;->cancel()V

    iget-object v0, p0, Landroid/net/dhcp/e;->dB:Landroid/net/dhcp/b;

    invoke-static {v0}, Landroid/net/dhcp/b;->w(Landroid/net/dhcp/b;)Lcom/android/internal/util/WakeupMessage;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/util/WakeupMessage;->cancel()V

    iget-object v0, p0, Landroid/net/dhcp/e;->dB:Landroid/net/dhcp/b;

    invoke-static {v0}, Landroid/net/dhcp/b;->g(Landroid/net/dhcp/b;)V

    iget-object v0, p0, Landroid/net/dhcp/e;->dB:Landroid/net/dhcp/b;

    invoke-static {v0}, Landroid/net/dhcp/b;->c(Landroid/net/dhcp/b;)Lcom/android/internal/util/StateMachine;

    move-result-object v0

    const v1, 0x30007

    invoke-virtual {v0, v1}, Lcom/android/internal/util/StateMachine;->sendMessage(I)V

    return-void
.end method

.method public final processMessage(Landroid/os/Message;)Z
    .locals 1

    iget p1, p1, Landroid/os/Message;->what:I

    const v0, 0x3006a

    if-eq p1, v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    const-string p1, "DhcpClient"

    const-string v0, "Lease expired!"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Landroid/net/dhcp/e;->dB:Landroid/net/dhcp/b;

    invoke-static {p1}, Landroid/net/dhcp/b;->k(Landroid/net/dhcp/b;)V

    iget-object p1, p0, Landroid/net/dhcp/e;->dB:Landroid/net/dhcp/b;

    iget-object v0, p0, Landroid/net/dhcp/e;->dB:Landroid/net/dhcp/b;

    invoke-static {v0}, Landroid/net/dhcp/b;->f(Landroid/net/dhcp/b;)Lcom/android/internal/util/State;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/net/dhcp/b;->transitionTo(Lcom/android/internal/util/IState;)V

    const/4 p1, 0x1

    return p1
.end method
