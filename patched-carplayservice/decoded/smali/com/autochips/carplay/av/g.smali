.class public Lcom/autochips/carplay/av/g;
.super Ljava/lang/Object;


# instance fields
.field private qm:Lcom/autochips/carplay/av/StreamController;

.field private qn:Lcom/autochips/carplay/av/f;

.field private qr:Lcom/autochips/carplay/av/VideoStream;


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/autochips/carplay/av/h;

    invoke-direct {v0, p0}, Lcom/autochips/carplay/av/h;-><init>(Lcom/autochips/carplay/av/g;)V

    iput-object v0, p0, Lcom/autochips/carplay/av/g;->qn:Lcom/autochips/carplay/av/f;

    new-instance v0, Lcom/autochips/carplay/av/StreamController;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/autochips/carplay/av/StreamController;-><init>(I)V

    iput-object v0, p0, Lcom/autochips/carplay/av/g;->qm:Lcom/autochips/carplay/av/StreamController;

    iget-object v0, p0, Lcom/autochips/carplay/av/g;->qm:Lcom/autochips/carplay/av/StreamController;

    iget-object v1, p0, Lcom/autochips/carplay/av/g;->qn:Lcom/autochips/carplay/av/f;

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/av/StreamController;->setStreamAction(Lcom/autochips/carplay/av/f;)V

    return-void
.end method

.method static synthetic a(Lcom/autochips/carplay/av/g;)Lcom/autochips/carplay/av/VideoStream;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/av/g;->qr:Lcom/autochips/carplay/av/VideoStream;

    return-object p0
.end method

.method static synthetic a(Lcom/autochips/carplay/av/g;Lcom/autochips/carplay/av/VideoStream;)Lcom/autochips/carplay/av/VideoStream;
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/av/g;->qr:Lcom/autochips/carplay/av/VideoStream;

    return-object p1
.end method


# virtual methods
.method public final cQ()I
    .locals 1

    iget-object v0, p0, Lcom/autochips/carplay/av/g;->qr:Lcom/autochips/carplay/av/VideoStream;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/autochips/carplay/av/g;->qr:Lcom/autochips/carplay/av/VideoStream;

    invoke-virtual {v0}, Lcom/autochips/carplay/av/VideoStream;->start()I

    move-result v0

    return v0

    :cond_0
    const/4 v0, -0x2

    return v0
.end method

.method public final cR()I
    .locals 1

    iget-object v0, p0, Lcom/autochips/carplay/av/g;->qr:Lcom/autochips/carplay/av/VideoStream;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/autochips/carplay/av/g;->qr:Lcom/autochips/carplay/av/VideoStream;

    invoke-virtual {v0}, Lcom/autochips/carplay/av/VideoStream;->stop()I

    move-result v0

    return v0

    :cond_0
    const/4 v0, -0x2

    return v0
.end method

.method public final setOnStreamListener(Lcom/autochips/carplay/av/e;)V
    .locals 1

    iget-object v0, p0, Lcom/autochips/carplay/av/g;->qm:Lcom/autochips/carplay/av/StreamController;

    invoke-virtual {v0, p1}, Lcom/autochips/carplay/av/StreamController;->setOnStreamListener(Lcom/autochips/carplay/av/e;)V

    return-void
.end method

.method public final setSurface(Landroid/view/Surface;)I
    .locals 1

    iget-object v0, p0, Lcom/autochips/carplay/av/g;->qr:Lcom/autochips/carplay/av/VideoStream;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/autochips/carplay/av/g;->qr:Lcom/autochips/carplay/av/VideoStream;

    invoke-virtual {v0, p1}, Lcom/autochips/carplay/av/VideoStream;->setSurface(Landroid/view/Surface;)I

    move-result p1

    return p1

    :cond_0
    const/4 p1, -0x2

    return p1
.end method
