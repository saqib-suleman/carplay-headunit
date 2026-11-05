.class final Lcom/autochips/carplay/a/b;
.super Lvendor/autochips/hardware/iap/V1_0/IIAPClient$Stub;


# instance fields
.field final synthetic rc:Lcom/autochips/carplay/a/a;


# direct methods
.method private constructor <init>(Lcom/autochips/carplay/a/a;)V
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/a/b;->rc:Lcom/autochips/carplay/a/a;

    invoke-direct {p0}, Lvendor/autochips/hardware/iap/V1_0/IIAPClient$Stub;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/autochips/carplay/a/a;B)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/autochips/carplay/a/b;-><init>(Lcom/autochips/carplay/a/a;)V

    return-void
.end method


# virtual methods
.method public final onCallStateUpdate(Lvendor/autochips/hardware/iap/V1_0/IAPDev;Lvendor/autochips/hardware/iap/V1_0/CallState;)V
    .locals 19

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    const-string v2, "IAPClient"

    const-string v3, "onCallStateUpdate"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v2, "IAPClient"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "remoteID:"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, v1, Lvendor/autochips/hardware/iap/V1_0/CallState;->remoteID:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v2, "IAPClient"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "displayName:"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, v1, Lvendor/autochips/hardware/iap/V1_0/CallState;->displayName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v2, "IAPClient"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "status:"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-byte v4, v1, Lvendor/autochips/hardware/iap/V1_0/CallState;->status:B

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v2, "IAPClient"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "direction:"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-byte v4, v1, Lvendor/autochips/hardware/iap/V1_0/CallState;->direction:B

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v2, "IAPClient"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "callUUID:"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, v1, Lvendor/autochips/hardware/iap/V1_0/CallState;->callUUID:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v2, "IAPClient"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "addrBookID:"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, v1, Lvendor/autochips/hardware/iap/V1_0/CallState;->addrBookID:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v2, "IAPClient"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "label:"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, v1, Lvendor/autochips/hardware/iap/V1_0/CallState;->label:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v2, "IAPClient"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "service:"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-byte v4, v1, Lvendor/autochips/hardware/iap/V1_0/CallState;->service:B

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v2, "IAPClient"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "isConferenced:"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-byte v4, v1, Lvendor/autochips/hardware/iap/V1_0/CallState;->isConferenced:B

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v2, "IAPClient"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "conferenceGroup:"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-byte v4, v1, Lvendor/autochips/hardware/iap/V1_0/CallState;->conferenceGroup:B

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v2, "IAPClient"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "disconnectReason:"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-byte v4, v1, Lvendor/autochips/hardware/iap/V1_0/CallState;->disconnectReason:B

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v2, "IAPClient"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "startTimeStamp:"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v4, v1, Lvendor/autochips/hardware/iap/V1_0/CallState;->startTimeStamp:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v2, Lcom/autochips/carplay/CarplayCall;

    iget-object v6, v1, Lvendor/autochips/hardware/iap/V1_0/CallState;->remoteID:Ljava/lang/String;

    iget-object v7, v1, Lvendor/autochips/hardware/iap/V1_0/CallState;->displayName:Ljava/lang/String;

    iget-byte v8, v1, Lvendor/autochips/hardware/iap/V1_0/CallState;->status:B

    iget-byte v9, v1, Lvendor/autochips/hardware/iap/V1_0/CallState;->direction:B

    iget-object v3, v1, Lvendor/autochips/hardware/iap/V1_0/CallState;->callUUID:Ljava/lang/String;

    invoke-static {v3}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v10

    iget-object v11, v1, Lvendor/autochips/hardware/iap/V1_0/CallState;->addrBookID:Ljava/lang/String;

    iget-object v12, v1, Lvendor/autochips/hardware/iap/V1_0/CallState;->label:Ljava/lang/String;

    iget-byte v13, v1, Lvendor/autochips/hardware/iap/V1_0/CallState;->service:B

    iget-byte v3, v1, Lvendor/autochips/hardware/iap/V1_0/CallState;->isConferenced:B

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    move v14, v4

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    move v14, v3

    :goto_0
    iget-byte v15, v1, Lvendor/autochips/hardware/iap/V1_0/CallState;->conferenceGroup:B

    iget-byte v3, v1, Lvendor/autochips/hardware/iap/V1_0/CallState;->disconnectReason:B

    iget-wide v4, v1, Lvendor/autochips/hardware/iap/V1_0/CallState;->startTimeStamp:J

    const/4 v1, 0x0

    move-wide/from16 v17, v4

    move-object v4, v2

    move-object v5, v1

    move/from16 v16, v3

    invoke-direct/range {v4 .. v18}, Lcom/autochips/carplay/CarplayCall;-><init>(Lcom/autochips/carplay/CarplayDevice;Ljava/lang/String;Ljava/lang/String;IILjava/util/UUID;Ljava/lang/String;Ljava/lang/String;IZIIJ)V

    const-string v1, "IAPClient"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "call:"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Lcom/autochips/carplay/CarplayCall;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, v0, Lcom/autochips/carplay/a/b;->rc:Lcom/autochips/carplay/a/a;

    const/16 v3, 0x532

    invoke-virtual {v1, v3}, Lcom/autochips/carplay/a/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    iput-object v2, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object v0, v0, Lcom/autochips/carplay/a/b;->rc:Lcom/autochips/carplay/a/a;

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/a/a;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method public final onConnectStatusChanged(Lvendor/autochips/hardware/iap/V1_0/IAPDev;I)V
    .locals 3

    const-string v0, "IAPClient"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "ConnectStatusChanged:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/a/b;->rc:Lcom/autochips/carplay/a/a;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/a/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    iput p2, v0, Landroid/os/Message;->arg1:I

    iget p2, p1, Lvendor/autochips/hardware/iap/V1_0/IAPDev;->transportType:I

    iput p2, v0, Landroid/os/Message;->arg2:I

    iget-object p1, p1, Lvendor/autochips/hardware/iap/V1_0/IAPDev;->id:Ljava/lang/String;

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p1, p0, Lcom/autochips/carplay/a/b;->rc:Lcom/autochips/carplay/a/a;

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/a/a;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method public final onDatabaseInfoChanged(Lvendor/autochips/hardware/iap/V1_0/IAPDev;Lvendor/autochips/hardware/iap/V1_0/DatabaseInfo;)V
    .locals 0

    return-void
.end method

.method public final onEapReady(Lvendor/autochips/hardware/iap/V1_0/IAPDev;Z)V
    .locals 0

    return-void
.end method

.method public final onLocationStart(Lvendor/autochips/hardware/iap/V1_0/IAPDev;Lvendor/autochips/hardware/iap/V1_0/LocationEvent;)V
    .locals 3

    const-string v0, "IAPClient"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "onLocationStart:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean v2, p2, Lvendor/autochips/hardware/iap/V1_0/LocationEvent;->start:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/a/b;->rc:Lcom/autochips/carplay/a/a;

    const/16 v1, 0xb

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/a/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    iget-boolean v1, p2, Lvendor/autochips/hardware/iap/V1_0/LocationEvent;->start:Z

    iput v1, v0, Landroid/os/Message;->arg1:I

    iget p2, p2, Lvendor/autochips/hardware/iap/V1_0/LocationEvent;->type:I

    iput p2, v0, Landroid/os/Message;->arg2:I

    iget-object p1, p1, Lvendor/autochips/hardware/iap/V1_0/IAPDev;->id:Ljava/lang/String;

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p1, p0, Lcom/autochips/carplay/a/b;->rc:Lcom/autochips/carplay/a/a;

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/a/a;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method public final onPlaybackStatusChanged(Lvendor/autochips/hardware/iap/V1_0/IAPDev;Lvendor/autochips/hardware/iap/V1_0/PlaybackStatus;)V
    .locals 0

    return-void
.end method

.method public final onSamplerateChanged(Lvendor/autochips/hardware/iap/V1_0/IAPDev;I)V
    .locals 0

    return-void
.end method
