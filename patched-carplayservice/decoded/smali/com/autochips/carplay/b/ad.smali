.class final Lcom/autochips/carplay/b/ad;
.super Lcom/android/internal/util/State;


# instance fields
.field final synthetic sW:Lcom/autochips/carplay/b/ac;


# direct methods
.method constructor <init>(Lcom/autochips/carplay/b/ac;)V
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/b/ad;->sW:Lcom/autochips/carplay/b/ac;

    invoke-direct {p0}, Lcom/android/internal/util/State;-><init>()V

    return-void
.end method


# virtual methods
.method public final enter()V
    .locals 2

    const-string v0, "ScreenManager"

    const-string v1, "entering AccessoryState"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public final exit()V
    .locals 2

    const-string v0, "ScreenManager"

    const-string v1, "exit AccessoryState"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public final processMessage(Landroid/os/Message;)Z
    .locals 5

    const-string v0, "ScreenManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/autochips/carplay/b/ad;->getName()Ljava/lang/String;

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

    const/16 v1, 0x14

    const/4 v2, 0x1

    if-eq v0, v1, :cond_4

    const/16 v1, 0x16

    const/4 v3, 0x0

    if-eq v0, v1, :cond_3

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_0

    packed-switch v0, :pswitch_data_1

    packed-switch v0, :pswitch_data_2

    packed-switch v0, :pswitch_data_3

    const-string v0, "ScreenManager"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "received an invalid message: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v3

    :pswitch_0
    iget-object p1, p0, Lcom/autochips/carplay/b/ad;->sW:Lcom/autochips/carplay/b/ac;

    iget-object p1, p1, Lcom/autochips/carplay/b/ac;->sT:Lcom/autochips/carplay/b/aa;

    invoke-static {p1}, Lcom/autochips/carplay/b/aa;->c(Lcom/autochips/carplay/b/aa;)Z

    return v2

    :pswitch_1
    iget-object p1, p0, Lcom/autochips/carplay/b/ad;->sW:Lcom/autochips/carplay/b/ac;

    iget-object p1, p1, Lcom/autochips/carplay/b/ac;->sT:Lcom/autochips/carplay/b/aa;

    invoke-static {p1, v3}, Lcom/autochips/carplay/b/aa;->a(Lcom/autochips/carplay/b/aa;Z)Z

    return v2

    :pswitch_2
    iget-object p1, p0, Lcom/autochips/carplay/b/ad;->sW:Lcom/autochips/carplay/b/ac;

    iget-object p1, p1, Lcom/autochips/carplay/b/ac;->sT:Lcom/autochips/carplay/b/aa;

    invoke-static {p1, v2}, Lcom/autochips/carplay/b/aa;->a(Lcom/autochips/carplay/b/aa;Z)Z

    return v2

    :pswitch_3
    iget-object p1, p0, Lcom/autochips/carplay/b/ad;->sW:Lcom/autochips/carplay/b/ac;

    iget-object p1, p1, Lcom/autochips/carplay/b/ac;->sT:Lcom/autochips/carplay/b/aa;

    invoke-static {p1}, Lcom/autochips/carplay/b/aa;->b(Lcom/autochips/carplay/b/aa;)Lcom/autochips/carplay/c/a;

    move-result-object p1

    invoke-virtual {p1}, Lcom/autochips/carplay/c/a;->el()Z

    move-result p1

    iget-object v0, p0, Lcom/autochips/carplay/b/ad;->sW:Lcom/autochips/carplay/b/ac;

    iget-object v0, v0, Lcom/autochips/carplay/b/ac;->sT:Lcom/autochips/carplay/b/aa;

    invoke-static {v0}, Lcom/autochips/carplay/b/aa;->b(Lcom/autochips/carplay/b/aa;)Lcom/autochips/carplay/c/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/autochips/carplay/c/a;->em()I

    move-result v0

    if-nez p1, :cond_5

    if-nez v0, :cond_5

    const-string v1, "ScreenManager"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "<AccessoryState> accessoty callOn: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string p1, ", audioState: "

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/autochips/carplay/b/ad;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->g(Lcom/autochips/carplay/b/ac;)Z

    move-result p1

    if-eqz p1, :cond_5

    iget-object p1, p0, Lcom/autochips/carplay/b/ad;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->t(Lcom/autochips/carplay/b/ac;)V

    return v2

    :pswitch_4
    iget-object p1, p0, Lcom/autochips/carplay/b/ad;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->b(Lcom/autochips/carplay/b/ac;)Z

    iget-object p1, p0, Lcom/autochips/carplay/b/ad;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1, v1}, Lcom/autochips/carplay/b/ac;->a(Lcom/autochips/carplay/b/ac;Landroid/view/Surface;)Landroid/view/Surface;

    iget-object p1, p0, Lcom/autochips/carplay/b/ad;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->j(Lcom/autochips/carplay/b/ac;)Lcom/autochips/carplay/common/f;

    iget-object p1, p0, Lcom/autochips/carplay/b/ad;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->e(Lcom/autochips/carplay/b/ac;)I

    iget-object p1, p0, Lcom/autochips/carplay/b/ad;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1, v2}, Lcom/autochips/carplay/b/ac;->a(Lcom/autochips/carplay/b/ac;I)I

    iget-object p1, p0, Lcom/autochips/carplay/b/ad;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1, v3}, Lcom/autochips/carplay/b/ac;->a(Lcom/autochips/carplay/b/ac;Z)Z

    iget-object p1, p0, Lcom/autochips/carplay/b/ad;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->k(Lcom/autochips/carplay/b/ac;)V

    iget-object p1, p0, Lcom/autochips/carplay/b/ad;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->l(Lcom/autochips/carplay/b/ac;)V

    iget-object p1, p0, Lcom/autochips/carplay/b/ad;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->m(Lcom/autochips/carplay/b/ac;)V

    iget-object p1, p0, Lcom/autochips/carplay/b/ad;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->n(Lcom/autochips/carplay/b/ac;)V

    iget-object p1, p0, Lcom/autochips/carplay/b/ad;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->o(Lcom/autochips/carplay/b/ac;)V

    iget-object p1, p0, Lcom/autochips/carplay/b/ad;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->p(Lcom/autochips/carplay/b/ac;)V

    return v2

    :pswitch_5
    iget-object p1, p0, Lcom/autochips/carplay/b/ad;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->c(Lcom/autochips/carplay/b/ac;)I

    move-result p1

    const/4 v0, 0x3

    if-ne p1, v0, :cond_5

    iget-object p1, p0, Lcom/autochips/carplay/b/ad;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->d(Lcom/autochips/carplay/b/ac;)V

    iget-object p1, p0, Lcom/autochips/carplay/b/ad;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->e(Lcom/autochips/carplay/b/ac;)I

    return v2

    :pswitch_6
    iget-object p1, p0, Lcom/autochips/carplay/b/ad;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->c(Lcom/autochips/carplay/b/ac;)I

    move-result p1

    const/4 v0, 0x4

    if-eq p1, v0, :cond_1

    iget-object p1, p0, Lcom/autochips/carplay/b/ad;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->c(Lcom/autochips/carplay/b/ac;)I

    move-result p1

    if-eq p1, v2, :cond_1

    iget-object p1, p0, Lcom/autochips/carplay/b/ad;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->c(Lcom/autochips/carplay/b/ac;)I

    move-result p1

    const/4 v0, 0x2

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/autochips/carplay/b/ad;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->g(Lcom/autochips/carplay/b/ac;)Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/autochips/carplay/b/ad;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->h(Lcom/autochips/carplay/b/ac;)V

    goto :goto_1

    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/autochips/carplay/b/ad;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->f(Lcom/autochips/carplay/b/ac;)V

    iget-object p1, p0, Lcom/autochips/carplay/b/ad;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->e(Lcom/autochips/carplay/b/ac;)I

    :cond_2
    :goto_1
    iget-object p1, p0, Lcom/autochips/carplay/b/ad;->sW:Lcom/autochips/carplay/b/ac;

    iget-object v0, p0, Lcom/autochips/carplay/b/ad;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {v0}, Lcom/autochips/carplay/b/ac;->i(Lcom/autochips/carplay/b/ac;)Lcom/android/internal/util/State;

    move-result-object v0

    goto :goto_2

    :pswitch_7
    iget-object p1, p0, Lcom/autochips/carplay/b/ad;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1, v2}, Lcom/autochips/carplay/b/ac;->a(Lcom/autochips/carplay/b/ac;I)I

    return v2

    :pswitch_8
    iget-object p1, p0, Lcom/autochips/carplay/b/ad;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1, v3}, Lcom/autochips/carplay/b/ac;->a(Lcom/autochips/carplay/b/ac;I)I

    const-string p1, "ScreenManager"

    const-string v0, "mode not change to controller, but screen stream already started"

    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/autochips/carplay/b/ad;->sW:Lcom/autochips/carplay/b/ac;

    iget-object v0, p0, Lcom/autochips/carplay/b/ad;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {v0}, Lcom/autochips/carplay/b/ac;->a(Lcom/autochips/carplay/b/ac;)Lcom/android/internal/util/State;

    move-result-object v0

    :goto_2
    invoke-virtual {p1, v0}, Lcom/autochips/carplay/b/ac;->transitionTo(Lcom/android/internal/util/IState;)V

    return v2

    :pswitch_9
    iget-object p1, p0, Lcom/autochips/carplay/b/ad;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->b(Lcom/autochips/carplay/b/ac;)Z

    iget-object p1, p0, Lcom/autochips/carplay/b/ad;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1, v1}, Lcom/autochips/carplay/b/ac;->a(Lcom/autochips/carplay/b/ac;Landroid/view/Surface;)Landroid/view/Surface;

    return v2

    :pswitch_a
    iget-object v0, p0, Lcom/autochips/carplay/b/ad;->sW:Lcom/autochips/carplay/b/ac;

    iget-object v0, v0, Lcom/autochips/carplay/b/ac;->sT:Lcom/autochips/carplay/b/aa;

    invoke-static {v0}, Lcom/autochips/carplay/b/aa;->a(Lcom/autochips/carplay/b/aa;)Z

    move-result v0

    if-nez v0, :cond_5

    iget-object v0, p0, Lcom/autochips/carplay/b/ad;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {v0, p1, v2}, Lcom/autochips/carplay/b/ac;->a(Lcom/autochips/carplay/b/ac;Landroid/os/Message;Z)Z

    return v2

    :cond_3
    iget-object p1, p0, Lcom/autochips/carplay/b/ad;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->g(Lcom/autochips/carplay/b/ac;)Z

    move-result p1

    if-eqz p1, :cond_5

    iget-object p1, p0, Lcom/autochips/carplay/b/ad;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->r(Lcom/autochips/carplay/b/ac;)Z

    move-result p1

    if-nez p1, :cond_5

    iget-object p1, p0, Lcom/autochips/carplay/b/ad;->sW:Lcom/autochips/carplay/b/ac;

    iget-object p1, p1, Lcom/autochips/carplay/b/ac;->sT:Lcom/autochips/carplay/b/aa;

    iget-object p1, p1, Lcom/autochips/carplay/b/aa;->sQ:Lcom/autochips/carplay/b/ac;

    invoke-virtual {p1, v3}, Lcom/autochips/carplay/b/ac;->obtainMessage(I)Landroid/os/Message;

    move-result-object p1

    iget-object v0, p0, Lcom/autochips/carplay/b/ad;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {v0}, Lcom/autochips/carplay/b/ac;->s(Lcom/autochips/carplay/b/ac;)Landroid/view/Surface;

    move-result-object v0

    iput-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object v0, p0, Lcom/autochips/carplay/b/ad;->sW:Lcom/autochips/carplay/b/ac;

    invoke-virtual {v0, p1}, Lcom/autochips/carplay/b/ac;->sendMessage(Landroid/os/Message;)V

    return v2

    :cond_4
    const-string v0, "ScreenManager"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "wait mode change timeout, current request transfer type: "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/autochips/carplay/b/ad;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {v3}, Lcom/autochips/carplay/b/ac;->c(Lcom/autochips/carplay/b/ac;)I

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

    iget-object p1, p0, Lcom/autochips/carplay/b/ad;->sW:Lcom/autochips/carplay/b/ac;

    invoke-static {p1}, Lcom/autochips/carplay/b/ac;->q(Lcom/autochips/carplay/b/ac;)V

    :cond_5
    return v2

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_a
        :pswitch_9
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0xa
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_4
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x901
        :pswitch_3
        :pswitch_3
    .end packed-switch

    :pswitch_data_3
    .packed-switch 0x1001
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
