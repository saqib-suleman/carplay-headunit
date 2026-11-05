.class public Lcom/autochips/carplay/service/p;
.super Lcom/android/internal/util/StateMachine;


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mCarplayMonitor:Lcom/autochips/carplay/service/h;

.field private sZ:Lcom/autochips/carplay/service/CarplayService;

.field private ta:Lcom/autochips/carplay/service/i;

.field private tu:Lcom/autochips/carplay/b/d;

.field private tv:Lcom/autochips/carplay/b/e;

.field private final uA:Ljava/util/concurrent/ConcurrentHashMap;

.field private uB:Z

.field private uC:Z

.field private uo:Lcom/autochips/carplay/service/u;

.field private up:Lcom/autochips/carplay/service/v;

.field private uq:Lcom/autochips/carplay/service/y;

.field private ur:Lcom/autochips/carplay/service/w;

.field private us:Lcom/autochips/carplay/service/t;

.field private ut:Lcom/autochips/carplay/service/r;

.field private uu:Lcom/autochips/carplay/service/x;

.field private uv:Lcom/autochips/carplay/service/s;

.field private uw:Lcom/autochips/carplay/CarplayDevice;

.field private ux:Lcom/autochips/carplay/common/b;

.field private uy:Lcom/android/internal/util/State;

.field private uz:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/autochips/carplay/service/p;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/autochips/carplay/service/p;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Lcom/autochips/carplay/service/CarplayService;)V
    .locals 2

    sget-object v0, Lcom/autochips/carplay/service/p;->TAG:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/android/internal/util/StateMachine;-><init>(Ljava/lang/String;)V

    new-instance v0, Lcom/autochips/carplay/service/u;

    invoke-direct {v0, p0}, Lcom/autochips/carplay/service/u;-><init>(Lcom/autochips/carplay/service/p;)V

    iput-object v0, p0, Lcom/autochips/carplay/service/p;->uo:Lcom/autochips/carplay/service/u;

    new-instance v0, Lcom/autochips/carplay/service/v;

    invoke-direct {v0, p0}, Lcom/autochips/carplay/service/v;-><init>(Lcom/autochips/carplay/service/p;)V

    iput-object v0, p0, Lcom/autochips/carplay/service/p;->up:Lcom/autochips/carplay/service/v;

    new-instance v0, Lcom/autochips/carplay/service/y;

    invoke-direct {v0, p0}, Lcom/autochips/carplay/service/y;-><init>(Lcom/autochips/carplay/service/p;)V

    iput-object v0, p0, Lcom/autochips/carplay/service/p;->uq:Lcom/autochips/carplay/service/y;

    new-instance v0, Lcom/autochips/carplay/service/w;

    invoke-direct {v0, p0}, Lcom/autochips/carplay/service/w;-><init>(Lcom/autochips/carplay/service/p;)V

    iput-object v0, p0, Lcom/autochips/carplay/service/p;->ur:Lcom/autochips/carplay/service/w;

    new-instance v0, Lcom/autochips/carplay/service/t;

    invoke-direct {v0, p0}, Lcom/autochips/carplay/service/t;-><init>(Lcom/autochips/carplay/service/p;)V

    iput-object v0, p0, Lcom/autochips/carplay/service/p;->us:Lcom/autochips/carplay/service/t;

    new-instance v0, Lcom/autochips/carplay/service/r;

    invoke-direct {v0, p0}, Lcom/autochips/carplay/service/r;-><init>(Lcom/autochips/carplay/service/p;)V

    iput-object v0, p0, Lcom/autochips/carplay/service/p;->ut:Lcom/autochips/carplay/service/r;

    new-instance v0, Lcom/autochips/carplay/service/x;

    invoke-direct {v0, p0}, Lcom/autochips/carplay/service/x;-><init>(Lcom/autochips/carplay/service/p;)V

    iput-object v0, p0, Lcom/autochips/carplay/service/p;->uu:Lcom/autochips/carplay/service/x;

    new-instance v0, Lcom/autochips/carplay/service/s;

    invoke-direct {v0, p0}, Lcom/autochips/carplay/service/s;-><init>(Lcom/autochips/carplay/service/p;)V

    iput-object v0, p0, Lcom/autochips/carplay/service/p;->uv:Lcom/autochips/carplay/service/s;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/autochips/carplay/service/p;->uw:Lcom/autochips/carplay/CarplayDevice;

    iput-object v0, p0, Lcom/autochips/carplay/service/p;->ux:Lcom/autochips/carplay/common/b;

    iput-object v0, p0, Lcom/autochips/carplay/service/p;->uy:Lcom/android/internal/util/State;

    const/4 v0, 0x0

    iput v0, p0, Lcom/autochips/carplay/service/p;->uz:I

    new-instance v1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v1, p0, Lcom/autochips/carplay/service/p;->uA:Ljava/util/concurrent/ConcurrentHashMap;

    iput-boolean v0, p0, Lcom/autochips/carplay/service/p;->uB:Z

    iput-boolean v0, p0, Lcom/autochips/carplay/service/p;->uC:Z

    iput-object p1, p0, Lcom/autochips/carplay/service/p;->sZ:Lcom/autochips/carplay/service/CarplayService;

    iget-object p1, p0, Lcom/autochips/carplay/service/p;->uo:Lcom/autochips/carplay/service/u;

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/service/p;->addState(Lcom/android/internal/util/State;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/p;->up:Lcom/autochips/carplay/service/v;

    iget-object v0, p0, Lcom/autochips/carplay/service/p;->uo:Lcom/autochips/carplay/service/u;

    invoke-virtual {p0, p1, v0}, Lcom/autochips/carplay/service/p;->addState(Lcom/android/internal/util/State;Lcom/android/internal/util/State;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/p;->uq:Lcom/autochips/carplay/service/y;

    iget-object v0, p0, Lcom/autochips/carplay/service/p;->uo:Lcom/autochips/carplay/service/u;

    invoke-virtual {p0, p1, v0}, Lcom/autochips/carplay/service/p;->addState(Lcom/android/internal/util/State;Lcom/android/internal/util/State;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/p;->ur:Lcom/autochips/carplay/service/w;

    iget-object v0, p0, Lcom/autochips/carplay/service/p;->uo:Lcom/autochips/carplay/service/u;

    invoke-virtual {p0, p1, v0}, Lcom/autochips/carplay/service/p;->addState(Lcom/android/internal/util/State;Lcom/android/internal/util/State;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/p;->us:Lcom/autochips/carplay/service/t;

    iget-object v0, p0, Lcom/autochips/carplay/service/p;->uo:Lcom/autochips/carplay/service/u;

    invoke-virtual {p0, p1, v0}, Lcom/autochips/carplay/service/p;->addState(Lcom/android/internal/util/State;Lcom/android/internal/util/State;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/p;->ut:Lcom/autochips/carplay/service/r;

    iget-object v0, p0, Lcom/autochips/carplay/service/p;->us:Lcom/autochips/carplay/service/t;

    invoke-virtual {p0, p1, v0}, Lcom/autochips/carplay/service/p;->addState(Lcom/android/internal/util/State;Lcom/android/internal/util/State;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/p;->uu:Lcom/autochips/carplay/service/x;

    iget-object v0, p0, Lcom/autochips/carplay/service/p;->us:Lcom/autochips/carplay/service/t;

    invoke-virtual {p0, p1, v0}, Lcom/autochips/carplay/service/p;->addState(Lcom/android/internal/util/State;Lcom/android/internal/util/State;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/p;->uv:Lcom/autochips/carplay/service/s;

    iget-object v0, p0, Lcom/autochips/carplay/service/p;->uu:Lcom/autochips/carplay/service/x;

    invoke-virtual {p0, p1, v0}, Lcom/autochips/carplay/service/p;->addState(Lcom/android/internal/util/State;Lcom/android/internal/util/State;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/p;->up:Lcom/autochips/carplay/service/v;

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/service/p;->setInitialState(Lcom/android/internal/util/State;)V

    return-void
.end method

.method static synthetic a(Lcom/autochips/carplay/service/p;)Lcom/android/internal/util/State;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/service/p;->uy:Lcom/android/internal/util/State;

    return-object p0
.end method

.method static synthetic a(Lcom/autochips/carplay/service/p;Lcom/android/internal/util/State;)Lcom/android/internal/util/State;
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/service/p;->uy:Lcom/android/internal/util/State;

    return-object p1
.end method

.method static synthetic a(Lcom/autochips/carplay/service/p;I)V
    .locals 0

    monitor-enter p0

    :try_start_0
    iput p1, p0, Lcom/autochips/carplay/service/p;->uz:I

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method static synthetic a(Lcom/autochips/carplay/service/p;Landroid/os/Message;)V
    .locals 2

    iget-object v0, p0, Lcom/autochips/carplay/service/p;->tv:Lcom/autochips/carplay/b/e;

    iget v1, p1, Landroid/os/Message;->what:I

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/b/e;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    iget v1, p1, Landroid/os/Message;->arg1:I

    iput v1, v0, Landroid/os/Message;->arg1:I

    iget v1, p1, Landroid/os/Message;->arg2:I

    iput v1, v0, Landroid/os/Message;->arg2:I

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p0, p0, Lcom/autochips/carplay/service/p;->tv:Lcom/autochips/carplay/b/e;

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/e;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method static synthetic a(Lcom/autochips/carplay/service/p;Lcom/autochips/carplay/CarplayCall;)V
    .locals 5

    iget-object v0, p0, Lcom/autochips/carplay/service/p;->uw:Lcom/autochips/carplay/CarplayDevice;

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/CarplayCall;->setDevice(Lcom/autochips/carplay/CarplayDevice;)V

    invoke-virtual {p1}, Lcom/autochips/carplay/CarplayCall;->getUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {p1}, Lcom/autochips/carplay/CarplayCall;->getState()I

    move-result v1

    iget-object v2, p0, Lcom/autochips/carplay/service/p;->uA:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2, v0}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/autochips/carplay/service/p;->uA:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/autochips/carplay/service/p;->uA:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_0
    sget-object v0, Lcom/autochips/carplay/service/p;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "current carplaycall: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/autochips/carplay/CarplayCall;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/service/p;->uA:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    sget-object v2, Lcom/autochips/carplay/service/p;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "call: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/autochips/carplay/CarplayCall;

    invoke-virtual {v1}, Lcom/autochips/carplay/CarplayCall;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    :cond_1
    iget-object p0, p0, Lcom/autochips/carplay/service/p;->sZ:Lcom/autochips/carplay/service/CarplayService;

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/service/CarplayService;->a(Lcom/autochips/carplay/CarplayCall;)V

    return-void
.end method

.method static synthetic a(Lcom/autochips/carplay/service/p;Lcom/autochips/carplay/CarplayDevice;)V
    .locals 0

    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lcom/autochips/carplay/service/p;->uw:Lcom/autochips/carplay/CarplayDevice;

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method static synthetic a(Lcom/autochips/carplay/service/p;Lcom/autochips/carplay/CarplayDevice;I)V
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/service/p;->sZ:Lcom/autochips/carplay/service/CarplayService;

    invoke-virtual {p0, p1, p2}, Lcom/autochips/carplay/service/CarplayService;->a(Lcom/autochips/carplay/CarplayDevice;I)V

    return-void
.end method

.method static synthetic a(Lcom/autochips/carplay/service/p;Lcom/autochips/carplay/common/b;)V
    .locals 7

    invoke-virtual {p0}, Lcom/autochips/carplay/service/p;->ee()Lcom/autochips/carplay/common/b;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lcom/autochips/carplay/common/b;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    sget-object p0, Lcom/autochips/carplay/service/p;->TAG:Ljava/lang/String;

    const-string p1, "ignore the same mode"

    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lcom/autochips/carplay/service/p;->ux:Lcom/autochips/carplay/common/b;

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/16 v1, 0x716

    if-eqz v0, :cond_1

    if-eqz p1, :cond_5

    invoke-virtual {v0, p1}, Lcom/autochips/carplay/common/b;->b(Lcom/autochips/carplay/common/b;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_1
    invoke-virtual {p1}, Lcom/autochips/carplay/common/b;->cT()Lcom/autochips/carplay/common/d;

    move-result-object v2

    const/4 v3, -0x1

    iget v4, v2, Lcom/autochips/carplay/common/d;->qA:I

    const/4 v5, 0x1

    if-ne v4, v5, :cond_2

    iget v3, v2, Lcom/autochips/carplay/common/d;->qB:I

    :cond_2
    invoke-virtual {p1}, Lcom/autochips/carplay/common/b;->cU()I

    move-result v2

    const/4 v4, 0x0

    if-ne v2, v5, :cond_3

    move v2, v5

    goto :goto_0

    :cond_3
    move v2, v4

    :goto_0
    invoke-virtual {p1}, Lcom/autochips/carplay/common/b;->cV()I

    move-result v6

    if-ne v6, v5, :cond_4

    move v4, v5

    :cond_4
    new-instance v5, Lcom/autochips/carplay/CarplayAppState;

    invoke-direct {v5, v3, v2, v4}, Lcom/autochips/carplay/CarplayAppState;-><init>(IZZ)V

    iget-object v2, p0, Lcom/autochips/carplay/service/p;->sZ:Lcom/autochips/carplay/service/CarplayService;

    invoke-virtual {v2, v5}, Lcom/autochips/carplay/service/CarplayService;->a(Lcom/autochips/carplay/CarplayAppState;)V

    iget-object v2, p0, Lcom/autochips/carplay/service/p;->tu:Lcom/autochips/carplay/b/d;

    invoke-virtual {v2, v1}, Lcom/autochips/carplay/b/d;->obtainMessage(I)Landroid/os/Message;

    move-result-object v2

    iput-object p1, v2, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object v3, p0, Lcom/autochips/carplay/service/p;->tu:Lcom/autochips/carplay/b/d;

    invoke-virtual {v3, v2}, Lcom/autochips/carplay/b/d;->sendMessage(Landroid/os/Message;)Z

    :cond_5
    if-eqz v0, :cond_6

    if-eqz p1, :cond_7

    invoke-virtual {v0, p1}, Lcom/autochips/carplay/common/b;->a(Lcom/autochips/carplay/common/b;)Z

    move-result v0

    if-eqz v0, :cond_7

    :cond_6
    new-instance v0, Lcom/autochips/carplay/CarplayResourceState;

    invoke-virtual {p1}, Lcom/autochips/carplay/common/b;->getMainAudio()I

    move-result v2

    invoke-virtual {p1}, Lcom/autochips/carplay/common/b;->cS()I

    move-result v3

    invoke-direct {v0, v2, v3}, Lcom/autochips/carplay/CarplayResourceState;-><init>(II)V

    iget-object v2, p0, Lcom/autochips/carplay/service/p;->sZ:Lcom/autochips/carplay/service/CarplayService;

    invoke-virtual {v2, v0}, Lcom/autochips/carplay/service/CarplayService;->a(Lcom/autochips/carplay/CarplayResourceState;)V

    iget-object v0, p0, Lcom/autochips/carplay/service/p;->tv:Lcom/autochips/carplay/b/e;

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/b/e;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p0, p0, Lcom/autochips/carplay/service/p;->tv:Lcom/autochips/carplay/b/e;

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/e;->sendMessage(Landroid/os/Message;)Z

    :cond_7
    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method static synthetic a(Lcom/autochips/carplay/service/p;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/autochips/carplay/service/p;->uC:Z

    return p1
.end method

.method static synthetic aB()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/autochips/carplay/service/p;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic al(I)V
    .locals 1

    invoke-static {}, Lcom/autochips/carplay/service/g;->dx()Lcom/autochips/carplay/service/g;

    move-result-object v0

    invoke-virtual {v0}, Lcom/autochips/carplay/service/g;->dE()Lcom/autochips/carplay/service/ad;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, p0}, Lcom/autochips/carplay/service/ad;->an(I)V

    :cond_0
    return-void
.end method

.method static synthetic b(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/service/i;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/service/p;->ta:Lcom/autochips/carplay/service/i;

    return-object p0
.end method

.method static synthetic b(Lcom/autochips/carplay/service/p;I)V
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/service/p;->sZ:Lcom/autochips/carplay/service/CarplayService;

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/service/CarplayService;->aj(I)V

    return-void
.end method

.method static synthetic b(Lcom/autochips/carplay/service/p;Landroid/os/Message;)V
    .locals 2

    iget-object v0, p0, Lcom/autochips/carplay/service/p;->tu:Lcom/autochips/carplay/b/d;

    iget v1, p1, Landroid/os/Message;->what:I

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/b/d;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    iget v1, p1, Landroid/os/Message;->arg1:I

    iput v1, v0, Landroid/os/Message;->arg1:I

    iget v1, p1, Landroid/os/Message;->arg2:I

    iput v1, v0, Landroid/os/Message;->arg2:I

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p0, p0, Lcom/autochips/carplay/service/p;->tu:Lcom/autochips/carplay/b/d;

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/d;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method static synthetic b(Lcom/autochips/carplay/service/p;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/autochips/carplay/service/p;->uB:Z

    return p1
.end method

.method static synthetic c(Lcom/autochips/carplay/service/p;)Ljava/util/concurrent/ConcurrentHashMap;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/service/p;->uA:Ljava/util/concurrent/ConcurrentHashMap;

    return-object p0
.end method

.method static synthetic d(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/CarplayDevice;
    .locals 0

    invoke-direct {p0}, Lcom/autochips/carplay/service/p;->ec()Lcom/autochips/carplay/CarplayDevice;

    move-result-object p0

    return-object p0
.end method

.method static synthetic e(Lcom/autochips/carplay/service/p;)V
    .locals 1

    const/16 v0, 0x528

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/service/p;->removeMessages(I)V

    return-void
.end method

.method private ec()Lcom/autochips/carplay/CarplayDevice;
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/autochips/carplay/service/p;->uw:Lcom/autochips/carplay/CarplayDevice;

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private ed()I
    .locals 1

    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/autochips/carplay/service/p;->uz:I

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method static synthetic f(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/service/y;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/service/p;->uq:Lcom/autochips/carplay/service/y;

    return-object p0
.end method

.method static synthetic g(Lcom/autochips/carplay/service/p;)V
    .locals 1

    const/16 v0, 0x528

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/service/p;->removeMessages(I)V

    return-void
.end method

.method static synthetic h(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/service/w;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/service/p;->ur:Lcom/autochips/carplay/service/w;

    return-object p0
.end method

.method static synthetic i(Lcom/autochips/carplay/service/p;)V
    .locals 1

    const/16 v0, 0x528

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/service/p;->removeMessages(I)V

    return-void
.end method

.method static synthetic j(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/b/d;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/service/p;->tu:Lcom/autochips/carplay/b/d;

    return-object p0
.end method

.method static synthetic k(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/service/t;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/service/p;->us:Lcom/autochips/carplay/service/t;

    return-object p0
.end method

.method public static l(Lcom/autochips/carplay/service/CarplayService;)Lcom/autochips/carplay/service/p;
    .locals 2

    sget-object v0, Lcom/autochips/carplay/service/p;->TAG:Ljava/lang/String;

    const-string v1, "make() - Creating CarplaySessionStateMachine"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Lcom/autochips/carplay/service/p;

    invoke-direct {v0, p0}, Lcom/autochips/carplay/service/p;-><init>(Lcom/autochips/carplay/service/CarplayService;)V

    return-object v0
.end method

.method static synthetic l(Lcom/autochips/carplay/service/p;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/autochips/carplay/service/p;->uC:Z

    return p0
.end method

.method static synthetic m(Lcom/autochips/carplay/service/p;)V
    .locals 1

    const/16 v0, 0x70d

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/service/p;->removeMessages(I)V

    return-void
.end method

.method static synthetic n(Lcom/autochips/carplay/service/p;)V
    .locals 1

    const/16 v0, 0x70d

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/service/p;->removeMessages(I)V

    return-void
.end method

.method static synthetic o(Lcom/autochips/carplay/service/p;)V
    .locals 1

    const/16 v0, 0x529

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/service/p;->removeMessages(I)V

    return-void
.end method

.method static synthetic p(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/service/v;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/service/p;->up:Lcom/autochips/carplay/service/v;

    return-object p0
.end method

.method static synthetic q(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/service/r;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/service/p;->ut:Lcom/autochips/carplay/service/r;

    return-object p0
.end method

.method static synthetic r(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/service/s;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/service/p;->uv:Lcom/autochips/carplay/service/s;

    return-object p0
.end method

.method static synthetic s(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/service/x;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/service/p;->uu:Lcom/autochips/carplay/service/x;

    return-object p0
.end method

.method static synthetic t(Lcom/autochips/carplay/service/p;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/autochips/carplay/service/p;->uB:Z

    return p0
.end method

.method static synthetic u(Lcom/autochips/carplay/service/p;)Lcom/autochips/carplay/service/CarplayService;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/service/p;->sZ:Lcom/autochips/carplay/service/CarplayService;

    return-object p0
.end method

.method static synthetic v(Lcom/autochips/carplay/service/p;)V
    .locals 1

    const/16 v0, 0x70e

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/service/p;->removeMessages(I)V

    return-void
.end method


# virtual methods
.method public final a(Lcom/autochips/carplay/service/i;Lcom/autochips/carplay/service/h;Lcom/autochips/carplay/b/e;Lcom/autochips/carplay/b/d;)V
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/service/p;->ta:Lcom/autochips/carplay/service/i;

    iput-object p2, p0, Lcom/autochips/carplay/service/p;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    iput-object p4, p0, Lcom/autochips/carplay/service/p;->tu:Lcom/autochips/carplay/b/d;

    iput-object p3, p0, Lcom/autochips/carplay/service/p;->tv:Lcom/autochips/carplay/b/e;

    sget-object p1, Lcom/autochips/carplay/service/p;->TAG:Ljava/lang/String;

    const-string p2, "registerForMonitorEvents"

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/autochips/carplay/service/p;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {p0}, Lcom/autochips/carplay/service/p;->getHandler()Landroid/os/Handler;

    move-result-object p2

    const/16 p3, 0x307

    invoke-virtual {p1, p3, p2}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/p;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {p0}, Lcom/autochips/carplay/service/p;->getHandler()Landroid/os/Handler;

    move-result-object p2

    const/16 p3, 0x308

    invoke-virtual {p1, p3, p2}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/p;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {p0}, Lcom/autochips/carplay/service/p;->getHandler()Landroid/os/Handler;

    move-result-object p2

    const/16 p3, 0x50a

    invoke-virtual {p1, p3, p2}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/p;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {p0}, Lcom/autochips/carplay/service/p;->getHandler()Landroid/os/Handler;

    move-result-object p2

    const/16 p3, 0x50b

    invoke-virtual {p1, p3, p2}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/p;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {p0}, Lcom/autochips/carplay/service/p;->getHandler()Landroid/os/Handler;

    move-result-object p2

    const/16 p3, 0x50c

    invoke-virtual {p1, p3, p2}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/p;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {p0}, Lcom/autochips/carplay/service/p;->getHandler()Landroid/os/Handler;

    move-result-object p2

    const/16 p3, 0x50d

    invoke-virtual {p1, p3, p2}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/p;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {p0}, Lcom/autochips/carplay/service/p;->getHandler()Landroid/os/Handler;

    move-result-object p2

    const/16 p3, 0x50e

    invoke-virtual {p1, p3, p2}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/p;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {p0}, Lcom/autochips/carplay/service/p;->getHandler()Landroid/os/Handler;

    move-result-object p2

    const/16 p3, 0x514

    invoke-virtual {p1, p3, p2}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/p;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {p0}, Lcom/autochips/carplay/service/p;->getHandler()Landroid/os/Handler;

    move-result-object p2

    const/16 p3, 0x515

    invoke-virtual {p1, p3, p2}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/p;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {p0}, Lcom/autochips/carplay/service/p;->getHandler()Landroid/os/Handler;

    move-result-object p2

    const/16 p3, 0x516

    invoke-virtual {p1, p3, p2}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/p;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {p0}, Lcom/autochips/carplay/service/p;->getHandler()Landroid/os/Handler;

    move-result-object p2

    const/16 p3, 0x517

    invoke-virtual {p1, p3, p2}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/p;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {p0}, Lcom/autochips/carplay/service/p;->getHandler()Landroid/os/Handler;

    move-result-object p2

    const/16 p3, 0x518

    invoke-virtual {p1, p3, p2}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/p;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {p0}, Lcom/autochips/carplay/service/p;->getHandler()Landroid/os/Handler;

    move-result-object p2

    const/16 p3, 0x51e

    invoke-virtual {p1, p3, p2}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/p;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {p0}, Lcom/autochips/carplay/service/p;->getHandler()Landroid/os/Handler;

    move-result-object p2

    const/16 p3, 0x51f

    invoke-virtual {p1, p3, p2}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/p;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {p0}, Lcom/autochips/carplay/service/p;->getHandler()Landroid/os/Handler;

    move-result-object p2

    const/16 p3, 0x520

    invoke-virtual {p1, p3, p2}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/p;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {p0}, Lcom/autochips/carplay/service/p;->getHandler()Landroid/os/Handler;

    move-result-object p2

    const/16 p3, 0x521

    invoke-virtual {p1, p3, p2}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/p;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {p0}, Lcom/autochips/carplay/service/p;->getHandler()Landroid/os/Handler;

    move-result-object p2

    const/16 p3, 0x522

    invoke-virtual {p1, p3, p2}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/p;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {p0}, Lcom/autochips/carplay/service/p;->getHandler()Landroid/os/Handler;

    move-result-object p2

    const/16 p3, 0x532

    invoke-virtual {p1, p3, p2}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/p;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {p0}, Lcom/autochips/carplay/service/p;->getHandler()Landroid/os/Handler;

    move-result-object p2

    const/16 p3, 0x70a

    invoke-virtual {p1, p3, p2}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/p;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {p0}, Lcom/autochips/carplay/service/p;->getHandler()Landroid/os/Handler;

    move-result-object p2

    const/16 p3, 0x70b

    invoke-virtual {p1, p3, p2}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/p;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {p0}, Lcom/autochips/carplay/service/p;->getHandler()Landroid/os/Handler;

    move-result-object p2

    const/16 p3, 0x70c

    invoke-virtual {p1, p3, p2}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/p;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {p0}, Lcom/autochips/carplay/service/p;->getHandler()Landroid/os/Handler;

    move-result-object p2

    const/16 p3, 0x714

    invoke-virtual {p1, p3, p2}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/p;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {p0}, Lcom/autochips/carplay/service/p;->getHandler()Landroid/os/Handler;

    move-result-object p2

    const/16 p3, 0x715

    invoke-virtual {p1, p3, p2}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/p;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {p0}, Lcom/autochips/carplay/service/p;->getHandler()Landroid/os/Handler;

    move-result-object p2

    const/16 p3, 0x718

    invoke-virtual {p1, p3, p2}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/p;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {p0}, Lcom/autochips/carplay/service/p;->getHandler()Landroid/os/Handler;

    move-result-object p2

    const/16 p3, 0x716

    invoke-virtual {p1, p3, p2}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/p;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {p0}, Lcom/autochips/carplay/service/p;->getHandler()Landroid/os/Handler;

    move-result-object p2

    const/16 p3, 0x717

    invoke-virtual {p1, p3, p2}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    return-void
.end method

.method public final ee()Lcom/autochips/carplay/common/b;
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/autochips/carplay/service/p;->ux:Lcom/autochips/carplay/common/b;

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method final getAppState()Lcom/autochips/carplay/CarplayAppState;
    .locals 5

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/autochips/carplay/service/p;->ux:Lcom/autochips/carplay/common/b;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/autochips/carplay/service/p;->ux:Lcom/autochips/carplay/common/b;

    invoke-virtual {v0}, Lcom/autochips/carplay/common/b;->cT()Lcom/autochips/carplay/common/d;

    move-result-object v0

    const/4 v1, -0x1

    iget v2, v0, Lcom/autochips/carplay/common/d;->qA:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    iget v1, v0, Lcom/autochips/carplay/common/d;->qB:I

    :cond_0
    iget-object v0, p0, Lcom/autochips/carplay/service/p;->ux:Lcom/autochips/carplay/common/b;

    invoke-virtual {v0}, Lcom/autochips/carplay/common/b;->cU()I

    move-result v0

    const/4 v2, 0x0

    if-ne v0, v3, :cond_1

    move v0, v3

    goto :goto_0

    :cond_1
    move v0, v2

    :goto_0
    iget-object v4, p0, Lcom/autochips/carplay/service/p;->ux:Lcom/autochips/carplay/common/b;

    invoke-virtual {v4}, Lcom/autochips/carplay/common/b;->cV()I

    move-result v4

    if-ne v4, v3, :cond_2

    move v2, v3

    :cond_2
    new-instance v3, Lcom/autochips/carplay/CarplayAppState;

    invoke-direct {v3, v1, v0, v2}, Lcom/autochips/carplay/CarplayAppState;-><init>(IZZ)V

    sget-object v0, Lcom/autochips/carplay/service/p;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "getAppState, appState:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    monitor-exit p0

    return-object v3

    :cond_3
    sget-object v0, Lcom/autochips/carplay/service/p;->TAG:Ljava/lang/String;

    const-string v1, "getAppState, current state is null"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public final getConnectedDevices()Ljava/util/List;
    .locals 4

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/autochips/carplay/service/p;->ed()I

    move-result v1

    const/4 v2, 0x3

    if-eq v1, v2, :cond_1

    const/4 v2, 0x4

    if-eq v1, v2, :cond_1

    const/4 v2, 0x5

    if-eq v1, v2, :cond_1

    const/4 v2, 0x6

    if-ne v1, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v1, 0x1

    :goto_1
    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/autochips/carplay/service/p;->uw:Lcom/autochips/carplay/CarplayDevice;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_2
    sget-object v1, Lcom/autochips/carplay/service/p;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "getConnectedDevices, devices:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, ", size:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public final declared-synchronized getConnectionState(Lcom/autochips/carplay/CarplayDevice;)I
    .locals 4

    monitor-enter p0

    :try_start_0
    sget-object v0, Lcom/autochips/carplay/service/p;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "getConnectionState mCurrentDevice: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/autochips/carplay/service/p;->uw:Lcom/autochips/carplay/CarplayDevice;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ", device:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/service/p;->uw:Lcom/autochips/carplay/CarplayDevice;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    monitor-exit p0

    return v1

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/autochips/carplay/service/p;->uw:Lcom/autochips/carplay/CarplayDevice;

    invoke-virtual {v0, p1}, Lcom/autochips/carplay/CarplayDevice;->equals(Ljava/lang/Object;)Z

    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez p1, :cond_1

    monitor-exit p0

    return v1

    :cond_1
    :try_start_2
    invoke-direct {p0}, Lcom/autochips/carplay/service/p;->ed()I

    move-result p1

    sget-object v0, Lcom/autochips/carplay/service/p;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "getConnectionState currentState: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x1

    if-eq p1, v0, :cond_5

    const/4 v2, 0x2

    if-ne p1, v2, :cond_2

    goto :goto_1

    :cond_2
    const/4 v0, 0x3

    if-eq p1, v0, :cond_4

    const/4 v0, 0x4

    if-eq p1, v0, :cond_4

    const/4 v0, 0x5

    if-eq p1, v0, :cond_4

    const/4 v0, 0x6

    if-ne p1, v0, :cond_3

    goto :goto_0

    :cond_3
    sget-object v0, Lcom/autochips/carplay/service/p;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Bad currentState: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return v1

    :cond_4
    :goto_0
    monitor-exit p0

    return v2

    :cond_5
    :goto_1
    monitor-exit p0

    return v0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method final getCurrentCalls()Ljava/util/List;
    .locals 2

    monitor-enter p0

    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/autochips/carplay/service/p;->uA:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method final getResourceState()Lcom/autochips/carplay/CarplayResourceState;
    .locals 4

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/autochips/carplay/service/p;->ux:Lcom/autochips/carplay/common/b;

    if-eqz v0, :cond_0

    new-instance v0, Lcom/autochips/carplay/CarplayResourceState;

    iget-object v1, p0, Lcom/autochips/carplay/service/p;->ux:Lcom/autochips/carplay/common/b;

    invoke-virtual {v1}, Lcom/autochips/carplay/common/b;->getMainAudio()I

    move-result v1

    iget-object v2, p0, Lcom/autochips/carplay/service/p;->ux:Lcom/autochips/carplay/common/b;

    invoke-virtual {v2}, Lcom/autochips/carplay/common/b;->cS()I

    move-result v2

    invoke-direct {v0, v1, v2}, Lcom/autochips/carplay/CarplayResourceState;-><init>(II)V

    sget-object v1, Lcom/autochips/carplay/service/p;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "getResourceState, state:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    monitor-exit p0

    return-object v0

    :cond_0
    sget-object v0, Lcom/autochips/carplay/service/p;->TAG:Ljava/lang/String;

    const-string v1, "getResourceState, current state is null"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method protected onQuitting()V
    .locals 2

    iget-object v0, p0, Lcom/autochips/carplay/service/p;->tv:Lcom/autochips/carplay/b/e;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iput-object v1, p0, Lcom/autochips/carplay/service/p;->tv:Lcom/autochips/carplay/b/e;

    :cond_0
    iget-object v0, p0, Lcom/autochips/carplay/service/p;->tu:Lcom/autochips/carplay/b/d;

    if-eqz v0, :cond_1

    iput-object v1, p0, Lcom/autochips/carplay/service/p;->tu:Lcom/autochips/carplay/b/d;

    :cond_1
    iget-object v0, p0, Lcom/autochips/carplay/service/p;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    if-eqz v0, :cond_2

    iput-object v1, p0, Lcom/autochips/carplay/service/p;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    :cond_2
    iget-object v0, p0, Lcom/autochips/carplay/service/p;->ta:Lcom/autochips/carplay/service/i;

    if-eqz v0, :cond_3

    iput-object v1, p0, Lcom/autochips/carplay/service/p;->ta:Lcom/autochips/carplay/service/i;

    :cond_3
    iget-object v0, p0, Lcom/autochips/carplay/service/p;->sZ:Lcom/autochips/carplay/service/CarplayService;

    if-eqz v0, :cond_4

    iput-object v1, p0, Lcom/autochips/carplay/service/p;->sZ:Lcom/autochips/carplay/service/CarplayService;

    :cond_4
    return-void
.end method
