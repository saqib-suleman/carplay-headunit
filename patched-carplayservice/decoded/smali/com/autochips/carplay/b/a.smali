.class public Lcom/autochips/carplay/b/a;
.super Ljava/lang/Object;


# instance fields
.field private final mCarplayMonitor:Lcom/autochips/carplay/service/h;

.field private final mHandler:Landroid/os/Handler;

.field private mStarted:Z

.field private final rS:Ljava/lang/Object;

.field private rT:Z

.field private rU:Lcom/autochips/backcar/BackCar;

.field rV:Ljava/util/ArrayList;

.field private rW:Lcom/autochips/backcar/BackCar$Listener;


# direct methods
.method public constructor <init>(Landroid/os/Looper;Lcom/autochips/carplay/service/h;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/autochips/carplay/b/a;->rS:Ljava/lang/Object;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/autochips/carplay/b/a;->rT:Z

    iput-boolean v0, p0, Lcom/autochips/carplay/b/a;->mStarted:Z

    new-instance v1, Lcom/autochips/carplay/b/c;

    invoke-direct {v1, p0}, Lcom/autochips/carplay/b/c;-><init>(Lcom/autochips/carplay/b/a;)V

    iput-object v1, p0, Lcom/autochips/carplay/b/a;->rW:Lcom/autochips/backcar/BackCar$Listener;

    iput-object p2, p0, Lcom/autochips/carplay/b/a;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    new-instance p2, Lcom/autochips/backcar/BackCar;

    invoke-direct {p2}, Lcom/autochips/backcar/BackCar;-><init>()V

    iput-object p2, p0, Lcom/autochips/carplay/b/a;->rU:Lcom/autochips/backcar/BackCar;

    new-instance p2, Ljava/util/ArrayList;

    const/4 v1, 0x3

    invoke-direct {p2, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object p2, p0, Lcom/autochips/carplay/b/a;->rV:Ljava/util/ArrayList;

    iget-object p2, p0, Lcom/autochips/carplay/b/a;->rV:Ljava/util/ArrayList;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object p2, p0, Lcom/autochips/carplay/b/a;->rV:Ljava/util/ArrayList;

    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object p2, p0, Lcom/autochips/carplay/b/a;->rV:Ljava/util/ArrayList;

    const/4 v0, 0x2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object p2, p0, Lcom/autochips/carplay/b/a;->rV:Ljava/util/ArrayList;

    const/4 v0, 0x4

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance p2, Lcom/autochips/carplay/b/b;

    invoke-direct {p2, p0, p1}, Lcom/autochips/carplay/b/b;-><init>(Lcom/autochips/carplay/b/a;Landroid/os/Looper;)V

    iput-object p2, p0, Lcom/autochips/carplay/b/a;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method static synthetic a(Lcom/autochips/carplay/b/a;Lcom/autochips/backcar/BackCar;)Lcom/autochips/backcar/BackCar;
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/b/a;->rU:Lcom/autochips/backcar/BackCar;

    return-object p1
.end method

.method static synthetic a(Lcom/autochips/carplay/b/a;)Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/b/a;->rS:Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic a(Lcom/autochips/carplay/b/a;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/autochips/carplay/b/a;->rT:Z

    return p1
.end method

.method static synthetic b(Lcom/autochips/carplay/b/a;)Lcom/autochips/carplay/service/h;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/b/a;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    return-object p0
.end method

.method static synthetic c(Lcom/autochips/carplay/b/a;)Lcom/autochips/backcar/BackCar;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/b/a;->rU:Lcom/autochips/backcar/BackCar;

    return-object p0
.end method

.method static synthetic d(Lcom/autochips/carplay/b/a;)Lcom/autochips/backcar/BackCar$Listener;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/b/a;->rW:Lcom/autochips/backcar/BackCar$Listener;

    return-object p0
.end method

.method static synthetic e(Lcom/autochips/carplay/b/a;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/autochips/carplay/b/a;->mStarted:Z

    return p0
.end method

.method static synthetic f(Lcom/autochips/carplay/b/a;)Landroid/os/Handler;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/b/a;->mHandler:Landroid/os/Handler;

    return-object p0
.end method


# virtual methods
.method public final da()V
    .locals 3

    const-string v0, "BackcarMonitor"

    const-string v1, "startMonitor"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/b/a;->rS:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x1

    :try_start_0
    iput-boolean v1, p0, Lcom/autochips/carplay/b/a;->mStarted:Z

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/autochips/carplay/b/a;->rU:Lcom/autochips/backcar/BackCar;

    iget-object v1, p0, Lcom/autochips/carplay/b/a;->rW:Lcom/autochips/backcar/BackCar$Listener;

    iget-object v2, p0, Lcom/autochips/carplay/b/a;->rV:Ljava/util/ArrayList;

    invoke-virtual {v0, v1, v2}, Lcom/autochips/backcar/BackCar;->setListener(Lcom/autochips/backcar/BackCar$Listener;Ljava/util/ArrayList;)Z

    return-void

    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public final db()V
    .locals 2

    const-string v0, "BackcarMonitor"

    const-string v1, "stopMonitor"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/b/a;->rS:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x0

    :try_start_0
    iput-boolean v1, p0, Lcom/autochips/carplay/b/a;->mStarted:Z

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/autochips/carplay/b/a;->rU:Lcom/autochips/backcar/BackCar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v1}, Lcom/autochips/backcar/BackCar;->setListener(Lcom/autochips/backcar/BackCar$Listener;Ljava/util/ArrayList;)Z

    iget-object v0, p0, Lcom/autochips/carplay/b/a;->rU:Lcom/autochips/backcar/BackCar;

    invoke-virtual {v0}, Lcom/autochips/backcar/BackCar;->release()Z

    return-void

    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public final dc()Z
    .locals 2

    iget-object v0, p0, Lcom/autochips/carplay/b/a;->rS:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-boolean v1, p0, Lcom/autochips/carplay/b/a;->rT:Z

    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
