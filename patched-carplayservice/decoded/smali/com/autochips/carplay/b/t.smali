.class final Lcom/autochips/carplay/b/t;
.super Lcom/android/internal/util/State;


# instance fields
.field final synthetic sP:Lcom/autochips/carplay/b/s;


# direct methods
.method constructor <init>(Lcom/autochips/carplay/b/s;)V
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/b/t;->sP:Lcom/autochips/carplay/b/s;

    invoke-direct {p0}, Lcom/android/internal/util/State;-><init>()V

    return-void
.end method


# virtual methods
.method public final enter()V
    .locals 2

    const-string v0, "OutputAudioStateMachine"

    const-string v1, "entering AccessoryState"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public final processMessage(Landroid/os/Message;)Z
    .locals 5

    const-string v0, "OutputAudioStateMachine"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/autochips/carplay/b/t;->getName()Ljava/lang/String;

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

    const/4 v1, 0x1

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_0

    packed-switch v0, :pswitch_data_1

    packed-switch v0, :pswitch_data_2

    const-string v0, "OutputAudioStateMachine"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "received an invalid message: "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v2

    :pswitch_0
    iget-object p1, p0, Lcom/autochips/carplay/b/t;->sP:Lcom/autochips/carplay/b/s;

    iget-object p1, p1, Lcom/autochips/carplay/b/s;->sC:Lcom/autochips/carplay/b/m;

    invoke-static {p1}, Lcom/autochips/carplay/b/m;->a(Lcom/autochips/carplay/b/m;)Lcom/autochips/carplay/c/a;

    move-result-object p1

    invoke-virtual {p1}, Lcom/autochips/carplay/c/a;->el()Z

    move-result p1

    iget-object v0, p0, Lcom/autochips/carplay/b/t;->sP:Lcom/autochips/carplay/b/s;

    iget-object v0, v0, Lcom/autochips/carplay/b/s;->sC:Lcom/autochips/carplay/b/m;

    invoke-static {v0}, Lcom/autochips/carplay/b/m;->a(Lcom/autochips/carplay/b/m;)Lcom/autochips/carplay/c/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/autochips/carplay/c/a;->em()I

    move-result v0

    if-nez p1, :cond_3

    if-nez v0, :cond_3

    const-string v2, "OutputAudioStateMachine"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "<AccessoryState> accessoty callOn: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string p1, ", audioState: "

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/autochips/carplay/b/t;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {p1}, Lcom/autochips/carplay/b/s;->m(Lcom/autochips/carplay/b/s;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/autochips/carplay/b/t;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {p1}, Lcom/autochips/carplay/b/s;->n(Lcom/autochips/carplay/b/s;)V

    return v1

    :pswitch_1
    const-string v0, "OutputAudioStateMachine"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "wait mode change timeout, current request transfer type: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/autochips/carplay/b/t;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {v3}, Lcom/autochips/carplay/b/s;->a(Lcom/autochips/carplay/b/s;)I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, p1, Landroid/os/Message;->arg1:I

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ")"

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/autochips/carplay/b/t;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {p1}, Lcom/autochips/carplay/b/s;->l(Lcom/autochips/carplay/b/s;)V

    return v1

    :pswitch_2
    iget-object p1, p0, Lcom/autochips/carplay/b/t;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {p1}, Lcom/autochips/carplay/b/s;->i(Lcom/autochips/carplay/b/s;)Lcom/autochips/carplay/common/f;

    iget-object p1, p0, Lcom/autochips/carplay/b/t;->sP:Lcom/autochips/carplay/b/s;

    iget-object p1, p1, Lcom/autochips/carplay/b/s;->sC:Lcom/autochips/carplay/b/m;

    invoke-static {p1, v2}, Lcom/autochips/carplay/b/m;->a(Lcom/autochips/carplay/b/m;Z)V

    iget-object p1, p0, Lcom/autochips/carplay/b/t;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {p1}, Lcom/autochips/carplay/b/s;->j(Lcom/autochips/carplay/b/s;)V

    iget-object p1, p0, Lcom/autochips/carplay/b/t;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {p1}, Lcom/autochips/carplay/b/s;->k(Lcom/autochips/carplay/b/s;)V

    return v1

    :pswitch_3
    iget-object p1, p0, Lcom/autochips/carplay/b/t;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {p1}, Lcom/autochips/carplay/b/s;->a(Lcom/autochips/carplay/b/s;)I

    move-result p1

    const/4 v0, 0x3

    if-eq p1, v0, :cond_0

    iget-object p1, p0, Lcom/autochips/carplay/b/t;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {p1}, Lcom/autochips/carplay/b/s;->a(Lcom/autochips/carplay/b/s;)I

    move-result p1

    if-eq p1, v1, :cond_0

    iget-object p1, p0, Lcom/autochips/carplay/b/t;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {p1}, Lcom/autochips/carplay/b/s;->a(Lcom/autochips/carplay/b/s;)I

    move-result p1

    const/4 v0, 0x2

    if-ne p1, v0, :cond_3

    :cond_0
    iget-object p1, p0, Lcom/autochips/carplay/b/t;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {p1}, Lcom/autochips/carplay/b/s;->h(Lcom/autochips/carplay/b/s;)V

    iget-object p1, p0, Lcom/autochips/carplay/b/t;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {p1}, Lcom/autochips/carplay/b/s;->c(Lcom/autochips/carplay/b/s;)I

    return v1

    :pswitch_4
    iget-object p1, p0, Lcom/autochips/carplay/b/t;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {p1}, Lcom/autochips/carplay/b/s;->a(Lcom/autochips/carplay/b/s;)I

    move-result p1

    const/4 v0, 0x4

    if-ne p1, v0, :cond_1

    iget-object p1, p0, Lcom/autochips/carplay/b/t;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {p1}, Lcom/autochips/carplay/b/s;->b(Lcom/autochips/carplay/b/s;)V

    iget-object p1, p0, Lcom/autochips/carplay/b/t;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {p1}, Lcom/autochips/carplay/b/s;->c(Lcom/autochips/carplay/b/s;)I

    :cond_1
    iget-object p1, p0, Lcom/autochips/carplay/b/t;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {p1}, Lcom/autochips/carplay/b/s;->d(Lcom/autochips/carplay/b/s;)I

    move-result p1

    if-eq p1, v1, :cond_2

    iget-object p1, p0, Lcom/autochips/carplay/b/t;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {p1}, Lcom/autochips/carplay/b/s;->e(Lcom/autochips/carplay/b/s;)I

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/autochips/carplay/b/t;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {p1}, Lcom/autochips/carplay/b/s;->f(Lcom/autochips/carplay/b/s;)I

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/autochips/carplay/b/t;->sP:Lcom/autochips/carplay/b/s;

    iget-object v0, p0, Lcom/autochips/carplay/b/t;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {v0}, Lcom/autochips/carplay/b/s;->e(Lcom/autochips/carplay/b/s;)I

    move-result v0

    iget-object v2, p0, Lcom/autochips/carplay/b/t;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {v2}, Lcom/autochips/carplay/b/s;->f(Lcom/autochips/carplay/b/s;)I

    move-result v2

    invoke-static {p1, v0, v2}, Lcom/autochips/carplay/b/s;->a(Lcom/autochips/carplay/b/s;II)V

    return v1

    :cond_2
    iget-object p1, p0, Lcom/autochips/carplay/b/t;->sP:Lcom/autochips/carplay/b/s;

    iget-object v0, p0, Lcom/autochips/carplay/b/t;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {v0}, Lcom/autochips/carplay/b/s;->g(Lcom/autochips/carplay/b/s;)Lcom/android/internal/util/State;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/b/s;->transitionTo(Lcom/android/internal/util/IState;)V

    return v1

    :pswitch_5
    iget p1, p1, Landroid/os/Message;->arg1:I

    iget-object v0, p0, Lcom/autochips/carplay/b/t;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {v0, p1}, Lcom/autochips/carplay/b/s;->d(Lcom/autochips/carplay/b/s;I)V

    return v1

    :pswitch_6
    iget-object p1, p0, Lcom/autochips/carplay/b/t;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {p1, v1}, Lcom/autochips/carplay/b/s;->a(Lcom/autochips/carplay/b/s;I)I

    iget-object p1, p0, Lcom/autochips/carplay/b/t;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {p1, v2}, Lcom/autochips/carplay/b/s;->b(Lcom/autochips/carplay/b/s;I)I

    iget-object p1, p0, Lcom/autochips/carplay/b/t;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {p1, v2}, Lcom/autochips/carplay/b/s;->c(Lcom/autochips/carplay/b/s;I)I

    return v1

    :pswitch_7
    iget v0, p1, Landroid/os/Message;->arg1:I

    iget p1, p1, Landroid/os/Message;->arg2:I

    iget-object v3, p0, Lcom/autochips/carplay/b/t;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {v3, v2}, Lcom/autochips/carplay/b/s;->a(Lcom/autochips/carplay/b/s;I)I

    iget-object v2, p0, Lcom/autochips/carplay/b/t;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {v2, v0}, Lcom/autochips/carplay/b/s;->b(Lcom/autochips/carplay/b/s;I)I

    iget-object v2, p0, Lcom/autochips/carplay/b/t;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {v2, p1}, Lcom/autochips/carplay/b/s;->c(Lcom/autochips/carplay/b/s;I)I

    iget-object v2, p0, Lcom/autochips/carplay/b/t;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {v2, v0, p1}, Lcom/autochips/carplay/b/s;->a(Lcom/autochips/carplay/b/s;II)V

    return v1

    :pswitch_8
    iget-object p1, p0, Lcom/autochips/carplay/b/t;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {p1, v2}, Lcom/autochips/carplay/b/s;->a(Lcom/autochips/carplay/b/s;Z)V

    return v1

    :pswitch_9
    iget-object p1, p0, Lcom/autochips/carplay/b/t;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {p1, v1}, Lcom/autochips/carplay/b/s;->a(Lcom/autochips/carplay/b/s;Z)V

    :cond_3
    :pswitch_a
    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_9
        :pswitch_8
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0xa
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_a
        :pswitch_1
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x901
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method
