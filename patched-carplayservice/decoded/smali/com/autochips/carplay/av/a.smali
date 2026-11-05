.class public Lcom/autochips/carplay/av/a;
.super Ljava/lang/Object;


# instance fields
.field private qk:Lcom/autochips/carplay/av/AudioStream;

.field private ql:Lcom/autochips/carplay/av/AudioStream;

.field private qm:Lcom/autochips/carplay/av/StreamController;

.field private qn:Lcom/autochips/carplay/av/f;


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/autochips/carplay/av/b;

    invoke-direct {v0, p0}, Lcom/autochips/carplay/av/b;-><init>(Lcom/autochips/carplay/av/a;)V

    iput-object v0, p0, Lcom/autochips/carplay/av/a;->qn:Lcom/autochips/carplay/av/f;

    new-instance v0, Lcom/autochips/carplay/av/StreamController;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/autochips/carplay/av/StreamController;-><init>(I)V

    iput-object v0, p0, Lcom/autochips/carplay/av/a;->qm:Lcom/autochips/carplay/av/StreamController;

    iget-object v0, p0, Lcom/autochips/carplay/av/a;->qm:Lcom/autochips/carplay/av/StreamController;

    iget-object v1, p0, Lcom/autochips/carplay/av/a;->qn:Lcom/autochips/carplay/av/f;

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/av/StreamController;->setStreamAction(Lcom/autochips/carplay/av/f;)V

    return-void
.end method

.method private R(I)Lcom/autochips/carplay/av/AudioStream;
    .locals 0

    packed-switch p1, :pswitch_data_0

    const/4 p1, 0x0

    return-object p1

    :pswitch_0
    iget-object p1, p0, Lcom/autochips/carplay/av/a;->ql:Lcom/autochips/carplay/av/AudioStream;

    return-object p1

    :pswitch_1
    iget-object p1, p0, Lcom/autochips/carplay/av/a;->qk:Lcom/autochips/carplay/av/AudioStream;

    return-object p1

    nop

    :pswitch_data_0
    .packed-switch 0x64
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method static synthetic a(Lcom/autochips/carplay/av/a;)Lcom/autochips/carplay/av/AudioStream;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/av/a;->qk:Lcom/autochips/carplay/av/AudioStream;

    return-object p0
.end method

.method static synthetic a(Lcom/autochips/carplay/av/a;Lcom/autochips/carplay/av/AudioStream;)Lcom/autochips/carplay/av/AudioStream;
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/av/a;->qk:Lcom/autochips/carplay/av/AudioStream;

    return-object p1
.end method

.method static synthetic b(Lcom/autochips/carplay/av/a;)Lcom/autochips/carplay/av/AudioStream;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/av/a;->ql:Lcom/autochips/carplay/av/AudioStream;

    return-object p0
.end method

.method static synthetic b(Lcom/autochips/carplay/av/a;Lcom/autochips/carplay/av/AudioStream;)Lcom/autochips/carplay/av/AudioStream;
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/av/a;->ql:Lcom/autochips/carplay/av/AudioStream;

    return-object p1
.end method


# virtual methods
.method public final S(I)I
    .locals 0

    invoke-direct {p0, p1}, Lcom/autochips/carplay/av/a;->R(I)Lcom/autochips/carplay/av/AudioStream;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/autochips/carplay/av/AudioStream;->stop()I

    move-result p1

    return p1

    :cond_0
    const/4 p1, -0x2

    return p1
.end method

.method public final b(FF)I
    .locals 1

    const/16 v0, 0x64

    invoke-direct {p0, v0}, Lcom/autochips/carplay/av/a;->R(I)Lcom/autochips/carplay/av/AudioStream;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1, p2}, Lcom/autochips/carplay/av/AudioStream;->setVolume(FF)I

    move-result p1

    return p1

    :cond_0
    const/4 p1, -0x2

    return p1
.end method

.method public final setOnStreamListener(Lcom/autochips/carplay/av/e;)V
    .locals 1

    iget-object v0, p0, Lcom/autochips/carplay/av/a;->qm:Lcom/autochips/carplay/av/StreamController;

    invoke-virtual {v0, p1}, Lcom/autochips/carplay/av/StreamController;->setOnStreamListener(Lcom/autochips/carplay/av/e;)V

    return-void
.end method

.method public final start(I)I
    .locals 0

    invoke-direct {p0, p1}, Lcom/autochips/carplay/av/a;->R(I)Lcom/autochips/carplay/av/AudioStream;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/autochips/carplay/av/AudioStream;->start()I

    move-result p1

    return p1

    :cond_0
    const/4 p1, -0x2

    return p1
.end method
