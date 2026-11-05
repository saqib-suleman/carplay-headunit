.class public final Lcom/autochips/carplay/b/d;
.super Landroid/os/Handler;


# instance fields
.field private mAudioManager:Landroid/media/AudioManager;

.field private mCarplayMonitor:Lcom/autochips/carplay/service/h;

.field private final mContext:Landroid/content/Context;

.field private rY:Lcom/autochips/carplay/c/a;

.field private rZ:Lcom/autochips/carplay/common/f;

.field private sa:Lcom/autochips/carplay/common/g;

.field private sb:Lcom/autochips/carplay/common/g;

.field private sc:I

.field private sd:Z

.field private se:I

.field private sf:Z

.field private sg:Z

.field private sh:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/os/Looper;)V
    .locals 0

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    const/4 p2, 0x0

    iput-object p2, p0, Lcom/autochips/carplay/b/d;->mAudioManager:Landroid/media/AudioManager;

    iput-object p2, p0, Lcom/autochips/carplay/b/d;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    iput-object p2, p0, Lcom/autochips/carplay/b/d;->rY:Lcom/autochips/carplay/c/a;

    iput-object p2, p0, Lcom/autochips/carplay/b/d;->rZ:Lcom/autochips/carplay/common/f;

    iput-object p2, p0, Lcom/autochips/carplay/b/d;->sa:Lcom/autochips/carplay/common/g;

    iput-object p2, p0, Lcom/autochips/carplay/b/d;->sb:Lcom/autochips/carplay/common/g;

    const/4 p2, 0x0

    iput p2, p0, Lcom/autochips/carplay/b/d;->sc:I

    iput-boolean p2, p0, Lcom/autochips/carplay/b/d;->sd:Z

    iput p2, p0, Lcom/autochips/carplay/b/d;->se:I

    iput-boolean p2, p0, Lcom/autochips/carplay/b/d;->sf:Z

    iput-boolean p2, p0, Lcom/autochips/carplay/b/d;->sg:Z

    iput p2, p0, Lcom/autochips/carplay/b/d;->sh:I

    iput-object p1, p0, Lcom/autochips/carplay/b/d;->mContext:Landroid/content/Context;

    iget-object p1, p0, Lcom/autochips/carplay/b/d;->mContext:Landroid/content/Context;

    const-string p2, "audio"

    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/media/AudioManager;

    iput-object p1, p0, Lcom/autochips/carplay/b/d;->mAudioManager:Landroid/media/AudioManager;

    return-void
.end method

.method private a(Lcom/autochips/carplay/common/f;Lcom/autochips/carplay/CarplayDevice;)V
    .locals 3

    iget-boolean v0, p0, Lcom/autochips/carplay/b/d;->sg:Z

    const/16 v1, 0x1f4

    if-eqz v0, :cond_0

    iget-object p2, p1, Lcom/autochips/carplay/common/f;->qF:Lcom/autochips/carplay/common/g;

    const/4 v0, 0x3

    iput v0, p2, Lcom/autochips/carplay/common/g;->qK:I

    iget-object p2, p1, Lcom/autochips/carplay/common/f;->qF:Lcom/autochips/carplay/common/g;

    iput v1, p2, Lcom/autochips/carplay/common/g;->qL:I

    iget-object p2, p1, Lcom/autochips/carplay/common/f;->qF:Lcom/autochips/carplay/common/g;

    const/4 v0, 0x0

    iput v0, p2, Lcom/autochips/carplay/common/g;->qM:I

    iget-object p1, p1, Lcom/autochips/carplay/common/f;->qF:Lcom/autochips/carplay/common/g;

    const/16 p2, 0x3e8

    iput p2, p1, Lcom/autochips/carplay/common/g;->qN:I

    return-void

    :cond_0
    iget-object v0, p1, Lcom/autochips/carplay/common/f;->qF:Lcom/autochips/carplay/common/g;

    const/4 v2, 0x1

    iput v2, v0, Lcom/autochips/carplay/common/g;->qK:I

    const/16 v0, 0x64

    if-eqz p2, :cond_1

    iget-object v2, p0, Lcom/autochips/carplay/b/d;->mContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/autochips/carplay/service/ac;->a(Landroid/content/Context;)Lcom/autochips/carplay/service/ac;

    move-result-object v2

    invoke-virtual {p2}, Lcom/autochips/carplay/CarplayDevice;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v2, p2}, Lcom/autochips/carplay/service/ac;->K(Ljava/lang/String;)I

    move-result p2

    if-nez p2, :cond_1

    iget-object p2, p1, Lcom/autochips/carplay/common/f;->qF:Lcom/autochips/carplay/common/g;

    iput v1, p2, Lcom/autochips/carplay/common/g;->qL:I

    iget-object p2, p1, Lcom/autochips/carplay/common/f;->qF:Lcom/autochips/carplay/common/g;

    iput v1, p2, Lcom/autochips/carplay/common/g;->qM:I

    goto :goto_0

    :cond_1
    iget-object p2, p1, Lcom/autochips/carplay/common/f;->qF:Lcom/autochips/carplay/common/g;

    iput v0, p2, Lcom/autochips/carplay/common/g;->qL:I

    iget-object p2, p1, Lcom/autochips/carplay/common/f;->qF:Lcom/autochips/carplay/common/g;

    iput v0, p2, Lcom/autochips/carplay/common/g;->qM:I

    :goto_0
    iget-object p1, p1, Lcom/autochips/carplay/common/f;->qF:Lcom/autochips/carplay/common/g;

    iput v0, p1, Lcom/autochips/carplay/common/g;->qN:I

    return-void
.end method

.method private a(Lcom/autochips/carplay/common/f;Z)Z
    .locals 4

    iget-object v0, p0, Lcom/autochips/carplay/b/d;->rY:Lcom/autochips/carplay/c/a;

    invoke-virtual {v0}, Lcom/autochips/carplay/c/a;->el()Z

    move-result v0

    const-string v1, "CarplayAppStateController"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "updatePhoneCall, isAccessoryCallOn: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v3, ", force: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v1, 0x1

    if-nez p2, :cond_1

    iget-boolean p2, p0, Lcom/autochips/carplay/b/d;->sd:Z

    if-eq p2, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    return v1

    :cond_1
    :goto_0
    iput-boolean v0, p0, Lcom/autochips/carplay/b/d;->sd:Z

    if-eqz v0, :cond_2

    iput v1, p1, Lcom/autochips/carplay/common/f;->qH:I

    return v1

    :cond_2
    const/4 p2, -0x1

    iput p2, p1, Lcom/autochips/carplay/common/f;->qH:I

    return v1
.end method

.method private a(Lcom/autochips/carplay/common/f;ZZ)Z
    .locals 3

    iget-object v0, p0, Lcom/autochips/carplay/b/d;->rZ:Lcom/autochips/carplay/common/f;

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/common/f;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_4

    iget-object v0, p1, Lcom/autochips/carplay/common/f;->qG:Lcom/autochips/carplay/common/g;

    iget-object v2, p0, Lcom/autochips/carplay/b/d;->sb:Lcom/autochips/carplay/common/g;

    invoke-virtual {v0, v2}, Lcom/autochips/carplay/common/g;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p1, Lcom/autochips/carplay/common/f;->qG:Lcom/autochips/carplay/common/g;

    iput-object v0, p0, Lcom/autochips/carplay/b/d;->sb:Lcom/autochips/carplay/common/g;

    goto :goto_0

    :cond_0
    const-string v0, "CarplayAppStateController"

    const-string v2, "the same main audio request, reset!"

    invoke-static {v0, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p1, Lcom/autochips/carplay/common/f;->qG:Lcom/autochips/carplay/common/g;

    iput v1, v0, Lcom/autochips/carplay/common/g;->qK:I

    iget-object v0, p1, Lcom/autochips/carplay/common/f;->qG:Lcom/autochips/carplay/common/g;

    iput v1, v0, Lcom/autochips/carplay/common/g;->qL:I

    iget-object v0, p1, Lcom/autochips/carplay/common/f;->qG:Lcom/autochips/carplay/common/g;

    iput v1, v0, Lcom/autochips/carplay/common/g;->qM:I

    iget-object v0, p1, Lcom/autochips/carplay/common/f;->qG:Lcom/autochips/carplay/common/g;

    iput v1, v0, Lcom/autochips/carplay/common/g;->qN:I

    :goto_0
    iget-object v0, p1, Lcom/autochips/carplay/common/f;->qF:Lcom/autochips/carplay/common/g;

    iget-object v2, p0, Lcom/autochips/carplay/b/d;->sa:Lcom/autochips/carplay/common/g;

    invoke-virtual {v0, v2}, Lcom/autochips/carplay/common/g;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    if-eqz p3, :cond_1

    goto :goto_1

    :cond_1
    const-string p3, "CarplayAppStateController"

    const-string v0, "the same main screen request, reset!"

    invoke-static {p3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p3, p1, Lcom/autochips/carplay/common/f;->qF:Lcom/autochips/carplay/common/g;

    iput v1, p3, Lcom/autochips/carplay/common/g;->qK:I

    iget-object p3, p1, Lcom/autochips/carplay/common/f;->qF:Lcom/autochips/carplay/common/g;

    iput v1, p3, Lcom/autochips/carplay/common/g;->qL:I

    iget-object p3, p1, Lcom/autochips/carplay/common/f;->qF:Lcom/autochips/carplay/common/g;

    iput v1, p3, Lcom/autochips/carplay/common/g;->qM:I

    iget-object p3, p1, Lcom/autochips/carplay/common/f;->qF:Lcom/autochips/carplay/common/g;

    iput v1, p3, Lcom/autochips/carplay/common/g;->qN:I

    goto :goto_2

    :cond_2
    :goto_1
    iget-object p3, p1, Lcom/autochips/carplay/common/f;->qF:Lcom/autochips/carplay/common/g;

    iput-object p3, p0, Lcom/autochips/carplay/b/d;->sa:Lcom/autochips/carplay/common/g;

    :goto_2
    iput-object p1, p0, Lcom/autochips/carplay/b/d;->rZ:Lcom/autochips/carplay/common/f;

    const/16 p3, 0x10a

    invoke-virtual {p0, p3}, Lcom/autochips/carplay/b/d;->obtainMessage(I)Landroid/os/Message;

    move-result-object p3

    iput-object p1, p3, Landroid/os/Message;->obj:Ljava/lang/Object;

    iput p2, p3, Landroid/os/Message;->arg1:I

    invoke-static {}, Lcom/autochips/carplay/service/g;->dx()Lcom/autochips/carplay/service/g;

    move-result-object p1

    invoke-virtual {p1}, Lcom/autochips/carplay/service/g;->dC()Lcom/autochips/carplay/service/p;

    move-result-object p1

    if-eqz p1, :cond_3

    invoke-static {}, Lcom/autochips/carplay/service/g;->dx()Lcom/autochips/carplay/service/g;

    move-result-object p1

    invoke-virtual {p1}, Lcom/autochips/carplay/service/g;->dC()Lcom/autochips/carplay/service/p;

    move-result-object p1

    invoke-virtual {p1, p3}, Lcom/autochips/carplay/service/p;->sendMessage(Landroid/os/Message;)V

    :cond_3
    const/4 v1, 0x1

    return v1

    :cond_4
    const-string p1, "CarplayAppStateController"

    const-string p2, "the same request, ignore!"

    invoke-static {p1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return v1
.end method

.method private b(Lcom/autochips/carplay/common/f;Z)Z
    .locals 9

    iget-object v0, p0, Lcom/autochips/carplay/b/d;->rY:Lcom/autochips/carplay/c/a;

    invoke-virtual {v0}, Lcom/autochips/carplay/c/a;->ek()I

    move-result v0

    iget-object v1, p0, Lcom/autochips/carplay/b/d;->rY:Lcom/autochips/carplay/c/a;

    invoke-virtual {v1}, Lcom/autochips/carplay/c/a;->em()I

    move-result v1

    const-string v2, "CarplayAppStateController"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "updateSpeech, callType: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ", audioState: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/16 v2, 0x1f4

    const/16 v3, 0x3e8

    const/4 v4, 0x3

    const/4 v5, -0x1

    const/4 v6, 0x0

    const/4 v7, 0x1

    if-eq v0, v7, :cond_6

    const/4 v8, 0x2

    if-ne v1, v8, :cond_0

    goto/16 :goto_2

    :cond_0
    if-nez p2, :cond_3

    if-nez v0, :cond_3

    if-nez v1, :cond_3

    invoke-static {}, Lcom/autochips/carplay/service/g;->dx()Lcom/autochips/carplay/service/g;

    move-result-object p2

    invoke-virtual {p2}, Lcom/autochips/carplay/service/g;->dC()Lcom/autochips/carplay/service/p;

    move-result-object p2

    if-eqz p2, :cond_1

    invoke-virtual {p2}, Lcom/autochips/carplay/service/p;->getConnectedDevices()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/autochips/carplay/b/d;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/autochips/carplay/service/ac;->a(Landroid/content/Context;)Lcom/autochips/carplay/service/ac;

    move-result-object v3

    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/autochips/carplay/CarplayDevice;

    invoke-virtual {v2}, Lcom/autochips/carplay/CarplayDevice;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Lcom/autochips/carplay/service/ac;->K(Ljava/lang/String;)I

    move-result v2

    if-ne v2, v7, :cond_1

    const/16 v2, 0x106

    invoke-virtual {p0, v2}, Lcom/autochips/carplay/b/d;->obtainMessage(I)Landroid/os/Message;

    move-result-object v2

    iput v7, v2, Landroid/os/Message;->arg1:I

    const/4 v3, 0x0

    iput-object v3, v2, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-virtual {p2, v2}, Lcom/autochips/carplay/service/p;->sendMessage(Landroid/os/Message;)V

    :cond_1
    iget-boolean p2, p0, Lcom/autochips/carplay/b/d;->sg:Z

    const/4 v2, 0x4

    if-nez p2, :cond_2

    iget-object p2, p1, Lcom/autochips/carplay/common/f;->qF:Lcom/autochips/carplay/common/g;

    iput v2, p2, Lcom/autochips/carplay/common/g;->qK:I

    goto :goto_0

    :cond_2
    const-string p2, "CarplayAppStateController"

    const-string v3, "backcar ongoing, ignore unborrow screen"

    invoke-static {p2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    iget-object p2, p1, Lcom/autochips/carplay/common/f;->qG:Lcom/autochips/carplay/common/g;

    iput v2, p2, Lcom/autochips/carplay/common/g;->qK:I

    goto :goto_1

    :cond_3
    if-ne v0, v8, :cond_5

    if-nez v1, :cond_5

    iget-object p2, p0, Lcom/autochips/carplay/b/d;->sb:Lcom/autochips/carplay/common/g;

    if-eqz p2, :cond_4

    iget-object p2, p0, Lcom/autochips/carplay/b/d;->sb:Lcom/autochips/carplay/common/g;

    iget p2, p2, Lcom/autochips/carplay/common/g;->qK:I

    if-ne p2, v4, :cond_4

    iget-object p2, p0, Lcom/autochips/carplay/b/d;->sb:Lcom/autochips/carplay/common/g;

    iget p2, p2, Lcom/autochips/carplay/common/g;->qN:I

    if-ne p2, v3, :cond_4

    iget-object p2, p1, Lcom/autochips/carplay/common/f;->qG:Lcom/autochips/carplay/common/g;

    iput v4, p2, Lcom/autochips/carplay/common/g;->qK:I

    iget-object p2, p1, Lcom/autochips/carplay/common/f;->qG:Lcom/autochips/carplay/common/g;

    iput v2, p2, Lcom/autochips/carplay/common/g;->qL:I

    iget-object p2, p1, Lcom/autochips/carplay/common/f;->qG:Lcom/autochips/carplay/common/g;

    iput v6, p2, Lcom/autochips/carplay/common/g;->qM:I

    iget-object p2, p1, Lcom/autochips/carplay/common/f;->qG:Lcom/autochips/carplay/common/g;

    iput v3, p2, Lcom/autochips/carplay/common/g;->qN:I

    :cond_4
    iget-object p2, p1, Lcom/autochips/carplay/common/f;->qF:Lcom/autochips/carplay/common/g;

    iput v4, p2, Lcom/autochips/carplay/common/g;->qK:I

    iget-object p2, p1, Lcom/autochips/carplay/common/f;->qF:Lcom/autochips/carplay/common/g;

    iput v2, p2, Lcom/autochips/carplay/common/g;->qL:I

    iget-object p2, p1, Lcom/autochips/carplay/common/f;->qF:Lcom/autochips/carplay/common/g;

    iput v6, p2, Lcom/autochips/carplay/common/g;->qM:I

    iget-object p2, p1, Lcom/autochips/carplay/common/f;->qF:Lcom/autochips/carplay/common/g;

    iput v3, p2, Lcom/autochips/carplay/common/g;->qN:I

    :goto_1
    iput v5, p1, Lcom/autochips/carplay/common/f;->qI:I

    move p2, v5

    move v6, v7

    goto :goto_3

    :cond_5
    move p2, v5

    goto :goto_3

    :cond_6
    :goto_2
    iget-object p2, p1, Lcom/autochips/carplay/common/f;->qF:Lcom/autochips/carplay/common/g;

    iput v4, p2, Lcom/autochips/carplay/common/g;->qK:I

    iget-object p2, p1, Lcom/autochips/carplay/common/f;->qF:Lcom/autochips/carplay/common/g;

    iput v2, p2, Lcom/autochips/carplay/common/g;->qL:I

    iget-object p2, p1, Lcom/autochips/carplay/common/f;->qF:Lcom/autochips/carplay/common/g;

    iput v6, p2, Lcom/autochips/carplay/common/g;->qM:I

    iget-object p2, p1, Lcom/autochips/carplay/common/f;->qF:Lcom/autochips/carplay/common/g;

    iput v3, p2, Lcom/autochips/carplay/common/g;->qN:I

    iget-object p2, p1, Lcom/autochips/carplay/common/f;->qG:Lcom/autochips/carplay/common/g;

    iput v4, p2, Lcom/autochips/carplay/common/g;->qK:I

    iget-object p2, p1, Lcom/autochips/carplay/common/f;->qG:Lcom/autochips/carplay/common/g;

    iput v2, p2, Lcom/autochips/carplay/common/g;->qL:I

    iget-object p2, p1, Lcom/autochips/carplay/common/f;->qG:Lcom/autochips/carplay/common/g;

    iput v6, p2, Lcom/autochips/carplay/common/g;->qM:I

    iget-object p2, p1, Lcom/autochips/carplay/common/f;->qG:Lcom/autochips/carplay/common/g;

    iput v3, p2, Lcom/autochips/carplay/common/g;->qN:I

    iput v7, p1, Lcom/autochips/carplay/common/f;->qI:I

    move p2, v7

    move v6, p2

    :goto_3
    if-eqz v0, :cond_7

    iput v7, p1, Lcom/autochips/carplay/common/f;->qH:I

    goto :goto_4

    :cond_7
    iput v5, p1, Lcom/autochips/carplay/common/f;->qH:I

    :goto_4
    iget p1, p0, Lcom/autochips/carplay/b/d;->se:I

    if-eq p1, p2, :cond_8

    iput p2, p0, Lcom/autochips/carplay/b/d;->se:I

    :cond_8
    if-nez v0, :cond_9

    if-nez v1, :cond_9

    invoke-virtual {p0, v7}, Lcom/autochips/carplay/b/d;->obtainMessage(I)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/b/d;->sendMessage(Landroid/os/Message;)Z

    :cond_9
    return v6
.end method

.method private m(Z)V
    .locals 5

    invoke-static {}, Lcom/autochips/carplay/service/g;->dx()Lcom/autochips/carplay/service/g;

    move-result-object v0

    invoke-virtual {v0}, Lcom/autochips/carplay/service/g;->dy()Lcom/autochips/carplay/service/CarplayService;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/autochips/carplay/service/CarplayService;->getConnectedDevices()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/autochips/carplay/b/d;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/autochips/carplay/service/ac;->a(Landroid/content/Context;)Lcom/autochips/carplay/service/ac;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/autochips/carplay/CarplayDevice;

    invoke-virtual {v3}, Lcom/autochips/carplay/CarplayDevice;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/autochips/carplay/service/ac;->K(Ljava/lang/String;)I

    move-result v1

    const/4 v3, 0x1

    if-nez v1, :cond_0

    const-string v1, "CarplayAppStateController"

    const-string v4, "UI_STATE_BACKGROUND"

    invoke-static {v1, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v1, Lcom/autochips/carplay/common/f;

    invoke-direct {v1}, Lcom/autochips/carplay/common/f;-><init>()V

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/autochips/carplay/CarplayDevice;

    invoke-direct {p0, v1, v0}, Lcom/autochips/carplay/b/d;->a(Lcom/autochips/carplay/common/f;Lcom/autochips/carplay/CarplayDevice;)V

    invoke-direct {p0, v1, v3, p1}, Lcom/autochips/carplay/b/d;->a(Lcom/autochips/carplay/common/f;ZZ)Z

    return-void

    :cond_0
    const-string v0, "CarplayAppStateController"

    const-string v1, "UI_STATE_FOREGROUND"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Lcom/autochips/carplay/common/f;

    invoke-direct {v0}, Lcom/autochips/carplay/common/f;-><init>()V

    iget-object v1, v0, Lcom/autochips/carplay/common/f;->qF:Lcom/autochips/carplay/common/g;

    const/4 v2, 0x4

    iput v2, v1, Lcom/autochips/carplay/common/g;->qK:I

    invoke-direct {p0, v0, v3, p1}, Lcom/autochips/carplay/b/d;->a(Lcom/autochips/carplay/common/f;ZZ)Z

    const/16 p1, 0x106

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/b/d;->obtainMessage(I)Landroid/os/Message;

    move-result-object p1

    iput v3, p1, Landroid/os/Message;->arg1:I

    const/4 v0, 0x0

    iput-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-static {}, Lcom/autochips/carplay/service/g;->dx()Lcom/autochips/carplay/service/g;

    move-result-object v0

    invoke-virtual {v0}, Lcom/autochips/carplay/service/g;->dC()Lcom/autochips/carplay/service/p;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/autochips/carplay/service/p;->sendMessage(Landroid/os/Message;)V

    :cond_1
    return-void
.end method


# virtual methods
.method public final a(Lcom/autochips/carplay/CarplayDevice;)Lcom/autochips/carplay/common/f;
    .locals 4

    new-instance v0, Lcom/autochips/carplay/common/f;

    invoke-direct {v0}, Lcom/autochips/carplay/common/f;-><init>()V

    invoke-direct {p0, v0, p1}, Lcom/autochips/carplay/b/d;->a(Lcom/autochips/carplay/common/f;Lcom/autochips/carplay/CarplayDevice;)V

    iget-object p1, p0, Lcom/autochips/carplay/b/d;->mAudioManager:Landroid/media/AudioManager;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/autochips/carplay/b/d;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {p1}, Landroid/media/AudioManager;->getCurrentAudioFocusContentType()I

    move-result p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    const-string v1, "CarplayAppStateController"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "contentType = "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, v0, Lcom/autochips/carplay/common/f;->qG:Lcom/autochips/carplay/common/g;

    const/4 v2, 0x1

    iput v2, v1, Lcom/autochips/carplay/common/g;->qK:I

    const/4 v1, 0x2

    const/16 v3, 0x64

    if-eq p1, v1, :cond_2

    const/4 v1, 0x3

    if-eq p1, v1, :cond_2

    const/4 v1, 0x7

    if-ne p1, v1, :cond_1

    goto :goto_1

    :cond_1
    iget-object p1, v0, Lcom/autochips/carplay/common/f;->qG:Lcom/autochips/carplay/common/g;

    iput v3, p1, Lcom/autochips/carplay/common/g;->qL:I

    iget-object p1, v0, Lcom/autochips/carplay/common/f;->qG:Lcom/autochips/carplay/common/g;

    iput v3, p1, Lcom/autochips/carplay/common/g;->qM:I

    goto :goto_2

    :cond_2
    :goto_1
    iget-object p1, v0, Lcom/autochips/carplay/common/f;->qG:Lcom/autochips/carplay/common/g;

    const/16 v1, 0x1f4

    iput v1, p1, Lcom/autochips/carplay/common/g;->qL:I

    iget-object p1, v0, Lcom/autochips/carplay/common/f;->qG:Lcom/autochips/carplay/common/g;

    iput v1, p1, Lcom/autochips/carplay/common/g;->qM:I

    :goto_2
    iget-object p1, v0, Lcom/autochips/carplay/common/f;->qG:Lcom/autochips/carplay/common/g;

    iput v3, p1, Lcom/autochips/carplay/common/g;->qN:I

    invoke-direct {p0, v0, v2}, Lcom/autochips/carplay/b/d;->a(Lcom/autochips/carplay/common/f;Z)Z

    invoke-direct {p0, v0, v2}, Lcom/autochips/carplay/b/d;->b(Lcom/autochips/carplay/common/f;Z)Z

    const/4 p1, -0x1

    iput p1, v0, Lcom/autochips/carplay/common/f;->qJ:I

    const-string p1, "CarplayAppStateController"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "getInitialMode: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-object v0
.end method

.method public final a(Lcom/autochips/carplay/service/h;Lcom/autochips/carplay/c/a;)V
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/b/d;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    iput-object p2, p0, Lcom/autochips/carplay/b/d;->rY:Lcom/autochips/carplay/c/a;

    iget-object p1, p0, Lcom/autochips/carplay/b/d;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    const/16 p2, 0x70a

    invoke-virtual {p1, p2, p0}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/b/d;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    const/16 p2, 0x309

    invoke-virtual {p1, p2, p0}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/b/d;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    const/16 p2, 0x901

    invoke-virtual {p1, p2, p0}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/b/d;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    const/16 p2, 0x902

    invoke-virtual {p1, p2, p0}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/b/d;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    const/16 p2, 0x1001

    invoke-virtual {p1, p2, p0}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/b/d;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    const/16 p2, 0x1002

    invoke-virtual {p1, p2, p0}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/b/d;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    const/16 p2, 0x1003

    invoke-virtual {p1, p2, p0}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/b/d;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    const/16 p2, 0x1004

    invoke-virtual {p1, p2, p0}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    return-void
.end method

.method public final handleMessage(Landroid/os/Message;)V
    .locals 6

    const-string v0, "CarplayAppStateController"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "handleMessage: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p1, Landroid/os/Message;->what:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_a

    const/16 v2, 0x309

    const/4 v3, 0x0

    if-eq v0, v2, :cond_7

    const/16 v2, 0x716

    if-eq v0, v2, :cond_6

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_0

    packed-switch v0, :pswitch_data_1

    packed-switch v0, :pswitch_data_2

    const-string v0, "CarplayAppStateController"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "ignoring msg="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :pswitch_0
    const-string p1, "CarplayAppStateController"

    const-string v0, "nothing to do with backcar error"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput-boolean v3, p0, Lcom/autochips/carplay/b/d;->sg:Z

    return-void

    :pswitch_1
    iput-boolean v3, p0, Lcom/autochips/carplay/b/d;->sg:Z

    return-void

    :pswitch_2
    iget-boolean p1, p0, Lcom/autochips/carplay/b/d;->sf:Z

    if-eqz p1, :cond_1

    iget-boolean p1, p0, Lcom/autochips/carplay/b/d;->sg:Z

    if-eqz p1, :cond_1

    iput-boolean v3, p0, Lcom/autochips/carplay/b/d;->sg:Z

    const-string p1, "CarplayAppStateController"

    const-string v0, "BACKCAR_EVENT_STOP"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/autochips/carplay/b/d;->rY:Lcom/autochips/carplay/c/a;

    invoke-virtual {p1}, Lcom/autochips/carplay/c/a;->el()Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "CarplayAppStateController"

    const-string v0, "carkit call ongoing, ignore backcar stop event"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    iget p1, p0, Lcom/autochips/carplay/b/d;->sh:I

    if-lez p1, :cond_1

    iget p1, p0, Lcom/autochips/carplay/b/d;->sh:I

    sub-int/2addr p1, v1

    iput p1, p0, Lcom/autochips/carplay/b/d;->sh:I

    invoke-direct {p0, v3}, Lcom/autochips/carplay/b/d;->m(Z)V

    :cond_1
    iput-boolean v3, p0, Lcom/autochips/carplay/b/d;->sg:Z

    return-void

    :pswitch_3
    const-string p1, "CarplayAppStateController"

    const-string v0, "BACKCAR_EVENT_START"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-boolean p1, p0, Lcom/autochips/carplay/b/d;->sf:Z

    if-eqz p1, :cond_3

    iget-boolean p1, p0, Lcom/autochips/carplay/b/d;->sg:Z

    if-nez p1, :cond_3

    iput-boolean v1, p0, Lcom/autochips/carplay/b/d;->sg:Z

    iget-object p1, p0, Lcom/autochips/carplay/b/d;->rY:Lcom/autochips/carplay/c/a;

    invoke-virtual {p1}, Lcom/autochips/carplay/c/a;->el()Z

    move-result p1

    if-nez p1, :cond_2

    new-instance p1, Lcom/autochips/carplay/common/f;

    invoke-direct {p1}, Lcom/autochips/carplay/common/f;-><init>()V

    invoke-direct {p0, p1, v2}, Lcom/autochips/carplay/b/d;->a(Lcom/autochips/carplay/common/f;Lcom/autochips/carplay/CarplayDevice;)V

    invoke-direct {p0, p1, v1, v3}, Lcom/autochips/carplay/b/d;->a(Lcom/autochips/carplay/common/f;ZZ)Z

    iget p1, p0, Lcom/autochips/carplay/b/d;->sh:I

    add-int/2addr p1, v1

    iput p1, p0, Lcom/autochips/carplay/b/d;->sh:I

    return-void

    :cond_2
    const-string p1, "CarplayAppStateController"

    const-string v0, "carkit call ongoing, ignore backcar start event"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_3
    iput-boolean v1, p0, Lcom/autochips/carplay/b/d;->sg:Z

    return-void

    :pswitch_4
    const/16 v0, 0x901

    iget v2, p1, Landroid/os/Message;->what:I

    if-ne v0, v2, :cond_4

    iget p1, p1, Landroid/os/Message;->arg1:I

    const-string v0, "CarplayAppStateController"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v4, "scoState: "

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_4
    :pswitch_5
    new-instance p1, Lcom/autochips/carplay/common/f;

    invoke-direct {p1}, Lcom/autochips/carplay/common/f;-><init>()V

    iget-boolean v0, p0, Lcom/autochips/carplay/b/d;->sf:Z

    xor-int/2addr v0, v1

    invoke-direct {p0, p1, v0}, Lcom/autochips/carplay/b/d;->a(Lcom/autochips/carplay/common/f;Z)Z

    move-result v0

    iget-boolean v2, p0, Lcom/autochips/carplay/b/d;->sf:Z

    xor-int/2addr v2, v1

    invoke-direct {p0, p1, v2}, Lcom/autochips/carplay/b/d;->b(Lcom/autochips/carplay/common/f;Z)Z

    move-result v2

    if-nez v0, :cond_5

    if-eqz v2, :cond_c

    :cond_5
    iget-boolean v0, p0, Lcom/autochips/carplay/b/d;->sf:Z

    xor-int/2addr v0, v1

    invoke-direct {p0, p1, v0, v3}, Lcom/autochips/carplay/b/d;->a(Lcom/autochips/carplay/common/f;ZZ)Z

    return-void

    :pswitch_6
    iput-boolean v3, p0, Lcom/autochips/carplay/b/d;->sf:Z

    iput-object v2, p0, Lcom/autochips/carplay/b/d;->rZ:Lcom/autochips/carplay/common/f;

    iput-object v2, p0, Lcom/autochips/carplay/b/d;->sa:Lcom/autochips/carplay/common/g;

    iput-object v2, p0, Lcom/autochips/carplay/b/d;->sb:Lcom/autochips/carplay/common/g;

    iput v3, p0, Lcom/autochips/carplay/b/d;->sc:I

    iput-boolean v3, p0, Lcom/autochips/carplay/b/d;->sd:Z

    return-void

    :pswitch_7
    iput-boolean v1, p0, Lcom/autochips/carplay/b/d;->sf:Z

    return-void

    :cond_6
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/autochips/carplay/common/b;

    const-string v0, "CarplayAppStateController"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "mode state="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_7
    iget v0, p1, Landroid/os/Message;->arg1:I

    iget p1, p1, Landroid/os/Message;->arg2:I

    const-string v2, "CarplayAppStateController"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "profile:"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, ", connectState:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/16 v2, 0x10

    if-ne v2, v0, :cond_c

    if-nez p1, :cond_c

    new-instance p1, Lcom/autochips/carplay/common/f;

    invoke-direct {p1}, Lcom/autochips/carplay/common/f;-><init>()V

    iget-boolean v0, p0, Lcom/autochips/carplay/b/d;->sf:Z

    xor-int/2addr v0, v1

    invoke-direct {p0, p1, v0}, Lcom/autochips/carplay/b/d;->a(Lcom/autochips/carplay/common/f;Z)Z

    move-result v0

    iget-boolean v2, p0, Lcom/autochips/carplay/b/d;->sf:Z

    xor-int/2addr v2, v1

    invoke-direct {p0, p1, v2}, Lcom/autochips/carplay/b/d;->b(Lcom/autochips/carplay/common/f;Z)Z

    move-result v2

    if-nez v0, :cond_8

    if-eqz v2, :cond_9

    :cond_8
    iget-object v0, p0, Lcom/autochips/carplay/b/d;->rZ:Lcom/autochips/carplay/common/f;

    if-eqz v0, :cond_9

    iget-boolean v0, p0, Lcom/autochips/carplay/b/d;->sf:Z

    xor-int/2addr v0, v1

    invoke-direct {p0, p1, v0, v3}, Lcom/autochips/carplay/b/d;->a(Lcom/autochips/carplay/common/f;ZZ)Z

    :cond_9
    return-void

    :cond_a
    iget-boolean p1, p0, Lcom/autochips/carplay/b/d;->sg:Z

    if-nez p1, :cond_b

    iget p1, p0, Lcom/autochips/carplay/b/d;->sh:I

    if-lez p1, :cond_b

    iget p1, p0, Lcom/autochips/carplay/b/d;->sh:I

    sub-int/2addr p1, v1

    iput p1, p0, Lcom/autochips/carplay/b/d;->sh:I

    invoke-direct {p0, v1}, Lcom/autochips/carplay/b/d;->m(Z)V

    return-void

    :cond_b
    iget-boolean p1, p0, Lcom/autochips/carplay/b/d;->sg:Z

    if-eqz p1, :cond_c

    iget p1, p0, Lcom/autochips/carplay/b/d;->sh:I

    if-nez p1, :cond_c

    const-string p1, "CarplayAppStateController"

    const-string v0, "backcar ongoing, but call skip borrow screen, we may unborrow screen after backcar stop"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget p1, p0, Lcom/autochips/carplay/b/d;->sh:I

    add-int/2addr p1, v1

    iput p1, p0, Lcom/autochips/carplay/b/d;->sh:I

    :cond_c
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x70a
        :pswitch_7
        :pswitch_6
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x901
        :pswitch_4
        :pswitch_5
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x1001
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
