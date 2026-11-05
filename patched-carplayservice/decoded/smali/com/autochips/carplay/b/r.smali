.class public final Lcom/autochips/carplay/b/r;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/autochips/carplay/av/e;


# instance fields
.field final synthetic sC:Lcom/autochips/carplay/b/m;


# direct methods
.method public constructor <init>(Lcom/autochips/carplay/b/m;)V
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/b/r;->sC:Lcom/autochips/carplay/b/m;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(IILandroid/os/Parcel;)V
    .locals 1

    invoke-static {p1, p2}, Lcom/autochips/carplay/b/m;->k(II)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p1, p2}, Lcom/autochips/carplay/b/m;->l(II)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/autochips/carplay/b/r;->sC:Lcom/autochips/carplay/b/m;

    invoke-virtual {v0, p1, p2, p3}, Lcom/autochips/carplay/b/m;->b(IILandroid/os/Parcel;)V

    :cond_2
    return-void
.end method

.method public final h(II)V
    .locals 4

    invoke-static {p1, p2}, Lcom/autochips/carplay/b/m;->k(II)Z

    move-result v0

    const/4 v1, 0x1

    const/16 v2, 0xa

    const/4 v3, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/autochips/carplay/b/r;->sC:Lcom/autochips/carplay/b/m;

    iget-object v0, v0, Lcom/autochips/carplay/b/m;->sw:Lcom/autochips/carplay/b/s;

    invoke-virtual {v0, v2, p1, p2}, Lcom/autochips/carplay/b/s;->sendMessage(III)V

    goto :goto_0

    :cond_0
    invoke-static {p1, p2}, Lcom/autochips/carplay/b/m;->l(II)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/autochips/carplay/b/r;->sC:Lcom/autochips/carplay/b/m;

    iget-object v0, v0, Lcom/autochips/carplay/b/m;->sx:Lcom/autochips/carplay/b/o;

    invoke-virtual {v0, v2, p1, p2}, Lcom/autochips/carplay/b/o;->sendMessage(III)V

    goto :goto_0

    :cond_1
    move v1, v3

    :goto_0
    if-eqz v1, :cond_2

    const-string v0, "OutputAudioManager"

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

    iget-object v0, p0, Lcom/autochips/carplay/b/r;->sC:Lcom/autochips/carplay/b/m;

    invoke-virtual {v0, p1, p2, v3}, Lcom/autochips/carplay/b/m;->f(III)V

    :cond_2
    return-void
.end method

.method public final i(II)V
    .locals 4

    invoke-static {p1, p2}, Lcom/autochips/carplay/b/m;->k(II)Z

    move-result v0

    const/16 v1, 0xb

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/autochips/carplay/b/r;->sC:Lcom/autochips/carplay/b/m;

    iget-object v0, v0, Lcom/autochips/carplay/b/m;->sw:Lcom/autochips/carplay/b/s;

    invoke-virtual {v0, v1, p1, p2}, Lcom/autochips/carplay/b/s;->sendMessage(III)V

    :goto_0
    move v0, v2

    goto :goto_1

    :cond_0
    invoke-static {p1, p2}, Lcom/autochips/carplay/b/m;->l(II)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/autochips/carplay/b/r;->sC:Lcom/autochips/carplay/b/m;

    iget-object v0, v0, Lcom/autochips/carplay/b/m;->sx:Lcom/autochips/carplay/b/o;

    invoke-virtual {v0, v1, p1, p2}, Lcom/autochips/carplay/b/o;->sendMessage(III)V

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_1
    if-eqz v0, :cond_2

    const-string v0, "OutputAudioManager"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "onDestroyed, streamID: "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, ", audioType: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/b/r;->sC:Lcom/autochips/carplay/b/m;

    invoke-virtual {v0, p1, p2, v2}, Lcom/autochips/carplay/b/m;->f(III)V

    :cond_2
    return-void
.end method

.method public final onError(II)V
    .locals 0

    return-void
.end method
