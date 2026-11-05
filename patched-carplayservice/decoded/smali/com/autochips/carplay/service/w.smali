.class public final Lcom/autochips/carplay/service/w;
.super Lcom/autochips/carplay/service/q;


# instance fields
.field final synthetic uD:Lcom/autochips/carplay/service/p;


# direct methods
.method public constructor <init>(Lcom/autochips/carplay/service/p;)V
    .locals 1

    iput-object p1, p0, Lcom/autochips/carplay/service/w;->uD:Lcom/autochips/carplay/service/p;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/autochips/carplay/service/q;-><init>(Lcom/autochips/carplay/service/p;B)V

    return-void
.end method


# virtual methods
.method public final enter()V
    .locals 2

    invoke-super {p0}, Lcom/autochips/carplay/service/q;->enter()V

    iget-object v0, p0, Lcom/autochips/carplay/service/w;->uD:Lcom/autochips/carplay/service/p;

    const/4 v1, 0x2

    invoke-static {v0, v1}, Lcom/autochips/carplay/service/p;->a(Lcom/autochips/carplay/service/p;I)V

    return-void
.end method

.method public final exit()V
    .locals 0

    invoke-super {p0}, Lcom/autochips/carplay/service/q;->exit()V

    return-void
.end method

.method public final declared-synchronized processMessage(Landroid/os/Message;)Z
    .locals 2

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

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/service/w;->B(Ljava/lang/String;)V

    iget v0, p1, Landroid/os/Message;->what:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/16 v1, 0x114

    if-eq v0, v1, :cond_2

    const/16 v1, 0x517

    if-eq v0, v1, :cond_1

    const/16 v1, 0x70a

    if-eq v0, v1, :cond_0

    packed-switch v0, :pswitch_data_0

    const/4 p1, 0x0

    :goto_0
    monitor-exit p0

    return p1

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/autochips/carplay/service/w;->uD:Lcom/autochips/carplay/service/p;

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/autochips/carplay/CarplayDevice;

    invoke-static {v0, p1}, Lcom/autochips/carplay/service/p;->a(Lcom/autochips/carplay/service/p;Lcom/autochips/carplay/CarplayDevice;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/w;->uD:Lcom/autochips/carplay/service/p;

    iget-object v0, p0, Lcom/autochips/carplay/service/w;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0}, Lcom/autochips/carplay/service/p;->k(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/service/t;

    move-result-object v0

    :goto_1
    invoke-virtual {p1, v0}, Lcom/autochips/carplay/service/p;->transitionTo(Lcom/android/internal/util/IState;)V

    goto :goto_2

    :cond_1
    iget-object p1, p0, Lcom/autochips/carplay/service/w;->uD:Lcom/autochips/carplay/service/p;

    iget-object v0, p0, Lcom/autochips/carplay/service/w;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0}, Lcom/autochips/carplay/service/p;->p(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/service/v;

    move-result-object v0

    goto :goto_1

    :cond_2
    :pswitch_0
    iget-object v0, p0, Lcom/autochips/carplay/service/w;->uD:Lcom/autochips/carplay/service/p;

    invoke-virtual {v0, p1}, Lcom/autochips/carplay/service/p;->deferMessage(Landroid/os/Message;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_2
    const/4 p1, 0x1

    goto :goto_0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1

    :pswitch_data_0
    .packed-switch 0x103
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method
