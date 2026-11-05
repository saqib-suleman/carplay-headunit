.class final Lcom/autochips/carplay/av/b;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/autochips/carplay/av/f;


# instance fields
.field final synthetic qo:Lcom/autochips/carplay/av/a;


# direct methods
.method constructor <init>(Lcom/autochips/carplay/av/a;)V
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/av/b;->qo:Lcom/autochips/carplay/av/a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final T(I)V
    .locals 3

    const-string v0, "AudioStreamController"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "created, streamID:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/16 v0, 0x64

    if-eq p1, v0, :cond_2

    const/16 v0, 0x66

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/16 v0, 0x65

    if-ne p1, v0, :cond_1

    iget-object v0, p0, Lcom/autochips/carplay/av/b;->qo:Lcom/autochips/carplay/av/a;

    new-instance v1, Lcom/autochips/carplay/av/AudioStream;

    invoke-direct {v1, p1}, Lcom/autochips/carplay/av/AudioStream;-><init>(I)V

    invoke-static {v0, v1}, Lcom/autochips/carplay/av/a;->b(Lcom/autochips/carplay/av/a;Lcom/autochips/carplay/av/AudioStream;)Lcom/autochips/carplay/av/AudioStream;

    return-void

    :cond_1
    const-string p1, "AudioStreamController"

    const-string v0, "unknown stream id"

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/autochips/carplay/av/b;->qo:Lcom/autochips/carplay/av/a;

    new-instance v1, Lcom/autochips/carplay/av/AudioStream;

    invoke-direct {v1, p1}, Lcom/autochips/carplay/av/AudioStream;-><init>(I)V

    invoke-static {v0, v1}, Lcom/autochips/carplay/av/a;->a(Lcom/autochips/carplay/av/a;Lcom/autochips/carplay/av/AudioStream;)Lcom/autochips/carplay/av/AudioStream;

    return-void
.end method

.method public final U(I)V
    .locals 3

    const-string v0, "AudioStreamController"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "destroyed, streamID:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    const/16 v1, 0x64

    if-eq p1, v1, :cond_2

    const/16 v1, 0x66

    if-ne p1, v1, :cond_0

    goto :goto_0

    :cond_0
    const/16 v1, 0x65

    if-ne p1, v1, :cond_1

    iget-object p1, p0, Lcom/autochips/carplay/av/b;->qo:Lcom/autochips/carplay/av/a;

    invoke-static {p1}, Lcom/autochips/carplay/av/a;->b(Lcom/autochips/carplay/av/a;)Lcom/autochips/carplay/av/AudioStream;

    move-result-object p1

    invoke-virtual {p1}, Lcom/autochips/carplay/av/AudioStream;->release()V

    iget-object p1, p0, Lcom/autochips/carplay/av/b;->qo:Lcom/autochips/carplay/av/a;

    invoke-static {p1, v0}, Lcom/autochips/carplay/av/a;->b(Lcom/autochips/carplay/av/a;Lcom/autochips/carplay/av/AudioStream;)Lcom/autochips/carplay/av/AudioStream;

    return-void

    :cond_1
    const-string p1, "AudioStreamController"

    const-string v0, "unknown stream id"

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/autochips/carplay/av/b;->qo:Lcom/autochips/carplay/av/a;

    invoke-static {p1}, Lcom/autochips/carplay/av/a;->a(Lcom/autochips/carplay/av/a;)Lcom/autochips/carplay/av/AudioStream;

    move-result-object p1

    invoke-virtual {p1}, Lcom/autochips/carplay/av/AudioStream;->release()V

    iget-object p1, p0, Lcom/autochips/carplay/av/b;->qo:Lcom/autochips/carplay/av/a;

    invoke-static {p1, v0}, Lcom/autochips/carplay/av/a;->a(Lcom/autochips/carplay/av/a;Lcom/autochips/carplay/av/AudioStream;)Lcom/autochips/carplay/av/AudioStream;

    return-void
.end method
