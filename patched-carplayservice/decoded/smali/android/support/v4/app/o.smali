.class final Landroid/support/v4/app/o;
.super Landroid/os/Handler;


# instance fields
.field final synthetic iv:Landroid/support/v4/app/n;


# direct methods
.method constructor <init>(Landroid/support/v4/app/n;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v4/app/o;->iv:Landroid/support/v4/app/n;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)V
    .locals 1

    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    return-void

    :pswitch_0
    iget-object p1, p0, Landroid/support/v4/app/o;->iv:Landroid/support/v4/app/n;

    iget-object p1, p1, Landroid/support/v4/app/n;->ip:Landroid/support/v4/app/s;

    invoke-virtual {p1}, Landroid/support/v4/app/s;->dispatchResume()V

    iget-object p1, p0, Landroid/support/v4/app/o;->iv:Landroid/support/v4/app/n;

    iget-object p1, p1, Landroid/support/v4/app/n;->ip:Landroid/support/v4/app/s;

    invoke-virtual {p1}, Landroid/support/v4/app/s;->execPendingActions()Z

    return-void

    :pswitch_1
    iget-object p1, p0, Landroid/support/v4/app/o;->iv:Landroid/support/v4/app/n;

    iget-boolean p1, p1, Landroid/support/v4/app/n;->mStopped:Z

    if-eqz p1, :cond_0

    iget-object p1, p0, Landroid/support/v4/app/o;->iv:Landroid/support/v4/app/n;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/support/v4/app/n;->e(Z)V

    :cond_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
