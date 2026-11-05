.class public final Lcom/autochips/carplay/service/t;
.super Lcom/autochips/carplay/service/q;


# instance fields
.field final synthetic uD:Lcom/autochips/carplay/service/p;


# direct methods
.method public constructor <init>(Lcom/autochips/carplay/service/p;)V
    .locals 1

    iput-object p1, p0, Lcom/autochips/carplay/service/t;->uD:Lcom/autochips/carplay/service/p;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/autochips/carplay/service/q;-><init>(Lcom/autochips/carplay/service/p;B)V

    return-void
.end method


# virtual methods
.method public final enter()V
    .locals 3

    invoke-super {p0}, Lcom/autochips/carplay/service/q;->enter()V

    iget-object v0, p0, Lcom/autochips/carplay/service/t;->uD:Lcom/autochips/carplay/service/p;

    const/4 v1, 0x3

    invoke-static {v0, v1}, Lcom/autochips/carplay/service/p;->a(Lcom/autochips/carplay/service/p;I)V

    iget-object v0, p0, Lcom/autochips/carplay/service/t;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0}, Lcom/autochips/carplay/service/p;->f(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/service/y;

    move-result-object v0

    iget-object v1, p0, Lcom/autochips/carplay/service/t;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v1}, Lcom/autochips/carplay/service/p;->a(Lcom/autochips/carplay/service/p;)Lcom/android/internal/util/State;

    move-result-object v1

    const/4 v2, 0x1

    if-eq v0, v1, :cond_2

    iget-object v0, p0, Lcom/autochips/carplay/service/t;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0}, Lcom/autochips/carplay/service/p;->p(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/service/v;

    move-result-object v0

    iget-object v1, p0, Lcom/autochips/carplay/service/t;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v1}, Lcom/autochips/carplay/service/p;->a(Lcom/autochips/carplay/service/p;)Lcom/android/internal/util/State;

    move-result-object v1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/autochips/carplay/service/t;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0}, Lcom/autochips/carplay/service/p;->h(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/service/w;

    move-result-object v0

    iget-object v1, p0, Lcom/autochips/carplay/service/t;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v1}, Lcom/autochips/carplay/service/p;->a(Lcom/autochips/carplay/service/p;)Lcom/android/internal/util/State;

    move-result-object v1

    if-ne v0, v1, :cond_1

    goto :goto_1

    :cond_1
    const/4 v2, 0x0

    goto :goto_1

    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/autochips/carplay/service/t;->uD:Lcom/autochips/carplay/service/p;

    iget-object v1, p0, Lcom/autochips/carplay/service/t;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v1}, Lcom/autochips/carplay/service/p;->q(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/service/r;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/service/p;->transitionTo(Lcom/android/internal/util/IState;)V

    :goto_1
    if-eqz v2, :cond_3

    iget-object v0, p0, Lcom/autochips/carplay/service/t;->uD:Lcom/autochips/carplay/service/p;

    iget-object v1, p0, Lcom/autochips/carplay/service/t;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v1}, Lcom/autochips/carplay/service/p;->d(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/CarplayDevice;

    move-result-object v1

    const/4 v2, 0x2

    invoke-static {v0, v1, v2}, Lcom/autochips/carplay/service/p;->a(Lcom/autochips/carplay/service/p;Lcom/autochips/carplay/CarplayDevice;I)V

    :cond_3
    return-void
.end method

.method public final exit()V
    .locals 0

    invoke-super {p0}, Lcom/autochips/carplay/service/q;->exit()V

    return-void
.end method

.method public final declared-synchronized processMessage(Landroid/os/Message;)Z
    .locals 4

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/autochips/carplay/service/t;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0}, Lcom/autochips/carplay/service/p;->d(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/CarplayDevice;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/autochips/carplay/service/p;->aB()Ljava/lang/String;

    move-result-object p1

    const-string v0, "ERROR: mCurrentDevice is null in Connected"

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    monitor-exit p0

    return v1

    :cond_0
    :try_start_1
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "processMessage: "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p1, Landroid/os/Message;->what:I

    invoke-static {v2}, Lcom/autochips/carplay/common/CarplayMessage;->messageString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/service/t;->B(Ljava/lang/String;)V

    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v2, 0x1

    sparse-switch v0, :sswitch_data_0

    new-instance v0, Ljava/lang/StringBuilder;

    goto/16 :goto_3

    :sswitch_0
    iget v0, p1, Landroid/os/Message;->arg1:I

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/autochips/carplay/CarplayDevice;

    iget-object v1, p0, Lcom/autochips/carplay/service/t;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v1}, Lcom/autochips/carplay/service/p;->d(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/CarplayDevice;

    move-result-object v1

    if-eqz v1, :cond_6

    iget-object v1, p0, Lcom/autochips/carplay/service/t;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v1}, Lcom/autochips/carplay/service/p;->d(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/CarplayDevice;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/autochips/carplay/CarplayDevice;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_6

    invoke-static {v0}, Lcom/autochips/carplay/service/p;->al(I)V

    goto/16 :goto_2

    :sswitch_1
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/autochips/carplay/CarplayDevice;

    iget-object v0, p0, Lcom/autochips/carplay/service/t;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0}, Lcom/autochips/carplay/service/p;->d(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/CarplayDevice;

    move-result-object v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/autochips/carplay/service/t;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0}, Lcom/autochips/carplay/service/p;->d(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/CarplayDevice;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/autochips/carplay/CarplayDevice;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object p1, p0, Lcom/autochips/carplay/service/t;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {p1}, Lcom/autochips/carplay/service/p;->h(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/service/w;

    move-result-object p1

    iget-object v0, p0, Lcom/autochips/carplay/service/t;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0}, Lcom/autochips/carplay/service/p;->a(Lcom/autochips/carplay/service/p;)Lcom/android/internal/util/State;

    move-result-object v0

    if-ne p1, v0, :cond_1

    iget-object p1, p0, Lcom/autochips/carplay/service/t;->uD:Lcom/autochips/carplay/service/p;

    iget-object v0, p0, Lcom/autochips/carplay/service/t;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0}, Lcom/autochips/carplay/service/p;->h(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/service/w;

    move-result-object v0

    :goto_0
    invoke-virtual {p1, v0}, Lcom/autochips/carplay/service/p;->transitionTo(Lcom/android/internal/util/IState;)V

    goto/16 :goto_2

    :cond_1
    iget-object p1, p0, Lcom/autochips/carplay/service/t;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {p1}, Lcom/autochips/carplay/service/p;->r(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/service/s;

    move-result-object p1

    iget-object v0, p0, Lcom/autochips/carplay/service/t;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0}, Lcom/autochips/carplay/service/p;->a(Lcom/autochips/carplay/service/p;)Lcom/android/internal/util/State;

    move-result-object v0

    if-eq p1, v0, :cond_2

    iget-object p1, p0, Lcom/autochips/carplay/service/t;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {p1}, Lcom/autochips/carplay/service/p;->s(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/service/x;

    move-result-object p1

    iget-object v0, p0, Lcom/autochips/carplay/service/t;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0}, Lcom/autochips/carplay/service/p;->a(Lcom/autochips/carplay/service/p;)Lcom/android/internal/util/State;

    move-result-object v0

    if-eq p1, v0, :cond_2

    iget-object p1, p0, Lcom/autochips/carplay/service/t;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {p1}, Lcom/autochips/carplay/service/p;->k(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/service/t;

    move-result-object p1

    iget-object v0, p0, Lcom/autochips/carplay/service/t;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0}, Lcom/autochips/carplay/service/p;->a(Lcom/autochips/carplay/service/p;)Lcom/android/internal/util/State;

    move-result-object v0

    if-ne p1, v0, :cond_6

    :cond_2
    iget-object p1, p0, Lcom/autochips/carplay/service/t;->uD:Lcom/autochips/carplay/service/p;

    iget-object v0, p0, Lcom/autochips/carplay/service/t;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0}, Lcom/autochips/carplay/service/p;->p(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/service/v;

    move-result-object v0

    goto :goto_0

    :cond_3
    invoke-static {}, Lcom/autochips/carplay/service/p;->aB()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "carplay session disconnect from unknown device: "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    :sswitch_2
    iget-object v0, p0, Lcom/autochips/carplay/service/t;->uD:Lcom/autochips/carplay/service/p;

    monitor-enter v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :try_start_2
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/autochips/carplay/CarplayCall;

    iget-object v1, p0, Lcom/autochips/carplay/service/t;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v1, p1}, Lcom/autochips/carplay/service/p;->a(Lcom/autochips/carplay/service/p;Lcom/autochips/carplay/CarplayCall;)V

    monitor-exit v0

    goto/16 :goto_2

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    throw p1

    :sswitch_3
    iget-object p1, p0, Lcom/autochips/carplay/service/t;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {p1}, Lcom/autochips/carplay/service/p;->h(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/service/w;

    move-result-object p1

    iget-object v0, p0, Lcom/autochips/carplay/service/t;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0}, Lcom/autochips/carplay/service/p;->a(Lcom/autochips/carplay/service/p;)Lcom/android/internal/util/State;

    move-result-object v0

    if-ne p1, v0, :cond_6

    iget-object p1, p0, Lcom/autochips/carplay/service/t;->uD:Lcom/autochips/carplay/service/p;

    iget-object v0, p0, Lcom/autochips/carplay/service/t;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0}, Lcom/autochips/carplay/service/p;->s(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/service/x;

    move-result-object v0

    goto :goto_0

    :sswitch_4
    iget-object p1, p0, Lcom/autochips/carplay/service/t;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {p1}, Lcom/autochips/carplay/service/p;->h(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/service/w;

    move-result-object p1

    iget-object v0, p0, Lcom/autochips/carplay/service/t;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0}, Lcom/autochips/carplay/service/p;->a(Lcom/autochips/carplay/service/p;)Lcom/android/internal/util/State;

    move-result-object v0

    if-ne p1, v0, :cond_6

    iget-object p1, p0, Lcom/autochips/carplay/service/t;->uD:Lcom/autochips/carplay/service/p;

    iget-object v0, p0, Lcom/autochips/carplay/service/t;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0}, Lcom/autochips/carplay/service/p;->p(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/service/v;

    move-result-object v0

    goto/16 :goto_0

    :sswitch_5
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/autochips/carplay/common/f;

    iget-object v0, p0, Lcom/autochips/carplay/service/t;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0}, Lcom/autochips/carplay/service/p;->b(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/service/i;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/autochips/carplay/service/i;->b(Lcom/autochips/carplay/common/f;)Z

    goto :goto_2

    :sswitch_6
    iget-object v0, p0, Lcom/autochips/carplay/service/t;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0}, Lcom/autochips/carplay/service/p;->l(Lcom/autochips/carplay/service/p;)Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-static {}, Lcom/autochips/carplay/service/p;->aB()Ljava/lang/String;

    move-result-object p1

    const-string v0, "ignore user_stop_video"

    :goto_1
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    :cond_4
    iget-object v0, p0, Lcom/autochips/carplay/service/t;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0, v2}, Lcom/autochips/carplay/service/p;->a(Lcom/autochips/carplay/service/p;Z)Z

    iget-object v0, p0, Lcom/autochips/carplay/service/t;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0, v1}, Lcom/autochips/carplay/service/p;->b(Lcom/autochips/carplay/service/p;Z)Z

    iget p1, p1, Landroid/os/Message;->arg1:I

    const/16 v0, 0x11e

    if-ne p1, v0, :cond_6

    iget-object p1, p0, Lcom/autochips/carplay/service/t;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {p1}, Lcom/autochips/carplay/service/p;->d(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/CarplayDevice;

    move-result-object p1

    if-eqz p1, :cond_6

    iget-object v0, p0, Lcom/autochips/carplay/service/t;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0}, Lcom/autochips/carplay/service/p;->u(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/service/CarplayService;

    move-result-object v0

    invoke-virtual {v0}, Lcom/autochips/carplay/service/CarplayService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/autochips/carplay/service/ac;->a(Landroid/content/Context;)Lcom/autochips/carplay/service/ac;

    move-result-object v0

    invoke-virtual {p1}, Lcom/autochips/carplay/CarplayDevice;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1, v1}, Lcom/autochips/carplay/service/ac;->b(Ljava/lang/String;I)V

    goto :goto_2

    :sswitch_7
    iget-object p1, p0, Lcom/autochips/carplay/service/t;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {p1}, Lcom/autochips/carplay/service/p;->t(Lcom/autochips/carplay/service/p;)Z

    move-result p1

    if-eqz p1, :cond_5

    invoke-static {}, Lcom/autochips/carplay/service/p;->aB()Ljava/lang/String;

    move-result-object p1

    const-string v0, "ignore user_start_video"

    goto :goto_1

    :cond_5
    iget-object p1, p0, Lcom/autochips/carplay/service/t;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {p1, v2}, Lcom/autochips/carplay/service/p;->b(Lcom/autochips/carplay/service/p;Z)Z

    iget-object p1, p0, Lcom/autochips/carplay/service/t;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {p1, v1}, Lcom/autochips/carplay/service/p;->a(Lcom/autochips/carplay/service/p;Z)Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :cond_6
    :goto_2
    :sswitch_8
    monitor-exit p0

    return v2

    :goto_3
    :try_start_4
    const-string v2, "Unhandled message - "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget p1, p1, Landroid/os/Message;->what:I

    invoke-static {p1}, Lcom/autochips/carplay/common/CarplayMessage;->messageString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/service/t;->B(Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    monitor-exit p0

    return v1

    :catchall_1
    move-exception p1

    monitor-exit p0

    throw p1

    :sswitch_data_0
    .sparse-switch
        0x103 -> :sswitch_7
        0x104 -> :sswitch_6
        0x105 -> :sswitch_8
        0x106 -> :sswitch_8
        0x10a -> :sswitch_5
        0x114 -> :sswitch_8
        0x50b -> :sswitch_8
        0x50d -> :sswitch_8
        0x515 -> :sswitch_8
        0x517 -> :sswitch_4
        0x51f -> :sswitch_3
        0x521 -> :sswitch_8
        0x532 -> :sswitch_2
        0x70a -> :sswitch_8
        0x70b -> :sswitch_1
        0x70c -> :sswitch_0
    .end sparse-switch
.end method
