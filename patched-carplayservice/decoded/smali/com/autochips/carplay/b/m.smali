.class public final Lcom/autochips/carplay/b/m;
.super Lcom/autochips/carplay/av/a;

# interfaces
.implements Lcom/autochips/carplay/b/z;


# static fields
.field private static final sA:Z

.field static sj:Lcom/autochips/carplay/b/m;


# instance fields
.field private mAudioManager:Landroid/media/AudioManager;

.field private mCarplayMonitor:Lcom/autochips/carplay/service/h;

.field private final mContext:Landroid/content/Context;

.field private final mLock:Ljava/lang/Object;

.field private rY:Lcom/autochips/carplay/c/a;

.field private sB:Landroid/media/AudioManager$OnAudioFocusChangeListener;

.field final sw:Lcom/autochips/carplay/b/s;

.field final sx:Lcom/autochips/carplay/b/o;

.field private sy:I

.field private sz:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const-string v0, "ro.atc.carplay.audio_enable_ctl"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    const/4 v2, 0x1

    if-ne v2, v0, :cond_0

    move v1, v2

    :cond_0
    sput-boolean v1, Lcom/autochips/carplay/b/m;->sA:Z

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;Landroid/os/Looper;)V
    .locals 1

    invoke-direct {p0}, Lcom/autochips/carplay/av/a;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/autochips/carplay/b/m;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    iput-object v0, p0, Lcom/autochips/carplay/b/m;->rY:Lcom/autochips/carplay/c/a;

    const/4 v0, 0x0

    iput v0, p0, Lcom/autochips/carplay/b/m;->sy:I

    iput-boolean v0, p0, Lcom/autochips/carplay/b/m;->sz:Z

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/autochips/carplay/b/m;->mLock:Ljava/lang/Object;

    new-instance v0, Lcom/autochips/carplay/b/n;

    invoke-direct {v0, p0}, Lcom/autochips/carplay/b/n;-><init>(Lcom/autochips/carplay/b/m;)V

    iput-object v0, p0, Lcom/autochips/carplay/b/m;->sB:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    iput-object p1, p0, Lcom/autochips/carplay/b/m;->mContext:Landroid/content/Context;

    iget-object p1, p0, Lcom/autochips/carplay/b/m;->mContext:Landroid/content/Context;

    const-string v0, "audio"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/media/AudioManager;

    iput-object p1, p0, Lcom/autochips/carplay/b/m;->mAudioManager:Landroid/media/AudioManager;

    new-instance p1, Lcom/autochips/carplay/b/r;

    invoke-direct {p1, p0}, Lcom/autochips/carplay/b/r;-><init>(Lcom/autochips/carplay/b/m;)V

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/b/m;->setOnStreamListener(Lcom/autochips/carplay/av/e;)V

    new-instance p1, Lcom/autochips/carplay/b/s;

    invoke-direct {p1, p0, p2}, Lcom/autochips/carplay/b/s;-><init>(Lcom/autochips/carplay/b/m;Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/autochips/carplay/b/m;->sw:Lcom/autochips/carplay/b/s;

    new-instance p1, Lcom/autochips/carplay/b/o;

    invoke-direct {p1, p0, p2}, Lcom/autochips/carplay/b/o;-><init>(Lcom/autochips/carplay/b/m;Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/autochips/carplay/b/m;->sx:Lcom/autochips/carplay/b/o;

    return-void
.end method

.method private static X(I)Z
    .locals 1

    const/16 v0, 0x64

    if-eq v0, p0, :cond_1

    const/16 v0, 0x66

    if-ne v0, p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method static synthetic Y(I)Z
    .locals 0

    invoke-static {p0}, Lcom/autochips/carplay/b/m;->X(I)Z

    move-result p0

    return p0
.end method

.method static synthetic a(Lcom/autochips/carplay/b/m;I)I
    .locals 0

    iput p1, p0, Lcom/autochips/carplay/b/m;->sy:I

    return p1
.end method

.method public static a(Landroid/content/Context;Landroid/os/Looper;)Lcom/autochips/carplay/b/m;
    .locals 2

    const-string v0, "OutputAudioManager"

    const-string v1, "make() - Creating mOutputAudioManager"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v0, Lcom/autochips/carplay/b/m;->sj:Lcom/autochips/carplay/b/m;

    if-nez v0, :cond_0

    new-instance v0, Lcom/autochips/carplay/b/m;

    invoke-direct {v0, p0, p1}, Lcom/autochips/carplay/b/m;-><init>(Landroid/content/Context;Landroid/os/Looper;)V

    sput-object v0, Lcom/autochips/carplay/b/m;->sj:Lcom/autochips/carplay/b/m;

    :cond_0
    sget-object p0, Lcom/autochips/carplay/b/m;->sj:Lcom/autochips/carplay/b/m;

    return-object p0
.end method

.method static synthetic a(Lcom/autochips/carplay/b/m;)Lcom/autochips/carplay/c/a;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/b/m;->rY:Lcom/autochips/carplay/c/a;

    return-object p0
.end method

.method static synthetic a(Lcom/autochips/carplay/b/m;Z)V
    .locals 1

    iget-object v0, p0, Lcom/autochips/carplay/b/m;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iput-boolean p1, p0, Lcom/autochips/carplay/b/m;->sz:Z

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method static synthetic b(Lcom/autochips/carplay/b/m;)I
    .locals 0

    iget p0, p0, Lcom/autochips/carplay/b/m;->sy:I

    return p0
.end method

.method static synthetic c(Lcom/autochips/carplay/b/m;)Landroid/media/AudioManager;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/b/m;->mAudioManager:Landroid/media/AudioManager;

    return-object p0
.end method

.method static synthetic d(Lcom/autochips/carplay/b/m;)Z
    .locals 0

    invoke-direct {p0}, Lcom/autochips/carplay/b/m;->dg()Z

    move-result p0

    return p0
.end method

.method private dg()Z
    .locals 2

    iget-object v0, p0, Lcom/autochips/carplay/b/m;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-boolean v1, p0, Lcom/autochips/carplay/b/m;->sz:Z

    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method static synthetic dh()Z
    .locals 1

    sget-boolean v0, Lcom/autochips/carplay/b/m;->sA:Z

    return v0
.end method

.method static synthetic e(Lcom/autochips/carplay/b/m;)Landroid/media/AudioManager$OnAudioFocusChangeListener;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/b/m;->sB:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    return-object p0
.end method

.method static synthetic k(II)Z
    .locals 3

    invoke-static {p0}, Lcom/autochips/carplay/b/m;->X(I)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    const/16 v0, 0x64

    const/4 v2, 0x1

    if-ne v0, p0, :cond_2

    const/4 p0, 0x6

    if-eq p1, p0, :cond_1

    packed-switch p1, :pswitch_data_0

    return v1

    :cond_1
    :goto_0
    :pswitch_0
    move v1, v2

    return v1

    :cond_2
    const/16 v0, 0x66

    if-ne v0, p0, :cond_3

    const/4 p0, 0x3

    if-ne p1, p0, :cond_3

    goto :goto_0

    :cond_3
    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method static synthetic l(II)Z
    .locals 2

    const/4 v0, 0x0

    const/16 v1, 0x65

    if-ne v1, p0, :cond_1

    const/4 p0, 0x6

    if-eq p1, p0, :cond_0

    packed-switch p1, :pswitch_data_0

    return v0

    :cond_0
    :pswitch_0
    const/4 v0, 0x1

    :cond_1
    return v0

    :pswitch_data_0
    .packed-switch 0x0
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
    iget-object p1, p0, Lcom/autochips/carplay/b/m;->sw:Lcom/autochips/carplay/b/s;

    const/16 v0, 0xf

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/b/s;->sendMessage(I)V

    return-void

    :cond_1
    iget-object p1, p0, Lcom/autochips/carplay/b/m;->sw:Lcom/autochips/carplay/b/s;

    const/16 v0, 0x10

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/b/s;->sendMessage(I)V

    return-void
.end method

.method public final a(Lcom/autochips/carplay/service/h;Lcom/autochips/carplay/c/a;)V
    .locals 1

    iput-object p1, p0, Lcom/autochips/carplay/b/m;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    iput-object p2, p0, Lcom/autochips/carplay/b/m;->rY:Lcom/autochips/carplay/c/a;

    iget-object p1, p0, Lcom/autochips/carplay/b/m;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/autochips/carplay/b/m;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    const/16 p2, 0x901

    iget-object v0, p0, Lcom/autochips/carplay/b/m;->sw:Lcom/autochips/carplay/b/s;

    invoke-virtual {v0}, Lcom/autochips/carplay/b/s;->getHandler()Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/b/m;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    const/16 p2, 0x902

    iget-object v0, p0, Lcom/autochips/carplay/b/m;->sw:Lcom/autochips/carplay/b/s;

    invoke-virtual {v0}, Lcom/autochips/carplay/b/s;->getHandler()Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    :cond_0
    return-void
.end method
