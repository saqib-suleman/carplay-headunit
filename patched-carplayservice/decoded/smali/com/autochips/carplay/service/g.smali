.class public final Lcom/autochips/carplay/service/g;
.super Ljava/lang/Object;


# static fields
.field static tj:Lcom/autochips/carplay/service/g;


# instance fields
.field private mCarplayMonitor:Lcom/autochips/carplay/service/h;

.field private final mContext:Landroid/content/Context;

.field private mRemoteDevices:Lcom/autochips/carplay/service/z;

.field private tA:Landroid/os/HandlerThread;

.field private tB:Landroid/os/HandlerThread;

.field private tC:Landroid/os/HandlerThread;

.field private tD:Landroid/os/HandlerThread;

.field private tE:Landroid/os/HandlerThread;

.field private tF:Lcom/autochips/carplay/b/a;

.field private tG:Lcom/autochips/carplay/service/ad;

.field private ta:Lcom/autochips/carplay/service/i;

.field private final tk:Landroid/os/INetworkManagementService;

.field private tl:Lcom/autochips/carplay/service/CarplayService;

.field private tm:Lcom/autochips/carplay/service/a;

.field private tn:Lcom/autochips/carplay/service/p;

.field private to:Lcom/autochips/carplay/wired/a;

.field private tp:Lcom/autochips/carplay/plugin/a;

.field private tq:Lcom/autochips/carplay/a/a;

.field private tr:Lcom/autochips/carplay/c/a;

.field private ts:Lcom/autochips/carplay/c/e;

.field private tt:Lcom/autochips/carplay/common/c;

.field private tu:Lcom/autochips/carplay/b/d;

.field private tv:Lcom/autochips/carplay/b/e;

.field private tw:Landroid/os/HandlerThread;

.field private tx:Landroid/os/HandlerThread;

.field private ty:Landroid/os/HandlerThread;

.field private tz:Landroid/os/HandlerThread;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    sput-object v0, Lcom/autochips/carplay/service/g;->tj:Lcom/autochips/carplay/service/g;

    return-void
.end method

.method public constructor <init>(Lcom/autochips/carplay/service/CarplayService;Landroid/content/Context;)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/autochips/carplay/service/g;->to:Lcom/autochips/carplay/wired/a;

    iput-object v0, p0, Lcom/autochips/carplay/service/g;->tp:Lcom/autochips/carplay/plugin/a;

    iput-object v0, p0, Lcom/autochips/carplay/service/g;->tq:Lcom/autochips/carplay/a/a;

    iput-object v0, p0, Lcom/autochips/carplay/service/g;->tr:Lcom/autochips/carplay/c/a;

    iput-object v0, p0, Lcom/autochips/carplay/service/g;->ts:Lcom/autochips/carplay/c/e;

    iput-object v0, p0, Lcom/autochips/carplay/service/g;->tt:Lcom/autochips/carplay/common/c;

    iput-object v0, p0, Lcom/autochips/carplay/service/g;->tu:Lcom/autochips/carplay/b/d;

    iput-object v0, p0, Lcom/autochips/carplay/service/g;->tv:Lcom/autochips/carplay/b/e;

    iput-object v0, p0, Lcom/autochips/carplay/service/g;->tw:Landroid/os/HandlerThread;

    iput-object v0, p0, Lcom/autochips/carplay/service/g;->tx:Landroid/os/HandlerThread;

    iput-object v0, p0, Lcom/autochips/carplay/service/g;->ty:Landroid/os/HandlerThread;

    iput-object v0, p0, Lcom/autochips/carplay/service/g;->tz:Landroid/os/HandlerThread;

    iput-object v0, p0, Lcom/autochips/carplay/service/g;->tA:Landroid/os/HandlerThread;

    iput-object v0, p0, Lcom/autochips/carplay/service/g;->tB:Landroid/os/HandlerThread;

    iput-object v0, p0, Lcom/autochips/carplay/service/g;->tC:Landroid/os/HandlerThread;

    iput-object v0, p0, Lcom/autochips/carplay/service/g;->tD:Landroid/os/HandlerThread;

    iput-object v0, p0, Lcom/autochips/carplay/service/g;->tE:Landroid/os/HandlerThread;

    iput-object v0, p0, Lcom/autochips/carplay/service/g;->tF:Lcom/autochips/carplay/b/a;

    iput-object v0, p0, Lcom/autochips/carplay/service/g;->tG:Lcom/autochips/carplay/service/ad;

    const-string v0, "CarplayInjector"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "svc:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ", context:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz p2, :cond_1

    sget-object v0, Lcom/autochips/carplay/service/g;->tj:Lcom/autochips/carplay/service/g;

    if-nez v0, :cond_0

    sput-object p0, Lcom/autochips/carplay/service/g;->tj:Lcom/autochips/carplay/service/g;

    iput-object p1, p0, Lcom/autochips/carplay/service/g;->tl:Lcom/autochips/carplay/service/CarplayService;

    iput-object p2, p0, Lcom/autochips/carplay/service/g;->mContext:Landroid/content/Context;

    const-string p1, "network_management"

    invoke-static {p1}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Landroid/os/INetworkManagementService$Stub;->asInterface(Landroid/os/IBinder;)Landroid/os/INetworkManagementService;

    move-result-object p1

    iput-object p1, p0, Lcom/autochips/carplay/service/g;->tk:Landroid/os/INetworkManagementService;

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "CarplayInjector was already created, use getInstance instead."

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "CarplayInjector should not be initialized with a null Context."

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static dx()Lcom/autochips/carplay/service/g;
    .locals 2

    sget-object v0, Lcom/autochips/carplay/service/g;->tj:Lcom/autochips/carplay/service/g;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/autochips/carplay/service/g;->tj:Lcom/autochips/carplay/service/g;

    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Attempted to retrieve a CarplayInjector instance before constructor was called."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public final dA()Lcom/autochips/carplay/service/z;
    .locals 1

    iget-object v0, p0, Lcom/autochips/carplay/service/g;->mRemoteDevices:Lcom/autochips/carplay/service/z;

    return-object v0
.end method

.method public final dB()Lcom/autochips/carplay/service/a;
    .locals 1

    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tm:Lcom/autochips/carplay/service/a;

    return-object v0
.end method

.method public final dC()Lcom/autochips/carplay/service/p;
    .locals 1

    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tn:Lcom/autochips/carplay/service/p;

    return-object v0
.end method

.method public final dD()Landroid/os/HandlerThread;
    .locals 1

    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tw:Landroid/os/HandlerThread;

    return-object v0
.end method

.method public final dE()Lcom/autochips/carplay/service/ad;
    .locals 1

    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tG:Lcom/autochips/carplay/service/ad;

    return-object v0
.end method

.method public final dF()Lcom/autochips/carplay/b/a;
    .locals 1

    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tF:Lcom/autochips/carplay/b/a;

    return-object v0
.end method

.method public final deinit()V
    .locals 2

    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tE:Landroid/os/HandlerThread;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tF:Lcom/autochips/carplay/b/a;

    invoke-virtual {v0}, Lcom/autochips/carplay/b/a;->db()V

    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tE:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quitSafely()Z

    iput-object v1, p0, Lcom/autochips/carplay/service/g;->tF:Lcom/autochips/carplay/b/a;

    iput-object v1, p0, Lcom/autochips/carplay/service/g;->tE:Landroid/os/HandlerThread;

    :cond_0
    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tn:Lcom/autochips/carplay/service/p;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tn:Lcom/autochips/carplay/service/p;

    invoke-virtual {v0}, Lcom/autochips/carplay/service/p;->quitNow()V

    :cond_1
    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tG:Lcom/autochips/carplay/service/ad;

    if-eqz v0, :cond_2

    iput-object v1, p0, Lcom/autochips/carplay/service/g;->tG:Lcom/autochips/carplay/service/ad;

    :cond_2
    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tm:Lcom/autochips/carplay/service/a;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tm:Lcom/autochips/carplay/service/a;

    invoke-virtual {v0}, Lcom/autochips/carplay/service/a;->quitNow()V

    :cond_3
    iget-object v0, p0, Lcom/autochips/carplay/service/g;->ta:Lcom/autochips/carplay/service/i;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/autochips/carplay/service/g;->ta:Lcom/autochips/carplay/service/i;

    invoke-virtual {v0}, Lcom/autochips/carplay/service/i;->cleanup()V

    iput-object v1, p0, Lcom/autochips/carplay/service/g;->ta:Lcom/autochips/carplay/service/i;

    :cond_4
    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tu:Lcom/autochips/carplay/b/d;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tu:Lcom/autochips/carplay/b/d;

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/b/d;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    iput-object v1, p0, Lcom/autochips/carplay/service/g;->tu:Lcom/autochips/carplay/b/d;

    :cond_5
    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tv:Lcom/autochips/carplay/b/e;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tv:Lcom/autochips/carplay/b/e;

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/b/e;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    iput-object v1, p0, Lcom/autochips/carplay/service/g;->tv:Lcom/autochips/carplay/b/e;

    :cond_6
    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tD:Landroid/os/HandlerThread;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tD:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quitSafely()Z

    iput-object v1, p0, Lcom/autochips/carplay/service/g;->tD:Landroid/os/HandlerThread;

    :cond_7
    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tq:Lcom/autochips/carplay/a/a;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tq:Lcom/autochips/carplay/a/a;

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/a/a;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    iput-object v1, p0, Lcom/autochips/carplay/service/g;->tq:Lcom/autochips/carplay/a/a;

    :cond_8
    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tB:Landroid/os/HandlerThread;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tB:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quitSafely()Z

    iput-object v1, p0, Lcom/autochips/carplay/service/g;->tB:Landroid/os/HandlerThread;

    :cond_9
    iget-object v0, p0, Lcom/autochips/carplay/service/g;->ts:Lcom/autochips/carplay/c/e;

    if-eqz v0, :cond_a

    iget-object v0, p0, Lcom/autochips/carplay/service/g;->ts:Lcom/autochips/carplay/c/e;

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/c/e;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/autochips/carplay/service/g;->ts:Lcom/autochips/carplay/c/e;

    invoke-virtual {v0}, Lcom/autochips/carplay/c/e;->cleanup()V

    iput-object v1, p0, Lcom/autochips/carplay/service/g;->ts:Lcom/autochips/carplay/c/e;

    :cond_a
    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tA:Landroid/os/HandlerThread;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tA:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quitSafely()Z

    iput-object v1, p0, Lcom/autochips/carplay/service/g;->tA:Landroid/os/HandlerThread;

    :cond_b
    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tr:Lcom/autochips/carplay/c/a;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tr:Lcom/autochips/carplay/c/a;

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/c/a;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tr:Lcom/autochips/carplay/c/a;

    invoke-virtual {v0}, Lcom/autochips/carplay/c/a;->cleanup()V

    iput-object v1, p0, Lcom/autochips/carplay/service/g;->tr:Lcom/autochips/carplay/c/a;

    :cond_c
    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tz:Landroid/os/HandlerThread;

    if-eqz v0, :cond_d

    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tz:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quitSafely()Z

    iput-object v1, p0, Lcom/autochips/carplay/service/g;->tz:Landroid/os/HandlerThread;

    :cond_d
    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tp:Lcom/autochips/carplay/plugin/a;

    if-eqz v0, :cond_e

    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tp:Lcom/autochips/carplay/plugin/a;

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/plugin/a;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tp:Lcom/autochips/carplay/plugin/a;

    invoke-virtual {v0}, Lcom/autochips/carplay/plugin/a;->cleanup()V

    iput-object v1, p0, Lcom/autochips/carplay/service/g;->tp:Lcom/autochips/carplay/plugin/a;

    :cond_e
    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tC:Landroid/os/HandlerThread;

    if-eqz v0, :cond_f

    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tC:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quitSafely()Z

    iput-object v1, p0, Lcom/autochips/carplay/service/g;->tC:Landroid/os/HandlerThread;

    :cond_f
    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tt:Lcom/autochips/carplay/common/c;

    if-eqz v0, :cond_10

    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tt:Lcom/autochips/carplay/common/c;

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/common/c;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    iput-object v1, p0, Lcom/autochips/carplay/service/g;->tt:Lcom/autochips/carplay/common/c;

    :cond_10
    iget-object v0, p0, Lcom/autochips/carplay/service/g;->ty:Landroid/os/HandlerThread;

    if-eqz v0, :cond_11

    iget-object v0, p0, Lcom/autochips/carplay/service/g;->ty:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quitSafely()Z

    iput-object v1, p0, Lcom/autochips/carplay/service/g;->ty:Landroid/os/HandlerThread;

    :cond_11
    iget-object v0, p0, Lcom/autochips/carplay/service/g;->to:Lcom/autochips/carplay/wired/a;

    if-eqz v0, :cond_12

    iget-object v0, p0, Lcom/autochips/carplay/service/g;->to:Lcom/autochips/carplay/wired/a;

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/wired/a;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    iput-object v1, p0, Lcom/autochips/carplay/service/g;->to:Lcom/autochips/carplay/wired/a;

    :cond_12
    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tx:Landroid/os/HandlerThread;

    if-eqz v0, :cond_13

    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tx:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quitSafely()Z

    iput-object v1, p0, Lcom/autochips/carplay/service/g;->tx:Landroid/os/HandlerThread;

    :cond_13
    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tw:Landroid/os/HandlerThread;

    if-eqz v0, :cond_14

    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tw:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quitSafely()Z

    iput-object v1, p0, Lcom/autochips/carplay/service/g;->tw:Landroid/os/HandlerThread;

    :cond_14
    iget-object v0, p0, Lcom/autochips/carplay/service/g;->mRemoteDevices:Lcom/autochips/carplay/service/z;

    if-eqz v0, :cond_15

    iget-object v0, p0, Lcom/autochips/carplay/service/g;->mRemoteDevices:Lcom/autochips/carplay/service/z;

    invoke-virtual {v0}, Lcom/autochips/carplay/service/z;->reset()V

    :cond_15
    iget-object v0, p0, Lcom/autochips/carplay/service/g;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    if-eqz v0, :cond_16

    iget-object v0, p0, Lcom/autochips/carplay/service/g;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {v0}, Lcom/autochips/carplay/service/h;->dG()V

    :cond_16
    iput-object v1, p0, Lcom/autochips/carplay/service/g;->tl:Lcom/autochips/carplay/service/CarplayService;

    return-void
.end method

.method public final dy()Lcom/autochips/carplay/service/CarplayService;
    .locals 1

    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tl:Lcom/autochips/carplay/service/CarplayService;

    return-object v0
.end method

.method public final dz()Lcom/autochips/carplay/service/h;
    .locals 1

    iget-object v0, p0, Lcom/autochips/carplay/service/g;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    return-object v0
.end method

.method public final init()V
    .locals 12

    new-instance v0, Lcom/autochips/carplay/service/h;

    invoke-direct {v0}, Lcom/autochips/carplay/service/h;-><init>()V

    iput-object v0, p0, Lcom/autochips/carplay/service/g;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    new-instance v0, Lcom/autochips/carplay/service/z;

    invoke-direct {v0}, Lcom/autochips/carplay/service/z;-><init>()V

    iput-object v0, p0, Lcom/autochips/carplay/service/g;->mRemoteDevices:Lcom/autochips/carplay/service/z;

    iget-object v0, p0, Lcom/autochips/carplay/service/g;->mRemoteDevices:Lcom/autochips/carplay/service/z;

    invoke-virtual {v0}, Lcom/autochips/carplay/service/z;->init()V

    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tw:Landroid/os/HandlerThread;

    if-nez v0, :cond_0

    new-instance v0, Landroid/os/HandlerThread;

    const-class v1, Lcom/autochips/carplay/service/CarplayService;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/autochips/carplay/service/g;->tw:Landroid/os/HandlerThread;

    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tw:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    :cond_0
    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tx:Landroid/os/HandlerThread;

    if-nez v0, :cond_1

    new-instance v0, Landroid/os/HandlerThread;

    const-class v1, Lcom/autochips/carplay/wired/a;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/autochips/carplay/service/g;->tx:Landroid/os/HandlerThread;

    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tx:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    :cond_1
    iget-object v0, p0, Lcom/autochips/carplay/service/g;->to:Lcom/autochips/carplay/wired/a;

    if-nez v0, :cond_2

    new-instance v0, Lcom/autochips/carplay/wired/a;

    iget-object v1, p0, Lcom/autochips/carplay/service/g;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/autochips/carplay/service/g;->tx:Landroid/os/HandlerThread;

    invoke-virtual {v2}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v2

    iget-object v3, p0, Lcom/autochips/carplay/service/g;->tk:Landroid/os/INetworkManagementService;

    iget-object v4, p0, Lcom/autochips/carplay/service/g;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/autochips/carplay/wired/a;-><init>(Landroid/content/Context;Landroid/os/Looper;Landroid/os/INetworkManagementService;Lcom/autochips/carplay/service/h;)V

    iput-object v0, p0, Lcom/autochips/carplay/service/g;->to:Lcom/autochips/carplay/wired/a;

    :cond_2
    iget-object v0, p0, Lcom/autochips/carplay/service/g;->ty:Landroid/os/HandlerThread;

    if-nez v0, :cond_3

    new-instance v0, Landroid/os/HandlerThread;

    const-class v1, Lcom/autochips/carplay/common/c;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/autochips/carplay/service/g;->ty:Landroid/os/HandlerThread;

    iget-object v0, p0, Lcom/autochips/carplay/service/g;->ty:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    :cond_3
    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tt:Lcom/autochips/carplay/common/c;

    if-nez v0, :cond_4

    new-instance v0, Lcom/autochips/carplay/common/c;

    iget-object v1, p0, Lcom/autochips/carplay/service/g;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/autochips/carplay/service/g;->ty:Landroid/os/HandlerThread;

    invoke-virtual {v2}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/autochips/carplay/common/c;-><init>(Landroid/content/Context;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/autochips/carplay/service/g;->tt:Lcom/autochips/carplay/common/c;

    :cond_4
    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tC:Landroid/os/HandlerThread;

    if-nez v0, :cond_5

    new-instance v0, Landroid/os/HandlerThread;

    const-class v1, Lcom/autochips/carplay/plugin/a;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/autochips/carplay/service/g;->tC:Landroid/os/HandlerThread;

    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tC:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    :cond_5
    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tp:Lcom/autochips/carplay/plugin/a;

    if-nez v0, :cond_6

    new-instance v0, Lcom/autochips/carplay/plugin/a;

    iget-object v1, p0, Lcom/autochips/carplay/service/g;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/autochips/carplay/service/g;->tC:Landroid/os/HandlerThread;

    invoke-virtual {v2}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/autochips/carplay/plugin/a;-><init>(Landroid/content/Context;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/autochips/carplay/service/g;->tp:Lcom/autochips/carplay/plugin/a;

    :cond_6
    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tr:Lcom/autochips/carplay/c/a;

    if-nez v0, :cond_7

    new-instance v0, Lcom/autochips/carplay/c/a;

    iget-object v1, p0, Lcom/autochips/carplay/service/g;->mContext:Landroid/content/Context;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/autochips/carplay/c/a;-><init>(Landroid/content/Context;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/autochips/carplay/service/g;->tr:Lcom/autochips/carplay/c/a;

    :cond_7
    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tA:Landroid/os/HandlerThread;

    if-nez v0, :cond_8

    new-instance v0, Landroid/os/HandlerThread;

    const-class v1, Lcom/autochips/carplay/c/e;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/autochips/carplay/service/g;->tA:Landroid/os/HandlerThread;

    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tA:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    :cond_8
    iget-object v0, p0, Lcom/autochips/carplay/service/g;->ts:Lcom/autochips/carplay/c/e;

    if-nez v0, :cond_9

    new-instance v0, Lcom/autochips/carplay/c/e;

    iget-object v1, p0, Lcom/autochips/carplay/service/g;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/autochips/carplay/service/g;->tA:Landroid/os/HandlerThread;

    invoke-virtual {v2}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/autochips/carplay/c/e;-><init>(Landroid/content/Context;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/autochips/carplay/service/g;->ts:Lcom/autochips/carplay/c/e;

    :cond_9
    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tB:Landroid/os/HandlerThread;

    if-nez v0, :cond_a

    new-instance v0, Landroid/os/HandlerThread;

    const-class v1, Lcom/autochips/carplay/a/a;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/autochips/carplay/service/g;->tB:Landroid/os/HandlerThread;

    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tB:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    :cond_a
    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tq:Lcom/autochips/carplay/a/a;

    if-nez v0, :cond_b

    new-instance v0, Lcom/autochips/carplay/a/a;

    iget-object v1, p0, Lcom/autochips/carplay/service/g;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/autochips/carplay/service/g;->tB:Landroid/os/HandlerThread;

    invoke-virtual {v2}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/autochips/carplay/a/a;-><init>(Landroid/content/Context;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/autochips/carplay/service/g;->tq:Lcom/autochips/carplay/a/a;

    :cond_b
    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tD:Landroid/os/HandlerThread;

    if-nez v0, :cond_c

    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "CarplayResourceManager"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/autochips/carplay/service/g;->tD:Landroid/os/HandlerThread;

    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tD:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    :cond_c
    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tv:Lcom/autochips/carplay/b/e;

    if-nez v0, :cond_d

    new-instance v0, Lcom/autochips/carplay/b/e;

    iget-object v1, p0, Lcom/autochips/carplay/service/g;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/autochips/carplay/service/g;->tD:Landroid/os/HandlerThread;

    invoke-virtual {v2}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/autochips/carplay/b/e;-><init>(Landroid/content/Context;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/autochips/carplay/service/g;->tv:Lcom/autochips/carplay/b/e;

    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tv:Lcom/autochips/carplay/b/e;

    iget-object v1, p0, Lcom/autochips/carplay/service/g;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    iget-object v2, p0, Lcom/autochips/carplay/service/g;->tr:Lcom/autochips/carplay/c/a;

    invoke-virtual {v0, v1, v2}, Lcom/autochips/carplay/b/e;->a(Lcom/autochips/carplay/service/h;Lcom/autochips/carplay/c/a;)V

    :cond_d
    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tu:Lcom/autochips/carplay/b/d;

    if-nez v0, :cond_e

    new-instance v0, Lcom/autochips/carplay/b/d;

    iget-object v1, p0, Lcom/autochips/carplay/service/g;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/autochips/carplay/service/g;->tD:Landroid/os/HandlerThread;

    invoke-virtual {v2}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/autochips/carplay/b/d;-><init>(Landroid/content/Context;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/autochips/carplay/service/g;->tu:Lcom/autochips/carplay/b/d;

    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tu:Lcom/autochips/carplay/b/d;

    iget-object v1, p0, Lcom/autochips/carplay/service/g;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    iget-object v2, p0, Lcom/autochips/carplay/service/g;->tr:Lcom/autochips/carplay/c/a;

    invoke-virtual {v0, v1, v2}, Lcom/autochips/carplay/b/d;->a(Lcom/autochips/carplay/service/h;Lcom/autochips/carplay/c/a;)V

    :cond_e
    new-instance v0, Lcom/autochips/carplay/service/i;

    iget-object v4, p0, Lcom/autochips/carplay/service/g;->to:Lcom/autochips/carplay/wired/a;

    iget-object v5, p0, Lcom/autochips/carplay/service/g;->tp:Lcom/autochips/carplay/plugin/a;

    iget-object v6, p0, Lcom/autochips/carplay/service/g;->tq:Lcom/autochips/carplay/a/a;

    iget-object v7, p0, Lcom/autochips/carplay/service/g;->tr:Lcom/autochips/carplay/c/a;

    iget-object v8, p0, Lcom/autochips/carplay/service/g;->ts:Lcom/autochips/carplay/c/e;

    iget-object v9, p0, Lcom/autochips/carplay/service/g;->tt:Lcom/autochips/carplay/common/c;

    iget-object v10, p0, Lcom/autochips/carplay/service/g;->tk:Landroid/os/INetworkManagementService;

    iget-object v11, p0, Lcom/autochips/carplay/service/g;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    move-object v3, v0

    invoke-direct/range {v3 .. v11}, Lcom/autochips/carplay/service/i;-><init>(Lcom/autochips/carplay/wired/a;Lcom/autochips/carplay/plugin/a;Lcom/autochips/carplay/a/a;Lcom/autochips/carplay/c/a;Lcom/autochips/carplay/c/e;Lcom/autochips/carplay/common/c;Landroid/os/INetworkManagementService;Lcom/autochips/carplay/service/h;)V

    iput-object v0, p0, Lcom/autochips/carplay/service/g;->ta:Lcom/autochips/carplay/service/i;

    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tl:Lcom/autochips/carplay/service/CarplayService;

    invoke-static {v0}, Lcom/autochips/carplay/service/a;->a(Lcom/autochips/carplay/service/CarplayService;)Lcom/autochips/carplay/service/a;

    move-result-object v0

    iput-object v0, p0, Lcom/autochips/carplay/service/g;->tm:Lcom/autochips/carplay/service/a;

    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tm:Lcom/autochips/carplay/service/a;

    iget-object v1, p0, Lcom/autochips/carplay/service/g;->ta:Lcom/autochips/carplay/service/i;

    iget-object v2, p0, Lcom/autochips/carplay/service/g;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {v0, v1, v2}, Lcom/autochips/carplay/service/a;->a(Lcom/autochips/carplay/service/i;Lcom/autochips/carplay/service/h;)V

    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tm:Lcom/autochips/carplay/service/a;

    invoke-virtual {v0}, Lcom/autochips/carplay/service/a;->start()V

    new-instance v0, Lcom/autochips/carplay/service/ad;

    iget-object v1, p0, Lcom/autochips/carplay/service/g;->tm:Lcom/autochips/carplay/service/a;

    invoke-direct {v0, v1}, Lcom/autochips/carplay/service/ad;-><init>(Lcom/autochips/carplay/service/a;)V

    iput-object v0, p0, Lcom/autochips/carplay/service/g;->tG:Lcom/autochips/carplay/service/ad;

    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tl:Lcom/autochips/carplay/service/CarplayService;

    invoke-static {v0}, Lcom/autochips/carplay/service/p;->l(Lcom/autochips/carplay/service/CarplayService;)Lcom/autochips/carplay/service/p;

    move-result-object v0

    iput-object v0, p0, Lcom/autochips/carplay/service/g;->tn:Lcom/autochips/carplay/service/p;

    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tn:Lcom/autochips/carplay/service/p;

    iget-object v1, p0, Lcom/autochips/carplay/service/g;->ta:Lcom/autochips/carplay/service/i;

    iget-object v2, p0, Lcom/autochips/carplay/service/g;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    iget-object v3, p0, Lcom/autochips/carplay/service/g;->tv:Lcom/autochips/carplay/b/e;

    iget-object v4, p0, Lcom/autochips/carplay/service/g;->tu:Lcom/autochips/carplay/b/d;

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/autochips/carplay/service/p;->a(Lcom/autochips/carplay/service/i;Lcom/autochips/carplay/service/h;Lcom/autochips/carplay/b/e;Lcom/autochips/carplay/b/d;)V

    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tn:Lcom/autochips/carplay/service/p;

    invoke-virtual {v0}, Lcom/autochips/carplay/service/p;->start()V

    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tE:Landroid/os/HandlerThread;

    if-nez v0, :cond_f

    new-instance v0, Landroid/os/HandlerThread;

    const-class v1, Lcom/autochips/carplay/b/a;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/autochips/carplay/service/g;->tE:Landroid/os/HandlerThread;

    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tE:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    new-instance v0, Lcom/autochips/carplay/b/a;

    iget-object v1, p0, Lcom/autochips/carplay/service/g;->tE:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    iget-object v2, p0, Lcom/autochips/carplay/service/g;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-direct {v0, v1, v2}, Lcom/autochips/carplay/b/a;-><init>(Landroid/os/Looper;Lcom/autochips/carplay/service/h;)V

    iput-object v0, p0, Lcom/autochips/carplay/service/g;->tF:Lcom/autochips/carplay/b/a;

    iget-object v0, p0, Lcom/autochips/carplay/service/g;->tF:Lcom/autochips/carplay/b/a;

    invoke-virtual {v0}, Lcom/autochips/carplay/b/a;->da()V

    :cond_f
    return-void
.end method
