.class public Landroid/net/a/d;
.super Lcom/android/internal/util/StateMachine;


# static fields
.field private static final DBG:Z

.field private static final eu:Landroid/util/SparseArray;

.field private static final ev:Ljava/util/concurrent/ConcurrentHashMap;

.field private static final ew:Ljava/util/concurrent/ConcurrentHashMap;

.field private static final sMessageClasses:[Ljava/lang/Class;


# instance fields
.field private ax:Landroid/net/util/b;

.field private final ay:Landroid/net/metrics/IpConnectivityLog;

.field private dn:Lcom/android/internal/util/State;

.field private final eA:Ljava/lang/String;

.field private final eB:Ljava/lang/String;

.field private final eC:Landroid/net/a/j;

.field private final eD:Ljava/util/concurrent/CountDownLatch;

.field private final eE:Landroid/os/INetworkManagementService;

.field private final eF:Lcom/android/server/net/NetlinkTracker;

.field private final eG:Lcom/android/internal/util/WakeupMessage;

.field private final eH:Lcom/android/internal/util/WakeupMessage;

.field private final eI:Landroid/util/LocalLog;

.field private final eJ:Landroid/net/a/m;

.field private final eK:Landroid/net/a/c;

.field private eL:Landroid/net/LinkProperties;

.field private eM:Landroid/net/a/n;

.field private eN:Landroid/net/util/c;

.field private eO:Landroid/net/a/v;

.field private eP:Landroid/net/dhcp/b;

.field private eQ:Landroid/net/DhcpResults;

.field private eR:Ljava/lang/String;

.field private eS:Landroid/net/ProxyInfo;

.field private eT:Landroid/net/apf/ApfFilter;

.field private eU:Z

.field private eV:J

.field private final eW:Landroid/os/ConditionVariable;

.field private final et:Landroid/net/util/SharedLog;

.field private final ex:Lcom/android/internal/util/State;

.field private final ey:Lcom/android/internal/util/State;

.field private ez:Lcom/android/internal/util/State;

.field protected final mCallback:Landroid/net/a/i;
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation
.end field

.field private final mContext:Landroid/content/Context;

.field private final mTag:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    sget-boolean v0, Landroid/os/Build;->IS_USER:Z

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    sput-boolean v0, Landroid/net/a/d;->DBG:Z

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Class;

    const/4 v2, 0x0

    const-class v3, Landroid/net/a/d;

    aput-object v3, v0, v2

    const-class v2, Landroid/net/dhcp/b;

    aput-object v2, v0, v1

    sput-object v0, Landroid/net/a/d;->sMessageClasses:[Ljava/lang/Class;

    invoke-static {v0}, Lcom/android/internal/util/MessageUtils;->findMessageNames([Ljava/lang/Class;)Landroid/util/SparseArray;

    move-result-object v0

    sput-object v0, Landroid/net/a/d;->eu:Landroid/util/SparseArray;

    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Landroid/net/a/d;->ev:Ljava/util/concurrent/ConcurrentHashMap;

    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Landroid/net/a/d;->ew:Ljava/util/concurrent/ConcurrentHashMap;

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Ljava/lang/String;Landroid/net/a/i;Landroid/net/a/j;)V
    .locals 7
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-class v1, Landroid/net/a/d;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/internal/util/StateMachine;-><init>(Ljava/lang/String;)V

    new-instance v0, Landroid/net/a/r;

    invoke-direct {v0, p0}, Landroid/net/a/r;-><init>(Landroid/net/a/d;)V

    iput-object v0, p0, Landroid/net/a/d;->ex:Lcom/android/internal/util/State;

    new-instance v0, Landroid/net/a/p;

    invoke-direct {v0, p0}, Landroid/net/a/p;-><init>(Landroid/net/a/d;)V

    iput-object v0, p0, Landroid/net/a/d;->ey:Lcom/android/internal/util/State;

    new-instance v0, Landroid/net/metrics/IpConnectivityLog;

    invoke-direct {v0}, Landroid/net/metrics/IpConnectivityLog;-><init>()V

    iput-object v0, p0, Landroid/net/a/d;->ay:Landroid/net/metrics/IpConnectivityLog;

    new-instance v0, Landroid/os/ConditionVariable;

    invoke-direct {v0}, Landroid/os/ConditionVariable;-><init>()V

    iput-object v0, p0, Landroid/net/a/d;->eW:Landroid/os/ConditionVariable;

    invoke-static {p2}, Lcom/android/internal/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p3}, Lcom/android/internal/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Landroid/net/a/d;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/net/a/d;->mTag:Ljava/lang/String;

    iput-object p1, p0, Landroid/net/a/d;->mContext:Landroid/content/Context;

    iput-object p2, p0, Landroid/net/a/d;->eA:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "v4-"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/net/a/d;->eB:Ljava/lang/String;

    new-instance v0, Landroid/net/a/l;

    invoke-direct {v0, p0, p3}, Landroid/net/a/l;-><init>(Landroid/net/a/d;Landroid/net/a/i;)V

    iput-object v0, p0, Landroid/net/a/d;->mCallback:Landroid/net/a/i;

    iput-object p4, p0, Landroid/net/a/d;->eC:Landroid/net/a/j;

    new-instance p3, Ljava/util/concurrent/CountDownLatch;

    const/4 p4, 0x1

    invoke-direct {p3, p4}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    iput-object p3, p0, Landroid/net/a/d;->eD:Ljava/util/concurrent/CountDownLatch;

    const-string p3, "network_management"

    invoke-static {p3}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object p3

    invoke-static {p3}, Landroid/os/INetworkManagementService$Stub;->asInterface(Landroid/os/IBinder;)Landroid/os/INetworkManagementService;

    move-result-object p3

    iput-object p3, p0, Landroid/net/a/d;->eE:Landroid/os/INetworkManagementService;

    sget-object p3, Landroid/net/a/d;->ev:Ljava/util/concurrent/ConcurrentHashMap;

    iget-object v0, p0, Landroid/net/a/d;->eA:Ljava/lang/String;

    new-instance v1, Landroid/net/util/SharedLog;

    iget-object v2, p0, Landroid/net/a/d;->mTag:Ljava/lang/String;

    invoke-direct {v1, v2}, Landroid/net/util/SharedLog;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p3, Landroid/net/a/d;->ev:Ljava/util/concurrent/ConcurrentHashMap;

    iget-object v0, p0, Landroid/net/a/d;->eA:Ljava/lang/String;

    invoke-virtual {p3, v0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroid/net/util/SharedLog;

    iput-object p3, p0, Landroid/net/a/d;->et:Landroid/net/util/SharedLog;

    sget-object p3, Landroid/net/a/d;->ew:Ljava/util/concurrent/ConcurrentHashMap;

    iget-object v0, p0, Landroid/net/a/d;->eA:Ljava/lang/String;

    new-instance v1, Landroid/util/LocalLog;

    const/16 v2, 0x64

    invoke-direct {v1, v2}, Landroid/util/LocalLog;-><init>(I)V

    invoke-virtual {p3, v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p3, Landroid/net/a/d;->ew:Ljava/util/concurrent/ConcurrentHashMap;

    iget-object v0, p0, Landroid/net/a/d;->eA:Ljava/lang/String;

    invoke-virtual {p3, v0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroid/util/LocalLog;

    iput-object p3, p0, Landroid/net/a/d;->eI:Landroid/util/LocalLog;

    new-instance p3, Landroid/net/a/m;

    const/4 v0, 0x0

    invoke-direct {p3, v0}, Landroid/net/a/m;-><init>(B)V

    iput-object p3, p0, Landroid/net/a/d;->eJ:Landroid/net/a/m;

    new-instance p3, Landroid/net/a/c;

    iget-object v1, p0, Landroid/net/a/d;->eA:Ljava/lang/String;

    iget-object v2, p0, Landroid/net/a/d;->eE:Landroid/os/INetworkManagementService;

    invoke-static {}, Landroid/net/util/f;->aC()Landroid/net/INetd;

    move-result-object v3

    iget-object v4, p0, Landroid/net/a/d;->et:Landroid/net/util/SharedLog;

    invoke-direct {p3, v1, v2, v3, v4}, Landroid/net/a/c;-><init>(Ljava/lang/String;Landroid/os/INetworkManagementService;Landroid/net/INetd;Landroid/net/util/SharedLog;)V

    iput-object p3, p0, Landroid/net/a/d;->eK:Landroid/net/a/c;

    new-instance p3, Landroid/net/a/f;

    iget-object v1, p0, Landroid/net/a/d;->eA:Ljava/lang/String;

    new-instance v2, Landroid/net/a/e;

    invoke-direct {v2, p0}, Landroid/net/a/e;-><init>(Landroid/net/a/d;)V

    invoke-direct {p3, p0, v1, v2}, Landroid/net/a/f;-><init>(Landroid/net/a/d;Ljava/lang/String;Lcom/android/server/net/NetlinkTracker$Callback;)V

    iput-object p3, p0, Landroid/net/a/d;->eF:Lcom/android/server/net/NetlinkTracker;

    new-instance p3, Landroid/net/LinkProperties;

    invoke-direct {p3}, Landroid/net/LinkProperties;-><init>()V

    iput-object p3, p0, Landroid/net/a/d;->eL:Landroid/net/LinkProperties;

    iget-object p3, p0, Landroid/net/a/d;->eL:Landroid/net/LinkProperties;

    iget-object v1, p0, Landroid/net/a/d;->eA:Ljava/lang/String;

    invoke-virtual {p3, v1}, Landroid/net/LinkProperties;->setInterfaceName(Ljava/lang/String;)V

    new-instance p3, Lcom/android/internal/util/WakeupMessage;

    iget-object v1, p0, Landroid/net/a/d;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/net/a/d;->getHandler()Landroid/os/Handler;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Landroid/net/a/d;->mTag:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ".EVENT_PROVISIONING_TIMEOUT"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0xa

    invoke-direct {p3, v1, v2, v3, v4}, Lcom/android/internal/util/WakeupMessage;-><init>(Landroid/content/Context;Landroid/os/Handler;Ljava/lang/String;I)V

    iput-object p3, p0, Landroid/net/a/d;->eG:Lcom/android/internal/util/WakeupMessage;

    new-instance p3, Lcom/android/internal/util/WakeupMessage;

    iget-object v1, p0, Landroid/net/a/d;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/net/a/d;->getHandler()Landroid/os/Handler;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Landroid/net/a/d;->mTag:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ".EVENT_DHCPACTION_TIMEOUT"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0xb

    invoke-direct {p3, v1, v2, v3, v4}, Lcom/android/internal/util/WakeupMessage;-><init>(Landroid/content/Context;Landroid/os/Handler;Ljava/lang/String;I)V

    iput-object p3, p0, Landroid/net/a/d;->eH:Lcom/android/internal/util/WakeupMessage;

    const/4 p3, 0x4

    const/4 v1, 0x3

    const/4 v2, 0x2

    :try_start_0
    new-instance v3, Ldalvik/system/PathClassLoader;

    const-string v4, "/system/framework/mediatek-framework-net.jar"

    iget-object v5, p0, Landroid/net/a/d;->mContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Ldalvik/system/PathClassLoader;-><init>(Ljava/lang/String;Ljava/lang/ClassLoader;)V

    const-string v4, "com.mediatek.net.ip.MtkIpRunningState"

    invoke-virtual {v3, v4}, Ldalvik/system/PathClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    const/4 v4, 0x5

    new-array v5, v4, [Ljava/lang/Class;

    const-class v6, Landroid/content/Context;

    aput-object v6, v5, v0

    const-class v6, Landroid/net/a/d;

    aput-object v6, v5, p4

    const-class v6, Ljava/lang/String;

    aput-object v6, v5, v2

    const-class v6, Lcom/android/server/net/NetlinkTracker;

    aput-object v6, v5, v1

    const-class v6, Lcom/android/internal/util/State;

    aput-object v6, v5, p3

    invoke-virtual {v3, v5}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v3

    invoke-virtual {v3, p4}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    new-array v4, v4, [Ljava/lang/Object;

    aput-object p1, v4, v0

    aput-object p0, v4, p4

    aput-object p2, v4, v2

    iget-object v5, p0, Landroid/net/a/d;->eF:Lcom/android/server/net/NetlinkTracker;

    aput-object v5, v4, v1

    new-instance v5, Landroid/net/a/o;

    invoke-direct {v5, p0}, Landroid/net/a/o;-><init>(Landroid/net/a/d;)V

    aput-object v5, v4, p3

    invoke-virtual {v3, v4}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/internal/util/State;

    iput-object v3, p0, Landroid/net/a/d;->ez:Lcom/android/internal/util/State;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v3

    const-string v4, "No MtkIpRunningState! Used AOSP for instead! %s"

    new-array v5, p4, [Ljava/lang/Object;

    aput-object v3, v5, v0

    invoke-direct {p0, v4, v5}, Landroid/net/a/d;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v3, Landroid/net/a/o;

    invoke-direct {v3, p0}, Landroid/net/a/o;-><init>(Landroid/net/a/d;)V

    iput-object v3, p0, Landroid/net/a/d;->ez:Lcom/android/internal/util/State;

    :goto_0
    :try_start_1
    new-instance v3, Ldalvik/system/PathClassLoader;

    const-string v4, "/system/framework/mediatek-framework-net.jar"

    iget-object v5, p0, Landroid/net/a/d;->mContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Ldalvik/system/PathClassLoader;-><init>(Ljava/lang/String;Ljava/lang/ClassLoader;)V

    const-string v4, "com.mediatek.net.ip.MtkIpStoppedState"

    invoke-virtual {v3, v4}, Ldalvik/system/PathClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    new-array v4, p3, [Ljava/lang/Class;

    const-class v5, Landroid/content/Context;

    aput-object v5, v4, v0

    const-class v5, Landroid/net/a/d;

    aput-object v5, v4, p4

    const-class v5, Ljava/lang/String;

    aput-object v5, v4, v2

    const-class v5, Lcom/android/internal/util/State;

    aput-object v5, v4, v1

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v3

    invoke-virtual {v3, p4}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    new-array p3, p3, [Ljava/lang/Object;

    aput-object p1, p3, v0

    aput-object p0, p3, p4

    aput-object p2, p3, v2

    new-instance p1, Landroid/net/a/q;

    invoke-direct {p1, p0}, Landroid/net/a/q;-><init>(Landroid/net/a/d;)V

    aput-object p1, p3, v1

    invoke-virtual {v3, p3}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/internal/util/State;

    iput-object p1, p0, Landroid/net/a/d;->dn:Lcom/android/internal/util/State;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception p1

    const-string p2, "No mtkStoppedClass! Used AOSP for instead! %s"

    new-array p3, p4, [Ljava/lang/Object;

    aput-object p1, p3, v0

    invoke-direct {p0, p2, p3}, Landroid/net/a/d;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance p1, Landroid/net/a/q;

    invoke-direct {p1, p0}, Landroid/net/a/q;-><init>(Landroid/net/a/d;)V

    iput-object p1, p0, Landroid/net/a/d;->dn:Lcom/android/internal/util/State;

    :goto_1
    iget-object p1, p0, Landroid/net/a/d;->dn:Lcom/android/internal/util/State;

    invoke-virtual {p0, p1}, Landroid/net/a/d;->addState(Lcom/android/internal/util/State;)V

    iget-object p1, p0, Landroid/net/a/d;->ey:Lcom/android/internal/util/State;

    invoke-virtual {p0, p1}, Landroid/net/a/d;->addState(Lcom/android/internal/util/State;)V

    iget-object p1, p0, Landroid/net/a/d;->ez:Lcom/android/internal/util/State;

    iget-object p2, p0, Landroid/net/a/d;->ey:Lcom/android/internal/util/State;

    invoke-virtual {p0, p1, p2}, Landroid/net/a/d;->addState(Lcom/android/internal/util/State;Lcom/android/internal/util/State;)V

    iget-object p1, p0, Landroid/net/a/d;->ex:Lcom/android/internal/util/State;

    invoke-virtual {p0, p1}, Landroid/net/a/d;->addState(Lcom/android/internal/util/State;)V

    iget-object p1, p0, Landroid/net/a/d;->dn:Lcom/android/internal/util/State;

    invoke-virtual {p0, p1}, Landroid/net/a/d;->setInitialState(Lcom/android/internal/util/State;)V

    invoke-super {p0}, Lcom/android/internal/util/StateMachine;->start()V

    :try_start_2
    iget-object p1, p0, Landroid/net/a/d;->eE:Landroid/os/INetworkManagementService;

    iget-object p2, p0, Landroid/net/a/d;->eF:Lcom/android/server/net/NetlinkTracker;

    invoke-interface {p1, p2}, Landroid/os/INetworkManagementService;->registerObserver(Landroid/net/INetworkManagementEventObserver;)V
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_2

    return-void

    :catch_2
    move-exception p1

    const-string p2, "Couldn\'t register NetlinkTracker: %s"

    new-array p3, p4, [Ljava/lang/Object;

    aput-object p1, p3, v0

    invoke-direct {p0, p2, p3}, Landroid/net/a/d;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic A(Landroid/net/a/d;)Z
    .locals 2

    iget-object v0, p0, Landroid/net/a/d;->eM:Landroid/net/a/n;

    iget-object v0, v0, Landroid/net/a/n;->fl:Landroid/net/StaticIpConfiguration;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/net/a/d;->eK:Landroid/net/a/c;

    iget-object v1, p0, Landroid/net/a/d;->eM:Landroid/net/a/n;

    iget-object v1, v1, Landroid/net/a/n;->fl:Landroid/net/StaticIpConfiguration;

    iget-object v1, v1, Landroid/net/StaticIpConfiguration;->ipAddress:Landroid/net/LinkAddress;

    invoke-virtual {v0, v1}, Landroid/net/a/c;->a(Landroid/net/LinkAddress;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Landroid/net/DhcpResults;

    iget-object v1, p0, Landroid/net/a/d;->eM:Landroid/net/a/n;

    iget-object v1, v1, Landroid/net/a/n;->fl:Landroid/net/StaticIpConfiguration;

    invoke-direct {v0, v1}, Landroid/net/DhcpResults;-><init>(Landroid/net/StaticIpConfiguration;)V

    invoke-direct {p0, v0}, Landroid/net/a/d;->a(Landroid/net/DhcpResults;)V

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    iget-object v0, p0, Landroid/net/a/d;->mContext:Landroid/content/Context;

    iget-object v1, p0, Landroid/net/a/d;->ax:Landroid/net/util/b;

    invoke-static {v0, p0, v1}, Landroid/net/dhcp/b;->a(Landroid/content/Context;Lcom/android/internal/util/StateMachine;Landroid/net/util/b;)Landroid/net/dhcp/b;

    move-result-object v0

    iput-object v0, p0, Landroid/net/a/d;->eP:Landroid/net/dhcp/b;

    iget-object v0, p0, Landroid/net/a/d;->eP:Landroid/net/dhcp/b;

    invoke-virtual {v0}, Landroid/net/dhcp/b;->J()V

    iget-object p0, p0, Landroid/net/a/d;->eP:Landroid/net/dhcp/b;

    const v0, 0x30001

    invoke-virtual {p0, v0}, Landroid/net/dhcp/b;->sendMessage(I)V

    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method static synthetic B(Landroid/net/a/d;)Landroid/net/util/c;
    .locals 0

    iget-object p0, p0, Landroid/net/a/d;->eN:Landroid/net/util/c;

    return-object p0
.end method

.method static synthetic C(Landroid/net/a/d;)Z
    .locals 0

    invoke-direct {p0}, Landroid/net/a/d;->ad()Z

    move-result p0

    return p0
.end method

.method static synthetic D(Landroid/net/a/d;)Landroid/net/a/v;
    .locals 0

    iget-object p0, p0, Landroid/net/a/d;->eO:Landroid/net/a/v;

    return-object p0
.end method

.method static synthetic E(Landroid/net/a/d;)Landroid/net/a/v;
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/net/a/d;->eO:Landroid/net/a/v;

    return-object v0
.end method

.method static synthetic F(Landroid/net/a/d;)Landroid/util/LocalLog;
    .locals 0

    iget-object p0, p0, Landroid/net/a/d;->eI:Landroid/util/LocalLog;

    return-object p0
.end method

.method static synthetic G(Landroid/net/a/d;)Lcom/android/internal/util/WakeupMessage;
    .locals 0

    iget-object p0, p0, Landroid/net/a/d;->eH:Lcom/android/internal/util/WakeupMessage;

    return-object p0
.end method

.method static synthetic H(Landroid/net/a/d;)Landroid/os/ConditionVariable;
    .locals 0

    iget-object p0, p0, Landroid/net/a/d;->eW:Landroid/os/ConditionVariable;

    return-object p0
.end method

.method static synthetic I(Landroid/net/a/d;)V
    .locals 3

    iget-object v0, p0, Landroid/net/a/d;->eK:Landroid/net/a/c;

    invoke-virtual {v0}, Landroid/net/a/c;->W()Z

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/net/a/d;->eQ:Landroid/net/DhcpResults;

    sget-boolean v1, Landroid/net/a/d;->DBG:Z

    if-eqz v1, :cond_0

    iget-object v1, p0, Landroid/net/a/d;->mTag:Ljava/lang/String;

    const-string v2, "onNewDhcpResults(null)"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    iget-object v1, p0, Landroid/net/a/d;->mCallback:Landroid/net/a/i;

    invoke-virtual {v1, v0}, Landroid/net/a/i;->b(Landroid/net/DhcpResults;)V

    invoke-direct {p0}, Landroid/net/a/d;->ac()V

    return-void
.end method

.method static synthetic a(Landroid/net/a/d;J)J
    .locals 0

    iput-wide p1, p0, Landroid/net/a/d;->eV:J

    return-wide p1
.end method

.method static synthetic a(Landroid/net/a/d;Landroid/net/ProxyInfo;)Landroid/net/ProxyInfo;
    .locals 0

    iput-object p1, p0, Landroid/net/a/d;->eS:Landroid/net/ProxyInfo;

    return-object p1
.end method

.method static synthetic a(Landroid/net/a/d;Landroid/net/a/n;)Landroid/net/a/n;
    .locals 0

    iput-object p1, p0, Landroid/net/a/d;->eM:Landroid/net/a/n;

    return-object p1
.end method

.method static synthetic a(Landroid/net/a/d;Landroid/net/apf/ApfFilter;)Landroid/net/apf/ApfFilter;
    .locals 0

    iput-object p1, p0, Landroid/net/a/d;->eT:Landroid/net/apf/ApfFilter;

    return-object p1
.end method

.method static synthetic a(Landroid/net/a/d;)Landroid/net/util/SharedLog;
    .locals 0

    iget-object p0, p0, Landroid/net/a/d;->et:Landroid/net/util/SharedLog;

    return-object p0
.end method

.method static synthetic a(Landroid/net/a/d;Landroid/net/util/c;)Landroid/net/util/c;
    .locals 0

    iput-object p1, p0, Landroid/net/a/d;->eN:Landroid/net/util/c;

    return-object p1
.end method

.method static synthetic a(Landroid/net/a/d;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Landroid/net/a/d;->eR:Ljava/lang/String;

    return-object p1
.end method

.method static a(Ljava/lang/String;Ljava/util/Collection;)Ljava/lang/String;
    .locals 1

    invoke-interface {p1}, Ljava/util/Collection;->stream()Ljava/util/stream/Stream;

    move-result-object p1

    sget-object v0, Landroid/net/a/-$$Lambda$d$JsVbJ5mpbRjwJuW_A3bDJMqYpF0;->INSTANCE:Landroid/net/a/-$$Lambda$d$JsVbJ5mpbRjwJuW_A3bDJMqYpF0;

    invoke-interface {p1, v0}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    move-result-object p1

    invoke-static {p0}, Ljava/util/stream/Collectors;->joining(Ljava/lang/CharSequence;)Ljava/util/stream/Collector;

    move-result-object p0

    invoke-interface {p1, p0}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method private a(Landroid/net/DhcpResults;)V
    .locals 5

    new-instance v0, Landroid/net/DhcpResults;

    invoke-direct {v0, p1}, Landroid/net/DhcpResults;-><init>(Landroid/net/DhcpResults;)V

    iput-object v0, p0, Landroid/net/a/d;->eQ:Landroid/net/DhcpResults;

    invoke-direct {p0}, Landroid/net/a/d;->ab()Landroid/net/LinkProperties;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/net/a/d;->b(Landroid/net/LinkProperties;)Landroid/net/LinkProperties$ProvisioningChange;

    move-result-object v1

    sget-boolean v2, Landroid/net/a/d;->DBG:Z

    if-eqz v2, :cond_0

    iget-object v2, p0, Landroid/net/a/d;->mTag:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "onNewDhcpResults("

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    iget-object v2, p0, Landroid/net/a/d;->mCallback:Landroid/net/a/i;

    invoke-virtual {v2, p1}, Landroid/net/a/i;->b(Landroid/net/DhcpResults;)V

    invoke-direct {p0, v1, v0}, Landroid/net/a/d;->a(Landroid/net/LinkProperties$ProvisioningChange;Landroid/net/LinkProperties;)V

    return-void
.end method

.method private a(Landroid/net/LinkProperties$ProvisioningChange;Landroid/net/LinkProperties;)V
    .locals 1

    sget-object v0, Landroid/net/a/h;->eY:[I

    invoke-virtual {p1}, Landroid/net/LinkProperties$ProvisioningChange;->ordinal()I

    move-result p1

    aget p1, v0, p1

    packed-switch p1, :pswitch_data_0

    sget-boolean p1, Landroid/net/a/d;->DBG:Z

    if-eqz p1, :cond_2

    iget-object p1, p0, Landroid/net/a/d;->mTag:Ljava/lang/String;

    const-string v0, "onLinkPropertiesChange()"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :pswitch_0
    sget-boolean p1, Landroid/net/a/d;->DBG:Z

    if-eqz p1, :cond_0

    iget-object p1, p0, Landroid/net/a/d;->mTag:Ljava/lang/String;

    const-string v0, "onProvisioningFailure()"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    const/4 p1, 0x2

    invoke-direct {p0, p1}, Landroid/net/a/d;->g(I)V

    iget-object p1, p0, Landroid/net/a/d;->mCallback:Landroid/net/a/i;

    invoke-virtual {p1, p2}, Landroid/net/a/i;->d(Landroid/net/LinkProperties;)V

    return-void

    :pswitch_1
    sget-boolean p1, Landroid/net/a/d;->DBG:Z

    if-eqz p1, :cond_1

    iget-object p1, p0, Landroid/net/a/d;->mTag:Ljava/lang/String;

    const-string v0, "onProvisioningSuccess()"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    const/4 p1, 0x1

    invoke-direct {p0, p1}, Landroid/net/a/d;->g(I)V

    iget-object p1, p0, Landroid/net/a/d;->mCallback:Landroid/net/a/i;

    invoke-virtual {p1, p2}, Landroid/net/a/i;->c(Landroid/net/LinkProperties;)V

    return-void

    :cond_2
    :goto_0
    iget-object p1, p0, Landroid/net/a/d;->mCallback:Landroid/net/a/i;

    invoke-virtual {p1, p2}, Landroid/net/a/i;->e(Landroid/net/LinkProperties;)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static a(Landroid/net/LinkProperties;Ljava/lang/Iterable;)V
    .locals 2

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/InetAddress;

    invoke-virtual {v0}, Ljava/net/InetAddress;->isAnyLocalAddress()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {p0, v0}, Landroid/net/LinkProperties;->isReachable(Ljava/net/InetAddress;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p0, v0}, Landroid/net/LinkProperties;->addDnsServer(Ljava/net/InetAddress;)Z

    goto :goto_0

    :cond_1
    return-void
.end method

.method static synthetic a(Landroid/net/a/d;I)V
    .locals 4

    const-string v0, "onProvisioningFailure(): %s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-direct {p0, v0, v1}, Landroid/net/a/d;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-direct {p0, p1}, Landroid/net/a/d;->g(I)V

    iget-object p1, p0, Landroid/net/a/d;->mCallback:Landroid/net/a/i;

    new-instance v0, Landroid/net/LinkProperties;

    iget-object p0, p0, Landroid/net/a/d;->eL:Landroid/net/LinkProperties;

    invoke-direct {v0, p0}, Landroid/net/LinkProperties;-><init>(Landroid/net/LinkProperties;)V

    invoke-virtual {p1, v0}, Landroid/net/a/i;->d(Landroid/net/LinkProperties;)V

    return-void
.end method

.method static synthetic a(Landroid/net/a/d;Landroid/net/DhcpResults;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/net/a/d;->a(Landroid/net/DhcpResults;)V

    return-void
.end method

.method static synthetic a(Landroid/net/a/d;Landroid/net/LinkProperties$ProvisioningChange;Landroid/net/LinkProperties;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Landroid/net/a/d;->a(Landroid/net/LinkProperties$ProvisioningChange;Landroid/net/LinkProperties;)V

    return-void
.end method

.method static synthetic a(Landroid/net/a/d;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Landroid/net/a/d;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method private varargs a(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "ERROR "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iget-object p2, p0, Landroid/net/a/d;->mTag:Ljava/lang/String;

    invoke-static {p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p2, p0, Landroid/net/a/d;->et:Landroid/net/util/SharedLog;

    invoke-virtual {p2, p1}, Landroid/net/util/SharedLog;->log(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic a(Landroid/net/a/d;Landroid/net/a/k;)Z
    .locals 3

    iget-object p1, p1, Landroid/net/a/k;->eZ:Ljava/util/Set;

    sget-object v0, Landroid/net/a/-$$Lambda$d$GdLECAc1sQEo2Jjde3Y4ykVjDBg;->INSTANCE:Landroid/net/a/-$$Lambda$d$GdLECAc1sQEo2Jjde3Y4ykVjDBg;

    invoke-interface {p1}, Ljava/util/Collection;->stream()Ljava/util/stream/Stream;

    move-result-object p1

    invoke-interface {p1, v0}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    move-result-object p1

    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/LinkAddress;

    iget-object v1, p0, Landroid/net/a/d;->eK:Landroid/net/a/c;

    invoke-virtual {v0}, Landroid/net/LinkAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v2

    invoke-virtual {v0}, Landroid/net/LinkAddress;->getPrefixLength()I

    move-result v0

    invoke-virtual {v1, v2, v0}, Landroid/net/a/c;->addAddress(Ljava/net/InetAddress;I)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_1
    const/4 p0, 0x1

    return p0
.end method

.method static synthetic a(Landroid/net/a/d;Z)Z
    .locals 3

    invoke-direct {p0}, Landroid/net/a/d;->ab()Landroid/net/LinkProperties;

    move-result-object v0

    iget-object v1, p0, Landroid/net/a/d;->eL:Landroid/net/LinkProperties;

    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    return v2

    :cond_0
    invoke-direct {p0, v0}, Landroid/net/a/d;->b(Landroid/net/LinkProperties;)Landroid/net/LinkProperties$ProvisioningChange;

    move-result-object v1

    if-eqz p1, :cond_1

    invoke-direct {p0, v1, v0}, Landroid/net/a/d;->a(Landroid/net/LinkProperties$ProvisioningChange;Landroid/net/LinkProperties;)V

    :cond_1
    sget-object p0, Landroid/net/LinkProperties$ProvisioningChange;->LOST_PROVISIONING:Landroid/net/LinkProperties$ProvisioningChange;

    if-eq v1, p0, :cond_2

    return v2

    :cond_2
    const/4 p0, 0x0

    return p0
.end method

.method static a(Ljava/lang/Iterable;Ljava/util/function/Predicate;)Z
    .locals 1

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/function/Predicate;->test(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method private ab()Landroid/net/LinkProperties;
    .locals 8

    new-instance v0, Landroid/net/LinkProperties;

    invoke-direct {v0}, Landroid/net/LinkProperties;-><init>()V

    iget-object v1, p0, Landroid/net/a/d;->eA:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/net/LinkProperties;->setInterfaceName(Ljava/lang/String;)V

    iget-object v1, p0, Landroid/net/a/d;->eF:Lcom/android/server/net/NetlinkTracker;

    invoke-virtual {v1}, Lcom/android/server/net/NetlinkTracker;->getLinkProperties()Landroid/net/LinkProperties;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/LinkProperties;->getLinkAddresses()Ljava/util/List;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/net/LinkProperties;->setLinkAddresses(Ljava/util/Collection;)V

    invoke-virtual {v1}, Landroid/net/LinkProperties;->getRoutes()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/net/RouteInfo;

    invoke-virtual {v0, v3}, Landroid/net/LinkProperties;->addRoute(Landroid/net/RouteInfo;)Z

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Landroid/net/LinkProperties;->getDnsServers()Ljava/util/List;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/net/a/d;->a(Landroid/net/LinkProperties;Ljava/lang/Iterable;)V

    iget-object v2, p0, Landroid/net/a/d;->eQ:Landroid/net/DhcpResults;

    if-eqz v2, :cond_2

    iget-object v2, p0, Landroid/net/a/d;->eQ:Landroid/net/DhcpResults;

    iget-object v3, p0, Landroid/net/a/d;->eA:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/net/DhcpResults;->getRoutes(Ljava/lang/String;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/net/RouteInfo;

    invoke-virtual {v0, v3}, Landroid/net/LinkProperties;->addRoute(Landroid/net/RouteInfo;)Z

    goto :goto_1

    :cond_1
    iget-object v2, p0, Landroid/net/a/d;->eQ:Landroid/net/DhcpResults;

    iget-object v2, v2, Landroid/net/DhcpResults;->dnsServers:Ljava/util/ArrayList;

    invoke-static {v0, v2}, Landroid/net/a/d;->a(Landroid/net/LinkProperties;Ljava/lang/Iterable;)V

    iget-object v2, p0, Landroid/net/a/d;->eQ:Landroid/net/DhcpResults;

    iget-object v2, v2, Landroid/net/DhcpResults;->domains:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/net/LinkProperties;->setDomains(Ljava/lang/String;)V

    iget-object v2, p0, Landroid/net/a/d;->eQ:Landroid/net/DhcpResults;

    iget v2, v2, Landroid/net/DhcpResults;->mtu:I

    if-eqz v2, :cond_2

    iget-object v2, p0, Landroid/net/a/d;->eQ:Landroid/net/DhcpResults;

    iget v2, v2, Landroid/net/DhcpResults;->mtu:I

    invoke-virtual {v0, v2}, Landroid/net/LinkProperties;->setMtu(I)V

    :cond_2
    iget-object v2, p0, Landroid/net/a/d;->eR:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_3

    iget-object v2, p0, Landroid/net/a/d;->eR:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/net/LinkProperties;->setTcpBufferSizes(Ljava/lang/String;)V

    :cond_3
    iget-object v2, p0, Landroid/net/a/d;->eS:Landroid/net/ProxyInfo;

    if-eqz v2, :cond_4

    iget-object v2, p0, Landroid/net/a/d;->eS:Landroid/net/ProxyInfo;

    invoke-virtual {v0, v2}, Landroid/net/LinkProperties;->setHttpProxy(Landroid/net/ProxyInfo;)V

    :cond_4
    iget-object v2, p0, Landroid/net/a/d;->eM:Landroid/net/a/n;

    if-eqz v2, :cond_6

    iget-object v2, p0, Landroid/net/a/d;->eM:Landroid/net/a/n;

    iget-object v2, v2, Landroid/net/a/n;->fk:Landroid/net/a/k;

    if-eqz v2, :cond_6

    iget-object v2, p0, Landroid/net/a/d;->eM:Landroid/net/a/n;

    iget-object v2, v2, Landroid/net/a/n;->fk:Landroid/net/a/k;

    invoke-virtual {v0}, Landroid/net/LinkProperties;->getLinkAddresses()Ljava/util/List;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/net/a/k;->a(Ljava/util/List;Ljava/util/List;)Z

    move-result v3

    if-eqz v3, :cond_5

    iget-object v3, v2, Landroid/net/a/k;->fa:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_5

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/net/IpPrefix;

    new-instance v6, Landroid/net/RouteInfo;

    iget-object v7, p0, Landroid/net/a/d;->eA:Ljava/lang/String;

    invoke-direct {v6, v5, v4, v7}, Landroid/net/RouteInfo;-><init>(Landroid/net/IpPrefix;Ljava/net/InetAddress;Ljava/lang/String;)V

    invoke-virtual {v0, v6}, Landroid/net/LinkProperties;->addRoute(Landroid/net/RouteInfo;)Z

    goto :goto_2

    :cond_5
    iget-object v2, v2, Landroid/net/a/k;->fb:Ljava/util/Set;

    invoke-static {v0, v2}, Landroid/net/a/d;->a(Landroid/net/LinkProperties;Ljava/lang/Iterable;)V

    :cond_6
    iget-object v2, p0, Landroid/net/a/d;->eL:Landroid/net/LinkProperties;

    sget-boolean v3, Landroid/net/a/d;->DBG:Z

    if-eqz v3, :cond_7

    iget-object v3, p0, Landroid/net/a/d;->mTag:Ljava/lang/String;

    const-string v4, "Netlink-seen LPs: %s, new LPs: %s; old LPs: %s"

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v1, v5, v6

    const/4 v1, 0x1

    aput-object v0, v5, v1

    const/4 v1, 0x2

    aput-object v2, v5, v1

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_7
    return-object v0
.end method

.method private ac()V
    .locals 3

    invoke-direct {p0}, Landroid/net/a/d;->ab()Landroid/net/LinkProperties;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/net/a/d;->b(Landroid/net/LinkProperties;)Landroid/net/LinkProperties$ProvisioningChange;

    move-result-object v1

    sget-object v2, Landroid/net/LinkProperties$ProvisioningChange;->STILL_NOT_PROVISIONED:Landroid/net/LinkProperties$ProvisioningChange;

    if-ne v1, v2, :cond_0

    sget-object v1, Landroid/net/LinkProperties$ProvisioningChange;->LOST_PROVISIONING:Landroid/net/LinkProperties$ProvisioningChange;

    :cond_0
    invoke-direct {p0, v1, v0}, Landroid/net/a/d;->a(Landroid/net/LinkProperties$ProvisioningChange;Landroid/net/LinkProperties;)V

    sget-object v0, Landroid/net/LinkProperties$ProvisioningChange;->LOST_PROVISIONING:Landroid/net/LinkProperties$ProvisioningChange;

    if-ne v1, v0, :cond_1

    iget-object v0, p0, Landroid/net/a/d;->ex:Lcom/android/internal/util/State;

    invoke-virtual {p0, v0}, Landroid/net/a/d;->transitionTo(Lcom/android/internal/util/IState;)V

    :cond_1
    return-void
.end method

.method private ad()Z
    .locals 10

    const/4 v0, 0x0

    const/4 v1, 0x1

    :try_start_0
    new-instance v9, Landroid/net/a/v;

    iget-object v3, p0, Landroid/net/a/d;->mContext:Landroid/content/Context;

    iget-object v4, p0, Landroid/net/a/d;->ax:Landroid/net/util/b;

    invoke-virtual {p0}, Landroid/net/a/d;->getHandler()Landroid/os/Handler;

    move-result-object v5

    iget-object v6, p0, Landroid/net/a/d;->et:Landroid/net/util/SharedLog;

    new-instance v7, Landroid/net/a/g;

    invoke-direct {v7, p0}, Landroid/net/a/g;-><init>(Landroid/net/a/d;)V

    iget-object v8, p0, Landroid/net/a/d;->eN:Landroid/net/util/c;

    move-object v2, v9

    invoke-direct/range {v2 .. v8}, Landroid/net/a/v;-><init>(Landroid/content/Context;Landroid/net/util/b;Landroid/os/Handler;Landroid/net/util/SharedLog;Landroid/net/a/x;Landroid/net/util/c;)V

    iput-object v9, p0, Landroid/net/a/d;->eO:Landroid/net/a/v;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v2

    const-string v3, "IpReachabilityMonitor failure: %s"

    new-array v4, v1, [Ljava/lang/Object;

    aput-object v2, v4, v0

    invoke-direct {p0, v3, v4}, Landroid/net/a/d;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    const/4 v2, 0x0

    iput-object v2, p0, Landroid/net/a/d;->eO:Landroid/net/a/v;

    :goto_0
    iget-object v2, p0, Landroid/net/a/d;->eO:Landroid/net/a/v;

    if-eqz v2, :cond_0

    return v1

    :cond_0
    return v0
.end method

.method private b(Landroid/net/LinkProperties;)Landroid/net/LinkProperties$ProvisioningChange;
    .locals 8

    iget-object v0, p0, Landroid/net/a/d;->eT:Landroid/net/apf/ApfFilter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/net/a/d;->eT:Landroid/net/apf/ApfFilter;

    invoke-virtual {v0, p1}, Landroid/net/apf/ApfFilter;->a(Landroid/net/LinkProperties;)V

    :cond_0
    iget-object v0, p0, Landroid/net/a/d;->eO:Landroid/net/a/v;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/net/a/d;->eO:Landroid/net/a/v;

    invoke-virtual {v0, p1}, Landroid/net/a/v;->f(Landroid/net/LinkProperties;)V

    :cond_1
    iget-object v0, p0, Landroid/net/a/d;->eL:Landroid/net/LinkProperties;

    iget-object v1, p0, Landroid/net/a/d;->eM:Landroid/net/a/n;

    if-eqz v1, :cond_2

    iget-object v1, p0, Landroid/net/a/d;->eM:Landroid/net/a/n;

    iget-object v1, v1, Landroid/net/a/n;->fk:Landroid/net/a/k;

    goto :goto_0

    :cond_2
    const/4 v1, 0x0

    :goto_0
    invoke-static {v0, v1}, Landroid/net/a/d;->isProvisioned(Landroid/net/LinkProperties;Landroid/net/a/k;)Z

    move-result v2

    invoke-static {p1, v1}, Landroid/net/a/d;->isProvisioned(Landroid/net/LinkProperties;Landroid/net/a/k;)Z

    move-result v1

    if-nez v2, :cond_3

    if-eqz v1, :cond_3

    sget-object v1, Landroid/net/LinkProperties$ProvisioningChange;->GAINED_PROVISIONING:Landroid/net/LinkProperties$ProvisioningChange;

    goto :goto_1

    :cond_3
    if-eqz v2, :cond_4

    if-eqz v1, :cond_4

    sget-object v1, Landroid/net/LinkProperties$ProvisioningChange;->STILL_PROVISIONED:Landroid/net/LinkProperties$ProvisioningChange;

    goto :goto_1

    :cond_4
    if-nez v2, :cond_5

    sget-object v1, Landroid/net/LinkProperties$ProvisioningChange;->STILL_NOT_PROVISIONED:Landroid/net/LinkProperties$ProvisioningChange;

    goto :goto_1

    :cond_5
    sget-object v1, Landroid/net/LinkProperties$ProvisioningChange;->LOST_PROVISIONING:Landroid/net/LinkProperties$ProvisioningChange;

    :goto_1
    invoke-virtual {v0}, Landroid/net/LinkProperties;->isIPv6Provisioned()Z

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_6

    invoke-virtual {p1}, Landroid/net/LinkProperties;->isIPv6Provisioned()Z

    move-result v2

    if-nez v2, :cond_6

    move v2, v4

    goto :goto_2

    :cond_6
    move v2, v3

    :goto_2
    invoke-virtual {v0}, Landroid/net/LinkProperties;->hasIPv4Address()Z

    move-result v5

    if-eqz v5, :cond_7

    invoke-virtual {p1}, Landroid/net/LinkProperties;->hasIPv4Address()Z

    move-result v5

    if-nez v5, :cond_7

    move v5, v4

    goto :goto_3

    :cond_7
    move v5, v3

    :goto_3
    invoke-virtual {v0}, Landroid/net/LinkProperties;->hasIPv6DefaultRoute()Z

    move-result v6

    if-eqz v6, :cond_8

    invoke-virtual {p1}, Landroid/net/LinkProperties;->hasIPv6DefaultRoute()Z

    move-result v6

    if-nez v6, :cond_8

    move v6, v4

    goto :goto_4

    :cond_8
    move v6, v3

    :goto_4
    iget-object v7, p0, Landroid/net/a/d;->eN:Landroid/net/util/c;

    if-eqz v7, :cond_9

    iget-object v7, p0, Landroid/net/a/d;->eN:Landroid/net/util/c;

    invoke-virtual {v7}, Landroid/net/util/c;->ay()Z

    move-result v7

    if-nez v7, :cond_9

    move v3, v4

    :cond_9
    if-nez v5, :cond_a

    if-eqz v2, :cond_b

    if-nez v3, :cond_b

    :cond_a
    sget-object v1, Landroid/net/LinkProperties$ProvisioningChange;->LOST_PROVISIONING:Landroid/net/LinkProperties$ProvisioningChange;

    :cond_b
    invoke-virtual {v0}, Landroid/net/LinkProperties;->hasGlobalIPv6Address()Z

    move-result v0

    if-eqz v0, :cond_c

    if-eqz v6, :cond_c

    if-nez v3, :cond_c

    sget-object v1, Landroid/net/LinkProperties$ProvisioningChange;->LOST_PROVISIONING:Landroid/net/LinkProperties$ProvisioningChange;

    :cond_c
    new-instance v0, Landroid/net/LinkProperties;

    invoke-direct {v0, p1}, Landroid/net/LinkProperties;-><init>(Landroid/net/LinkProperties;)V

    iput-object v0, p0, Landroid/net/a/d;->eL:Landroid/net/LinkProperties;

    sget-object p1, Landroid/net/LinkProperties$ProvisioningChange;->GAINED_PROVISIONING:Landroid/net/LinkProperties$ProvisioningChange;

    if-ne v1, p1, :cond_d

    iget-object p1, p0, Landroid/net/a/d;->eG:Lcom/android/internal/util/WakeupMessage;

    invoke-virtual {p1}, Lcom/android/internal/util/WakeupMessage;->cancel()V

    :cond_d
    return-object v1
.end method

.method static synthetic b(Landroid/net/a/d;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Landroid/net/a/d;->eB:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic b(Landroid/net/a/d;Z)Z
    .locals 0

    iput-boolean p1, p0, Landroid/net/a/d;->eU:Z

    return p1
.end method

.method static synthetic c(Landroid/net/a/d;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Landroid/net/a/d;->eA:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic d(Landroid/net/a/d;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Landroid/net/a/d;->mTag:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic e(Landroid/net/a/d;)V
    .locals 1

    iget-object v0, p0, Landroid/net/a/d;->eK:Landroid/net/a/c;

    invoke-virtual {v0}, Landroid/net/a/c;->Y()Z

    iget-object p0, p0, Landroid/net/a/d;->eK:Landroid/net/a/c;

    invoke-virtual {p0}, Landroid/net/a/c;->aa()Z

    return-void
.end method

.method static synthetic f(Landroid/net/a/d;)V
    .locals 2

    iget-object v0, p0, Landroid/net/a/d;->eF:Lcom/android/server/net/NetlinkTracker;

    invoke-virtual {v0}, Lcom/android/server/net/NetlinkTracker;->clearLinkProperties()V

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/net/a/d;->eM:Landroid/net/a/n;

    iput-object v0, p0, Landroid/net/a/d;->eQ:Landroid/net/DhcpResults;

    const-string v1, ""

    iput-object v1, p0, Landroid/net/a/d;->eR:Ljava/lang/String;

    iput-object v0, p0, Landroid/net/a/d;->eS:Landroid/net/ProxyInfo;

    new-instance v0, Landroid/net/LinkProperties;

    invoke-direct {v0}, Landroid/net/LinkProperties;-><init>()V

    iput-object v0, p0, Landroid/net/a/d;->eL:Landroid/net/LinkProperties;

    iget-object v0, p0, Landroid/net/a/d;->eL:Landroid/net/LinkProperties;

    iget-object p0, p0, Landroid/net/a/d;->eA:Ljava/lang/String;

    invoke-virtual {v0, p0}, Landroid/net/LinkProperties;->setInterfaceName(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic g(Landroid/net/a/d;)J
    .locals 2

    iget-wide v0, p0, Landroid/net/a/d;->eV:J

    return-wide v0
.end method

.method private g(I)V
    .locals 5

    iget-wide v0, p0, Landroid/net/a/d;->eV:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-wide v2, p0, Landroid/net/a/d;->eV:J

    sub-long v2, v0, v2

    :cond_0
    iget-object v0, p0, Landroid/net/a/d;->ay:Landroid/net/metrics/IpConnectivityLog;

    iget-object v1, p0, Landroid/net/a/d;->eA:Ljava/lang/String;

    new-instance v4, Landroid/net/metrics/IpManagerEvent;

    invoke-direct {v4, p1, v2, v3}, Landroid/net/metrics/IpManagerEvent;-><init>(IJ)V

    invoke-virtual {v0, v1, v4}, Landroid/net/metrics/IpConnectivityLog;->log(Ljava/lang/String;Landroid/os/Parcelable;)Z

    return-void
.end method

.method static synthetic h(Landroid/net/a/d;)V
    .locals 1

    const/4 v0, 0x3

    invoke-direct {p0, v0}, Landroid/net/a/d;->g(I)V

    return-void
.end method

.method static synthetic i(Landroid/net/a/d;)V
    .locals 4

    :try_start_0
    iget-object v0, p0, Landroid/net/a/d;->eE:Landroid/os/INetworkManagementService;

    iget-object v1, p0, Landroid/net/a/d;->eF:Lcom/android/server/net/NetlinkTracker;

    invoke-interface {v0, v1}, Landroid/os/INetworkManagementService;->unregisterObserver(Landroid/net/INetworkManagementEventObserver;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    const-string v1, "Couldn\'t unregister NetlinkTracker: %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-direct {p0, v1, v2}, Landroid/net/a/d;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method static isProvisioned(Landroid/net/LinkProperties;Landroid/net/a/k;)Z
    .locals 1
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation

    invoke-virtual {p0}, Landroid/net/LinkProperties;->hasIPv4Address()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p0}, Landroid/net/LinkProperties;->isProvisioned()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    if-nez p1, :cond_1

    const/4 p0, 0x0

    return p0

    :cond_1
    invoke-virtual {p0}, Landroid/net/LinkProperties;->getLinkAddresses()Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0}, Landroid/net/LinkProperties;->getRoutes()Ljava/util/List;

    move-result-object p0

    invoke-virtual {p1, v0, p0}, Landroid/net/a/k;->a(Ljava/util/List;Ljava/util/List;)Z

    move-result p0

    return p0

    :cond_2
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method static synthetic j(Landroid/net/a/d;)Lcom/android/internal/util/State;
    .locals 0

    iget-object p0, p0, Landroid/net/a/d;->ey:Lcom/android/internal/util/State;

    return-object p0
.end method

.method static synthetic k(Landroid/net/a/d;)Landroid/net/a/m;
    .locals 0

    iget-object p0, p0, Landroid/net/a/d;->eJ:Landroid/net/a/m;

    return-object p0
.end method

.method static synthetic l(Landroid/net/a/d;)Landroid/net/dhcp/b;
    .locals 0

    iget-object p0, p0, Landroid/net/a/d;->eP:Landroid/net/dhcp/b;

    return-object p0
.end method

.method public static synthetic lambda$GdLECAc1sQEo2Jjde3Y4ykVjDBg(Landroid/net/LinkAddress;)Z
    .locals 0

    invoke-virtual {p0}, Landroid/net/LinkAddress;->isIPv6()Z

    move-result p0

    return p0
.end method

.method public static synthetic lambda$JsVbJ5mpbRjwJuW_A3bDJMqYpF0(Ljava/lang/Object;)Ljava/lang/String;
    .locals 0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic m(Landroid/net/a/d;)Lcom/android/internal/util/State;
    .locals 0

    iget-object p0, p0, Landroid/net/a/d;->dn:Lcom/android/internal/util/State;

    return-object p0
.end method

.method static synthetic n(Landroid/net/a/d;)Landroid/net/a/c;
    .locals 0

    iget-object p0, p0, Landroid/net/a/d;->eK:Landroid/net/a/c;

    return-object p0
.end method

.method static synthetic o(Landroid/net/a/d;)Landroid/net/dhcp/b;
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/net/a/d;->eP:Landroid/net/dhcp/b;

    return-object v0
.end method

.method static synthetic p(Landroid/net/a/d;)Landroid/net/a/n;
    .locals 0

    iget-object p0, p0, Landroid/net/a/d;->eM:Landroid/net/a/n;

    return-object p0
.end method

.method static synthetic q(Landroid/net/a/d;)Lcom/android/internal/util/WakeupMessage;
    .locals 0

    iget-object p0, p0, Landroid/net/a/d;->eG:Lcom/android/internal/util/WakeupMessage;

    return-object p0
.end method

.method static synthetic r(Landroid/net/a/d;)Lcom/android/internal/util/State;
    .locals 0

    iget-object p0, p0, Landroid/net/a/d;->ez:Lcom/android/internal/util/State;

    return-object p0
.end method

.method static synthetic s(Landroid/net/a/d;)Lcom/android/internal/util/State;
    .locals 0

    iget-object p0, p0, Landroid/net/a/d;->ex:Lcom/android/internal/util/State;

    return-object p0
.end method

.method static synthetic t(Landroid/net/a/d;)V
    .locals 0

    invoke-direct {p0}, Landroid/net/a/d;->ac()V

    return-void
.end method

.method static synthetic u(Landroid/net/a/d;)Landroid/net/LinkProperties;
    .locals 0

    iget-object p0, p0, Landroid/net/a/d;->eL:Landroid/net/LinkProperties;

    return-object p0
.end method

.method static synthetic v(Landroid/net/a/d;)Z
    .locals 0

    iget-boolean p0, p0, Landroid/net/a/d;->eU:Z

    return p0
.end method

.method static synthetic w(Landroid/net/a/d;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Landroid/net/a/d;->mContext:Landroid/content/Context;

    return-object p0
.end method

.method static synthetic x(Landroid/net/a/d;)Landroid/net/util/b;
    .locals 0

    iget-object p0, p0, Landroid/net/a/d;->ax:Landroid/net/util/b;

    return-object p0
.end method

.method static synthetic y(Landroid/net/a/d;)Landroid/net/apf/ApfFilter;
    .locals 0

    iget-object p0, p0, Landroid/net/a/d;->eT:Landroid/net/apf/ApfFilter;

    return-object p0
.end method

.method static synthetic z(Landroid/net/a/d;)Z
    .locals 2

    iget-object v0, p0, Landroid/net/a/d;->eK:Landroid/net/a/c;

    invoke-virtual {v0}, Landroid/net/a/c;->Z()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/net/a/d;->eK:Landroid/net/a/c;

    iget-object v1, p0, Landroid/net/a/d;->eM:Landroid/net/a/n;

    iget v1, v1, Landroid/net/a/n;->fn:I

    invoke-virtual {v0, v1}, Landroid/net/a/c;->f(I)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p0, p0, Landroid/net/a/d;->eK:Landroid/net/a/c;

    invoke-virtual {p0}, Landroid/net/a/c;->X()Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method


# virtual methods
.method public dump(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 6

    if-eqz p3, :cond_0

    array-length v0, p3

    if-lez v0, :cond_0

    const-string v0, "confirm"

    const/4 v1, 0x0

    aget-object v1, p3, v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x4

    invoke-virtual {p0, p1}, Landroid/net/a/d;->sendMessage(I)V

    return-void

    :cond_0
    iget-object v0, p0, Landroid/net/a/d;->eT:Landroid/net/apf/ApfFilter;

    iget-object v1, p0, Landroid/net/a/d;->eM:Landroid/net/a/n;

    if-eqz v1, :cond_1

    iget-object v2, v1, Landroid/net/a/n;->av:Landroid/net/apf/a;

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    :goto_0
    new-instance v3, Lcom/android/internal/util/IndentingPrintWriter;

    const-string v4, "  "

    invoke-direct {v3, p2, v4}, Lcom/android/internal/util/IndentingPrintWriter;-><init>(Ljava/io/Writer;Ljava/lang/String;)V

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Landroid/net/a/d;->mTag:Ljava/lang/String;

    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " APF dump:"

    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v3, p2}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/android/internal/util/IndentingPrintWriter;->increaseIndent()Lcom/android/internal/util/IndentingPrintWriter;

    if-eqz v0, :cond_4

    if-nez v2, :cond_2

    const-string p2, "Hardware does not support APF."

    invoke-virtual {v3, p2}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    goto :goto_1

    :cond_2
    invoke-virtual {v2}, Landroid/net/apf/a;->s()Z

    move-result p2

    if-eqz p2, :cond_3

    iget-object p2, p0, Landroid/net/a/d;->eW:Landroid/os/ConditionVariable;

    invoke-virtual {p2}, Landroid/os/ConditionVariable;->close()V

    iget-object p2, p0, Landroid/net/a/d;->mCallback:Landroid/net/a/i;

    invoke-virtual {p2}, Landroid/net/a/i;->ah()V

    iget-object p2, p0, Landroid/net/a/d;->eW:Landroid/os/ConditionVariable;

    const-wide/16 v4, 0x3e8

    invoke-virtual {p2, v4, v5}, Landroid/os/ConditionVariable;->block(J)Z

    move-result p2

    if-nez p2, :cond_3

    const-string p2, "TIMEOUT: DUMPING STALE APF SNAPSHOT"

    invoke-virtual {v3, p2}, Lcom/android/internal/util/IndentingPrintWriter;->print(Ljava/lang/String;)V

    :cond_3
    :goto_1
    invoke-virtual {v0, v3}, Landroid/net/apf/ApfFilter;->dump(Lcom/android/internal/util/IndentingPrintWriter;)V

    goto :goto_4

    :cond_4
    const-string p2, "No active ApfFilter; "

    invoke-virtual {v3, p2}, Lcom/android/internal/util/IndentingPrintWriter;->print(Ljava/lang/String;)V

    if-nez v1, :cond_5

    const-string p2, "IpClient not yet started."

    :goto_2
    invoke-virtual {v3, p2}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    goto :goto_4

    :cond_5
    if-eqz v2, :cond_7

    iget p2, v2, Landroid/net/apf/a;->an:I

    if-nez p2, :cond_6

    goto :goto_3

    :cond_6
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "ApfFilter not yet started, APF capabilities: "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    goto :goto_2

    :cond_7
    :goto_3
    const-string p2, "Hardware does not support APF."

    goto :goto_2

    :goto_4
    invoke-virtual {v3}, Lcom/android/internal/util/IndentingPrintWriter;->decreaseIndent()Lcom/android/internal/util/IndentingPrintWriter;

    invoke-virtual {v3}, Lcom/android/internal/util/IndentingPrintWriter;->println()V

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Landroid/net/a/d;->mTag:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " current ProvisioningConfiguration:"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v3, p2}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/android/internal/util/IndentingPrintWriter;->increaseIndent()Lcom/android/internal/util/IndentingPrintWriter;

    const-string p2, "N/A"

    invoke-static {v1, p2}, Ljava/util/Objects;->toString(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v3, p2}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/android/internal/util/IndentingPrintWriter;->decreaseIndent()Lcom/android/internal/util/IndentingPrintWriter;

    iget-object p2, p0, Landroid/net/a/d;->eO:Landroid/net/a/v;

    if-eqz p2, :cond_8

    invoke-virtual {v3}, Lcom/android/internal/util/IndentingPrintWriter;->println()V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Landroid/net/a/d;->mTag:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " current IpReachabilityMonitor state:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/android/internal/util/IndentingPrintWriter;->increaseIndent()Lcom/android/internal/util/IndentingPrintWriter;

    invoke-virtual {p2, v3}, Landroid/net/a/v;->dump(Ljava/io/PrintWriter;)V

    invoke-virtual {v3}, Lcom/android/internal/util/IndentingPrintWriter;->decreaseIndent()Lcom/android/internal/util/IndentingPrintWriter;

    :cond_8
    invoke-virtual {v3}, Lcom/android/internal/util/IndentingPrintWriter;->println()V

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Landroid/net/a/d;->mTag:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " StateMachine dump:"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v3, p2}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/android/internal/util/IndentingPrintWriter;->increaseIndent()Lcom/android/internal/util/IndentingPrintWriter;

    iget-object p2, p0, Landroid/net/a/d;->et:Landroid/net/util/SharedLog;

    invoke-virtual {p2, p1, v3, p3}, Landroid/net/util/SharedLog;->dump(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/android/internal/util/IndentingPrintWriter;->decreaseIndent()Lcom/android/internal/util/IndentingPrintWriter;

    invoke-virtual {v3}, Lcom/android/internal/util/IndentingPrintWriter;->println()V

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Landroid/net/a/d;->mTag:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " connectivity packet log:"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v3, p2}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/android/internal/util/IndentingPrintWriter;->println()V

    const-string p2, "Debug with python and scapy via:"

    invoke-virtual {v3, p2}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    const-string p2, "shell$ python"

    invoke-virtual {v3, p2}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    const-string p2, ">>> from scapy import all as scapy"

    invoke-virtual {v3, p2}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    const-string p2, ">>> scapy.Ether(\"<paste_hex_string>\".decode(\"hex\")).show2()"

    invoke-virtual {v3, p2}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/android/internal/util/IndentingPrintWriter;->println()V

    invoke-virtual {v3}, Lcom/android/internal/util/IndentingPrintWriter;->increaseIndent()Lcom/android/internal/util/IndentingPrintWriter;

    iget-object p2, p0, Landroid/net/a/d;->eI:Landroid/util/LocalLog;

    invoke-virtual {p2}, Landroid/util/LocalLog;->readOnlyLocalLog()Landroid/util/LocalLog$ReadOnlyLocalLog;

    move-result-object p2

    invoke-virtual {p2, p1, v3, p3}, Landroid/util/LocalLog$ReadOnlyLocalLog;->dump(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/android/internal/util/IndentingPrintWriter;->decreaseIndent()Lcom/android/internal/util/IndentingPrintWriter;

    return-void
.end method

.method protected getLogRecString(Landroid/os/Message;)Ljava/lang/String;
    .locals 4

    const-string v0, "%s/%d %d %d %s [%s]"

    const/4 v1, 0x6

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v2, p0, Landroid/net/a/d;->eA:Ljava/lang/String;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    iget-object v2, p0, Landroid/net/a/d;->ax:Landroid/net/util/b;

    if-nez v2, :cond_0

    const/4 v2, -0x1

    goto :goto_0

    :cond_0
    iget-object v2, p0, Landroid/net/a/d;->ax:Landroid/net/util/b;

    iget v2, v2, Landroid/net/util/b;->index:I

    :goto_0
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    const/4 v2, 0x2

    iget v3, p1, Landroid/os/Message;->arg1:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x3

    iget v3, p1, Landroid/os/Message;->arg2:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x4

    iget-object v3, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-static {v3}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x5

    iget-object v3, p0, Landroid/net/a/d;->eJ:Landroid/net/a/m;

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget p1, p1, Landroid/os/Message;->what:I

    invoke-virtual {p0, p1}, Landroid/net/a/d;->getWhatToString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iget-object v1, p0, Landroid/net/a/d;->et:Landroid/net/util/SharedLog;

    invoke-virtual {v1, p1}, Landroid/net/util/SharedLog;->log(Ljava/lang/String;)V

    sget-boolean v1, Landroid/net/a/d;->DBG:Z

    if-eqz v1, :cond_1

    iget-object v1, p0, Landroid/net/a/d;->mTag:Ljava/lang/String;

    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    iget-object p1, p0, Landroid/net/a/d;->eJ:Landroid/net/a/m;

    invoke-virtual {p1}, Landroid/net/a/m;->reset()V

    return-object v0
.end method

.method protected getWhatToString(I)Ljava/lang/String;
    .locals 3

    sget-object v0, Landroid/net/a/d;->eu:Landroid/util/SparseArray;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "UNKNOWN: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Landroid/util/SparseArray;->get(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    return-object p1
.end method

.method protected onQuitting()V
    .locals 1

    iget-object v0, p0, Landroid/net/a/d;->mCallback:Landroid/net/a/i;

    invoke-virtual {v0}, Landroid/net/a/i;->ag()V

    iget-object v0, p0, Landroid/net/a/d;->eD:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    return-void
.end method

.method protected recordLogRec(Landroid/os/Message;)Z
    .locals 1

    iget p1, p1, Landroid/os/Message;->what:I

    const/4 v0, 0x6

    if-eq p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    if-nez p1, :cond_1

    iget-object v0, p0, Landroid/net/a/d;->eJ:Landroid/net/a/m;

    invoke-virtual {v0}, Landroid/net/a/m;->reset()V

    :cond_1
    return p1
.end method
