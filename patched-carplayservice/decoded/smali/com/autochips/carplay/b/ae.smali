.class final Lcom/autochips/carplay/b/ae;
.super Lcom/android/internal/util/State;


# instance fields
.field final synthetic sW:Lcom/autochips/carplay/b/ac;


# direct methods
.method constructor <init>(Lcom/autochips/carplay/b/ac;)V
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/b/ae;->sW:Lcom/autochips/carplay/b/ac;

    invoke-direct {p0}, Lcom/android/internal/util/State;-><init>()V

    return-void
.end method


# virtual methods
.method public final enter()V
    .locals 2

    const-string v0, "ScreenManager"

    const-string v1, "entering ControllerState"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public final exit()V
    .locals 2

    const-string v0, "ScreenManager"

    const-string v1, "exit ControllerState"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public final processMessage(Landroid/os/Message;)Z
    .locals 6

    const-string v0, "ScreenManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/autochips/carplay/b/ae;->getName()Ljava/lang/String;

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

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x1

    sparse-switch v0, :sswitch_data_0

    const-string v0, "ScreenManager"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "received an invalid message: "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v2

    :sswitch_0
    iget-object p1, p0, Lcom/autochips/carplay/b/ae;->sW:Lcom/autochips/carplay/b/ac;

    iget-object p1, p1, Lcom/autochips/carplay/b/ac;->sT:Lcom/autochips/carplay/b/aa;

    invoke-static {p1}, Lcom/autochips/carplay/b/aa;->c(Lcom/autochips/carplay/b/aa;)Z

    return v3

    :sswitch_1
    iget-object p1, p0, Lcom/autochips/carplay/b/ae;->sW:Lcom/autochips/carplay/b/ac;

    iget-object p1, p1, Lcom/autochips/carplay/b/ac;->sT:Lcom/autochips/carplay/b/aa;

    invoke-static {p1, v2}, Lcom/autochips/carplay/b/aa;->a(Lcom/autochips/carplay/b/aa;Z)Z

    return v3

    :sswitch_2
    iget-object p1, p0, Lcom/autochips/carplay/b/ae;->sW:Lcom/autochips/carplay/b/ac;

    iget-object p1, p1, Lcom/autochips/carplay/b/ac;->sT:Lcom/autochips/carplay/b/aa;

    invoke-static {p1, v3}, Lcom/autochips/carplay/b/aa;->a(Lcom/autochips/carplay/b/aa;Z)Z

    return v3

    :sswitch_3
    iget-object p1, p0, Lcom/autochips/carplay/b/ae;->sW:Lcom/autochips/carplay/b/ac;

    iget-object p1, p1, Lcom/autochips/carplay/b/ac;->sT:Lcom/autochips/carplay/b/aa;

    invoke-static {p1}, Lcom/autochips/carplay/b/aa;->b(Lcom/autochips/carplay/b/aa;)Lcom/autochips/carplay/c/a;

    move-result-object p1

    invoke-virtual {p1}, Lcom/autochips/carplay/c/a;->el()Z

    move-result p1

    iget-object v0, p0, Lcom/autochips/carplay/b/ae;->sW:Lcom/autochips/carplay/b/ac;

    iget-object v0, v0, Lcom/autochips/carplay/b/ac;->sT:Lcom/autochips/carplay/b/aa;

    invoke-static {v0}, Lcom/autochips/carplay/b/aa;->b(Lcom/autochips/carplay/b/aa;)Lcom/autochips/carplay/c/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/autochips/carplay/c/a;->em()I

    move-result v0

    if-nez p1, :cond_5

    if-nez v0, :cond_5

    const-string v2, "ScreenManager"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "<ControllerState> accessoty callOn: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string p1, ", audioState: "

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/autochips/carplay/b/ae;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->g(Lcom/autochips/carplay/b/ac;)Z

    move-result p1

    if-eqz p1, :cond_5

    sget-object p1, Lcom/autochips/carplay/b/aa;->si:Lcom/autochips/carplay/b/aa;

    invoke-virtual {p1}, Lcom/autochips/carplay/b/aa;->do()Lcom/autochips/carplay/common/b;

    move-result-object p1

    if-eqz p1, :cond_5

    invoke-virtual {p1}, Lcom/autochips/carplay/common/b;->cS()I

    move-result p1

    if-ne v1, p1, :cond_5

    goto :goto_0

    :sswitch_4
    iget-object p1, p0, Lcom/autochips/carplay/b/ae;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->g(Lcom/autochips/carplay/b/ac;)Z

    move-result p1

    if-eqz p1, :cond_5

    iget-object p1, p0, Lcom/autochips/carplay/b/ae;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->B(Lcom/autochips/carplay/b/ac;)I

    move-result p1

    if-eqz p1, :cond_5

    :goto_0
    iget-object p1, p0, Lcom/autochips/carplay/b/ae;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->t(Lcom/autochips/carplay/b/ac;)V

    return v3

    :sswitch_5
    iget-object p1, p0, Lcom/autochips/carplay/b/ae;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->g(Lcom/autochips/carplay/b/ac;)Z

    move-result p1

    if-nez p1, :cond_5

    iget-object p1, p0, Lcom/autochips/carplay/b/ae;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->A(Lcom/autochips/carplay/b/ac;)Z

    return v3

    :sswitch_6
    const-string v0, "ScreenManager"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v4, "wait mode change timeout, current request transfer type: "

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/autochips/carplay/b/ae;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {v4}, Lcom/autochips/carplay/b/ac;->c(Lcom/autochips/carplay/b/ac;)I

    move-result v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, "("

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, p1, Landroid/os/Message;->arg1:I

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ")"

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    sget-object p1, Lcom/autochips/carplay/b/aa;->si:Lcom/autochips/carplay/b/aa;

    invoke-virtual {p1}, Lcom/autochips/carplay/b/aa;->do()Lcom/autochips/carplay/common/b;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/autochips/carplay/common/b;->cS()I

    move-result p1

    if-ne v3, p1, :cond_0

    iget-object p1, p0, Lcom/autochips/carplay/b/ae;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->c(Lcom/autochips/carplay/b/ac;)I

    move-result p1

    if-ne p1, v1, :cond_0

    iget-object p1, p0, Lcom/autochips/carplay/b/ae;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->e(Lcom/autochips/carplay/b/ac;)I

    const-string p1, "ScreenManager"

    const-string v0, "not need to doModeChangedTimeout"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v3

    :cond_0
    iget-object p1, p0, Lcom/autochips/carplay/b/ae;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->q(Lcom/autochips/carplay/b/ac;)V

    return v3

    :sswitch_7
    iget-object p1, p0, Lcom/autochips/carplay/b/ae;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->b(Lcom/autochips/carplay/b/ac;)Z

    iget-object p1, p0, Lcom/autochips/carplay/b/ae;->sW:Lcom/autochips/carplay/b/ac;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/autochips/carplay/b/ac;->a(Lcom/autochips/carplay/b/ac;Landroid/view/Surface;)Landroid/view/Surface;

    iget-object p1, p0, Lcom/autochips/carplay/b/ae;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->j(Lcom/autochips/carplay/b/ac;)Lcom/autochips/carplay/common/f;

    iget-object p1, p0, Lcom/autochips/carplay/b/ae;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->e(Lcom/autochips/carplay/b/ac;)I

    iget-object p1, p0, Lcom/autochips/carplay/b/ae;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1, v3}, Lcom/autochips/carplay/b/ac;->a(Lcom/autochips/carplay/b/ac;I)I

    iget-object p1, p0, Lcom/autochips/carplay/b/ae;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1, v2}, Lcom/autochips/carplay/b/ac;->a(Lcom/autochips/carplay/b/ac;Z)Z

    iget-object p1, p0, Lcom/autochips/carplay/b/ae;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->C(Lcom/autochips/carplay/b/ac;)V

    iget-object p1, p0, Lcom/autochips/carplay/b/ae;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->D(Lcom/autochips/carplay/b/ac;)V

    iget-object p1, p0, Lcom/autochips/carplay/b/ae;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->E(Lcom/autochips/carplay/b/ac;)V

    iget-object p1, p0, Lcom/autochips/carplay/b/ae;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->F(Lcom/autochips/carplay/b/ac;)V

    iget-object p1, p0, Lcom/autochips/carplay/b/ae;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->G(Lcom/autochips/carplay/b/ac;)V

    iget-object p1, p0, Lcom/autochips/carplay/b/ae;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->H(Lcom/autochips/carplay/b/ac;)V

    return v3

    :sswitch_8
    iget-object p1, p0, Lcom/autochips/carplay/b/ae;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->c(Lcom/autochips/carplay/b/ac;)I

    move-result p1

    const/4 v0, 0x3

    if-eq p1, v0, :cond_1

    iget-object p1, p0, Lcom/autochips/carplay/b/ae;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->c(Lcom/autochips/carplay/b/ac;)I

    move-result p1

    if-ne p1, v3, :cond_2

    :cond_1
    iget-object p1, p0, Lcom/autochips/carplay/b/ae;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->v(Lcom/autochips/carplay/b/ac;)V

    iget-object p1, p0, Lcom/autochips/carplay/b/ae;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->e(Lcom/autochips/carplay/b/ac;)I

    :cond_2
    iget-object p1, p0, Lcom/autochips/carplay/b/ae;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->w(Lcom/autochips/carplay/b/ac;)V

    iget-object p1, p0, Lcom/autochips/carplay/b/ae;->sW:Lcom/autochips/carplay/b/ac;

    iget-object v0, p0, Lcom/autochips/carplay/b/ae;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {v0}, Lcom/autochips/carplay/b/ac;->x(Lcom/autochips/carplay/b/ac;)Lcom/android/internal/util/State;

    move-result-object v0

    goto :goto_2

    :sswitch_9
    iget-object p1, p0, Lcom/autochips/carplay/b/ae;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->c(Lcom/autochips/carplay/b/ac;)I

    move-result p1

    const/4 v0, 0x4

    if-eq p1, v0, :cond_4

    iget-object p1, p0, Lcom/autochips/carplay/b/ae;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->c(Lcom/autochips/carplay/b/ac;)I

    move-result p1

    if-ne p1, v1, :cond_3

    goto :goto_1

    :cond_3
    iget-object p1, p0, Lcom/autochips/carplay/b/ae;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->g(Lcom/autochips/carplay/b/ac;)Z

    move-result p1

    if-eqz p1, :cond_5

    iget-object p1, p0, Lcom/autochips/carplay/b/ae;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->z(Lcom/autochips/carplay/b/ac;)V

    return v3

    :cond_4
    :goto_1
    iget-object p1, p0, Lcom/autochips/carplay/b/ae;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->y(Lcom/autochips/carplay/b/ac;)V

    iget-object p1, p0, Lcom/autochips/carplay/b/ae;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->e(Lcom/autochips/carplay/b/ac;)I

    return v3

    :sswitch_a
    iget-object p1, p0, Lcom/autochips/carplay/b/ae;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1, v3}, Lcom/autochips/carplay/b/ac;->a(Lcom/autochips/carplay/b/ac;I)I

    return v3

    :sswitch_b
    iget-object p1, p0, Lcom/autochips/carplay/b/ae;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->u(Lcom/autochips/carplay/b/ac;)V

    iget-object p1, p0, Lcom/autochips/carplay/b/ae;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1, v2}, Lcom/autochips/carplay/b/ac;->a(Lcom/autochips/carplay/b/ac;I)I

    iget-object p1, p0, Lcom/autochips/carplay/b/ae;->sW:Lcom/autochips/carplay/b/ac;

    iget-object v0, p0, Lcom/autochips/carplay/b/ae;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {v0}, Lcom/autochips/carplay/b/ac;->a(Lcom/autochips/carplay/b/ac;)Lcom/android/internal/util/State;

    move-result-object v0

    :goto_2
    invoke-virtual {p1, v0}, Lcom/autochips/carplay/b/ac;->transitionTo(Lcom/android/internal/util/IState;)V

    return v3

    :sswitch_c
    iget-object v0, p0, Lcom/autochips/carplay/b/ae;->sW:Lcom/autochips/carplay/b/ac;

    iget-object v0, v0, Lcom/autochips/carplay/b/ac;->sT:Lcom/autochips/carplay/b/aa;

    invoke-static {v0}, Lcom/autochips/carplay/b/aa;->a(Lcom/autochips/carplay/b/aa;)Z

    move-result v0

    if-nez v0, :cond_5

    iget-object v0, p0, Lcom/autochips/carplay/b/ae;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {v0, p1, v3}, Lcom/autochips/carplay/b/ac;->a(Lcom/autochips/carplay/b/ac;Landroid/os/Message;Z)Z

    :cond_5
    return v3

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_c
        0x1 -> :sswitch_c
        0xa -> :sswitch_b
        0xb -> :sswitch_a
        0xc -> :sswitch_9
        0xd -> :sswitch_8
        0xf -> :sswitch_7
        0x14 -> :sswitch_6
        0x17 -> :sswitch_5
        0x18 -> :sswitch_4
        0x901 -> :sswitch_3
        0x902 -> :sswitch_3
        0x1001 -> :sswitch_2
        0x1002 -> :sswitch_1
        0x1003 -> :sswitch_0
    .end sparse-switch
.end method
