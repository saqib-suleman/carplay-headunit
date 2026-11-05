.class Landroid/support/v4/media/MediaController2ImplLegacy$ControllerCompatCallback$1;
.super Landroid/os/ResultReceiver;


# instance fields
.field final synthetic kP:Landroid/support/v4/media/w;


# direct methods
.method constructor <init>(Landroid/support/v4/media/w;Landroid/os/Handler;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v4/media/MediaController2ImplLegacy$ControllerCompatCallback$1;->kP:Landroid/support/v4/media/w;

    invoke-direct {p0, p2}, Landroid/os/ResultReceiver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method protected onReceiveResult(ILandroid/os/Bundle;)V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplLegacy$ControllerCompatCallback$1;->kP:Landroid/support/v4/media/w;

    iget-object v0, v0, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

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
    iget-object p1, p0, Landroid/support/v4/media/MediaController2ImplLegacy$ControllerCompatCallback$1;->kP:Landroid/support/v4/media/w;

    iget-object p1, p1, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    invoke-virtual {p1, p2}, Landroid/support/v4/media/s;->h(Landroid/os/Bundle;)V

    return-void

    :pswitch_1
    iget-object p1, p0, Landroid/support/v4/media/MediaController2ImplLegacy$ControllerCompatCallback$1;->kP:Landroid/support/v4/media/w;

    iget-object p1, p1, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    invoke-static {p1}, Landroid/support/v4/media/s;->d(Landroid/support/v4/media/s;)Ljava/util/concurrent/Executor;

    move-result-object p1

    new-instance p2, Landroid/support/v4/media/x;

    invoke-direct {p2, p0}, Landroid/support/v4/media/x;-><init>(Landroid/support/v4/media/MediaController2ImplLegacy$ControllerCompatCallback$1;)V

    invoke-interface {p1, p2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    iget-object p1, p0, Landroid/support/v4/media/MediaController2ImplLegacy$ControllerCompatCallback$1;->kP:Landroid/support/v4/media/w;

    iget-object p1, p1, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    invoke-virtual {p1}, Landroid/support/v4/media/s;->close()V

    return-void

    nop

    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
