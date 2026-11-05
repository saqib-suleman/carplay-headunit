.class public final Lcom/autochips/carplay/b/e;
.super Landroid/os/Handler;


# instance fields
.field private mCarplayMonitor:Lcom/autochips/carplay/service/h;

.field private final mContext:Landroid/content/Context;

.field private rY:Lcom/autochips/carplay/c/a;

.field private final si:Lcom/autochips/carplay/b/aa;

.field private final sj:Lcom/autochips/carplay/b/m;

.field private final sk:Lcom/autochips/carplay/b/f;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/os/Looper;)V
    .locals 2

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/autochips/carplay/b/e;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    iput-object v0, p0, Lcom/autochips/carplay/b/e;->rY:Lcom/autochips/carplay/c/a;

    iput-object p1, p0, Lcom/autochips/carplay/b/e;->mContext:Landroid/content/Context;

    const-string v0, "ScreenManager"

    const-string v1, "make() - Creating ScreenManager"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v0, Lcom/autochips/carplay/b/aa;->si:Lcom/autochips/carplay/b/aa;

    if-nez v0, :cond_0

    new-instance v0, Lcom/autochips/carplay/b/aa;

    invoke-direct {v0, p1, p2}, Lcom/autochips/carplay/b/aa;-><init>(Landroid/content/Context;Landroid/os/Looper;)V

    sput-object v0, Lcom/autochips/carplay/b/aa;->si:Lcom/autochips/carplay/b/aa;

    :cond_0
    sget-object v0, Lcom/autochips/carplay/b/aa;->si:Lcom/autochips/carplay/b/aa;

    iput-object v0, p0, Lcom/autochips/carplay/b/e;->si:Lcom/autochips/carplay/b/aa;

    invoke-static {p1, p2}, Lcom/autochips/carplay/b/m;->a(Landroid/content/Context;Landroid/os/Looper;)Lcom/autochips/carplay/b/m;

    move-result-object v0

    iput-object v0, p0, Lcom/autochips/carplay/b/e;->sj:Lcom/autochips/carplay/b/m;

    const-string v0, "FullDuplexAudioManager"

    const-string v1, "make() - Creating FullDuplexAudioManager"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v0, Lcom/autochips/carplay/b/f;->sk:Lcom/autochips/carplay/b/f;

    if-nez v0, :cond_1

    new-instance v0, Lcom/autochips/carplay/b/f;

    invoke-direct {v0, p1, p2}, Lcom/autochips/carplay/b/f;-><init>(Landroid/content/Context;Landroid/os/Looper;)V

    sput-object v0, Lcom/autochips/carplay/b/f;->sk:Lcom/autochips/carplay/b/f;

    :cond_1
    sget-object p1, Lcom/autochips/carplay/b/f;->sk:Lcom/autochips/carplay/b/f;

    iput-object p1, p0, Lcom/autochips/carplay/b/e;->sk:Lcom/autochips/carplay/b/f;

    return-void
.end method


# virtual methods
.method public final a(Lcom/autochips/carplay/service/h;Lcom/autochips/carplay/c/a;)V
    .locals 1

    iput-object p1, p0, Lcom/autochips/carplay/b/e;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    iput-object p2, p0, Lcom/autochips/carplay/b/e;->rY:Lcom/autochips/carplay/c/a;

    iget-object v0, p0, Lcom/autochips/carplay/b/e;->si:Lcom/autochips/carplay/b/aa;

    invoke-virtual {v0, p1, p2}, Lcom/autochips/carplay/b/aa;->a(Lcom/autochips/carplay/service/h;Lcom/autochips/carplay/c/a;)V

    iget-object v0, p0, Lcom/autochips/carplay/b/e;->sj:Lcom/autochips/carplay/b/m;

    invoke-virtual {v0, p1, p2}, Lcom/autochips/carplay/b/m;->a(Lcom/autochips/carplay/service/h;Lcom/autochips/carplay/c/a;)V

    iget-object v0, p0, Lcom/autochips/carplay/b/e;->sk:Lcom/autochips/carplay/b/f;

    invoke-virtual {v0, p1, p2}, Lcom/autochips/carplay/b/f;->a(Lcom/autochips/carplay/service/h;Lcom/autochips/carplay/c/a;)V

    iget-object p1, p0, Lcom/autochips/carplay/b/e;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/autochips/carplay/b/e;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    const/16 p2, 0x70a

    invoke-virtual {p1, p2, p0}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    :cond_0
    return-void
.end method

.method public final handleMessage(Landroid/os/Message;)V
    .locals 4

    const-string v0, "CarplayResourceController"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "handleMessage: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p1, Landroid/os/Message;->what:I

    invoke-static {v2}, Lcom/autochips/carplay/common/CarplayMessage;->messageString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_0

    packed-switch v0, :pswitch_data_1

    packed-switch v0, :pswitch_data_2

    const-string v0, "CarplayResourceController"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "ignoring msg="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :pswitch_0
    const-string p1, "CarplayResourceController"

    const-string v0, "request accessory ui"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/autochips/carplay/b/e;->si:Lcom/autochips/carplay/b/aa;

    const/16 v0, 0x11e

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/b/aa;->disable(I)V

    return-void

    :pswitch_1
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/autochips/carplay/common/b;

    iget-object v0, p0, Lcom/autochips/carplay/b/e;->si:Lcom/autochips/carplay/b/aa;

    invoke-virtual {p1}, Lcom/autochips/carplay/common/b;->cS()I

    move-result v1

    const/16 v2, 0xc

    const/16 v3, 0xd

    packed-switch v1, :pswitch_data_3

    goto :goto_0

    :pswitch_2
    iget-object v0, v0, Lcom/autochips/carplay/b/aa;->sQ:Lcom/autochips/carplay/b/ac;

    invoke-virtual {v0, v3}, Lcom/autochips/carplay/b/ac;->sendMessage(I)V

    goto :goto_0

    :pswitch_3
    iget-object v0, v0, Lcom/autochips/carplay/b/aa;->sQ:Lcom/autochips/carplay/b/ac;

    invoke-virtual {v0, v2}, Lcom/autochips/carplay/b/ac;->sendMessage(I)V

    :goto_0
    iget-object v0, p0, Lcom/autochips/carplay/b/e;->sj:Lcom/autochips/carplay/b/m;

    invoke-virtual {p1}, Lcom/autochips/carplay/common/b;->getMainAudio()I

    move-result v1

    packed-switch v1, :pswitch_data_4

    goto :goto_1

    :pswitch_4
    iget-object v0, v0, Lcom/autochips/carplay/b/m;->sw:Lcom/autochips/carplay/b/s;

    const/16 v1, 0xe

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/b/s;->sendMessage(I)V

    goto :goto_1

    :pswitch_5
    iget-object v0, v0, Lcom/autochips/carplay/b/m;->sw:Lcom/autochips/carplay/b/s;

    invoke-virtual {v0, v3}, Lcom/autochips/carplay/b/s;->sendMessage(I)V

    :goto_1
    iget-object v0, p0, Lcom/autochips/carplay/b/e;->sk:Lcom/autochips/carplay/b/f;

    invoke-virtual {p1}, Lcom/autochips/carplay/common/b;->getMainAudio()I

    move-result p1

    packed-switch p1, :pswitch_data_5

    return-void

    :pswitch_6
    iget-object p1, v0, Lcom/autochips/carplay/b/f;->sl:Lcom/autochips/carplay/b/h;

    invoke-virtual {p1, v3}, Lcom/autochips/carplay/b/h;->sendMessage(I)V

    return-void

    :pswitch_7
    iget-object p1, v0, Lcom/autochips/carplay/b/f;->sl:Lcom/autochips/carplay/b/h;

    invoke-virtual {p1, v2}, Lcom/autochips/carplay/b/h;->sendMessage(I)V

    return-void

    :pswitch_8
    iget-object p1, p0, Lcom/autochips/carplay/b/e;->sj:Lcom/autochips/carplay/b/m;

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p1, v0, v0}, Lcom/autochips/carplay/b/m;->b(FF)I

    return-void

    :pswitch_9
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Double;

    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    const-string p1, "CarplayResourceController"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "double inVolume: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    double-to-float p1, v0

    const-string v0, "CarplayResourceController"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "float volume: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/b/e;->sj:Lcom/autochips/carplay/b/m;

    invoke-virtual {v0, p1, p1}, Lcom/autochips/carplay/b/m;->b(FF)I

    return-void

    :pswitch_a
    iget-object p1, p0, Lcom/autochips/carplay/b/e;->si:Lcom/autochips/carplay/b/aa;

    invoke-virtual {p1, v1}, Lcom/autochips/carplay/b/aa;->W(I)V

    iget-object p1, p0, Lcom/autochips/carplay/b/e;->sj:Lcom/autochips/carplay/b/m;

    invoke-virtual {p1, v1}, Lcom/autochips/carplay/b/m;->W(I)V

    iget-object p1, p0, Lcom/autochips/carplay/b/e;->sk:Lcom/autochips/carplay/b/f;

    invoke-virtual {p1, v1}, Lcom/autochips/carplay/b/f;->W(I)V

    return-void

    :pswitch_b
    iget-object p1, p0, Lcom/autochips/carplay/b/e;->si:Lcom/autochips/carplay/b/aa;

    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/b/aa;->W(I)V

    iget-object p1, p0, Lcom/autochips/carplay/b/e;->sj:Lcom/autochips/carplay/b/m;

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/b/m;->W(I)V

    iget-object p1, p0, Lcom/autochips/carplay/b/e;->sk:Lcom/autochips/carplay/b/f;

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/b/f;->W(I)V

    return-void

    :pswitch_c
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/autochips/carplay/b/e;->sj:Lcom/autochips/carplay/b/m;

    iget-object p1, p1, Lcom/autochips/carplay/b/m;->sw:Lcom/autochips/carplay/b/s;

    invoke-virtual {p1, v1}, Lcom/autochips/carplay/b/s;->sendMessage(I)V

    return-void

    :cond_0
    iget-object p1, p0, Lcom/autochips/carplay/b/e;->sj:Lcom/autochips/carplay/b/m;

    iget-object p1, p1, Lcom/autochips/carplay/b/m;->sw:Lcom/autochips/carplay/b/s;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/b/s;->sendMessage(I)V

    return-void

    :pswitch_d
    const-string v0, "CarplayResourceController"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "user select "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p1, Landroid/os/Message;->arg1:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/b/e;->si:Lcom/autochips/carplay/b/aa;

    iget p1, p1, Landroid/os/Message;->arg1:I

    invoke-virtual {v0, p1}, Lcom/autochips/carplay/b/aa;->disable(I)V

    return-void

    :pswitch_e
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Landroid/view/Surface;

    const-string v0, "CarplayResourceController"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "setSurface: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/b/e;->si:Lcom/autochips/carplay/b/aa;

    iget-object v2, v0, Lcom/autochips/carplay/b/aa;->sQ:Lcom/autochips/carplay/b/ac;

    invoke-virtual {v2, v1}, Lcom/autochips/carplay/b/ac;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    iput-object p1, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p1, v0, Lcom/autochips/carplay/b/aa;->sQ:Lcom/autochips/carplay/b/ac;

    invoke-virtual {p1, v1}, Lcom/autochips/carplay/b/ac;->sendMessage(Landroid/os/Message;)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x103
        :pswitch_e
        :pswitch_d
        :pswitch_c
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x70a
        :pswitch_b
        :pswitch_a
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x714
        :pswitch_9
        :pswitch_8
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_3
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
    .end packed-switch

    :pswitch_data_4
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
    .end packed-switch

    :pswitch_data_5
    .packed-switch 0x1
        :pswitch_7
        :pswitch_6
    .end packed-switch
.end method
