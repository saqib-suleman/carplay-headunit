.class public final Lcom/autochips/carplay/service/y;
.super Lcom/autochips/carplay/service/q;


# instance fields
.field final synthetic uD:Lcom/autochips/carplay/service/p;


# direct methods
.method public constructor <init>(Lcom/autochips/carplay/service/p;)V
    .locals 1

    iput-object p1, p0, Lcom/autochips/carplay/service/y;->uD:Lcom/autochips/carplay/service/p;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/autochips/carplay/service/q;-><init>(Lcom/autochips/carplay/service/p;B)V

    return-void
.end method


# virtual methods
.method public final enter()V
    .locals 2

    invoke-super {p0}, Lcom/autochips/carplay/service/q;->enter()V

    iget-object v0, p0, Lcom/autochips/carplay/service/y;->uD:Lcom/autochips/carplay/service/p;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/autochips/carplay/service/p;->a(Lcom/autochips/carplay/service/p;I)V

    return-void
.end method

.method public final exit()V
    .locals 0

    invoke-super {p0}, Lcom/autochips/carplay/service/q;->exit()V

    return-void
.end method

.method public final declared-synchronized processMessage(Landroid/os/Message;)Z
    .locals 3

    monitor-enter p0

    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "processMessage: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p1, Landroid/os/Message;->what:I

    invoke-static {v1}, Lcom/autochips/carplay/common/CarplayMessage;->messageString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/service/y;->B(Ljava/lang/String;)V

    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x10a

    const/4 v2, 0x1

    if-eq v0, v1, :cond_3

    const/16 v1, 0x50d

    if-eq v0, v1, :cond_1

    const/16 v1, 0x529

    if-eq v0, v1, :cond_2

    const/16 v1, 0x70a

    if-eq v0, v1, :cond_0

    packed-switch v0, :pswitch_data_0

    packed-switch v0, :pswitch_data_1

    packed-switch v0, :pswitch_data_2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Unhandled message - "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget p1, p1, Landroid/os/Message;->what:I

    invoke-static {p1}, Lcom/autochips/carplay/common/CarplayMessage;->messageString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/service/y;->B(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 p1, 0x0

    monitor-exit p0

    return p1

    :pswitch_0
    const/4 p1, 0x3

    :try_start_1
    invoke-static {p1}, Lcom/autochips/carplay/service/p;->al(I)V

    goto :goto_1

    :pswitch_1
    iget p1, p1, Landroid/os/Message;->arg1:I

    invoke-static {p1}, Lcom/autochips/carplay/service/p;->al(I)V

    goto :goto_1

    :pswitch_2
    iget-object v0, p0, Lcom/autochips/carplay/service/y;->uD:Lcom/autochips/carplay/service/p;

    invoke-virtual {v0, p1}, Lcom/autochips/carplay/service/p;->deferMessage(Landroid/os/Message;)V

    goto :goto_1

    :cond_0
    iget-object v0, p0, Lcom/autochips/carplay/service/y;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0}, Lcom/autochips/carplay/service/p;->m(Lcom/autochips/carplay/service/p;)V

    iget-object v0, p0, Lcom/autochips/carplay/service/y;->uD:Lcom/autochips/carplay/service/p;

    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Lcom/autochips/carplay/CarplayDevice;

    invoke-static {v0, v1}, Lcom/autochips/carplay/service/p;->a(Lcom/autochips/carplay/service/p;Lcom/autochips/carplay/CarplayDevice;)V

    iget-object v0, p0, Lcom/autochips/carplay/service/y;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0}, Lcom/autochips/carplay/service/p;->j(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/b/d;

    move-result-object v0

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/autochips/carplay/CarplayDevice;

    invoke-virtual {v0, p1}, Lcom/autochips/carplay/b/d;->a(Lcom/autochips/carplay/CarplayDevice;)Lcom/autochips/carplay/common/f;

    move-result-object p1

    iget-object v0, p0, Lcom/autochips/carplay/service/y;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0}, Lcom/autochips/carplay/service/p;->b(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/service/i;

    move-result-object v0

    invoke-virtual {v0, p1, v2}, Lcom/autochips/carplay/service/i;->a(Lcom/autochips/carplay/common/f;I)Z

    iget-object p1, p0, Lcom/autochips/carplay/service/y;->uD:Lcom/autochips/carplay/service/p;

    iget-object v0, p0, Lcom/autochips/carplay/service/y;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0}, Lcom/autochips/carplay/service/p;->k(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/service/t;

    move-result-object v0

    :goto_0
    invoke-virtual {p1, v0}, Lcom/autochips/carplay/service/p;->transitionTo(Lcom/android/internal/util/IState;)V

    goto :goto_1

    :cond_1
    iget-object p1, p0, Lcom/autochips/carplay/service/y;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {p1}, Lcom/autochips/carplay/service/p;->n(Lcom/autochips/carplay/service/p;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/y;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {p1}, Lcom/autochips/carplay/service/p;->o(Lcom/autochips/carplay/service/p;)V

    :cond_2
    iget-object p1, p0, Lcom/autochips/carplay/service/y;->uD:Lcom/autochips/carplay/service/p;

    iget-object v0, p0, Lcom/autochips/carplay/service/y;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0}, Lcom/autochips/carplay/service/p;->p(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/service/v;

    move-result-object v0

    goto :goto_0

    :cond_3
    iget v0, p1, Landroid/os/Message;->arg1:I

    if-ne v2, v0, :cond_4

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/autochips/carplay/common/f;

    iget-object v0, p0, Lcom/autochips/carplay/service/y;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0}, Lcom/autochips/carplay/service/p;->b(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/service/i;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/autochips/carplay/service/i;->b(Lcom/autochips/carplay/common/f;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_4
    :goto_1
    monitor-exit p0

    return v2

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1

    nop

    :pswitch_data_0
    .packed-switch 0x103
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x114
        :pswitch_2
        :pswitch_2
        :pswitch_2
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x70c
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
