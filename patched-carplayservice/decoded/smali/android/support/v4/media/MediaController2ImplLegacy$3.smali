.class Landroid/support/v4/media/MediaController2ImplLegacy$3;
.super Landroid/os/ResultReceiver;


# instance fields
.field final synthetic kM:Landroid/support/v4/media/s;


# virtual methods
.method protected onReceiveResult(ILandroid/os/Bundle;)V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplLegacy$3;->kM:Landroid/support/v4/media/s;

    invoke-static {v0}, Landroid/support/v4/media/s;->c(Landroid/support/v4/media/s;)Landroid/os/HandlerThread;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/HandlerThread;->isAlive()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    packed-switch p1, :pswitch_data_0

    return-void

    :pswitch_0
    iget-object p1, p0, Landroid/support/v4/media/MediaController2ImplLegacy$3;->kM:Landroid/support/v4/media/s;

    invoke-virtual {p1, p2}, Landroid/support/v4/media/s;->h(Landroid/os/Bundle;)V

    return-void

    :pswitch_1
    iget-object p1, p0, Landroid/support/v4/media/MediaController2ImplLegacy$3;->kM:Landroid/support/v4/media/s;

    invoke-static {p1}, Landroid/support/v4/media/s;->d(Landroid/support/v4/media/s;)Ljava/util/concurrent/Executor;

    move-result-object p1

    new-instance p2, Landroid/support/v4/media/v;

    invoke-direct {p2, p0}, Landroid/support/v4/media/v;-><init>(Landroid/support/v4/media/MediaController2ImplLegacy$3;)V

    invoke-interface {p1, p2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    iget-object p1, p0, Landroid/support/v4/media/MediaController2ImplLegacy$3;->kM:Landroid/support/v4/media/s;

    invoke-virtual {p1}, Landroid/support/v4/media/s;->close()V

    return-void

    nop

    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
