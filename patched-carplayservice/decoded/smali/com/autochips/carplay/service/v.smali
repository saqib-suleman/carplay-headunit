.class public final Lcom/autochips/carplay/service/v;
.super Lcom/autochips/carplay/service/q;


# instance fields
.field final synthetic uD:Lcom/autochips/carplay/service/p;


# direct methods
.method public constructor <init>(Lcom/autochips/carplay/service/p;)V
    .locals 1

    iput-object p1, p0, Lcom/autochips/carplay/service/v;->uD:Lcom/autochips/carplay/service/p;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/autochips/carplay/service/q;-><init>(Lcom/autochips/carplay/service/p;B)V

    return-void
.end method


# virtual methods
.method public final enter()V
    .locals 4

    invoke-super {p0}, Lcom/autochips/carplay/service/q;->enter()V

    iget-object v0, p0, Lcom/autochips/carplay/service/v;->uD:Lcom/autochips/carplay/service/p;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/autochips/carplay/service/p;->a(Lcom/autochips/carplay/service/p;I)V

    iget-object v0, p0, Lcom/autochips/carplay/service/v;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0}, Lcom/autochips/carplay/service/p;->c(Lcom/autochips/carplay/service/p;)Ljava/util/concurrent/ConcurrentHashMap;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    iget-object v0, p0, Lcom/autochips/carplay/service/v;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0}, Lcom/autochips/carplay/service/p;->d(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/CarplayDevice;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/autochips/carplay/service/v;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0}, Lcom/autochips/carplay/service/p;->d(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/CarplayDevice;

    move-result-object v0

    iget-object v2, p0, Lcom/autochips/carplay/service/v;->uD:Lcom/autochips/carplay/service/p;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/autochips/carplay/service/p;->a(Lcom/autochips/carplay/service/p;Lcom/autochips/carplay/CarplayDevice;)V

    iget-object v2, p0, Lcom/autochips/carplay/service/v;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v2, v0, v1}, Lcom/autochips/carplay/service/p;->a(Lcom/autochips/carplay/service/p;Lcom/autochips/carplay/CarplayDevice;I)V

    :cond_0
    return-void
.end method

.method public final exit()V
    .locals 0

    invoke-super {p0}, Lcom/autochips/carplay/service/q;->exit()V

    return-void
.end method

.method public final declared-synchronized processMessage(Landroid/os/Message;)Z
    .locals 5

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

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/service/v;->B(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/autochips/carplay/service/v;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0}, Lcom/autochips/carplay/service/p;->d(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/CarplayDevice;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/autochips/carplay/service/p;->aB()Ljava/lang/String;

    move-result-object p1

    const-string v0, "ERROR: current device not null in Disconnected"

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v1

    :cond_0
    :try_start_1
    iget v0, p1, Landroid/os/Message;->what:I

    const-wide/16 v2, 0x2710

    const/4 v4, 0x1

    sparse-switch v0, :sswitch_data_0

    new-instance v0, Ljava/lang/StringBuilder;

    goto/16 :goto_2

    :sswitch_0
    iget p1, p1, Landroid/os/Message;->arg1:I

    invoke-static {p1}, Lcom/autochips/carplay/service/p;->al(I)V

    goto/16 :goto_1

    :sswitch_1
    invoke-static {}, Lcom/autochips/carplay/service/p;->aB()Ljava/lang/String;

    move-result-object v0

    const-string v1, "iap not connected"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/service/v;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0}, Lcom/autochips/carplay/service/p;->i(Lcom/autochips/carplay/service/p;)V

    iget-object v0, p0, Lcom/autochips/carplay/service/v;->uD:Lcom/autochips/carplay/service/p;

    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Lcom/autochips/carplay/CarplayDevice;

    invoke-static {v0, v1}, Lcom/autochips/carplay/service/p;->a(Lcom/autochips/carplay/service/p;Lcom/autochips/carplay/CarplayDevice;)V

    iget-object v0, p0, Lcom/autochips/carplay/service/v;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0}, Lcom/autochips/carplay/service/p;->j(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/b/d;

    move-result-object v0

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/autochips/carplay/CarplayDevice;

    invoke-virtual {v0, p1}, Lcom/autochips/carplay/b/d;->a(Lcom/autochips/carplay/CarplayDevice;)Lcom/autochips/carplay/common/f;

    move-result-object p1

    iget-object v0, p0, Lcom/autochips/carplay/service/v;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0}, Lcom/autochips/carplay/service/p;->b(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/service/i;

    move-result-object v0

    invoke-virtual {v0, p1, v4}, Lcom/autochips/carplay/service/i;->a(Lcom/autochips/carplay/common/f;I)Z

    iget-object p1, p0, Lcom/autochips/carplay/service/v;->uD:Lcom/autochips/carplay/service/p;

    iget-object v0, p0, Lcom/autochips/carplay/service/v;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0}, Lcom/autochips/carplay/service/p;->k(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/service/t;

    move-result-object v0

    :goto_0
    invoke-virtual {p1, v0}, Lcom/autochips/carplay/service/p;->transitionTo(Lcom/android/internal/util/IState;)V

    goto :goto_1

    :sswitch_2
    const/4 p1, 0x3

    invoke-static {p1}, Lcom/autochips/carplay/service/p;->al(I)V

    goto :goto_1

    :sswitch_3
    iget-object p1, p0, Lcom/autochips/carplay/service/v;->uD:Lcom/autochips/carplay/service/p;

    iget-object v0, p0, Lcom/autochips/carplay/service/v;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0}, Lcom/autochips/carplay/service/p;->h(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/service/w;

    move-result-object v0

    goto :goto_0

    :sswitch_4
    const/4 p1, 0x4

    invoke-static {p1}, Lcom/autochips/carplay/service/p;->al(I)V

    goto :goto_1

    :sswitch_5
    iget-object p1, p0, Lcom/autochips/carplay/service/v;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {p1}, Lcom/autochips/carplay/service/p;->g(Lcom/autochips/carplay/service/p;)V

    goto :goto_1

    :sswitch_6
    iget-object p1, p0, Lcom/autochips/carplay/service/v;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {p1}, Lcom/autochips/carplay/service/p;->e(Lcom/autochips/carplay/service/p;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/v;->uD:Lcom/autochips/carplay/service/p;

    iget-object v0, p0, Lcom/autochips/carplay/service/v;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0}, Lcom/autochips/carplay/service/p;->f(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/service/y;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/service/p;->transitionTo(Lcom/android/internal/util/IState;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/v;->uD:Lcom/autochips/carplay/service/p;

    const/16 v0, 0x70d

    invoke-virtual {p1, v0, v2, v3}, Lcom/autochips/carplay/service/p;->sendMessageDelayed(IJ)V

    goto :goto_1

    :sswitch_7
    iget-object p1, p0, Lcom/autochips/carplay/service/v;->uD:Lcom/autochips/carplay/service/p;

    const/16 v0, 0x528

    invoke-virtual {p1, v0, v2, v3}, Lcom/autochips/carplay/service/p;->sendMessageDelayed(IJ)V

    goto :goto_1

    :sswitch_8
    iget v0, p1, Landroid/os/Message;->arg1:I

    if-ne v4, v0, :cond_1

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/autochips/carplay/common/f;

    iget-object v0, p0, Lcom/autochips/carplay/service/v;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0}, Lcom/autochips/carplay/service/p;->b(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/service/i;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/autochips/carplay/service/i;->b(Lcom/autochips/carplay/common/f;)Z

    goto :goto_1

    :sswitch_9
    iget-object v0, p0, Lcom/autochips/carplay/service/v;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0}, Lcom/autochips/carplay/service/p;->l(Lcom/autochips/carplay/service/p;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/autochips/carplay/service/v;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0, v4}, Lcom/autochips/carplay/service/p;->a(Lcom/autochips/carplay/service/p;Z)Z

    iget-object v0, p0, Lcom/autochips/carplay/service/v;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0, v1}, Lcom/autochips/carplay/service/p;->b(Lcom/autochips/carplay/service/p;Z)Z

    iget-object v0, p0, Lcom/autochips/carplay/service/v;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0, p1}, Lcom/autochips/carplay/service/p;->a(Lcom/autochips/carplay/service/p;Landroid/os/Message;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_1
    :goto_1
    monitor-exit p0

    return v4

    :goto_2
    :try_start_2
    const-string v2, "Unhandled message - "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget p1, p1, Landroid/os/Message;->what:I

    invoke-static {p1}, Lcom/autochips/carplay/common/CarplayMessage;->messageString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/service/v;->B(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return v1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1

    nop

    :sswitch_data_0
    .sparse-switch
        0x104 -> :sswitch_9
        0x10a -> :sswitch_8
        0x50a -> :sswitch_7
        0x50b -> :sswitch_6
        0x50d -> :sswitch_5
        0x50e -> :sswitch_4
        0x515 -> :sswitch_3
        0x518 -> :sswitch_4
        0x528 -> :sswitch_2
        0x70a -> :sswitch_1
        0x70c -> :sswitch_0
    .end sparse-switch
.end method
