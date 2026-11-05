.class public Lcom/autochips/carplay/plugin/a;
.super Lcom/autochips/carplay/common/a;


# static fields
.field private static final rR:Z


# instance fields
.field private final mContext:Landroid/content/Context;

.field private mEnabled:Z

.field private rO:Lcom/autochips/carplay/plugin/CarplayPluginInterface;

.field private rP:Z

.field private rQ:Lcom/autochips/carplay/common/e;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const-string v0, "ro.atc.carplay.skip_input"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lcom/autochips/carplay/plugin/a;->rR:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/os/Looper;)V
    .locals 0

    invoke-direct {p0, p2}, Lcom/autochips/carplay/common/a;-><init>(Landroid/os/Looper;)V

    const/4 p2, 0x0

    iput-boolean p2, p0, Lcom/autochips/carplay/plugin/a;->mEnabled:Z

    iput-boolean p2, p0, Lcom/autochips/carplay/plugin/a;->rP:Z

    const/4 p2, 0x0

    iput-object p2, p0, Lcom/autochips/carplay/plugin/a;->rQ:Lcom/autochips/carplay/common/e;

    iput-object p1, p0, Lcom/autochips/carplay/plugin/a;->mContext:Landroid/content/Context;

    new-instance p1, Lcom/autochips/carplay/plugin/CarplayPluginInterface;

    invoke-direct {p1}, Lcom/autochips/carplay/plugin/CarplayPluginInterface;-><init>()V

    iput-object p1, p0, Lcom/autochips/carplay/plugin/a;->rO:Lcom/autochips/carplay/plugin/CarplayPluginInterface;

    iget-object p1, p0, Lcom/autochips/carplay/plugin/a;->rO:Lcom/autochips/carplay/plugin/CarplayPluginInterface;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/autochips/carplay/plugin/a;->rO:Lcom/autochips/carplay/plugin/CarplayPluginInterface;

    invoke-virtual {p1}, Lcom/autochips/carplay/plugin/CarplayPluginInterface;->initNative()Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/autochips/carplay/plugin/a;->rP:Z

    :cond_0
    invoke-static {}, Lcom/autochips/carplay/service/g;->dx()Lcom/autochips/carplay/service/g;

    move-result-object p1

    invoke-virtual {p1}, Lcom/autochips/carplay/service/g;->dz()Lcom/autochips/carplay/service/h;

    move-result-object p1

    if-eqz p1, :cond_1

    const/16 p2, 0x30a

    invoke-virtual {p1, p2, p0}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    const/16 p2, 0x804

    invoke-virtual {p1, p2, p0}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    const/16 p2, 0x50a

    invoke-virtual {p1, p2, p0}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    const/16 p2, 0x50b

    invoke-virtual {p1, p2, p0}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    const/16 p2, 0x50c

    invoke-virtual {p1, p2, p0}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    const/16 p2, 0x50d

    invoke-virtual {p1, p2, p0}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    const/16 p2, 0x50e

    invoke-virtual {p1, p2, p0}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    :cond_1
    return-void
.end method


# virtual methods
.method public final cleanup()V
    .locals 2

    iget-boolean v0, p0, Lcom/autochips/carplay/plugin/a;->rP:Z

    if-eqz v0, :cond_0

    const-string v0, "CarplayPluginAdapter"

    const-string v1, "cleanup() - Cleaning up plugin native"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/plugin/a;->rO:Lcom/autochips/carplay/plugin/CarplayPluginInterface;

    invoke-virtual {v0}, Lcom/autochips/carplay/plugin/CarplayPluginInterface;->cleanupNative()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/autochips/carplay/plugin/a;->rP:Z

    iget-object v0, p0, Lcom/autochips/carplay/plugin/a;->rO:Lcom/autochips/carplay/plugin/CarplayPluginInterface;

    invoke-virtual {v0}, Lcom/autochips/carplay/plugin/CarplayPluginInterface;->cleanup()V

    :cond_0
    return-void
.end method

.method public handleMessage(Landroid/os/Message;)V
    .locals 19

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const-string v2, "CarplayPluginAdapter"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "handleMessage, what: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v4, v1, Landroid/os/Message;->what:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget v2, v1, Landroid/os/Message;->what:I

    const/16 v3, 0x30a

    if-eq v2, v3, :cond_14

    const/16 v3, 0x804

    if-eq v2, v3, :cond_12

    const/4 v3, -0x1

    const/4 v4, 0x0

    const/4 v5, 0x1

    packed-switch v2, :pswitch_data_0

    packed-switch v2, :pswitch_data_1

    packed-switch v2, :pswitch_data_2

    packed-switch v2, :pswitch_data_3

    const-string v0, "CarplayPluginAdapter"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "ignoring msg="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :pswitch_0
    iget-object v1, v0, Lcom/autochips/carplay/plugin/a;->rO:Lcom/autochips/carplay/plugin/CarplayPluginInterface;

    if-eqz v1, :cond_13

    iget-object v0, v0, Lcom/autochips/carplay/plugin/a;->rO:Lcom/autochips/carplay/plugin/CarplayPluginInterface;

    invoke-virtual {v0, v4}, Lcom/autochips/carplay/plugin/CarplayPluginInterface;->setIAP2StateNative(Z)I

    return-void

    :pswitch_1
    iget-object v1, v0, Lcom/autochips/carplay/plugin/a;->rO:Lcom/autochips/carplay/plugin/CarplayPluginInterface;

    if-eqz v1, :cond_13

    iget-object v0, v0, Lcom/autochips/carplay/plugin/a;->rO:Lcom/autochips/carplay/plugin/CarplayPluginInterface;

    invoke-virtual {v0, v5}, Lcom/autochips/carplay/plugin/CarplayPluginInterface;->setIAP2StateNative(Z)I

    :pswitch_2
    return-void

    :pswitch_3
    iget-object v1, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Lcom/autochips/carplay/common/h;

    iget-object v2, v0, Lcom/autochips/carplay/plugin/a;->rO:Lcom/autochips/carplay/plugin/CarplayPluginInterface;

    if-eqz v2, :cond_13

    iget-object v3, v0, Lcom/autochips/carplay/plugin/a;->rO:Lcom/autochips/carplay/plugin/CarplayPluginInterface;

    iget-boolean v4, v1, Lcom/autochips/carplay/common/h;->qP:Z

    iget-boolean v5, v1, Lcom/autochips/carplay/common/h;->qQ:Z

    iget-boolean v6, v1, Lcom/autochips/carplay/common/h;->qR:Z

    iget v7, v1, Lcom/autochips/carplay/common/h;->x:I

    iget v8, v1, Lcom/autochips/carplay/common/h;->y:I

    iget v9, v1, Lcom/autochips/carplay/common/h;->qS:I

    invoke-virtual/range {v3 .. v9}, Lcom/autochips/carplay/plugin/CarplayPluginInterface;->updateKnobNative(ZZZIII)I

    return-void

    :pswitch_4
    iget v1, v1, Landroid/os/Message;->arg1:I

    iget-object v2, v0, Lcom/autochips/carplay/plugin/a;->rO:Lcom/autochips/carplay/plugin/CarplayPluginInterface;

    if-eqz v2, :cond_13

    iget-object v0, v0, Lcom/autochips/carplay/plugin/a;->rO:Lcom/autochips/carplay/plugin/CarplayPluginInterface;

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/plugin/CarplayPluginInterface;->updateMediaBuottnNative(I)I

    return-void

    :pswitch_5
    iget v1, v1, Landroid/os/Message;->arg1:I

    iget-object v2, v0, Lcom/autochips/carplay/plugin/a;->rO:Lcom/autochips/carplay/plugin/CarplayPluginInterface;

    if-eqz v2, :cond_13

    iget-object v0, v0, Lcom/autochips/carplay/plugin/a;->rO:Lcom/autochips/carplay/plugin/CarplayPluginInterface;

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/plugin/CarplayPluginInterface;->updateTelephonyNative(I)I

    return-void

    :pswitch_6
    iget-object v2, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    iget v3, v1, Landroid/os/Message;->arg1:I

    iget v1, v1, Landroid/os/Message;->arg2:I

    sget-boolean v4, Lcom/autochips/carplay/plugin/a;->rR:Z

    if-eqz v4, :cond_4

    new-instance v4, Lcom/autochips/carplay/common/e;

    invoke-direct {v4, v2, v3, v1}, Lcom/autochips/carplay/common/e;-><init>(ZII)V

    const/4 v5, 0x3

    invoke-virtual {v0, v5}, Lcom/autochips/carplay/plugin/a;->hasMessages(I)Z

    move-result v6

    if-eqz v6, :cond_2

    iget-object v6, v0, Lcom/autochips/carplay/plugin/a;->rQ:Lcom/autochips/carplay/common/e;

    invoke-virtual {v4, v6}, Lcom/autochips/carplay/common/e;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    goto :goto_0

    :cond_0
    iget-object v1, v0, Lcom/autochips/carplay/plugin/a;->rQ:Lcom/autochips/carplay/common/e;

    if-eqz v1, :cond_1

    const-string v1, "CarplayPluginAdapter"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "touchEvent: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Lcom/autochips/carplay/common/e;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const-string v1, "CarplayPluginAdapter"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "mCurrentTouchEvent: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, v0, Lcom/autochips/carplay/plugin/a;->rQ:Lcom/autochips/carplay/common/e;

    invoke-virtual {v0}, Lcom/autochips/carplay/common/e;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    return-void

    :cond_2
    :goto_0
    iput-object v4, v0, Lcom/autochips/carplay/plugin/a;->rQ:Lcom/autochips/carplay/common/e;

    iget-object v4, v0, Lcom/autochips/carplay/plugin/a;->rO:Lcom/autochips/carplay/plugin/CarplayPluginInterface;

    if-eqz v4, :cond_3

    iget-object v4, v0, Lcom/autochips/carplay/plugin/a;->rO:Lcom/autochips/carplay/plugin/CarplayPluginInterface;

    invoke-virtual {v4, v2, v3, v1}, Lcom/autochips/carplay/plugin/CarplayPluginInterface;->updateTouchScreenNative(ZII)I

    :cond_3
    invoke-virtual {v0, v5}, Lcom/autochips/carplay/plugin/a;->removeMessages(I)V

    const-wide/16 v1, 0xc8

    invoke-virtual {v0, v5, v1, v2}, Lcom/autochips/carplay/plugin/a;->sendEmptyMessageDelayed(IJ)Z

    return-void

    :cond_4
    iget-object v4, v0, Lcom/autochips/carplay/plugin/a;->rO:Lcom/autochips/carplay/plugin/CarplayPluginInterface;

    if-eqz v4, :cond_13

    iget-object v0, v0, Lcom/autochips/carplay/plugin/a;->rO:Lcom/autochips/carplay/plugin/CarplayPluginInterface;

    invoke-virtual {v0, v2, v3, v1}, Lcom/autochips/carplay/plugin/CarplayPluginInterface;->updateTouchScreenNative(ZII)I

    return-void

    :pswitch_7
    iget-object v1, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    const-string v2, "CarplayPluginAdapter"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "setOemIconLabel, label: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v2, v0, Lcom/autochips/carplay/plugin/a;->rO:Lcom/autochips/carplay/plugin/CarplayPluginInterface;

    if-eqz v2, :cond_5

    iget-object v0, v0, Lcom/autochips/carplay/plugin/a;->rO:Lcom/autochips/carplay/plugin/CarplayPluginInterface;

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/plugin/CarplayPluginInterface;->setOemIconLabelNative(Ljava/lang/String;)I

    :cond_5
    return-void

    :pswitch_8
    iget v2, v1, Landroid/os/Message;->arg1:I

    iget v1, v1, Landroid/os/Message;->arg2:I

    const-string v3, "CarplayPluginAdapter"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "setScreenSize, width: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, ", height: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v3, v0, Lcom/autochips/carplay/plugin/a;->rO:Lcom/autochips/carplay/plugin/CarplayPluginInterface;

    if-eqz v3, :cond_6

    iget-object v0, v0, Lcom/autochips/carplay/plugin/a;->rO:Lcom/autochips/carplay/plugin/CarplayPluginInterface;

    invoke-virtual {v0, v2, v1}, Lcom/autochips/carplay/plugin/CarplayPluginInterface;->setScreenSizeNative(II)I

    :cond_6
    return-void

    :pswitch_9
    iget v2, v1, Landroid/os/Message;->arg1:I

    iget v1, v1, Landroid/os/Message;->arg2:I

    const-string v3, "CarplayPluginAdapter"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "setVideoResolution, width: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, ", height: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v3, v0, Lcom/autochips/carplay/plugin/a;->rO:Lcom/autochips/carplay/plugin/CarplayPluginInterface;

    if-eqz v3, :cond_7

    iget-object v0, v0, Lcom/autochips/carplay/plugin/a;->rO:Lcom/autochips/carplay/plugin/CarplayPluginInterface;

    invoke-virtual {v0, v2, v1}, Lcom/autochips/carplay/plugin/CarplayPluginInterface;->setVideoResolutionNative(II)I

    :cond_7
    return-void

    :pswitch_a
    iget-object v1, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iget-object v2, v0, Lcom/autochips/carplay/plugin/a;->rO:Lcom/autochips/carplay/plugin/CarplayPluginInterface;

    if-eqz v2, :cond_13

    iget-object v0, v0, Lcom/autochips/carplay/plugin/a;->rO:Lcom/autochips/carplay/plugin/CarplayPluginInterface;

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/plugin/CarplayPluginInterface;->setNightModeNative(Z)I

    return-void

    :pswitch_b
    iget-object v2, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Lcom/autochips/carplay/common/f;

    iget v1, v1, Landroid/os/Message;->arg1:I

    iget-object v3, v2, Lcom/autochips/carplay/common/f;->qF:Lcom/autochips/carplay/common/g;

    iget v7, v3, Lcom/autochips/carplay/common/g;->qK:I

    iget-object v3, v2, Lcom/autochips/carplay/common/f;->qF:Lcom/autochips/carplay/common/g;

    iget v8, v3, Lcom/autochips/carplay/common/g;->qL:I

    iget-object v3, v2, Lcom/autochips/carplay/common/f;->qF:Lcom/autochips/carplay/common/g;

    iget v9, v3, Lcom/autochips/carplay/common/g;->qM:I

    iget-object v3, v2, Lcom/autochips/carplay/common/f;->qF:Lcom/autochips/carplay/common/g;

    iget v10, v3, Lcom/autochips/carplay/common/g;->qN:I

    iget-object v3, v2, Lcom/autochips/carplay/common/f;->qG:Lcom/autochips/carplay/common/g;

    iget v11, v3, Lcom/autochips/carplay/common/g;->qK:I

    iget-object v3, v2, Lcom/autochips/carplay/common/f;->qG:Lcom/autochips/carplay/common/g;

    iget v12, v3, Lcom/autochips/carplay/common/g;->qL:I

    iget-object v3, v2, Lcom/autochips/carplay/common/f;->qG:Lcom/autochips/carplay/common/g;

    iget v13, v3, Lcom/autochips/carplay/common/g;->qM:I

    iget-object v3, v2, Lcom/autochips/carplay/common/f;->qG:Lcom/autochips/carplay/common/g;

    iget v14, v3, Lcom/autochips/carplay/common/g;->qN:I

    iget v15, v2, Lcom/autochips/carplay/common/f;->qH:I

    iget v3, v2, Lcom/autochips/carplay/common/f;->qI:I

    iget v2, v2, Lcom/autochips/carplay/common/f;->qJ:I

    iget-object v6, v0, Lcom/autochips/carplay/plugin/a;->rO:Lcom/autochips/carplay/plugin/CarplayPluginInterface;

    if-eqz v6, :cond_13

    iget-object v6, v0, Lcom/autochips/carplay/plugin/a;->rO:Lcom/autochips/carplay/plugin/CarplayPluginInterface;

    if-ne v1, v5, :cond_8

    move/from16 v18, v5

    goto :goto_1

    :cond_8
    move/from16 v18, v4

    :goto_1
    move/from16 v16, v3

    move/from16 v17, v2

    invoke-virtual/range {v6 .. v18}, Lcom/autochips/carplay/plugin/CarplayPluginInterface;->sendChangeModeRequestNative(IIIIIIIIIIIZ)I

    return-void

    :pswitch_c
    iget-object v1, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iget-object v2, v0, Lcom/autochips/carplay/plugin/a;->rO:Lcom/autochips/carplay/plugin/CarplayPluginInterface;

    if-eqz v2, :cond_13

    iget-object v0, v0, Lcom/autochips/carplay/plugin/a;->rO:Lcom/autochips/carplay/plugin/CarplayPluginInterface;

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/plugin/CarplayPluginInterface;->setLimitedUINative(Z)I

    return-void

    :pswitch_d
    iget-object v1, v0, Lcom/autochips/carplay/plugin/a;->rO:Lcom/autochips/carplay/plugin/CarplayPluginInterface;

    if-eqz v1, :cond_13

    iget-object v0, v0, Lcom/autochips/carplay/plugin/a;->rO:Lcom/autochips/carplay/plugin/CarplayPluginInterface;

    invoke-virtual {v0}, Lcom/autochips/carplay/plugin/CarplayPluginInterface;->forceKeyFrameNative()I

    return-void

    :pswitch_e
    iget v1, v1, Landroid/os/Message;->arg1:I

    iget-object v2, v0, Lcom/autochips/carplay/plugin/a;->rO:Lcom/autochips/carplay/plugin/CarplayPluginInterface;

    if-eqz v2, :cond_13

    iget-object v0, v0, Lcom/autochips/carplay/plugin/a;->rO:Lcom/autochips/carplay/plugin/CarplayPluginInterface;

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/plugin/CarplayPluginInterface;->requestSiriActionNative(I)I

    return-void

    :pswitch_f
    iget v2, v1, Landroid/os/Message;->arg1:I

    iget-object v1, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    const-string v3, ""

    packed-switch v2, :pswitch_data_4

    goto :goto_2

    :pswitch_10
    const-string v3, "oem:"

    goto :goto_2

    :pswitch_11
    const-string v3, "tel:"

    goto :goto_2

    :pswitch_12
    const-string v3, "nowplaying:"

    goto :goto_2

    :pswitch_13
    const-string v3, "music:"

    goto :goto_2

    :pswitch_14
    const-string v3, "mobilephone:"

    goto :goto_2

    :pswitch_15
    const-string v3, "maps:"

    goto :goto_2

    :pswitch_16
    const-string v3, ""

    :goto_2
    const/4 v6, 0x6

    if-ne v6, v2, :cond_a

    if-eqz v1, :cond_9

    move v4, v5

    :cond_9
    if-eqz v4, :cond_b

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :cond_a
    iget-object v1, v0, Lcom/autochips/carplay/plugin/a;->rO:Lcom/autochips/carplay/plugin/CarplayPluginInterface;

    if-eqz v1, :cond_b

    iget-object v0, v0, Lcom/autochips/carplay/plugin/a;->rO:Lcom/autochips/carplay/plugin/CarplayPluginInterface;

    invoke-virtual {v0, v3}, Lcom/autochips/carplay/plugin/CarplayPluginInterface;->requestUINative(Ljava/lang/String;)I

    :cond_b
    :pswitch_17
    return-void

    :pswitch_18
    iget-boolean v1, v0, Lcom/autochips/carplay/plugin/a;->mEnabled:Z

    if-nez v1, :cond_c

    const/16 v0, 0x702

    invoke-static {v0}, Lcom/autochips/carplay/plugin/a;->V(I)V

    return-void

    :cond_c
    iget-object v1, v0, Lcom/autochips/carplay/plugin/a;->rO:Lcom/autochips/carplay/plugin/CarplayPluginInterface;

    if-eqz v1, :cond_d

    iget-object v1, v0, Lcom/autochips/carplay/plugin/a;->rO:Lcom/autochips/carplay/plugin/CarplayPluginInterface;

    invoke-virtual {v1}, Lcom/autochips/carplay/plugin/CarplayPluginInterface;->shutdownCarplayNative()I

    move-result v3

    :cond_d
    const-string v1, "CarplayPluginAdapter"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v5, "shutdownCarplay "

    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-nez v3, :cond_e

    iput-boolean v4, v0, Lcom/autochips/carplay/plugin/a;->mEnabled:Z

    return-void

    :cond_e
    const/16 v0, 0x704

    invoke-static {v0}, Lcom/autochips/carplay/plugin/a;->V(I)V

    return-void

    :pswitch_19
    iget-boolean v1, v0, Lcom/autochips/carplay/plugin/a;->mEnabled:Z

    if-eqz v1, :cond_f

    const/16 v0, 0x701

    invoke-static {v0}, Lcom/autochips/carplay/plugin/a;->V(I)V

    return-void

    :cond_f
    iget-object v1, v0, Lcom/autochips/carplay/plugin/a;->rO:Lcom/autochips/carplay/plugin/CarplayPluginInterface;

    if-eqz v1, :cond_10

    iget-object v1, v0, Lcom/autochips/carplay/plugin/a;->rO:Lcom/autochips/carplay/plugin/CarplayPluginInterface;

    invoke-virtual {v1}, Lcom/autochips/carplay/plugin/CarplayPluginInterface;->startupCarplayNative()I

    move-result v3

    :cond_10
    const-string v1, "CarplayPluginAdapter"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v4, "startupCarplay "

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-nez v3, :cond_11

    iput-boolean v5, v0, Lcom/autochips/carplay/plugin/a;->mEnabled:Z

    return-void

    :cond_11
    const/16 v0, 0x703

    invoke-static {v0}, Lcom/autochips/carplay/plugin/a;->V(I)V

    return-void

    :cond_12
    iget-object v1, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget-object v2, v0, Lcom/autochips/carplay/plugin/a;->rO:Lcom/autochips/carplay/plugin/CarplayPluginInterface;

    if-eqz v2, :cond_13

    iget-object v0, v0, Lcom/autochips/carplay/plugin/a;->rO:Lcom/autochips/carplay/plugin/CarplayPluginInterface;

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/plugin/CarplayPluginInterface;->setDeviceIDNative(Ljava/lang/String;)I

    :cond_13
    return-void

    :cond_14
    iget-object v1, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    const-string v2, "CarplayPluginAdapter"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "setBluetoothAddress, address: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v2, v0, Lcom/autochips/carplay/plugin/a;->rO:Lcom/autochips/carplay/plugin/CarplayPluginInterface;

    if-eqz v2, :cond_15

    iget-object v0, v0, Lcom/autochips/carplay/plugin/a;->rO:Lcom/autochips/carplay/plugin/CarplayPluginInterface;

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/plugin/CarplayPluginInterface;->setBluetoothAddressNative(Ljava/lang/String;)I

    :cond_15
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_19
        :pswitch_18
        :pswitch_17
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x106
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x114
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
    .end packed-switch

    :pswitch_data_3
    .packed-switch 0x50a
        :pswitch_2
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_0
    .end packed-switch

    :pswitch_data_4
    .packed-switch 0x1
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
    .end packed-switch
.end method
