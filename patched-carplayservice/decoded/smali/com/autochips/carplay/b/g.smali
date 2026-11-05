.class public final Lcom/autochips/carplay/b/g;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/autochips/carplay/av/e;


# instance fields
.field final synthetic sm:Lcom/autochips/carplay/b/f;


# direct methods
.method public constructor <init>(Lcom/autochips/carplay/b/f;)V
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/b/g;->sm:Lcom/autochips/carplay/b/f;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(IILandroid/os/Parcel;)V
    .locals 1

    invoke-static {p1, p2}, Lcom/autochips/carplay/b/f;->j(II)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/autochips/carplay/b/g;->sm:Lcom/autochips/carplay/b/f;

    invoke-virtual {v0, p1, p2, p3}, Lcom/autochips/carplay/b/f;->b(IILandroid/os/Parcel;)V

    :cond_0
    return-void
.end method

.method public final h(II)V
    .locals 3

    invoke-static {p1, p2}, Lcom/autochips/carplay/b/f;->j(II)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "FullDuplexAudioManager"

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

    iget-object v0, p0, Lcom/autochips/carplay/b/g;->sm:Lcom/autochips/carplay/b/f;

    iget-object v0, v0, Lcom/autochips/carplay/b/f;->sl:Lcom/autochips/carplay/b/h;

    const/16 v1, 0xa

    invoke-virtual {v0, v1, p1, p2}, Lcom/autochips/carplay/b/h;->sendMessage(III)V

    iget-object v0, p0, Lcom/autochips/carplay/b/g;->sm:Lcom/autochips/carplay/b/f;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, p2, v1}, Lcom/autochips/carplay/b/f;->f(III)V

    :cond_0
    return-void
.end method

.method public final i(II)V
    .locals 3

    invoke-static {p1, p2}, Lcom/autochips/carplay/b/f;->j(II)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "FullDuplexAudioManager"

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

    iget-object v0, p0, Lcom/autochips/carplay/b/g;->sm:Lcom/autochips/carplay/b/f;

    iget-object v0, v0, Lcom/autochips/carplay/b/f;->sl:Lcom/autochips/carplay/b/h;

    const/16 v1, 0xb

    invoke-virtual {v0, v1, p1, p2}, Lcom/autochips/carplay/b/h;->sendMessage(III)V

    iget-object v0, p0, Lcom/autochips/carplay/b/g;->sm:Lcom/autochips/carplay/b/f;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, p2, v1}, Lcom/autochips/carplay/b/f;->f(III)V

    :cond_0
    return-void
.end method

.method public final onError(II)V
    .locals 0

    return-void
.end method
