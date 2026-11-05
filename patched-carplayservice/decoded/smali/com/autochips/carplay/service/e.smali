.class final Lcom/autochips/carplay/service/e;
.super Lcom/autochips/carplay/service/b;


# instance fields
.field final synthetic ti:Lcom/autochips/carplay/service/a;


# direct methods
.method private constructor <init>(Lcom/autochips/carplay/service/a;)V
    .locals 1

    iput-object p1, p0, Lcom/autochips/carplay/service/e;->ti:Lcom/autochips/carplay/service/a;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/autochips/carplay/service/b;-><init>(Lcom/autochips/carplay/service/a;B)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/autochips/carplay/service/a;B)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/autochips/carplay/service/e;-><init>(Lcom/autochips/carplay/service/a;)V

    return-void
.end method

.method private du()Z
    .locals 5

    iget-object v0, p0, Lcom/autochips/carplay/service/e;->ti:Lcom/autochips/carplay/service/a;

    invoke-static {v0}, Lcom/autochips/carplay/service/a;->i(Lcom/autochips/carplay/service/a;)Lcom/autochips/carplay/service/i;

    move-result-object v0

    iget-object v1, p0, Lcom/autochips/carplay/service/e;->ti:Lcom/autochips/carplay/service/a;

    invoke-static {v1}, Lcom/autochips/carplay/service/a;->l(Lcom/autochips/carplay/service/a;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/service/i;->ae(I)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/autochips/carplay/service/e;->ti:Lcom/autochips/carplay/service/a;

    const/16 v2, 0x206

    const-wide/16 v3, 0x3e8

    invoke-virtual {v1, v2, v3, v4}, Lcom/autochips/carplay/service/a;->sendMessageDelayed(IJ)V

    :cond_0
    return v0
.end method

.method private dv()Z
    .locals 5

    iget-object v0, p0, Lcom/autochips/carplay/service/e;->ti:Lcom/autochips/carplay/service/a;

    invoke-static {v0}, Lcom/autochips/carplay/service/a;->i(Lcom/autochips/carplay/service/a;)Lcom/autochips/carplay/service/i;

    move-result-object v0

    iget-object v1, p0, Lcom/autochips/carplay/service/e;->ti:Lcom/autochips/carplay/service/a;

    invoke-static {v1}, Lcom/autochips/carplay/service/a;->l(Lcom/autochips/carplay/service/a;)I

    invoke-virtual {v0}, Lcom/autochips/carplay/service/i;->dQ()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/autochips/carplay/service/e;->ti:Lcom/autochips/carplay/service/a;

    const/16 v2, 0x706

    const-wide/16 v3, 0xfa0

    invoke-virtual {v1, v2, v3, v4}, Lcom/autochips/carplay/service/a;->sendMessageDelayed(IJ)V

    :cond_0
    return v0
.end method


# virtual methods
.method final dt()I
    .locals 1

    const/4 v0, 0x3

    return v0
.end method

.method public final enter()V
    .locals 4

    invoke-super {p0}, Lcom/autochips/carplay/service/b;->enter()V

    iget-object v0, p0, Lcom/autochips/carplay/service/e;->ti:Lcom/autochips/carplay/service/a;

    invoke-static {v0}, Lcom/autochips/carplay/service/a;->b(Lcom/autochips/carplay/service/a;)Lcom/autochips/carplay/service/CarplayService;

    move-result-object v0

    invoke-virtual {v0}, Lcom/autochips/carplay/service/CarplayService;->getConnectedDevices()Ljava/util/List;

    move-result-object v0

    invoke-static {}, Lcom/autochips/carplay/service/a;->dr()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "isNeedDisconnectAdapter, connectionDevice: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/autochips/carplay/service/e;->ti:Lcom/autochips/carplay/service/a;

    const/16 v1, 0x47

    const-wide/16 v2, 0x7d0

    invoke-virtual {v0, v1, v2, v3}, Lcom/autochips/carplay/service/a;->sendMessageDelayed(IJ)V

    invoke-direct {p0}, Lcom/autochips/carplay/service/e;->du()Z

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    const-string v0, "step: waiting for device disconnect..."

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/service/e;->B(Ljava/lang/String;)V

    return-void

    :cond_1
    invoke-direct {p0}, Lcom/autochips/carplay/service/e;->dv()Z

    return-void
.end method

.method public final exit()V
    .locals 0

    invoke-super {p0}, Lcom/autochips/carplay/service/b;->exit()V

    return-void
.end method

.method public final processMessage(Landroid/os/Message;)Z
    .locals 3

    iget v0, p1, Landroid/os/Message;->what:I

    invoke-static {v0}, Lcom/autochips/carplay/common/CarplayMessage;->messageString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/service/e;->B(Ljava/lang/String;)V

    iget v0, p1, Landroid/os/Message;->what:I

    sparse-switch v0, :sswitch_data_0

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Unhandled message - "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget p1, p1, Landroid/os/Message;->what:I

    invoke-static {p1}, Lcom/autochips/carplay/common/CarplayMessage;->messageString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/service/e;->B(Ljava/lang/String;)V

    const/4 p1, 0x0

    return p1

    :sswitch_0
    iget-object v0, p0, Lcom/autochips/carplay/service/e;->ti:Lcom/autochips/carplay/service/a;

    invoke-static {v0}, Lcom/autochips/carplay/service/a;->p(Lcom/autochips/carplay/service/a;)V

    :sswitch_1
    iget p1, p1, Landroid/os/Message;->what:I

    invoke-static {p1}, Lcom/autochips/carplay/common/CarplayMessage;->messageString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/service/e;->B(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/e;->ti:Lcom/autochips/carplay/service/a;

    invoke-static {p1}, Lcom/autochips/carplay/service/a;->i(Lcom/autochips/carplay/service/a;)Lcom/autochips/carplay/service/i;

    move-result-object p1

    iget-object v0, p0, Lcom/autochips/carplay/service/e;->ti:Lcom/autochips/carplay/service/a;

    invoke-static {v0}, Lcom/autochips/carplay/service/a;->l(Lcom/autochips/carplay/service/a;)I

    invoke-virtual {p1}, Lcom/autochips/carplay/service/i;->dS()Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/autochips/carplay/service/e;->ti:Lcom/autochips/carplay/service/a;

    const/16 v0, 0x606

    const-wide/16 v1, 0x1f4

    :goto_0
    invoke-virtual {p1, v0, v1, v2}, Lcom/autochips/carplay/service/a;->sendMessageDelayed(IJ)V

    goto/16 :goto_1

    :sswitch_2
    iget-object v0, p0, Lcom/autochips/carplay/service/e;->ti:Lcom/autochips/carplay/service/a;

    invoke-static {v0}, Lcom/autochips/carplay/service/a;->q(Lcom/autochips/carplay/service/a;)V

    :sswitch_3
    iget p1, p1, Landroid/os/Message;->what:I

    invoke-static {p1}, Lcom/autochips/carplay/common/CarplayMessage;->messageString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/service/e;->B(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/e;->ti:Lcom/autochips/carplay/service/a;

    invoke-static {p1}, Lcom/autochips/carplay/service/a;->i(Lcom/autochips/carplay/service/a;)Lcom/autochips/carplay/service/i;

    move-result-object p1

    iget-object v0, p0, Lcom/autochips/carplay/service/e;->ti:Lcom/autochips/carplay/service/a;

    invoke-static {v0}, Lcom/autochips/carplay/service/a;->l(Lcom/autochips/carplay/service/a;)I

    invoke-virtual {p1}, Lcom/autochips/carplay/service/i;->dO()Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/autochips/carplay/service/e;->ti:Lcom/autochips/carplay/service/a;

    const/16 v0, 0x506

    const-wide/16 v1, 0x3e8

    goto :goto_0

    :sswitch_4
    iget-object v0, p0, Lcom/autochips/carplay/service/e;->ti:Lcom/autochips/carplay/service/a;

    invoke-static {v0}, Lcom/autochips/carplay/service/a;->r(Lcom/autochips/carplay/service/a;)V

    :sswitch_5
    iget p1, p1, Landroid/os/Message;->what:I

    invoke-static {p1}, Lcom/autochips/carplay/common/CarplayMessage;->messageString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/service/e;->B(Ljava/lang/String;)V

    invoke-static {}, Lcom/autochips/carplay/service/a;->ds()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/autochips/carplay/service/e;->ti:Lcom/autochips/carplay/service/a;

    invoke-static {p1}, Lcom/autochips/carplay/service/a;->i(Lcom/autochips/carplay/service/a;)Lcom/autochips/carplay/service/i;

    move-result-object p1

    iget-object v0, p0, Lcom/autochips/carplay/service/e;->ti:Lcom/autochips/carplay/service/a;

    invoke-static {v0}, Lcom/autochips/carplay/service/a;->l(Lcom/autochips/carplay/service/a;)I

    invoke-virtual {p1}, Lcom/autochips/carplay/service/i;->dM()Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/autochips/carplay/service/e;->ti:Lcom/autochips/carplay/service/a;

    const/16 v0, 0x406

    const-wide/16 v1, 0xbb8

    goto :goto_0

    :sswitch_6
    iget-object v0, p0, Lcom/autochips/carplay/service/e;->ti:Lcom/autochips/carplay/service/a;

    invoke-static {v0}, Lcom/autochips/carplay/service/a;->s(Lcom/autochips/carplay/service/a;)V

    :sswitch_7
    iget p1, p1, Landroid/os/Message;->what:I

    invoke-static {p1}, Lcom/autochips/carplay/common/CarplayMessage;->messageString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/service/e;->B(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/e;->ti:Lcom/autochips/carplay/service/a;

    invoke-static {p1}, Lcom/autochips/carplay/service/a;->i(Lcom/autochips/carplay/service/a;)Lcom/autochips/carplay/service/i;

    move-result-object p1

    iget-object v0, p0, Lcom/autochips/carplay/service/e;->ti:Lcom/autochips/carplay/service/a;

    invoke-static {v0}, Lcom/autochips/carplay/service/a;->l(Lcom/autochips/carplay/service/a;)I

    invoke-virtual {p1}, Lcom/autochips/carplay/service/i;->dK()Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/autochips/carplay/service/e;->ti:Lcom/autochips/carplay/service/a;

    const/16 v0, 0x306

    const-wide/16 v1, 0x1388

    goto :goto_0

    :sswitch_8
    iget-object v0, p0, Lcom/autochips/carplay/service/e;->ti:Lcom/autochips/carplay/service/a;

    invoke-static {v0}, Lcom/autochips/carplay/service/a;->t(Lcom/autochips/carplay/service/a;)V

    :sswitch_9
    iget p1, p1, Landroid/os/Message;->what:I

    invoke-static {p1}, Lcom/autochips/carplay/common/CarplayMessage;->messageString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/service/e;->B(Ljava/lang/String;)V

    :cond_0
    invoke-direct {p0}, Lcom/autochips/carplay/service/e;->du()Z

    goto :goto_1

    :sswitch_a
    iget-object v0, p0, Lcom/autochips/carplay/service/e;->ti:Lcom/autochips/carplay/service/a;

    invoke-static {v0}, Lcom/autochips/carplay/service/a;->u(Lcom/autochips/carplay/service/a;)V

    iget-object v0, p0, Lcom/autochips/carplay/service/e;->ti:Lcom/autochips/carplay/service/a;

    invoke-static {v0}, Lcom/autochips/carplay/service/a;->v(Lcom/autochips/carplay/service/a;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string p1, "need to for other resource disable..."

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/service/e;->B(Ljava/lang/String;)V

    goto :goto_1

    :cond_1
    :sswitch_b
    iget p1, p1, Landroid/os/Message;->what:I

    invoke-static {p1}, Lcom/autochips/carplay/common/CarplayMessage;->messageString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/service/e;->B(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/e;->ti:Lcom/autochips/carplay/service/a;

    iget-object v0, p0, Lcom/autochips/carplay/service/e;->ti:Lcom/autochips/carplay/service/a;

    invoke-static {v0}, Lcom/autochips/carplay/service/a;->w(Lcom/autochips/carplay/service/a;)Lcom/autochips/carplay/service/c;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/service/a;->transitionTo(Lcom/android/internal/util/IState;)V

    goto :goto_1

    :sswitch_c
    iget-object v0, p0, Lcom/autochips/carplay/service/e;->ti:Lcom/autochips/carplay/service/a;

    invoke-static {v0}, Lcom/autochips/carplay/service/a;->o(Lcom/autochips/carplay/service/a;)V

    :sswitch_d
    iget p1, p1, Landroid/os/Message;->what:I

    invoke-static {p1}, Lcom/autochips/carplay/common/CarplayMessage;->messageString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/service/e;->B(Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/autochips/carplay/service/e;->dv()Z

    :cond_2
    :goto_1
    const/4 p1, 0x1

    return p1

    :sswitch_data_0
    .sparse-switch
        0x46 -> :sswitch_c
        0x47 -> :sswitch_d
        0x202 -> :sswitch_a
        0x203 -> :sswitch_b
        0x205 -> :sswitch_b
        0x206 -> :sswitch_b
        0x302 -> :sswitch_8
        0x305 -> :sswitch_9
        0x306 -> :sswitch_9
        0x402 -> :sswitch_6
        0x405 -> :sswitch_7
        0x406 -> :sswitch_7
        0x502 -> :sswitch_4
        0x505 -> :sswitch_5
        0x506 -> :sswitch_5
        0x602 -> :sswitch_2
        0x605 -> :sswitch_3
        0x606 -> :sswitch_3
        0x702 -> :sswitch_0
        0x705 -> :sswitch_1
        0x706 -> :sswitch_1
    .end sparse-switch
.end method
