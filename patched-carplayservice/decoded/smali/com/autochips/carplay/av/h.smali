.class final Lcom/autochips/carplay/av/h;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/autochips/carplay/av/f;


# instance fields
.field final synthetic qs:Lcom/autochips/carplay/av/g;


# direct methods
.method constructor <init>(Lcom/autochips/carplay/av/g;)V
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/av/h;->qs:Lcom/autochips/carplay/av/g;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final T(I)V
    .locals 3

    const-string v0, "VidoeStreamController"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "created, streamID:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/16 v0, 0x6e

    if-ne p1, v0, :cond_0

    iget-object p1, p0, Lcom/autochips/carplay/av/h;->qs:Lcom/autochips/carplay/av/g;

    new-instance v0, Lcom/autochips/carplay/av/VideoStream;

    invoke-direct {v0}, Lcom/autochips/carplay/av/VideoStream;-><init>()V

    invoke-static {p1, v0}, Lcom/autochips/carplay/av/g;->a(Lcom/autochips/carplay/av/g;Lcom/autochips/carplay/av/VideoStream;)Lcom/autochips/carplay/av/VideoStream;

    :cond_0
    return-void
.end method

.method public final U(I)V
    .locals 3

    const-string v0, "VidoeStreamController"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "destroyed, streamID:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", mVideoStream:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/autochips/carplay/av/h;->qs:Lcom/autochips/carplay/av/g;

    invoke-static {v2}, Lcom/autochips/carplay/av/g;->a(Lcom/autochips/carplay/av/g;)Lcom/autochips/carplay/av/VideoStream;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/16 v0, 0x6e

    if-ne p1, v0, :cond_0

    iget-object p1, p0, Lcom/autochips/carplay/av/h;->qs:Lcom/autochips/carplay/av/g;

    invoke-static {p1}, Lcom/autochips/carplay/av/g;->a(Lcom/autochips/carplay/av/g;)Lcom/autochips/carplay/av/VideoStream;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/autochips/carplay/av/h;->qs:Lcom/autochips/carplay/av/g;

    invoke-static {p1}, Lcom/autochips/carplay/av/g;->a(Lcom/autochips/carplay/av/g;)Lcom/autochips/carplay/av/VideoStream;

    move-result-object p1

    invoke-virtual {p1}, Lcom/autochips/carplay/av/VideoStream;->release()V

    iget-object p1, p0, Lcom/autochips/carplay/av/h;->qs:Lcom/autochips/carplay/av/g;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/autochips/carplay/av/g;->a(Lcom/autochips/carplay/av/g;Lcom/autochips/carplay/av/VideoStream;)Lcom/autochips/carplay/av/VideoStream;

    :cond_0
    return-void
.end method
