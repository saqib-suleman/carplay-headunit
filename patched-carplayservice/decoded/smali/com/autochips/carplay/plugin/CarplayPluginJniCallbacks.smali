.class public final Lcom/autochips/carplay/plugin/CarplayPluginJniCallbacks;
.super Ljava/lang/Object;


# static fields
.field private static final TAG:Ljava/lang/String; = "CarplayPluginJniCallbacks"


# instance fields
.field private mCarplayMonitor:Lcom/autochips/carplay/service/h;

.field private mRemoteDevices:Lcom/autochips/carplay/service/z;


# direct methods
.method public constructor <init>()V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Lcom/autochips/carplay/service/g;->dx()Lcom/autochips/carplay/service/g;

    move-result-object v0

    invoke-virtual {v0}, Lcom/autochips/carplay/service/g;->dz()Lcom/autochips/carplay/service/h;

    move-result-object v0

    iput-object v0, p0, Lcom/autochips/carplay/plugin/CarplayPluginJniCallbacks;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-static {}, Lcom/autochips/carplay/service/g;->dx()Lcom/autochips/carplay/service/g;

    move-result-object v0

    invoke-virtual {v0}, Lcom/autochips/carplay/service/g;->dA()Lcom/autochips/carplay/service/z;

    move-result-object v0

    iput-object v0, p0, Lcom/autochips/carplay/plugin/CarplayPluginJniCallbacks;->mRemoteDevices:Lcom/autochips/carplay/service/z;

    const-string v0, "CarplayPluginJniCallbacks"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "mCarplayMonitor: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/autochips/carplay/plugin/CarplayPluginJniCallbacks;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method


# virtual methods
.method public final cleanup()V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/autochips/carplay/plugin/CarplayPluginJniCallbacks;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    iput-object v0, p0, Lcom/autochips/carplay/plugin/CarplayPluginJniCallbacks;->mRemoteDevices:Lcom/autochips/carplay/service/z;

    return-void
.end method

.method public final clone()Ljava/lang/Object;
    .locals 1

    new-instance v0, Ljava/lang/CloneNotSupportedException;

    invoke-direct {v0}, Ljava/lang/CloneNotSupportedException;-><init>()V

    throw v0
.end method

.method final init()V
    .locals 0

    return-void
.end method

.method final onDuckAudio(DD)V
    .locals 3

    const-string v0, "CarplayPluginJniCallbacks"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "onDuckAudio, inDurationSecs: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string p1, ", inVolume"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3, p4}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/autochips/carplay/plugin/CarplayPluginJniCallbacks;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/autochips/carplay/plugin/CarplayPluginJniCallbacks;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    const/16 p2, 0x714

    invoke-static {p3, p4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p3

    invoke-virtual {p1, p2, p3}, Lcom/autochips/carplay/service/h;->sendMessage(ILjava/lang/Object;)V

    :cond_0
    return-void
.end method

.method final onModesChanged(IIIIII)V
    .locals 9

    const-string v0, "CarplayPluginJniCallbacks"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "onModesChanged, screenEntity:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", mainAudioEntity:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", speechEntity:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", SpeechMode:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", phoneCallEntity:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", trunByTurnEntity:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Lcom/autochips/carplay/common/b;

    move-object v2, v0

    move v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    move v7, p5

    move v8, p6

    invoke-direct/range {v2 .. v8}, Lcom/autochips/carplay/common/b;-><init>(IIIIII)V

    iget-object p1, p0, Lcom/autochips/carplay/plugin/CarplayPluginJniCallbacks;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/autochips/carplay/plugin/CarplayPluginJniCallbacks;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    const/16 p2, 0x716

    invoke-virtual {p1, p2, v0}, Lcom/autochips/carplay/service/h;->sendMessage(ILjava/lang/Object;)V

    :cond_0
    return-void
.end method

.method final onPluginInited(Z)V
    .locals 3

    const-string v0, "CarplayPluginJniCallbacks"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "onPluginInited, inited: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/plugin/CarplayPluginJniCallbacks;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    if-eqz v0, :cond_1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/autochips/carplay/plugin/CarplayPluginJniCallbacks;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    const/16 v0, 0x701

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/service/h;->sendMessage(I)V

    return-void

    :cond_0
    iget-object p1, p0, Lcom/autochips/carplay/plugin/CarplayPluginJniCallbacks;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    const/16 v0, 0x702

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/service/h;->sendMessage(I)V

    :cond_1
    return-void
.end method

.method final onRequestAccessoryUI(I)V
    .locals 3

    const-string v0, "CarplayPluginJniCallbacks"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "onRequestAccessoryUI: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/plugin/CarplayPluginJniCallbacks;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/autochips/carplay/plugin/CarplayPluginJniCallbacks;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    const/16 v1, 0x717

    invoke-virtual {v0, v1, p1}, Lcom/autochips/carplay/service/h;->sendMessage(II)V

    :cond_0
    return-void
.end method

.method final onSessionControl(ILjava/lang/String;)V
    .locals 3

    const-string v0, "CarplayPluginJniCallbacks"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "onSessionControl: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", deviceID: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/plugin/CarplayPluginJniCallbacks;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/autochips/carplay/plugin/CarplayPluginJniCallbacks;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    const/16 v1, 0x718

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2, p2}, Lcom/autochips/carplay/service/h;->sendMessage(IIILjava/lang/Object;)V

    :cond_0
    return-void
.end method

.method final onSessionCreated(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    const-string v0, "CarplayPluginJniCallbacks"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "onSessionCreated, deviceID:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ", clientMacAddr:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ", clientName:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/plugin/CarplayPluginJniCallbacks;->mRemoteDevices:Lcom/autochips/carplay/service/z;

    invoke-virtual {v0, p1}, Lcom/autochips/carplay/service/z;->H(Ljava/lang/String;)Lcom/autochips/carplay/CarplayDevice;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, "CarplayPluginJniCallbacks"

    const-string v1, "Added new device property"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/plugin/CarplayPluginJniCallbacks;->mRemoteDevices:Lcom/autochips/carplay/service/z;

    invoke-virtual {v0, p1}, Lcom/autochips/carplay/service/z;->I(Ljava/lang/String;)Lcom/autochips/carplay/service/aa;

    move-result-object v0

    iget-object v1, p0, Lcom/autochips/carplay/plugin/CarplayPluginJniCallbacks;->mRemoteDevices:Lcom/autochips/carplay/service/z;

    invoke-virtual {v1, p1}, Lcom/autochips/carplay/service/z;->H(Ljava/lang/String;)Lcom/autochips/carplay/CarplayDevice;

    move-result-object p1

    move-object v3, v0

    move-object v0, p1

    move-object p1, v3

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/autochips/carplay/plugin/CarplayPluginJniCallbacks;->mRemoteDevices:Lcom/autochips/carplay/service/z;

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/service/z;->b(Lcom/autochips/carplay/CarplayDevice;)Lcom/autochips/carplay/service/aa;

    move-result-object p1

    :goto_0
    invoke-virtual {p1, p3}, Lcom/autochips/carplay/service/aa;->setName(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Lcom/autochips/carplay/service/aa;->setAddress(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/autochips/carplay/plugin/CarplayPluginJniCallbacks;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/autochips/carplay/plugin/CarplayPluginJniCallbacks;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    const/16 p2, 0x70a

    invoke-virtual {p1, p2, v0}, Lcom/autochips/carplay/service/h;->sendMessage(ILjava/lang/Object;)V

    :cond_1
    return-void
.end method

.method final onSessionFailed(Ljava/lang/String;I)V
    .locals 3

    const-string v0, "CarplayPluginJniCallbacks"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "onSessionFailed, deviceID:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ", reason:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/plugin/CarplayPluginJniCallbacks;->mRemoteDevices:Lcom/autochips/carplay/service/z;

    invoke-virtual {v0, p1}, Lcom/autochips/carplay/service/z;->H(Ljava/lang/String;)Lcom/autochips/carplay/CarplayDevice;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/autochips/carplay/plugin/CarplayPluginJniCallbacks;->mRemoteDevices:Lcom/autochips/carplay/service/z;

    invoke-virtual {v1, p1}, Lcom/autochips/carplay/service/z;->J(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    new-instance v0, Lcom/autochips/carplay/CarplayDevice;

    invoke-direct {v0, p1}, Lcom/autochips/carplay/CarplayDevice;-><init>(Ljava/lang/String;)V

    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/autochips/carplay/plugin/CarplayPluginJniCallbacks;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/autochips/carplay/plugin/CarplayPluginJniCallbacks;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    const/16 v1, 0x70c

    const/4 v2, 0x0

    invoke-virtual {p1, v1, p2, v2, v0}, Lcom/autochips/carplay/service/h;->sendMessage(IIILjava/lang/Object;)V

    :cond_2
    return-void
.end method

.method final onSessionFinalized(Ljava/lang/String;)V
    .locals 3

    const-string v0, "CarplayPluginJniCallbacks"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "onSessionFinalized, deviceID:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/plugin/CarplayPluginJniCallbacks;->mRemoteDevices:Lcom/autochips/carplay/service/z;

    invoke-virtual {v0, p1}, Lcom/autochips/carplay/service/z;->H(Ljava/lang/String;)Lcom/autochips/carplay/CarplayDevice;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/autochips/carplay/plugin/CarplayPluginJniCallbacks;->mRemoteDevices:Lcom/autochips/carplay/service/z;

    invoke-virtual {v1, p1}, Lcom/autochips/carplay/service/z;->J(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/autochips/carplay/CarplayDevice;

    invoke-direct {v0, p1}, Lcom/autochips/carplay/CarplayDevice;-><init>(Ljava/lang/String;)V

    :goto_0
    iget-object p1, p0, Lcom/autochips/carplay/plugin/CarplayPluginJniCallbacks;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/autochips/carplay/plugin/CarplayPluginJniCallbacks;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    const/16 v1, 0x70b

    invoke-virtual {p1, v1, v0}, Lcom/autochips/carplay/service/h;->sendMessage(ILjava/lang/Object;)V

    :cond_1
    return-void
.end method

.method final onUnduckAudio(D)V
    .locals 3

    const-string v0, "CarplayPluginJniCallbacks"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "onUnduckAudio, inDurationSecs: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/plugin/CarplayPluginJniCallbacks;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/autochips/carplay/plugin/CarplayPluginJniCallbacks;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    const/16 v1, 0x715

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Lcom/autochips/carplay/service/h;->sendMessage(ILjava/lang/Object;)V

    :cond_0
    return-void
.end method
