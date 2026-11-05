.class final Lcom/autochips/carplay/b/b;
.super Landroid/os/Handler;


# instance fields
.field final synthetic rX:Lcom/autochips/carplay/b/a;


# direct methods
.method constructor <init>(Lcom/autochips/carplay/b/a;Landroid/os/Looper;)V
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/b/b;->rX:Lcom/autochips/carplay/b/a;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)V
    .locals 4

    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_3

    const/4 v1, 0x6

    if-eq v0, v1, :cond_0

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_1

    :pswitch_0
    const-string v0, "BackcarMonitor"

    const-string v1, "MSG_EVENT_BACKCAR_ARM2_EXIT"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/b/b;->rX:Lcom/autochips/carplay/b/a;

    invoke-static {v0}, Lcom/autochips/carplay/b/a;->b(Lcom/autochips/carplay/b/a;)Lcom/autochips/carplay/service/h;

    move-result-object v0

    const/16 v1, 0x1003

    :goto_0
    invoke-virtual {v0, v1}, Lcom/autochips/carplay/service/h;->sendMessage(I)V

    goto/16 :goto_1

    :pswitch_1
    const-string v0, "BackcarMonitor"

    const-string v1, "MSG_EVENT_BACKCAR_STOP"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/b/b;->rX:Lcom/autochips/carplay/b/a;

    invoke-static {v0}, Lcom/autochips/carplay/b/a;->a(Lcom/autochips/carplay/b/a;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/autochips/carplay/b/b;->rX:Lcom/autochips/carplay/b/a;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/autochips/carplay/b/a;->a(Lcom/autochips/carplay/b/a;Z)Z

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/autochips/carplay/b/b;->rX:Lcom/autochips/carplay/b/a;

    invoke-static {v0}, Lcom/autochips/carplay/b/a;->b(Lcom/autochips/carplay/b/a;)Lcom/autochips/carplay/service/h;

    move-result-object v0

    const/16 v1, 0x1002

    goto :goto_0

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :cond_0
    const-string v0, "BackcarMonitor"

    const-string v1, "MSG_EVENT_BACKCAR_SERVICE_DIED"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/b/b;->rX:Lcom/autochips/carplay/b/a;

    invoke-static {v0}, Lcom/autochips/carplay/b/a;->c(Lcom/autochips/carplay/b/a;)Lcom/autochips/backcar/BackCar;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/autochips/carplay/b/b;->rX:Lcom/autochips/carplay/b/a;

    invoke-static {v0}, Lcom/autochips/carplay/b/a;->c(Lcom/autochips/carplay/b/a;)Lcom/autochips/backcar/BackCar;

    move-result-object v0

    iget-object v1, p0, Lcom/autochips/carplay/b/b;->rX:Lcom/autochips/carplay/b/a;

    invoke-static {v1}, Lcom/autochips/carplay/b/a;->d(Lcom/autochips/carplay/b/a;)Lcom/autochips/backcar/BackCar$Listener;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/autochips/backcar/BackCar;->setListener(Lcom/autochips/backcar/BackCar$Listener;Ljava/util/ArrayList;)Z

    :cond_1
    iget-object v0, p0, Lcom/autochips/carplay/b/b;->rX:Lcom/autochips/carplay/b/a;

    new-instance v1, Lcom/autochips/backcar/BackCar;

    invoke-direct {v1}, Lcom/autochips/backcar/BackCar;-><init>()V

    invoke-static {v0, v1}, Lcom/autochips/carplay/b/a;->a(Lcom/autochips/carplay/b/a;Lcom/autochips/backcar/BackCar;)Lcom/autochips/backcar/BackCar;

    iget-object v0, p0, Lcom/autochips/carplay/b/b;->rX:Lcom/autochips/carplay/b/a;

    invoke-static {v0}, Lcom/autochips/carplay/b/a;->a(Lcom/autochips/carplay/b/a;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    :try_start_2
    iget-object v1, p0, Lcom/autochips/carplay/b/b;->rX:Lcom/autochips/carplay/b/a;

    invoke-static {v1}, Lcom/autochips/carplay/b/a;->e(Lcom/autochips/carplay/b/a;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/autochips/carplay/b/b;->rX:Lcom/autochips/carplay/b/a;

    invoke-static {v1}, Lcom/autochips/carplay/b/a;->c(Lcom/autochips/carplay/b/a;)Lcom/autochips/backcar/BackCar;

    move-result-object v1

    iget-object v2, p0, Lcom/autochips/carplay/b/b;->rX:Lcom/autochips/carplay/b/a;

    invoke-static {v2}, Lcom/autochips/carplay/b/a;->d(Lcom/autochips/carplay/b/a;)Lcom/autochips/backcar/BackCar$Listener;

    move-result-object v2

    iget-object v3, p0, Lcom/autochips/carplay/b/b;->rX:Lcom/autochips/carplay/b/a;

    iget-object v3, v3, Lcom/autochips/carplay/b/a;->rV:Ljava/util/ArrayList;

    invoke-virtual {v1, v2, v3}, Lcom/autochips/backcar/BackCar;->setListener(Lcom/autochips/backcar/BackCar$Listener;Ljava/util/ArrayList;)Z

    :cond_2
    monitor-exit v0

    goto :goto_1

    :catchall_1
    move-exception p1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw p1

    :cond_3
    const-string v0, "BackcarMonitor"

    const-string v2, "MSG_EVENT_BACKCAR_START"

    invoke-static {v0, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/b/b;->rX:Lcom/autochips/carplay/b/a;

    invoke-static {v0}, Lcom/autochips/carplay/b/a;->a(Lcom/autochips/carplay/b/a;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    :try_start_3
    iget-object v2, p0, Lcom/autochips/carplay/b/b;->rX:Lcom/autochips/carplay/b/a;

    invoke-static {v2, v1}, Lcom/autochips/carplay/b/a;->a(Lcom/autochips/carplay/b/a;Z)Z

    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    iget-object v0, p0, Lcom/autochips/carplay/b/b;->rX:Lcom/autochips/carplay/b/a;

    invoke-static {v0}, Lcom/autochips/carplay/b/a;->b(Lcom/autochips/carplay/b/a;)Lcom/autochips/carplay/service/h;

    move-result-object v0

    const/16 v1, 0x1001

    goto/16 :goto_0

    :goto_1
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    return-void

    :catchall_2
    move-exception p1

    :try_start_4
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    throw p1

    nop

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
