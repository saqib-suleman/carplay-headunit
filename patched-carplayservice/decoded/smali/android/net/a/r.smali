.class final Landroid/net/a/r;
.super Lcom/android/internal/util/State;


# instance fields
.field final synthetic eX:Landroid/net/a/d;


# direct methods
.method constructor <init>(Landroid/net/a/d;)V
    .locals 0

    iput-object p1, p0, Landroid/net/a/r;->eX:Landroid/net/a/d;

    invoke-direct {p0}, Lcom/android/internal/util/State;-><init>()V

    return-void
.end method


# virtual methods
.method public final enter()V
    .locals 2

    iget-object v0, p0, Landroid/net/a/r;->eX:Landroid/net/a/d;

    invoke-static {v0}, Landroid/net/a/d;->l(Landroid/net/a/d;)Landroid/net/dhcp/b;

    move-result-object v0

    if-nez v0, :cond_0

    iget-object v0, p0, Landroid/net/a/r;->eX:Landroid/net/a/d;

    iget-object v1, p0, Landroid/net/a/r;->eX:Landroid/net/a/d;

    invoke-static {v1}, Landroid/net/a/d;->m(Landroid/net/a/d;)Lcom/android/internal/util/State;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/net/a/d;->transitionTo(Lcom/android/internal/util/IState;)V

    :cond_0
    return-void
.end method

.method public final processMessage(Landroid/os/Message;)Z
    .locals 2

    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_2

    const v1, 0x30005

    if-eq v0, v1, :cond_1

    const v1, 0x30007

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Landroid/net/a/r;->eX:Landroid/net/a/d;

    invoke-virtual {v0, p1}, Landroid/net/a/d;->deferMessage(Landroid/os/Message;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Landroid/net/a/r;->eX:Landroid/net/a/d;

    invoke-static {p1}, Landroid/net/a/d;->n(Landroid/net/a/d;)Landroid/net/a/c;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/a/c;->W()Z

    goto :goto_0

    :cond_1
    iget-object p1, p0, Landroid/net/a/r;->eX:Landroid/net/a/d;

    invoke-static {p1}, Landroid/net/a/d;->o(Landroid/net/a/d;)Landroid/net/dhcp/b;

    iget-object p1, p0, Landroid/net/a/r;->eX:Landroid/net/a/d;

    iget-object v0, p0, Landroid/net/a/r;->eX:Landroid/net/a/d;

    invoke-static {v0}, Landroid/net/a/d;->m(Landroid/net/a/d;)Lcom/android/internal/util/State;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/net/a/d;->transitionTo(Lcom/android/internal/util/IState;)V

    :cond_2
    :goto_0
    iget-object p1, p0, Landroid/net/a/r;->eX:Landroid/net/a/d;

    invoke-static {p1}, Landroid/net/a/d;->k(Landroid/net/a/d;)Landroid/net/a/m;

    move-result-object p1

    iget-object v0, p0, Landroid/net/a/r;->eX:Landroid/net/a/d;

    invoke-virtual {v0}, Landroid/net/a/d;->getCurrentState()Lcom/android/internal/util/IState;

    move-result-object v0

    invoke-virtual {p1, p0, v0}, Landroid/net/a/m;->a(Lcom/android/internal/util/State;Lcom/android/internal/util/IState;)V

    const/4 p1, 0x1

    return p1
.end method
