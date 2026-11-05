.class final Lcom/autochips/carplay/b/w;
.super Lcom/android/internal/util/State;


# instance fields
.field final synthetic sP:Lcom/autochips/carplay/b/s;


# direct methods
.method constructor <init>(Lcom/autochips/carplay/b/s;)V
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/b/w;->sP:Lcom/autochips/carplay/b/s;

    invoke-direct {p0}, Lcom/android/internal/util/State;-><init>()V

    return-void
.end method


# virtual methods
.method public final enter()V
    .locals 2

    const-string v0, "OutputAudioStateMachine"

    const-string v1, "entering ControllerState"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public final exit()V
    .locals 2

    iget-object v0, p0, Lcom/autochips/carplay/b/w;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {v0}, Lcom/autochips/carplay/b/s;->s(Lcom/autochips/carplay/b/s;)V

    const-string v0, "OutputAudioStateMachine"

    const-string v1, "exit ControllerState"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public final processMessage(Landroid/os/Message;)Z
    .locals 6

    const-string v0, "OutputAudioStateMachine"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/autochips/carplay/b/w;->getName()Ljava/lang/String;

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

    const/4 v2, 0x1

    const/4 v3, 0x0

    sparse-switch v0, :sswitch_data_0

    return v3

    :sswitch_0
    iget-object p1, p0, Lcom/autochips/carplay/b/w;->sP:Lcom/autochips/carplay/b/s;

    iget-object p1, p1, Lcom/autochips/carplay/b/s;->sC:Lcom/autochips/carplay/b/m;

    invoke-static {p1}, Lcom/autochips/carplay/b/m;->a(Lcom/autochips/carplay/b/m;)Lcom/autochips/carplay/c/a;

    move-result-object p1

    invoke-virtual {p1}, Lcom/autochips/carplay/c/a;->el()Z

    move-result p1

    iget-object v0, p0, Lcom/autochips/carplay/b/w;->sP:Lcom/autochips/carplay/b/s;

    iget-object v0, v0, Lcom/autochips/carplay/b/s;->sC:Lcom/autochips/carplay/b/m;

    invoke-static {v0}, Lcom/autochips/carplay/b/m;->a(Lcom/autochips/carplay/b/m;)Lcom/autochips/carplay/c/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/autochips/carplay/c/a;->em()I

    move-result v0

    if-nez p1, :cond_6

    if-nez v0, :cond_6

    const-string v3, "OutputAudioStateMachine"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "<ControllerState> accessoty callOn: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string p1, ", audioState: "

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v3, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/autochips/carplay/b/w;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {p1}, Lcom/autochips/carplay/b/s;->m(Lcom/autochips/carplay/b/s;)Z

    move-result p1

    if-eqz p1, :cond_6

    sget-object p1, Lcom/autochips/carplay/b/m;->sj:Lcom/autochips/carplay/b/m;

    invoke-virtual {p1}, Lcom/autochips/carplay/b/m;->do()Lcom/autochips/carplay/common/b;

    move-result-object p1

    if-eqz p1, :cond_6

    invoke-virtual {p1}, Lcom/autochips/carplay/common/b;->getMainAudio()I

    move-result p1

    if-ne v1, p1, :cond_6

    iget-object p1, p0, Lcom/autochips/carplay/b/w;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {p1}, Lcom/autochips/carplay/b/s;->n(Lcom/autochips/carplay/b/s;)V

    return v2

    :sswitch_1
    const-string v0, "OutputAudioStateMachine"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "wait mode change timeout, current request transfer type: "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/autochips/carplay/b/w;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {v3}, Lcom/autochips/carplay/b/s;->a(Lcom/autochips/carplay/b/s;)I

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "("

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, p1, Landroid/os/Message;->arg1:I

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ")"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/autochips/carplay/b/w;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {p1}, Lcom/autochips/carplay/b/s;->l(Lcom/autochips/carplay/b/s;)V

    return v2

    :sswitch_2
    invoke-static {}, Lcom/autochips/carplay/b/m;->dh()Z

    move-result p1

    if-eqz p1, :cond_6

    iget-object p1, p0, Lcom/autochips/carplay/b/w;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {p1}, Lcom/autochips/carplay/b/s;->m(Lcom/autochips/carplay/b/s;)Z

    move-result p1

    if-nez p1, :cond_6

    iget-object p1, p0, Lcom/autochips/carplay/b/w;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {p1}, Lcom/autochips/carplay/b/s;->r(Lcom/autochips/carplay/b/s;)V

    return v2

    :sswitch_3
    iget-object p1, p0, Lcom/autochips/carplay/b/w;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {p1}, Lcom/autochips/carplay/b/s;->a(Lcom/autochips/carplay/b/s;)I

    move-result p1

    const/4 v0, 0x3

    if-eq p1, v0, :cond_0

    iget-object p1, p0, Lcom/autochips/carplay/b/w;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {p1}, Lcom/autochips/carplay/b/s;->a(Lcom/autochips/carplay/b/s;)I

    move-result p1

    if-eq p1, v2, :cond_0

    iget-object p1, p0, Lcom/autochips/carplay/b/w;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {p1}, Lcom/autochips/carplay/b/s;->a(Lcom/autochips/carplay/b/s;)I

    move-result p1

    if-ne p1, v1, :cond_1

    :cond_0
    iget-object p1, p0, Lcom/autochips/carplay/b/w;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {p1}, Lcom/autochips/carplay/b/s;->q(Lcom/autochips/carplay/b/s;)V

    iget-object p1, p0, Lcom/autochips/carplay/b/w;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {p1}, Lcom/autochips/carplay/b/s;->c(Lcom/autochips/carplay/b/s;)I

    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/autochips/carplay/b/w;->sP:Lcom/autochips/carplay/b/s;

    iget-object v0, p0, Lcom/autochips/carplay/b/w;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {v0}, Lcom/autochips/carplay/b/s;->o(Lcom/autochips/carplay/b/s;)Lcom/android/internal/util/State;

    move-result-object v0

    :goto_1
    invoke-virtual {p1, v0}, Lcom/autochips/carplay/b/s;->transitionTo(Lcom/android/internal/util/IState;)V

    return v2

    :sswitch_4
    iget-object p1, p0, Lcom/autochips/carplay/b/w;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {p1}, Lcom/autochips/carplay/b/s;->a(Lcom/autochips/carplay/b/s;)I

    move-result p1

    const/4 v0, 0x4

    if-ne p1, v0, :cond_6

    iget-object p1, p0, Lcom/autochips/carplay/b/w;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {p1}, Lcom/autochips/carplay/b/s;->p(Lcom/autochips/carplay/b/s;)V

    iget-object p1, p0, Lcom/autochips/carplay/b/w;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {p1}, Lcom/autochips/carplay/b/s;->c(Lcom/autochips/carplay/b/s;)I

    return v2

    :sswitch_5
    iget p1, p1, Landroid/os/Message;->arg1:I

    iget-object v0, p0, Lcom/autochips/carplay/b/w;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {v0, p1}, Lcom/autochips/carplay/b/s;->d(Lcom/autochips/carplay/b/s;I)V

    return v2

    :sswitch_6
    iget-object v0, p0, Lcom/autochips/carplay/b/w;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {v0, v2}, Lcom/autochips/carplay/b/s;->a(Lcom/autochips/carplay/b/s;I)I

    iget-object v0, p0, Lcom/autochips/carplay/b/w;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {v0, v3}, Lcom/autochips/carplay/b/s;->b(Lcom/autochips/carplay/b/s;I)I

    iget-object v0, p0, Lcom/autochips/carplay/b/w;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {v0, v3}, Lcom/autochips/carplay/b/s;->c(Lcom/autochips/carplay/b/s;I)I

    iget p1, p1, Landroid/os/Message;->arg1:I

    const/16 v0, 0x64

    if-eq p1, v0, :cond_3

    const/16 v0, 0x66

    if-ne p1, v0, :cond_2

    goto :goto_2

    :cond_2
    const-string v0, "OutputAudioStateMachine"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "ignore invalid stream id: "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v2

    :cond_3
    :goto_2
    sget-object p1, Lcom/autochips/carplay/b/m;->sj:Lcom/autochips/carplay/b/m;

    invoke-virtual {p1}, Lcom/autochips/carplay/b/m;->do()Lcom/autochips/carplay/common/b;

    move-result-object p1

    if-eqz p1, :cond_6

    invoke-virtual {p1}, Lcom/autochips/carplay/common/b;->getMainAudio()I

    move-result p1

    if-ne v1, p1, :cond_4

    goto :goto_0

    :cond_4
    if-ne v2, p1, :cond_5

    iget-object v0, p0, Lcom/autochips/carplay/b/w;->sP:Lcom/autochips/carplay/b/s;

    invoke-virtual {v0}, Lcom/autochips/carplay/b/s;->getCurrentState()Lcom/android/internal/util/IState;

    move-result-object v0

    iget-object v1, p0, Lcom/autochips/carplay/b/w;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {v1}, Lcom/autochips/carplay/b/s;->g(Lcom/autochips/carplay/b/s;)Lcom/android/internal/util/State;

    move-result-object v1

    if-eq v0, v1, :cond_5

    iget-object p1, p0, Lcom/autochips/carplay/b/w;->sP:Lcom/autochips/carplay/b/s;

    iget-object v0, p0, Lcom/autochips/carplay/b/w;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {v0}, Lcom/autochips/carplay/b/s;->g(Lcom/autochips/carplay/b/s;)Lcom/android/internal/util/State;

    move-result-object v0

    goto :goto_1

    :cond_5
    const-string v0, "OutputAudioStateMachine"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "main audio entity: "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return v2

    :sswitch_7
    iget v0, p1, Landroid/os/Message;->arg1:I

    iget p1, p1, Landroid/os/Message;->arg2:I

    iget-object v1, p0, Lcom/autochips/carplay/b/w;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {v1, v3}, Lcom/autochips/carplay/b/s;->a(Lcom/autochips/carplay/b/s;I)I

    iget-object v1, p0, Lcom/autochips/carplay/b/w;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {v1, v0}, Lcom/autochips/carplay/b/s;->b(Lcom/autochips/carplay/b/s;I)I

    iget-object v1, p0, Lcom/autochips/carplay/b/w;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {v1, p1}, Lcom/autochips/carplay/b/s;->c(Lcom/autochips/carplay/b/s;I)I

    iget-object v1, p0, Lcom/autochips/carplay/b/w;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {v1, v0, p1}, Lcom/autochips/carplay/b/s;->a(Lcom/autochips/carplay/b/s;II)V

    return v2

    :sswitch_8
    iget-object p1, p0, Lcom/autochips/carplay/b/w;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {p1, v3}, Lcom/autochips/carplay/b/s;->a(Lcom/autochips/carplay/b/s;Z)V

    return v2

    :sswitch_9
    iget-object p1, p0, Lcom/autochips/carplay/b/w;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {p1, v2}, Lcom/autochips/carplay/b/s;->a(Lcom/autochips/carplay/b/s;Z)V

    :cond_6
    return v2

    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_9
        0x1 -> :sswitch_8
        0xa -> :sswitch_7
        0xb -> :sswitch_6
        0xc -> :sswitch_5
        0xd -> :sswitch_4
        0xe -> :sswitch_3
        0x11 -> :sswitch_2
        0x12 -> :sswitch_1
        0x901 -> :sswitch_0
        0x902 -> :sswitch_0
    .end sparse-switch
.end method
