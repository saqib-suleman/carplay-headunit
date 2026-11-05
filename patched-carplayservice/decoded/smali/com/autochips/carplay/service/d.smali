.class final Lcom/autochips/carplay/service/d;
.super Lcom/autochips/carplay/service/b;


# instance fields
.field final synthetic ti:Lcom/autochips/carplay/service/a;


# direct methods
.method private constructor <init>(Lcom/autochips/carplay/service/a;)V
    .locals 1

    iput-object p1, p0, Lcom/autochips/carplay/service/d;->ti:Lcom/autochips/carplay/service/a;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/autochips/carplay/service/b;-><init>(Lcom/autochips/carplay/service/a;B)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/autochips/carplay/service/a;B)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/autochips/carplay/service/d;-><init>(Lcom/autochips/carplay/service/a;)V

    return-void
.end method


# virtual methods
.method final dt()I
    .locals 1

    const/4 v0, 0x2

    return v0
.end method

.method public final processMessage(Landroid/os/Message;)Z
    .locals 4

    iget v0, p1, Landroid/os/Message;->what:I

    invoke-static {v0}, Lcom/autochips/carplay/common/CarplayMessage;->messageString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/service/d;->B(Ljava/lang/String;)V

    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x102

    if-eq v0, v1, :cond_2

    const/16 v1, 0x705

    if-eq v0, v1, :cond_1

    packed-switch v0, :pswitch_data_0

    packed-switch v0, :pswitch_data_1

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Unhandled message - "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget p1, p1, Landroid/os/Message;->what:I

    invoke-static {p1}, Lcom/autochips/carplay/common/CarplayMessage;->messageString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/service/d;->B(Ljava/lang/String;)V

    const/4 p1, 0x0

    return p1

    :pswitch_0
    iget-object p1, p0, Lcom/autochips/carplay/service/d;->ti:Lcom/autochips/carplay/service/a;

    invoke-static {p1}, Lcom/autochips/carplay/service/a;->i(Lcom/autochips/carplay/service/a;)Lcom/autochips/carplay/service/i;

    move-result-object p1

    invoke-virtual {p1}, Lcom/autochips/carplay/service/i;->dH()Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/autochips/carplay/service/d;->ti:Lcom/autochips/carplay/service/a;

    invoke-static {p1}, Lcom/autochips/carplay/service/a;->i(Lcom/autochips/carplay/service/a;)Lcom/autochips/carplay/service/i;

    move-result-object p1

    iget-object v0, p0, Lcom/autochips/carplay/service/d;->ti:Lcom/autochips/carplay/service/a;

    invoke-static {v0}, Lcom/autochips/carplay/service/a;->l(Lcom/autochips/carplay/service/a;)I

    invoke-virtual {p1}, Lcom/autochips/carplay/service/i;->dP()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/autochips/carplay/service/d;->ti:Lcom/autochips/carplay/service/a;

    const-wide/16 v2, 0x2710

    invoke-virtual {p1, v1, v2, v3}, Lcom/autochips/carplay/service/a;->sendMessageDelayed(IJ)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/autochips/carplay/service/d;->ti:Lcom/autochips/carplay/service/a;

    iget-object v0, p0, Lcom/autochips/carplay/service/d;->ti:Lcom/autochips/carplay/service/a;

    const/16 v1, 0x703

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/service/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/autochips/carplay/service/a;->a(Lcom/autochips/carplay/service/a;Landroid/os/Message;)V

    goto :goto_0

    :pswitch_1
    iget-object p1, p0, Lcom/autochips/carplay/service/d;->ti:Lcom/autochips/carplay/service/a;

    invoke-static {p1}, Lcom/autochips/carplay/service/a;->m(Lcom/autochips/carplay/service/a;)V

    goto :goto_0

    :cond_1
    :pswitch_2
    iget v0, p1, Landroid/os/Message;->what:I

    invoke-static {v0}, Lcom/autochips/carplay/common/CarplayMessage;->messageString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/service/d;->C(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/autochips/carplay/service/d;->ti:Lcom/autochips/carplay/service/a;

    invoke-static {v0, p1}, Lcom/autochips/carplay/service/a;->a(Lcom/autochips/carplay/service/a;Landroid/os/Message;)V

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/autochips/carplay/service/d;->ti:Lcom/autochips/carplay/service/a;

    iget p1, p1, Landroid/os/Message;->arg1:I

    invoke-static {v0, p1}, Lcom/autochips/carplay/service/a;->b(Lcom/autochips/carplay/service/a;I)I

    iget-object p1, p0, Lcom/autochips/carplay/service/d;->ti:Lcom/autochips/carplay/service/a;

    iget-object v0, p0, Lcom/autochips/carplay/service/d;->ti:Lcom/autochips/carplay/service/a;

    invoke-static {v0}, Lcom/autochips/carplay/service/a;->n(Lcom/autochips/carplay/service/a;)Lcom/autochips/carplay/service/e;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/service/a;->transitionTo(Lcom/android/internal/util/IState;)V

    :cond_3
    :goto_0
    const/4 p1, 0x1

    return p1

    :pswitch_data_0
    .packed-switch 0x701
        :pswitch_1
        :pswitch_2
        :pswitch_2
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x801
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method
