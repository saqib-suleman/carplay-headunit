.class public final Lcom/autochips/carplay/b/f;
.super Lcom/autochips/carplay/av/a;

# interfaces
.implements Lcom/autochips/carplay/b/z;


# static fields
.field static sk:Lcom/autochips/carplay/b/f;


# instance fields
.field private mAudioManager:Landroid/media/AudioManager;

.field private mCarplayMonitor:Lcom/autochips/carplay/service/h;

.field private final mContext:Landroid/content/Context;

.field private rY:Lcom/autochips/carplay/c/a;

.field final sl:Lcom/autochips/carplay/b/h;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/os/Looper;)V
    .locals 1

    invoke-direct {p0}, Lcom/autochips/carplay/av/a;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/autochips/carplay/b/f;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    iput-object v0, p0, Lcom/autochips/carplay/b/f;->rY:Lcom/autochips/carplay/c/a;

    iput-object p1, p0, Lcom/autochips/carplay/b/f;->mContext:Landroid/content/Context;

    iget-object p1, p0, Lcom/autochips/carplay/b/f;->mContext:Landroid/content/Context;

    const-string v0, "audio"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/media/AudioManager;

    iput-object p1, p0, Lcom/autochips/carplay/b/f;->mAudioManager:Landroid/media/AudioManager;

    new-instance p1, Lcom/autochips/carplay/b/g;

    invoke-direct {p1, p0}, Lcom/autochips/carplay/b/g;-><init>(Lcom/autochips/carplay/b/f;)V

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/b/f;->setOnStreamListener(Lcom/autochips/carplay/av/e;)V

    new-instance p1, Lcom/autochips/carplay/b/h;

    invoke-direct {p1, p0, p2}, Lcom/autochips/carplay/b/h;-><init>(Lcom/autochips/carplay/b/f;Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/autochips/carplay/b/f;->sl:Lcom/autochips/carplay/b/h;

    return-void
.end method

.method static synthetic a(Lcom/autochips/carplay/b/f;)Landroid/media/AudioManager;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/b/f;->mAudioManager:Landroid/media/AudioManager;

    return-object p0
.end method

.method static synthetic b(Lcom/autochips/carplay/b/f;)Lcom/autochips/carplay/c/a;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/b/f;->rY:Lcom/autochips/carplay/c/a;

    return-object p0
.end method

.method static synthetic j(II)Z
    .locals 3

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/16 v2, 0x64

    if-ne v2, p0, :cond_0

    move p0, v0

    goto :goto_0

    :cond_0
    move p0, v1

    :goto_0
    if-nez p0, :cond_1

    return v1

    :cond_1
    packed-switch p1, :pswitch_data_0

    move v0, v1

    :pswitch_0
    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x4
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public final W(I)V
    .locals 1

    if-eqz p1, :cond_1

    const/4 v0, 0x2

    if-eq p1, v0, :cond_0

    return-void

    :cond_0
    iget-object p1, p0, Lcom/autochips/carplay/b/f;->sl:Lcom/autochips/carplay/b/h;

    const/16 v0, 0xe

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/b/h;->sendMessage(I)V

    return-void

    :cond_1
    iget-object p1, p0, Lcom/autochips/carplay/b/f;->sl:Lcom/autochips/carplay/b/h;

    const/16 v0, 0xf

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/b/h;->sendMessage(I)V

    return-void
.end method

.method public final a(Lcom/autochips/carplay/service/h;Lcom/autochips/carplay/c/a;)V
    .locals 1

    iput-object p1, p0, Lcom/autochips/carplay/b/f;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    iput-object p2, p0, Lcom/autochips/carplay/b/f;->rY:Lcom/autochips/carplay/c/a;

    iget-object p1, p0, Lcom/autochips/carplay/b/f;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/autochips/carplay/b/f;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    const/16 p2, 0x901

    iget-object v0, p0, Lcom/autochips/carplay/b/f;->sl:Lcom/autochips/carplay/b/h;

    invoke-virtual {v0}, Lcom/autochips/carplay/b/h;->getHandler()Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/b/f;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    const/16 p2, 0x902

    iget-object v0, p0, Lcom/autochips/carplay/b/f;->sl:Lcom/autochips/carplay/b/h;

    invoke-virtual {v0}, Lcom/autochips/carplay/b/h;->getHandler()Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    :cond_0
    return-void
.end method
