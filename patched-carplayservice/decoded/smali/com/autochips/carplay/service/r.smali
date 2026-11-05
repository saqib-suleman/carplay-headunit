.class public final Lcom/autochips/carplay/service/r;
.super Lcom/autochips/carplay/service/q;


# instance fields
.field final synthetic uD:Lcom/autochips/carplay/service/p;


# direct methods
.method public constructor <init>(Lcom/autochips/carplay/service/p;)V
    .locals 1

    iput-object p1, p0, Lcom/autochips/carplay/service/r;->uD:Lcom/autochips/carplay/service/p;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/autochips/carplay/service/q;-><init>(Lcom/autochips/carplay/service/p;B)V

    return-void
.end method


# virtual methods
.method public final enter()V
    .locals 2

    invoke-super {p0}, Lcom/autochips/carplay/service/q;->enter()V

    iget-object v0, p0, Lcom/autochips/carplay/service/r;->uD:Lcom/autochips/carplay/service/p;

    const/4 v1, 0x4

    invoke-static {v0, v1}, Lcom/autochips/carplay/service/p;->a(Lcom/autochips/carplay/service/p;I)V

    return-void
.end method

.method public final exit()V
    .locals 0

    invoke-super {p0}, Lcom/autochips/carplay/service/q;->exit()V

    return-void
.end method

.method public final declared-synchronized processMessage(Landroid/os/Message;)Z
    .locals 10

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

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/service/r;->B(Ljava/lang/String;)V

    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x10a

    const/4 v2, 0x1

    if-eq v0, v1, :cond_9

    const/16 v1, 0x50d

    const/16 v3, 0x70e

    if-eq v0, v1, :cond_8

    const/16 v1, 0x70b

    if-eq v0, v1, :cond_6

    if-eq v0, v3, :cond_5

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_0

    packed-switch v0, :pswitch_data_1

    packed-switch v0, :pswitch_data_2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "Unhandled message - "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget p1, p1, Landroid/os/Message;->what:I

    invoke-static {p1}, Lcom/autochips/carplay/common/CarplayMessage;->messageString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/service/r;->B(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v1

    :pswitch_0
    :try_start_1
    iget v0, p1, Landroid/os/Message;->arg1:I

    if-ne v0, v2, :cond_a

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    iget-object v0, p0, Lcom/autochips/carplay/service/r;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0}, Lcom/autochips/carplay/service/p;->b(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/service/i;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/autochips/carplay/service/i;->F(Ljava/lang/String;)Z

    goto/16 :goto_1

    :pswitch_1
    iget-object v0, p0, Lcom/autochips/carplay/service/r;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0}, Lcom/autochips/carplay/service/p;->d(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/CarplayDevice;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v3, p0, Lcom/autochips/carplay/service/r;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v3}, Lcom/autochips/carplay/service/p;->u(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/service/CarplayService;

    move-result-object v3

    invoke-virtual {v3}, Lcom/autochips/carplay/service/CarplayService;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/autochips/carplay/service/ac;->a(Landroid/content/Context;)Lcom/autochips/carplay/service/ac;

    move-result-object v3

    invoke-virtual {v0}, Lcom/autochips/carplay/CarplayDevice;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0, v1}, Lcom/autochips/carplay/service/ac;->b(Ljava/lang/String;I)V

    :cond_0
    iget v0, p1, Landroid/os/Message;->arg1:I

    iget-object v1, p0, Lcom/autochips/carplay/service/r;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v1, v0}, Lcom/autochips/carplay/service/p;->b(Lcom/autochips/carplay/service/p;I)V

    iget-object v0, p0, Lcom/autochips/carplay/service/r;->uD:Lcom/autochips/carplay/service/p;

    :goto_0
    invoke-static {v0, p1}, Lcom/autochips/carplay/service/p;->a(Lcom/autochips/carplay/service/p;Landroid/os/Message;)V

    goto/16 :goto_1

    :pswitch_2
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/autochips/carplay/common/b;

    iget-object v0, p0, Lcom/autochips/carplay/service/r;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0, p1}, Lcom/autochips/carplay/service/p;->a(Lcom/autochips/carplay/service/p;Lcom/autochips/carplay/common/b;)V

    goto/16 :goto_1

    :pswitch_3
    iget-object v0, p0, Lcom/autochips/carplay/service/r;->uD:Lcom/autochips/carplay/service/p;

    goto :goto_0

    :pswitch_4
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/autochips/carplay/common/h;

    iget-object v0, p0, Lcom/autochips/carplay/service/r;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0}, Lcom/autochips/carplay/service/p;->b(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/service/i;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/autochips/carplay/service/i;->a(Lcom/autochips/carplay/common/h;)Z

    goto/16 :goto_1

    :pswitch_5
    iget p1, p1, Landroid/os/Message;->arg1:I

    iget-object v0, p0, Lcom/autochips/carplay/service/r;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0}, Lcom/autochips/carplay/service/p;->b(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/service/i;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/autochips/carplay/service/i;->ag(I)Z

    goto/16 :goto_1

    :pswitch_6
    iget p1, p1, Landroid/os/Message;->arg1:I

    iget-object v0, p0, Lcom/autochips/carplay/service/r;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0}, Lcom/autochips/carplay/service/p;->b(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/service/i;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/autochips/carplay/service/i;->af(I)Z

    goto/16 :goto_1

    :pswitch_7
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iget v1, p1, Landroid/os/Message;->arg1:I

    iget p1, p1, Landroid/os/Message;->arg2:I

    iget-object v3, p0, Lcom/autochips/carplay/service/r;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v3}, Lcom/autochips/carplay/service/p;->b(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/service/i;

    move-result-object v3

    invoke-virtual {v3, v0, v1, p1}, Lcom/autochips/carplay/service/i;->a(ZII)Z

    goto/16 :goto_1

    :pswitch_8
    iget-object p1, p0, Lcom/autochips/carplay/service/r;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {p1}, Lcom/autochips/carplay/service/p;->b(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/service/i;

    move-result-object p1

    invoke-virtual {p1}, Lcom/autochips/carplay/service/i;->dT()Z

    goto/16 :goto_1

    :pswitch_9
    iget p1, p1, Landroid/os/Message;->arg1:I

    iget-object v0, p0, Lcom/autochips/carplay/service/r;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0}, Lcom/autochips/carplay/service/p;->b(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/service/i;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/autochips/carplay/service/i;->ah(I)Z

    goto/16 :goto_1

    :pswitch_a
    iget v0, p1, Landroid/os/Message;->arg1:I

    iget v1, p1, Landroid/os/Message;->arg2:I

    const/16 v3, 0x11e

    if-ne v1, v3, :cond_1

    iget-object v1, p0, Lcom/autochips/carplay/service/r;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v1}, Lcom/autochips/carplay/service/p;->d(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/CarplayDevice;

    move-result-object v1

    if-eqz v1, :cond_1

    iget-object v3, p0, Lcom/autochips/carplay/service/r;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v3}, Lcom/autochips/carplay/service/p;->u(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/service/CarplayService;

    move-result-object v3

    invoke-virtual {v3}, Lcom/autochips/carplay/service/CarplayService;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/autochips/carplay/service/ac;->a(Landroid/content/Context;)Lcom/autochips/carplay/service/ac;

    move-result-object v3

    invoke-virtual {v1}, Lcom/autochips/carplay/CarplayDevice;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1, v2}, Lcom/autochips/carplay/service/ac;->b(Ljava/lang/String;I)V

    :cond_1
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    iget-object v1, p0, Lcom/autochips/carplay/service/r;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v1}, Lcom/autochips/carplay/service/p;->b(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/service/i;

    move-result-object v1

    invoke-virtual {v1, v0, p1}, Lcom/autochips/carplay/service/i;->f(ILjava/lang/String;)Z

    goto/16 :goto_1

    :pswitch_b
    iget-object v0, p0, Lcom/autochips/carplay/service/r;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0, p1}, Lcom/autochips/carplay/service/p;->a(Lcom/autochips/carplay/service/p;Landroid/os/Message;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return v1

    :pswitch_c
    :try_start_2
    iget-object v0, p0, Lcom/autochips/carplay/service/r;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0}, Lcom/autochips/carplay/service/p;->l(Lcom/autochips/carplay/service/p;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/autochips/carplay/service/r;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0, p1}, Lcom/autochips/carplay/service/p;->a(Lcom/autochips/carplay/service/p;Landroid/os/Message;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :cond_2
    monitor-exit p0

    return v1

    :pswitch_d
    :try_start_3
    invoke-static {}, Lcom/autochips/carplay/service/g;->dx()Lcom/autochips/carplay/service/g;

    move-result-object v0

    invoke-virtual {v0}, Lcom/autochips/carplay/service/g;->dF()Lcom/autochips/carplay/b/a;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Lcom/autochips/carplay/b/a;->dc()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-static {}, Lcom/autochips/carplay/service/p;->aB()Ljava/lang/String;

    move-result-object p1

    const-string v0, "In Backcar, ignore user start video"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    :cond_3
    iget-object v0, p0, Lcom/autochips/carplay/service/r;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0}, Lcom/autochips/carplay/service/p;->t(Lcom/autochips/carplay/service/p;)Z

    move-result v0

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/autochips/carplay/service/r;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0, p1}, Lcom/autochips/carplay/service/p;->a(Lcom/autochips/carplay/service/p;Landroid/os/Message;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :cond_4
    monitor-exit p0

    return v1

    :cond_5
    :try_start_4
    invoke-static {}, Lcom/autochips/carplay/service/p;->aB()Ljava/lang/String;

    move-result-object p1

    const-string v0, "Carplay Session disconnect timeout"

    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    :cond_6
    iget-object v0, p0, Lcom/autochips/carplay/service/r;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0}, Lcom/autochips/carplay/service/p;->v(Lcom/autochips/carplay/service/p;)V

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/autochips/carplay/CarplayDevice;

    iget-object v1, p0, Lcom/autochips/carplay/service/r;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v1}, Lcom/autochips/carplay/service/p;->d(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/CarplayDevice;

    move-result-object v1

    if-eqz v1, :cond_7

    iget-object v1, p0, Lcom/autochips/carplay/service/r;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v1}, Lcom/autochips/carplay/service/p;->d(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/CarplayDevice;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/autochips/carplay/CarplayDevice;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    iget-object v0, p0, Lcom/autochips/carplay/service/r;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0}, Lcom/autochips/carplay/service/p;->b(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/service/i;

    move-result-object v0

    invoke-virtual {v0}, Lcom/autochips/carplay/service/i;->dI()V

    new-instance v0, Lcom/autochips/carplay/common/b;

    const/4 v4, 0x2

    const/4 v5, 0x2

    const/4 v6, 0x0

    const/4 v7, -0x1

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v3, v0

    invoke-direct/range {v3 .. v9}, Lcom/autochips/carplay/common/b;-><init>(IIIIII)V

    iget-object v1, p0, Lcom/autochips/carplay/service/r;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v1, v0}, Lcom/autochips/carplay/service/p;->a(Lcom/autochips/carplay/service/p;Lcom/autochips/carplay/common/b;)V

    iget-object v0, p0, Lcom/autochips/carplay/service/r;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0, p1}, Lcom/autochips/carplay/service/p;->a(Lcom/autochips/carplay/service/p;Landroid/os/Message;)V

    iget-object v0, p0, Lcom/autochips/carplay/service/r;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0, p1}, Lcom/autochips/carplay/service/p;->b(Lcom/autochips/carplay/service/p;Landroid/os/Message;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/r;->uD:Lcom/autochips/carplay/service/p;

    const/16 v0, 0x70d

    const-wide/16 v3, 0x2710

    invoke-virtual {p1, v0, v3, v4}, Lcom/autochips/carplay/service/p;->sendMessageDelayed(IJ)V

    iget-object p1, p0, Lcom/autochips/carplay/service/r;->uD:Lcom/autochips/carplay/service/p;

    iget-object v0, p0, Lcom/autochips/carplay/service/r;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0}, Lcom/autochips/carplay/service/p;->f(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/service/y;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/service/p;->transitionTo(Lcom/android/internal/util/IState;)V

    goto :goto_1

    :cond_7
    invoke-static {}, Lcom/autochips/carplay/service/p;->aB()Ljava/lang/String;

    move-result-object p1

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "carplay session disconnect from unknown device: "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    :cond_8
    iget-object v0, p0, Lcom/autochips/carplay/service/r;->uD:Lcom/autochips/carplay/service/p;

    const-wide/16 v4, 0xbb8

    invoke-virtual {v0, v3, v4, v5}, Lcom/autochips/carplay/service/p;->sendMessageDelayed(IJ)V

    iget-object v0, p0, Lcom/autochips/carplay/service/r;->uD:Lcom/autochips/carplay/service/p;

    invoke-virtual {v0, p1}, Lcom/autochips/carplay/service/p;->deferMessage(Landroid/os/Message;)V

    goto :goto_1

    :cond_9
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/autochips/carplay/common/f;

    iget-object v0, p0, Lcom/autochips/carplay/service/r;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0}, Lcom/autochips/carplay/service/p;->b(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/service/i;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/autochips/carplay/service/i;->b(Lcom/autochips/carplay/common/f;)Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :cond_a
    :goto_1
    monitor-exit p0

    return v2

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1

    :pswitch_data_0
    .packed-switch 0x103
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x114
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x714
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
