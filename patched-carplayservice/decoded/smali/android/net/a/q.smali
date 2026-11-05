.class final Landroid/net/a/q;
.super Lcom/android/internal/util/State;


# instance fields
.field final synthetic eX:Landroid/net/a/d;


# direct methods
.method constructor <init>(Landroid/net/a/d;)V
    .locals 0

    iput-object p1, p0, Landroid/net/a/q;->eX:Landroid/net/a/d;

    invoke-direct {p0}, Lcom/android/internal/util/State;-><init>()V

    return-void
.end method


# virtual methods
.method public final enter()V
    .locals 4

    iget-object v0, p0, Landroid/net/a/q;->eX:Landroid/net/a/d;

    invoke-static {v0}, Landroid/net/a/d;->e(Landroid/net/a/d;)V

    iget-object v0, p0, Landroid/net/a/q;->eX:Landroid/net/a/d;

    invoke-static {v0}, Landroid/net/a/d;->f(Landroid/net/a/d;)V

    iget-object v0, p0, Landroid/net/a/q;->eX:Landroid/net/a/d;

    invoke-static {v0}, Landroid/net/a/d;->g(Landroid/net/a/d;)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    iget-object v0, p0, Landroid/net/a/q;->eX:Landroid/net/a/d;

    invoke-static {v0}, Landroid/net/a/d;->h(Landroid/net/a/d;)V

    iget-object v0, p0, Landroid/net/a/q;->eX:Landroid/net/a/d;

    invoke-static {v0, v2, v3}, Landroid/net/a/d;->a(Landroid/net/a/d;J)J

    :cond_0
    return-void
.end method

.method public final processMessage(Landroid/os/Message;)Z
    .locals 3

    iget v0, p1, Landroid/os/Message;->what:I

    const v1, 0x30005

    const/4 v2, 0x0

    if-eq v0, v1, :cond_0

    packed-switch v0, :pswitch_data_0

    packed-switch v0, :pswitch_data_1

    return v2

    :pswitch_0
    iget-object v0, p0, Landroid/net/a/q;->eX:Landroid/net/a/d;

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-static {v0, p1}, Landroid/net/a/d;->b(Landroid/net/a/d;Z)Z

    goto :goto_1

    :pswitch_1
    iget-object v0, p0, Landroid/net/a/q;->eX:Landroid/net/a/d;

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Landroid/net/ProxyInfo;

    invoke-static {v0, p1}, Landroid/net/a/d;->a(Landroid/net/a/d;Landroid/net/ProxyInfo;)Landroid/net/ProxyInfo;

    goto :goto_0

    :pswitch_2
    iget-object v0, p0, Landroid/net/a/q;->eX:Landroid/net/a/d;

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, p1}, Landroid/net/a/d;->a(Landroid/net/a/d;Ljava/lang/String;)Ljava/lang/String;

    :goto_0
    :pswitch_3
    iget-object p1, p0, Landroid/net/a/q;->eX:Landroid/net/a/d;

    invoke-static {p1, v2}, Landroid/net/a/d;->a(Landroid/net/a/d;Z)Z

    goto :goto_1

    :pswitch_4
    iget-object v0, p0, Landroid/net/a/q;->eX:Landroid/net/a/d;

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Landroid/net/a/n;

    invoke-static {v0, p1}, Landroid/net/a/d;->a(Landroid/net/a/d;Landroid/net/a/n;)Landroid/net/a/n;

    iget-object p1, p0, Landroid/net/a/q;->eX:Landroid/net/a/d;

    iget-object v0, p0, Landroid/net/a/q;->eX:Landroid/net/a/d;

    invoke-static {v0}, Landroid/net/a/d;->j(Landroid/net/a/d;)Lcom/android/internal/util/State;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/net/a/d;->transitionTo(Lcom/android/internal/util/IState;)V

    goto :goto_1

    :pswitch_5
    iget-object p1, p0, Landroid/net/a/q;->eX:Landroid/net/a/d;

    invoke-static {p1}, Landroid/net/a/d;->i(Landroid/net/a/d;)V

    iget-object p1, p0, Landroid/net/a/q;->eX:Landroid/net/a/d;

    invoke-virtual {p1}, Landroid/net/a/d;->quit()V

    goto :goto_1

    :cond_0
    iget-object p1, p0, Landroid/net/a/q;->eX:Landroid/net/a/d;

    const-string v0, "Unexpected CMD_ON_QUIT (already stopped)."

    new-array v1, v2, [Ljava/lang/Object;

    invoke-static {p1, v0, v1}, Landroid/net/a/d;->a(Landroid/net/a/d;Ljava/lang/String;[Ljava/lang/Object;)V

    :goto_1
    :pswitch_6
    iget-object p1, p0, Landroid/net/a/q;->eX:Landroid/net/a/d;

    invoke-static {p1}, Landroid/net/a/d;->k(Landroid/net/a/d;)Landroid/net/a/m;

    move-result-object p1

    iget-object v0, p0, Landroid/net/a/q;->eX:Landroid/net/a/d;

    invoke-virtual {v0}, Landroid/net/a/d;->getCurrentState()Lcom/android/internal/util/IState;

    move-result-object v0

    invoke-virtual {p1, p0, v0}, Landroid/net/a/m;->a(Lcom/android/internal/util/State;Lcom/android/internal/util/IState;)V

    const/4 p1, 0x1

    return p1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_6
        :pswitch_4
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x6
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
