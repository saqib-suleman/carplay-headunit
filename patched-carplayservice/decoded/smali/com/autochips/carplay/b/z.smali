.class public interface abstract Lcom/autochips/carplay/b/z;
.super Ljava/lang/Object;


# virtual methods
.method public a(Landroid/os/Message;)V
    .locals 3

    const-string v0, "ResourceManager"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "sendRequest: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/autochips/carplay/service/g;->dx()Lcom/autochips/carplay/service/g;

    move-result-object v0

    invoke-virtual {v0}, Lcom/autochips/carplay/service/g;->dC()Lcom/autochips/carplay/service/p;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/autochips/carplay/service/g;->dx()Lcom/autochips/carplay/service/g;

    move-result-object v0

    invoke-virtual {v0}, Lcom/autochips/carplay/service/g;->dC()Lcom/autochips/carplay/service/p;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/autochips/carplay/service/p;->sendMessage(Landroid/os/Message;)V

    :cond_0
    return-void
.end method

.method public b(IILandroid/os/Parcel;)V
    .locals 3

    const-string v0, "ResourceManager"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "sendAudioInfo, streamId:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", audioType:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/autochips/carplay/service/g;->dx()Lcom/autochips/carplay/service/g;

    move-result-object v0

    invoke-virtual {v0}, Lcom/autochips/carplay/service/g;->dy()Lcom/autochips/carplay/service/CarplayService;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/autochips/carplay/service/g;->dx()Lcom/autochips/carplay/service/g;

    move-result-object v0

    invoke-virtual {v0}, Lcom/autochips/carplay/service/g;->dy()Lcom/autochips/carplay/service/CarplayService;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lcom/autochips/carplay/service/CarplayService;->c(IILandroid/os/Parcel;)V

    :cond_0
    return-void
.end method

.method public do()Lcom/autochips/carplay/common/b;
    .locals 2

    const-string v0, "ResourceManager"

    const-string v1, "getCurrentModeState"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/autochips/carplay/service/g;->dx()Lcom/autochips/carplay/service/g;

    move-result-object v0

    invoke-virtual {v0}, Lcom/autochips/carplay/service/g;->dC()Lcom/autochips/carplay/service/p;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/autochips/carplay/service/g;->dx()Lcom/autochips/carplay/service/g;

    move-result-object v0

    invoke-virtual {v0}, Lcom/autochips/carplay/service/g;->dC()Lcom/autochips/carplay/service/p;

    move-result-object v0

    invoke-virtual {v0}, Lcom/autochips/carplay/service/p;->ee()Lcom/autochips/carplay/common/b;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public f(III)V
    .locals 3

    const-string v0, "ResourceManager"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "sendStreamStateChanged, streamId:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", audioType:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", streamState:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/autochips/carplay/service/g;->dx()Lcom/autochips/carplay/service/g;

    move-result-object v0

    invoke-virtual {v0}, Lcom/autochips/carplay/service/g;->dy()Lcom/autochips/carplay/service/CarplayService;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/autochips/carplay/service/g;->dx()Lcom/autochips/carplay/service/g;

    move-result-object v0

    invoke-virtual {v0}, Lcom/autochips/carplay/service/g;->dy()Lcom/autochips/carplay/service/CarplayService;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lcom/autochips/carplay/service/CarplayService;->g(III)V

    :cond_0
    return-void
.end method
