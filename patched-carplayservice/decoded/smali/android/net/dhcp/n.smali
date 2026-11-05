.class final Landroid/net/dhcp/n;
.super Lcom/android/internal/util/State;


# instance fields
.field final synthetic dB:Landroid/net/dhcp/b;


# direct methods
.method constructor <init>(Landroid/net/dhcp/b;)V
    .locals 0

    iput-object p1, p0, Landroid/net/dhcp/n;->dB:Landroid/net/dhcp/b;

    invoke-direct {p0}, Lcom/android/internal/util/State;-><init>()V

    return-void
.end method


# virtual methods
.method public final enter()V
    .locals 3

    iget-object v0, p0, Landroid/net/dhcp/n;->dB:Landroid/net/dhcp/b;

    invoke-static {v0}, Landroid/net/dhcp/b;->g(Landroid/net/dhcp/b;)V

    iget-object v0, p0, Landroid/net/dhcp/n;->dB:Landroid/net/dhcp/b;

    invoke-static {v0}, Landroid/net/dhcp/b;->h(Landroid/net/dhcp/b;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/net/dhcp/n;->dB:Landroid/net/dhcp/b;

    invoke-static {v0}, Landroid/net/dhcp/b;->i(Landroid/net/dhcp/b;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/net/dhcp/n;->dB:Landroid/net/dhcp/b;

    new-instance v1, Landroid/net/dhcp/q;

    iget-object v2, p0, Landroid/net/dhcp/n;->dB:Landroid/net/dhcp/b;

    invoke-direct {v1, v2}, Landroid/net/dhcp/q;-><init>(Landroid/net/dhcp/b;)V

    invoke-static {v0, v1}, Landroid/net/dhcp/b;->a(Landroid/net/dhcp/b;Landroid/net/dhcp/q;)Landroid/net/dhcp/q;

    iget-object v0, p0, Landroid/net/dhcp/n;->dB:Landroid/net/dhcp/b;

    invoke-static {v0}, Landroid/net/dhcp/b;->j(Landroid/net/dhcp/b;)Landroid/net/dhcp/q;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/dhcp/q;->start()V

    return-void

    :cond_0
    iget-object v0, p0, Landroid/net/dhcp/n;->dB:Landroid/net/dhcp/b;

    invoke-static {v0}, Landroid/net/dhcp/b;->k(Landroid/net/dhcp/b;)V

    iget-object v0, p0, Landroid/net/dhcp/n;->dB:Landroid/net/dhcp/b;

    iget-object v1, p0, Landroid/net/dhcp/n;->dB:Landroid/net/dhcp/b;

    invoke-static {v1}, Landroid/net/dhcp/b;->l(Landroid/net/dhcp/b;)Lcom/android/internal/util/State;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/net/dhcp/b;->transitionTo(Lcom/android/internal/util/IState;)V

    return-void
.end method

.method public final exit()V
    .locals 2

    iget-object v0, p0, Landroid/net/dhcp/n;->dB:Landroid/net/dhcp/b;

    invoke-static {v0}, Landroid/net/dhcp/b;->j(Landroid/net/dhcp/b;)Landroid/net/dhcp/q;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/net/dhcp/n;->dB:Landroid/net/dhcp/b;

    invoke-static {v0}, Landroid/net/dhcp/b;->j(Landroid/net/dhcp/b;)Landroid/net/dhcp/q;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/dhcp/q;->z()V

    iget-object v0, p0, Landroid/net/dhcp/n;->dB:Landroid/net/dhcp/b;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/net/dhcp/b;->a(Landroid/net/dhcp/b;Landroid/net/dhcp/q;)Landroid/net/dhcp/q;

    :cond_0
    iget-object v0, p0, Landroid/net/dhcp/n;->dB:Landroid/net/dhcp/b;

    invoke-static {v0}, Landroid/net/dhcp/b;->g(Landroid/net/dhcp/b;)V

    return-void
.end method

.method public final processMessage(Landroid/os/Message;)Z
    .locals 1

    invoke-super {p0, p1}, Lcom/android/internal/util/State;->processMessage(Landroid/os/Message;)Z

    iget p1, p1, Landroid/os/Message;->what:I

    const v0, 0x30002

    if-eq p1, v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    iget-object p1, p0, Landroid/net/dhcp/n;->dB:Landroid/net/dhcp/b;

    iget-object v0, p0, Landroid/net/dhcp/n;->dB:Landroid/net/dhcp/b;

    invoke-static {v0}, Landroid/net/dhcp/b;->l(Landroid/net/dhcp/b;)Lcom/android/internal/util/State;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/net/dhcp/b;->transitionTo(Lcom/android/internal/util/IState;)V

    const/4 p1, 0x1

    return p1
.end method
