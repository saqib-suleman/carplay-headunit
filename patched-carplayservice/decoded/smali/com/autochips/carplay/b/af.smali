.class final Lcom/autochips/carplay/b/af;
.super Lcom/android/internal/util/State;


# instance fields
.field final synthetic sW:Lcom/autochips/carplay/b/ac;

.field private sX:Z


# direct methods
.method constructor <init>(Lcom/autochips/carplay/b/ac;)V
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/b/af;->sW:Lcom/autochips/carplay/b/ac;

    invoke-direct {p0}, Lcom/android/internal/util/State;-><init>()V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/autochips/carplay/b/af;->sX:Z

    return-void
.end method


# virtual methods
.method public final enter()V
    .locals 4

    const-string v0, "ScreenManager"

    const-string v1, "entering StartedState"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/b/af;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {v0}, Lcom/autochips/carplay/b/ac;->g(Lcom/autochips/carplay/b/ac;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/autochips/carplay/b/af;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {v0}, Lcom/autochips/carplay/b/ac;->I(Lcom/autochips/carplay/b/ac;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/autochips/carplay/b/af;->sW:Lcom/autochips/carplay/b/ac;

    const/16 v1, 0x17

    const-wide/16 v2, 0x2710

    invoke-virtual {v0, v1, v2, v3}, Lcom/autochips/carplay/b/ac;->sendMessageDelayed(IJ)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/autochips/carplay/b/af;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {v0}, Lcom/autochips/carplay/b/ac;->J(Lcom/autochips/carplay/b/ac;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/autochips/carplay/b/af;->sW:Lcom/autochips/carplay/b/ac;

    iget-object v0, v0, Lcom/autochips/carplay/b/ac;->sT:Lcom/autochips/carplay/b/aa;

    iget-object v0, v0, Lcom/autochips/carplay/b/aa;->sQ:Lcom/autochips/carplay/b/ac;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/b/ac;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    iget-object v1, p0, Lcom/autochips/carplay/b/af;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {v1}, Lcom/autochips/carplay/b/ac;->s(Lcom/autochips/carplay/b/ac;)Landroid/view/Surface;

    move-result-object v1

    iput-object v1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object v1, p0, Lcom/autochips/carplay/b/af;->sW:Lcom/autochips/carplay/b/ac;

    invoke-virtual {v1, v0}, Lcom/autochips/carplay/b/ac;->sendMessage(Landroid/os/Message;)V

    :cond_1
    return-void
.end method

.method public final exit()V
    .locals 2

    const-string v0, "ScreenManager"

    const-string v1, "exit StartedState"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/b/af;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {v0}, Lcom/autochips/carplay/b/ac;->M(Lcom/autochips/carplay/b/ac;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/autochips/carplay/b/af;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {v0}, Lcom/autochips/carplay/b/ac;->N(Lcom/autochips/carplay/b/ac;)V

    :cond_0
    iget-object v0, p0, Lcom/autochips/carplay/b/af;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {v0}, Lcom/autochips/carplay/b/ac;->O(Lcom/autochips/carplay/b/ac;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/autochips/carplay/b/af;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {v0}, Lcom/autochips/carplay/b/ac;->P(Lcom/autochips/carplay/b/ac;)V

    :cond_1
    return-void
.end method

.method public final processMessage(Landroid/os/Message;)Z
    .locals 7

    const-string v0, "ScreenManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/autochips/carplay/b/af;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " processMessage: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Landroid/os/Message;->what:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget v0, p1, Landroid/os/Message;->what:I

    const-wide/16 v1, 0x3e8

    const/16 v3, 0x108

    const/16 v4, 0x15

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-eqz v0, :cond_8

    const/16 p1, 0x10

    if-eq v0, p1, :cond_7

    if-eq v0, v4, :cond_2

    packed-switch v0, :pswitch_data_0

    return v6

    :pswitch_0
    const-string p1, "ScreenManager"

    const-string v0, "stop video"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/autochips/carplay/b/af;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1, v5}, Lcom/autochips/carplay/b/ac;->a(Lcom/autochips/carplay/b/ac;I)I

    sget-object p1, Lcom/autochips/carplay/b/aa;->si:Lcom/autochips/carplay/b/aa;

    invoke-virtual {p1}, Lcom/autochips/carplay/b/aa;->cR()I

    iget-object p1, p0, Lcom/autochips/carplay/b/af;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1, v6}, Lcom/autochips/carplay/b/ac;->a(Lcom/autochips/carplay/b/ac;Z)Z

    sget-object p1, Lcom/autochips/carplay/b/aa;->si:Lcom/autochips/carplay/b/aa;

    invoke-virtual {p1}, Lcom/autochips/carplay/b/aa;->do()Lcom/autochips/carplay/common/b;

    move-result-object p1

    if-eqz p1, :cond_c

    invoke-virtual {p1}, Lcom/autochips/carplay/common/b;->cS()I

    move-result p1

    const/4 v0, 0x2

    if-ne v0, p1, :cond_0

    iget-object p1, p0, Lcom/autochips/carplay/b/af;->sW:Lcom/autochips/carplay/b/ac;

    iget-object v0, p0, Lcom/autochips/carplay/b/af;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {v0}, Lcom/autochips/carplay/b/ac;->x(Lcom/autochips/carplay/b/ac;)Lcom/android/internal/util/State;

    move-result-object v0

    :goto_0
    invoke-virtual {p1, v0}, Lcom/autochips/carplay/b/ac;->transitionTo(Lcom/android/internal/util/IState;)V

    return v5

    :cond_0
    if-ne v5, p1, :cond_1

    iget-object p1, p0, Lcom/autochips/carplay/b/af;->sW:Lcom/autochips/carplay/b/ac;

    iget-object v0, p0, Lcom/autochips/carplay/b/af;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {v0}, Lcom/autochips/carplay/b/ac;->i(Lcom/autochips/carplay/b/ac;)Lcom/android/internal/util/State;

    move-result-object v0

    goto :goto_0

    :cond_1
    const-string v0, "ScreenManager"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "screen entity: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return v5

    :pswitch_1
    iget-object p1, p0, Lcom/autochips/carplay/b/af;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1, v6}, Lcom/autochips/carplay/b/ac;->a(Lcom/autochips/carplay/b/ac;I)I

    return v5

    :cond_2
    iget-object p1, p0, Lcom/autochips/carplay/b/af;->sW:Lcom/autochips/carplay/b/ac;

    iget-object p1, p1, Lcom/autochips/carplay/b/ac;->sT:Lcom/autochips/carplay/b/aa;

    invoke-static {p1}, Lcom/autochips/carplay/b/aa;->d(Lcom/autochips/carplay/b/aa;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-boolean p1, p0, Lcom/autochips/carplay/b/af;->sX:Z

    if-nez p1, :cond_4

    :cond_3
    const-string p1, "persist.cp.v.keyframe"

    invoke-static {p1, v6}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_6

    :cond_4
    const-string p1, "ScreenManager"

    const-string v0, "user force keyframe"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/autochips/carplay/b/af;->sW:Lcom/autochips/carplay/b/ac;

    invoke-virtual {p1}, Lcom/autochips/carplay/b/ac;->getHandler()Landroid/os/Handler;

    move-result-object p1

    invoke-static {p1}, Landroid/os/Message;->obtain(Landroid/os/Handler;)Landroid/os/Message;

    move-result-object p1

    iput v3, p1, Landroid/os/Message;->what:I

    sget-object v0, Lcom/autochips/carplay/b/aa;->si:Lcom/autochips/carplay/b/aa;

    invoke-virtual {v0, p1}, Lcom/autochips/carplay/b/aa;->a(Landroid/os/Message;)V

    iget-boolean p1, p0, Lcom/autochips/carplay/b/af;->sX:Z

    if-eqz p1, :cond_5

    iput-boolean v6, p0, Lcom/autochips/carplay/b/af;->sX:Z

    goto :goto_1

    :cond_5
    const-string p1, "persist.cp.v.keyframe"

    const-string v0, "false"

    invoke-static {p1, v0}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    :cond_6
    :goto_1
    iget-object p1, p0, Lcom/autochips/carplay/b/af;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->L(Lcom/autochips/carplay/b/ac;)Z

    move-result p1

    if-nez p1, :cond_c

    :goto_2
    iget-object p1, p0, Lcom/autochips/carplay/b/af;->sW:Lcom/autochips/carplay/b/ac;

    invoke-virtual {p1, v4, v1, v2}, Lcom/autochips/carplay/b/ac;->sendMessageDelayed(IJ)V

    return v5

    :cond_7
    iget-object p1, p0, Lcom/autochips/carplay/b/af;->sW:Lcom/autochips/carplay/b/ac;

    invoke-virtual {p1}, Lcom/autochips/carplay/b/ac;->getHandler()Landroid/os/Handler;

    move-result-object p1

    invoke-static {p1}, Landroid/os/Message;->obtain(Landroid/os/Handler;)Landroid/os/Message;

    move-result-object p1

    iput v3, p1, Landroid/os/Message;->what:I

    sget-object v0, Lcom/autochips/carplay/b/aa;->si:Lcom/autochips/carplay/b/aa;

    invoke-virtual {v0, p1}, Lcom/autochips/carplay/b/aa;->a(Landroid/os/Message;)V

    return v5

    :cond_8
    iget-object v0, p0, Lcom/autochips/carplay/b/af;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {v0, p1, v6}, Lcom/autochips/carplay/b/ac;->a(Lcom/autochips/carplay/b/ac;Landroid/os/Message;Z)Z

    move-result v0

    if-nez v0, :cond_9

    iget-object v0, p0, Lcom/autochips/carplay/b/af;->sW:Lcom/autochips/carplay/b/ac;

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Landroid/view/Surface;

    invoke-static {v0, p1}, Lcom/autochips/carplay/b/ac;->a(Lcom/autochips/carplay/b/ac;Landroid/view/Surface;)Landroid/view/Surface;

    const-string p1, "ScreenManager"

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v6, "start video, surf :"

    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v6, p0, Lcom/autochips/carplay/b/af;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {v6}, Lcom/autochips/carplay/b/ac;->s(Lcom/autochips/carplay/b/ac;)Landroid/view/Surface;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/autochips/carplay/b/af;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->s(Lcom/autochips/carplay/b/ac;)Landroid/view/Surface;

    move-result-object p1

    if-eqz p1, :cond_a

    sget-object p1, Lcom/autochips/carplay/b/aa;->si:Lcom/autochips/carplay/b/aa;

    iget-object v0, p0, Lcom/autochips/carplay/b/af;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {v0}, Lcom/autochips/carplay/b/ac;->s(Lcom/autochips/carplay/b/ac;)Landroid/view/Surface;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/b/aa;->setSurface(Landroid/view/Surface;)I

    sget-object p1, Lcom/autochips/carplay/b/aa;->si:Lcom/autochips/carplay/b/aa;

    invoke-virtual {p1}, Lcom/autochips/carplay/b/aa;->cQ()I

    iget-object p1, p0, Lcom/autochips/carplay/b/af;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1, v5}, Lcom/autochips/carplay/b/ac;->a(Lcom/autochips/carplay/b/ac;Z)Z

    goto :goto_3

    :cond_9
    iget-object v0, p0, Lcom/autochips/carplay/b/af;->sW:Lcom/autochips/carplay/b/ac;

    invoke-virtual {v0, v6}, Lcom/autochips/carplay/b/ac;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p1, p0, Lcom/autochips/carplay/b/af;->sW:Lcom/autochips/carplay/b/ac;

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/b/ac;->deferMessage(Landroid/os/Message;)V

    :cond_a
    :goto_3
    iget-object p1, p0, Lcom/autochips/carplay/b/af;->sW:Lcom/autochips/carplay/b/ac;

    iget-object p1, p1, Lcom/autochips/carplay/b/ac;->sT:Lcom/autochips/carplay/b/aa;

    invoke-static {p1}, Lcom/autochips/carplay/b/aa;->d(Lcom/autochips/carplay/b/aa;)Z

    move-result p1

    if-nez p1, :cond_b

    iput-boolean v5, p0, Lcom/autochips/carplay/b/af;->sX:Z

    goto :goto_4

    :cond_b
    iget-object p1, p0, Lcom/autochips/carplay/b/af;->sW:Lcom/autochips/carplay/b/ac;

    invoke-virtual {p1}, Lcom/autochips/carplay/b/ac;->getHandler()Landroid/os/Handler;

    move-result-object p1

    invoke-static {p1}, Landroid/os/Message;->obtain(Landroid/os/Handler;)Landroid/os/Message;

    move-result-object p1

    iput v3, p1, Landroid/os/Message;->what:I

    sget-object v0, Lcom/autochips/carplay/b/aa;->si:Lcom/autochips/carplay/b/aa;

    invoke-virtual {v0, p1}, Lcom/autochips/carplay/b/aa;->a(Landroid/os/Message;)V

    :goto_4
    iget-object p1, p0, Lcom/autochips/carplay/b/af;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->K(Lcom/autochips/carplay/b/ac;)Z

    move-result p1

    if-nez p1, :cond_c

    goto/16 :goto_2

    :cond_c
    return v5

    nop

    :pswitch_data_0
    .packed-switch 0xa
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
