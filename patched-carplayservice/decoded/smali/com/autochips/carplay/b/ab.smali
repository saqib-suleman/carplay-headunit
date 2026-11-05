.class public final Lcom/autochips/carplay/b/ab;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/autochips/carplay/av/e;


# instance fields
.field final synthetic sT:Lcom/autochips/carplay/b/aa;


# direct methods
.method public constructor <init>(Lcom/autochips/carplay/b/aa;)V
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/b/ab;->sT:Lcom/autochips/carplay/b/aa;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(IILandroid/os/Parcel;)V
    .locals 0

    return-void
.end method

.method public final h(II)V
    .locals 3

    invoke-static {p1}, Lcom/autochips/carplay/b/aa;->ac(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "ScreenManager"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "onCreated, streamID: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", audioType: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/b/ab;->sT:Lcom/autochips/carplay/b/aa;

    iget-object v0, v0, Lcom/autochips/carplay/b/aa;->sQ:Lcom/autochips/carplay/b/ac;

    const/16 v1, 0xa

    invoke-virtual {v0, v1, p1}, Lcom/autochips/carplay/b/ac;->sendMessage(II)V

    iget-object v0, p0, Lcom/autochips/carplay/b/ab;->sT:Lcom/autochips/carplay/b/aa;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, p2, v1}, Lcom/autochips/carplay/b/aa;->f(III)V

    :cond_0
    return-void
.end method

.method public final i(II)V
    .locals 3

    invoke-static {p1}, Lcom/autochips/carplay/b/aa;->ac(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "ScreenManager"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "onDestroyed, streamID: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", audioType: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/b/ab;->sT:Lcom/autochips/carplay/b/aa;

    iget-object v0, v0, Lcom/autochips/carplay/b/aa;->sQ:Lcom/autochips/carplay/b/ac;

    const/16 v1, 0xb

    invoke-virtual {v0, v1, p1}, Lcom/autochips/carplay/b/ac;->sendMessage(II)V

    iget-object v0, p0, Lcom/autochips/carplay/b/ab;->sT:Lcom/autochips/carplay/b/aa;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, p2, v1}, Lcom/autochips/carplay/b/aa;->f(III)V

    :cond_0
    return-void
.end method

.method public final onError(II)V
    .locals 3

    invoke-static {p1}, Lcom/autochips/carplay/b/aa;->ac(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "ScreenManager"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "video err "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x1

    if-ne p2, v0, :cond_0

    iget-object p2, p0, Lcom/autochips/carplay/b/ab;->sT:Lcom/autochips/carplay/b/aa;

    iget-object p2, p2, Lcom/autochips/carplay/b/aa;->sQ:Lcom/autochips/carplay/b/ac;

    const/16 v0, 0x10

    invoke-virtual {p2, v0, p1}, Lcom/autochips/carplay/b/ac;->sendMessage(II)V

    :cond_0
    return-void
.end method
