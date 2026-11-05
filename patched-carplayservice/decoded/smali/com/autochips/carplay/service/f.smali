.class final Lcom/autochips/carplay/service/f;
.super Lcom/autochips/carplay/service/b;


# instance fields
.field final synthetic ti:Lcom/autochips/carplay/service/a;


# direct methods
.method private constructor <init>(Lcom/autochips/carplay/service/a;)V
    .locals 1

    iput-object p1, p0, Lcom/autochips/carplay/service/f;->ti:Lcom/autochips/carplay/service/a;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/autochips/carplay/service/b;-><init>(Lcom/autochips/carplay/service/a;B)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/autochips/carplay/service/a;B)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/autochips/carplay/service/f;-><init>(Lcom/autochips/carplay/service/a;)V

    return-void
.end method

.method private dw()Z
    .locals 5

    iget-object v0, p0, Lcom/autochips/carplay/service/f;->ti:Lcom/autochips/carplay/service/a;

    invoke-static {v0}, Lcom/autochips/carplay/service/a;->i(Lcom/autochips/carplay/service/a;)Lcom/autochips/carplay/service/i;

    move-result-object v0

    iget-object v1, p0, Lcom/autochips/carplay/service/f;->ti:Lcom/autochips/carplay/service/a;

    invoke-static {v1}, Lcom/autochips/carplay/service/a;->l(Lcom/autochips/carplay/service/a;)I

    invoke-virtual {v0}, Lcom/autochips/carplay/service/i;->dN()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/autochips/carplay/service/f;->ti:Lcom/autochips/carplay/service/a;

    const/16 v2, 0x505

    const-wide/16 v3, 0x7d0

    invoke-virtual {v1, v2, v3, v4}, Lcom/autochips/carplay/service/a;->sendMessageDelayed(IJ)V

    :cond_0
    return v0
.end method


# virtual methods
.method final dt()I
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public final enter()V
    .locals 5

    invoke-super {p0}, Lcom/autochips/carplay/service/b;->enter()V

    iget-object v0, p0, Lcom/autochips/carplay/service/f;->ti:Lcom/autochips/carplay/service/a;

    invoke-static {v0}, Lcom/autochips/carplay/service/a;->i(Lcom/autochips/carplay/service/a;)Lcom/autochips/carplay/service/i;

    move-result-object v0

    iget-object v1, p0, Lcom/autochips/carplay/service/f;->ti:Lcom/autochips/carplay/service/a;

    invoke-static {v1}, Lcom/autochips/carplay/service/a;->l(Lcom/autochips/carplay/service/a;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/service/i;->ad(I)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/autochips/carplay/service/f;->ti:Lcom/autochips/carplay/service/a;

    const/16 v2, 0x205

    const-wide/16 v3, 0x3e8

    invoke-virtual {v1, v2, v3, v4}, Lcom/autochips/carplay/service/a;->sendMessageDelayed(IJ)V

    :cond_0
    if-nez v0, :cond_1

    invoke-static {}, Lcom/autochips/carplay/service/a;->dr()Ljava/lang/String;

    move-result-object v0

    const-string v1, "enableUsbNcm fail"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/service/f;->ti:Lcom/autochips/carplay/service/a;

    iget-object v1, p0, Lcom/autochips/carplay/service/f;->ti:Lcom/autochips/carplay/service/a;

    const/16 v2, 0x203

    invoke-virtual {v1, v2}, Lcom/autochips/carplay/service/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/autochips/carplay/service/a;->a(Lcom/autochips/carplay/service/a;Landroid/os/Message;)V

    :cond_1
    return-void
.end method

.method public final exit()V
    .locals 0

    invoke-super {p0}, Lcom/autochips/carplay/service/b;->exit()V

    return-void
.end method

.method public final processMessage(Landroid/os/Message;)Z
    .locals 5

    iget v0, p1, Landroid/os/Message;->what:I

    invoke-static {v0}, Lcom/autochips/carplay/common/CarplayMessage;->messageString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/service/f;->B(Ljava/lang/String;)V

    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x503

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

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/service/f;->B(Ljava/lang/String;)V

    const/4 p1, 0x0

    return p1

    :sswitch_0
    iget-object p1, p0, Lcom/autochips/carplay/service/f;->ti:Lcom/autochips/carplay/service/a;

    invoke-static {p1}, Lcom/autochips/carplay/service/a;->k(Lcom/autochips/carplay/service/a;)V

    :cond_0
    iget-object p1, p0, Lcom/autochips/carplay/service/f;->ti:Lcom/autochips/carplay/service/a;

    iget-object v0, p0, Lcom/autochips/carplay/service/f;->ti:Lcom/autochips/carplay/service/a;

    invoke-static {v0}, Lcom/autochips/carplay/service/a;->j(Lcom/autochips/carplay/service/a;)Lcom/autochips/carplay/service/d;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/service/a;->transitionTo(Lcom/android/internal/util/IState;)V

    goto/16 :goto_2

    :sswitch_1
    iget-object p1, p0, Lcom/autochips/carplay/service/f;->ti:Lcom/autochips/carplay/service/a;

    invoke-static {p1}, Lcom/autochips/carplay/service/a;->h(Lcom/autochips/carplay/service/a;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/f;->ti:Lcom/autochips/carplay/service/a;

    invoke-static {p1}, Lcom/autochips/carplay/service/a;->i(Lcom/autochips/carplay/service/a;)Lcom/autochips/carplay/service/i;

    move-result-object p1

    invoke-virtual {p1}, Lcom/autochips/carplay/service/i;->dH()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/autochips/carplay/service/f;->ti:Lcom/autochips/carplay/service/a;

    invoke-static {p1}, Lcom/autochips/carplay/service/a;->i(Lcom/autochips/carplay/service/a;)Lcom/autochips/carplay/service/i;

    move-result-object p1

    iget-object v0, p0, Lcom/autochips/carplay/service/f;->ti:Lcom/autochips/carplay/service/a;

    invoke-static {v0}, Lcom/autochips/carplay/service/a;->l(Lcom/autochips/carplay/service/a;)I

    invoke-virtual {p1}, Lcom/autochips/carplay/service/i;->dP()Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/autochips/carplay/service/f;->ti:Lcom/autochips/carplay/service/a;

    const/16 v1, 0x705

    const-wide/16 v2, 0x2710

    invoke-virtual {v0, v1, v2, v3}, Lcom/autochips/carplay/service/a;->sendMessageDelayed(IJ)V

    :cond_1
    if-nez p1, :cond_6

    iget-object p1, p0, Lcom/autochips/carplay/service/f;->ti:Lcom/autochips/carplay/service/a;

    iget-object v0, p0, Lcom/autochips/carplay/service/f;->ti:Lcom/autochips/carplay/service/a;

    const/16 v1, 0x703

    goto :goto_1

    :sswitch_2
    iget-object p1, p0, Lcom/autochips/carplay/service/f;->ti:Lcom/autochips/carplay/service/a;

    invoke-static {p1}, Lcom/autochips/carplay/service/a;->g(Lcom/autochips/carplay/service/a;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/f;->ti:Lcom/autochips/carplay/service/a;

    invoke-static {p1}, Lcom/autochips/carplay/service/a;->i(Lcom/autochips/carplay/service/a;)Lcom/autochips/carplay/service/i;

    move-result-object p1

    iget-object v0, p0, Lcom/autochips/carplay/service/f;->ti:Lcom/autochips/carplay/service/a;

    invoke-static {v0}, Lcom/autochips/carplay/service/a;->l(Lcom/autochips/carplay/service/a;)I

    invoke-virtual {p1}, Lcom/autochips/carplay/service/i;->dR()Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object v0, p0, Lcom/autochips/carplay/service/f;->ti:Lcom/autochips/carplay/service/a;

    const/16 v1, 0x605

    const-wide/16 v2, 0x7d0

    invoke-virtual {v0, v1, v2, v3}, Lcom/autochips/carplay/service/a;->sendMessageDelayed(IJ)V

    :cond_2
    if-nez p1, :cond_6

    iget-object p1, p0, Lcom/autochips/carplay/service/f;->ti:Lcom/autochips/carplay/service/a;

    iget-object v0, p0, Lcom/autochips/carplay/service/f;->ti:Lcom/autochips/carplay/service/a;

    const/16 v1, 0x603

    goto :goto_1

    :sswitch_3
    iget-object p1, p0, Lcom/autochips/carplay/service/f;->ti:Lcom/autochips/carplay/service/a;

    invoke-static {p1}, Lcom/autochips/carplay/service/a;->f(Lcom/autochips/carplay/service/a;)V

    invoke-direct {p0}, Lcom/autochips/carplay/service/f;->dw()Z

    move-result p1

    if-nez p1, :cond_6

    :goto_0
    iget-object p1, p0, Lcom/autochips/carplay/service/f;->ti:Lcom/autochips/carplay/service/a;

    iget-object v0, p0, Lcom/autochips/carplay/service/f;->ti:Lcom/autochips/carplay/service/a;

    :goto_1
    invoke-virtual {v0, v1}, Lcom/autochips/carplay/service/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/autochips/carplay/service/a;->a(Lcom/autochips/carplay/service/a;Landroid/os/Message;)V

    goto/16 :goto_2

    :sswitch_4
    iget-object p1, p0, Lcom/autochips/carplay/service/f;->ti:Lcom/autochips/carplay/service/a;

    invoke-static {p1}, Lcom/autochips/carplay/service/a;->e(Lcom/autochips/carplay/service/a;)V

    invoke-static {}, Lcom/autochips/carplay/service/a;->ds()Z

    move-result p1

    if-eqz p1, :cond_6

    iget-object p1, p0, Lcom/autochips/carplay/service/f;->ti:Lcom/autochips/carplay/service/a;

    invoke-static {p1}, Lcom/autochips/carplay/service/a;->i(Lcom/autochips/carplay/service/a;)Lcom/autochips/carplay/service/i;

    move-result-object p1

    iget-object v0, p0, Lcom/autochips/carplay/service/f;->ti:Lcom/autochips/carplay/service/a;

    invoke-static {v0}, Lcom/autochips/carplay/service/a;->l(Lcom/autochips/carplay/service/a;)I

    invoke-virtual {p1}, Lcom/autochips/carplay/service/i;->dL()Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object v0, p0, Lcom/autochips/carplay/service/f;->ti:Lcom/autochips/carplay/service/a;

    const/16 v1, 0x405

    const-wide/16 v2, 0x1388

    invoke-virtual {v0, v1, v2, v3}, Lcom/autochips/carplay/service/a;->sendMessageDelayed(IJ)V

    :cond_3
    if-nez p1, :cond_6

    iget-object p1, p0, Lcom/autochips/carplay/service/f;->ti:Lcom/autochips/carplay/service/a;

    iget-object v0, p0, Lcom/autochips/carplay/service/f;->ti:Lcom/autochips/carplay/service/a;

    const/16 v1, 0x403

    goto :goto_1

    :sswitch_5
    iget v0, p1, Landroid/os/Message;->what:I

    invoke-static {v0}, Lcom/autochips/carplay/common/CarplayMessage;->messageString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/service/f;->C(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/autochips/carplay/service/f;->ti:Lcom/autochips/carplay/service/a;

    invoke-static {v0, p1}, Lcom/autochips/carplay/service/a;->a(Lcom/autochips/carplay/service/a;Landroid/os/Message;)V

    goto :goto_2

    :sswitch_6
    iget-object p1, p0, Lcom/autochips/carplay/service/f;->ti:Lcom/autochips/carplay/service/a;

    invoke-static {p1}, Lcom/autochips/carplay/service/a;->d(Lcom/autochips/carplay/service/a;)V

    invoke-static {}, Lcom/autochips/carplay/service/a;->ds()Z

    move-result p1

    if-eqz p1, :cond_5

    iget-object p1, p0, Lcom/autochips/carplay/service/f;->ti:Lcom/autochips/carplay/service/a;

    invoke-static {p1}, Lcom/autochips/carplay/service/a;->i(Lcom/autochips/carplay/service/a;)Lcom/autochips/carplay/service/i;

    move-result-object p1

    iget-object v0, p0, Lcom/autochips/carplay/service/f;->ti:Lcom/autochips/carplay/service/a;

    invoke-static {v0}, Lcom/autochips/carplay/service/a;->l(Lcom/autochips/carplay/service/a;)I

    invoke-virtual {p1}, Lcom/autochips/carplay/service/i;->dJ()Z

    move-result p1

    if-eqz p1, :cond_4

    iget-object v0, p0, Lcom/autochips/carplay/service/f;->ti:Lcom/autochips/carplay/service/a;

    const/16 v2, 0x305

    const-wide/16 v3, 0x2328

    invoke-virtual {v0, v2, v3, v4}, Lcom/autochips/carplay/service/a;->sendMessageDelayed(IJ)V

    :cond_4
    if-nez p1, :cond_5

    iget-object p1, p0, Lcom/autochips/carplay/service/f;->ti:Lcom/autochips/carplay/service/a;

    iget-object v0, p0, Lcom/autochips/carplay/service/f;->ti:Lcom/autochips/carplay/service/a;

    const/16 v1, 0x303

    goto :goto_1

    :cond_5
    invoke-static {}, Lcom/autochips/carplay/service/a;->ds()Z

    move-result p1

    if-nez p1, :cond_6

    invoke-direct {p0}, Lcom/autochips/carplay/service/f;->dw()Z

    move-result p1

    if-nez p1, :cond_6

    goto/16 :goto_0

    :cond_6
    :goto_2
    const/4 p1, 0x1

    return p1

    :sswitch_data_0
    .sparse-switch
        0x201 -> :sswitch_6
        0x205 -> :sswitch_5
        0x301 -> :sswitch_4
        0x305 -> :sswitch_5
        0x401 -> :sswitch_3
        0x405 -> :sswitch_5
        0x501 -> :sswitch_2
        0x505 -> :sswitch_5
        0x601 -> :sswitch_1
        0x605 -> :sswitch_5
        0x701 -> :sswitch_0
        0x705 -> :sswitch_5
    .end sparse-switch
.end method
