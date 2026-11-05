.class public final Landroid/net/a/v;
.super Ljava/lang/Object;


# static fields
.field private static final DBG:Z


# instance fields
.field private final ax:Landroid/net/util/b;

.field private final ay:Landroid/net/metrics/IpConnectivityLog;

.field private eL:Landroid/net/LinkProperties;

.field private final eN:Landroid/net/util/c;

.field private final et:Landroid/net/util/SharedLog;

.field private final fA:Landroid/net/a/y;

.field private fB:Ljava/util/Map;

.field private volatile fC:J

.field private final fy:Landroid/net/a/s;

.field private final fz:Landroid/net/a/x;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    sget-boolean v0, Landroid/os/Build;->IS_USER:Z

    xor-int/lit8 v0, v0, 0x1

    sput-boolean v0, Landroid/net/a/v;->DBG:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/net/util/b;Landroid/os/Handler;Landroid/net/util/SharedLog;Landroid/net/a/x;Landroid/net/util/c;)V
    .locals 7

    iget-object v0, p2, Landroid/net/util/b;->name:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "IpReachabilityMonitor."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "power"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/PowerManager;

    const/4 v1, 0x1

    invoke-virtual {p1, v1, v0}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object p1

    new-instance v6, Landroid/net/a/z;

    invoke-direct {v6, p1}, Landroid/net/a/z;-><init>(Landroid/os/PowerManager$WakeLock;)V

    move-object v0, p0

    move-object v1, p2

    move-object v2, p3

    move-object v3, p4

    move-object v4, p5

    move-object v5, p6

    invoke-direct/range {v0 .. v6}, Landroid/net/a/v;-><init>(Landroid/net/util/b;Landroid/os/Handler;Landroid/net/util/SharedLog;Landroid/net/a/x;Landroid/net/util/c;Landroid/net/a/y;)V

    return-void
.end method

.method constructor <init>(Landroid/net/util/b;Landroid/os/Handler;Landroid/net/util/SharedLog;Landroid/net/a/x;Landroid/net/util/c;Landroid/net/a/y;)V
    .locals 1
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/net/metrics/IpConnectivityLog;

    invoke-direct {v0}, Landroid/net/metrics/IpConnectivityLog;-><init>()V

    iput-object v0, p0, Landroid/net/a/v;->ay:Landroid/net/metrics/IpConnectivityLog;

    new-instance v0, Landroid/net/LinkProperties;

    invoke-direct {v0}, Landroid/net/LinkProperties;-><init>()V

    iput-object v0, p0, Landroid/net/a/v;->eL:Landroid/net/LinkProperties;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroid/net/a/v;->fB:Ljava/util/Map;

    if-eqz p1, :cond_0

    iput-object p1, p0, Landroid/net/a/v;->ax:Landroid/net/util/b;

    const-string p1, "IpReachabilityMonitor"

    invoke-virtual {p3, p1}, Landroid/net/util/SharedLog;->o(Ljava/lang/String;)Landroid/net/util/SharedLog;

    move-result-object p1

    iput-object p1, p0, Landroid/net/a/v;->et:Landroid/net/util/SharedLog;

    iput-object p4, p0, Landroid/net/a/v;->fz:Landroid/net/a/x;

    iput-object p5, p0, Landroid/net/a/v;->eN:Landroid/net/util/c;

    iput-object p6, p0, Landroid/net/a/v;->fA:Landroid/net/a/y;

    new-instance p1, Landroid/net/a/s;

    iget-object p3, p0, Landroid/net/a/v;->et:Landroid/net/util/SharedLog;

    new-instance p4, Landroid/net/a/-$$Lambda$v$xQcrI_hNaY-ORSz9NkRFqQjM9FQ;

    invoke-direct {p4, p0}, Landroid/net/a/-$$Lambda$v$xQcrI_hNaY-ORSz9NkRFqQjM9FQ;-><init>(Landroid/net/a/v;)V

    invoke-direct {p1, p2, p3, p4}, Landroid/net/a/s;-><init>(Landroid/os/Handler;Landroid/net/util/SharedLog;Landroid/net/a/u;)V

    iput-object p1, p0, Landroid/net/a/v;->fy:Landroid/net/a/s;

    iget-object p1, p0, Landroid/net/a/v;->fy:Landroid/net/a/s;

    invoke-virtual {p1}, Landroid/net/a/s;->start()V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "null InterfaceParams"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method static synthetic a(Landroid/net/a/v;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    invoke-direct {p0, p1}, Landroid/net/a/v;->l(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private synthetic a(Landroid/net/a/t;)V
    .locals 4

    iget-object v0, p0, Landroid/net/a/v;->ax:Landroid/net/util/b;

    iget v0, v0, Landroid/net/util/b;->index:I

    iget v1, p1, Landroid/net/a/t;->fu:I

    if-eq v0, v1, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Landroid/net/a/v;->fB:Ljava/util/Map;

    iget-object v1, p1, Landroid/net/a/t;->fv:Ljava/net/InetAddress;

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    return-void

    :cond_1
    iget-object v0, p0, Landroid/net/a/v;->fB:Ljava/util/Map;

    iget-object v1, p1, Landroid/net/a/t;->fv:Ljava/net/InetAddress;

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/a/t;

    iget-short v1, p1, Landroid/net/a/t;->fw:S

    const/16 v2, 0x20

    if-ne v1, v2, :cond_2

    iget-object v1, p0, Landroid/net/a/v;->et:Landroid/net/util/SharedLog;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "ALERT neighbor went from: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, " to: "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/net/util/SharedLog;->w(Ljava/lang/String;)V

    invoke-direct {p0, p1}, Landroid/net/a/v;->b(Landroid/net/a/t;)V

    :cond_2
    return-void
.end method

.method private static a(Ljava/util/List;Ljava/net/InetAddress;)Z
    .locals 2

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/RouteInfo;

    invoke-virtual {v0}, Landroid/net/RouteInfo;->hasGateway()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0, p1}, Landroid/net/RouteInfo;->matches(Ljava/net/InetAddress;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method private am()Ljava/lang/String;
    .locals 1

    const-string v0, " "

    invoke-direct {p0, v0}, Landroid/net/a/v;->l(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private b(Landroid/net/a/t;)V
    .locals 8

    new-instance v0, Landroid/net/LinkProperties;

    iget-object v1, p0, Landroid/net/a/v;->eL:Landroid/net/LinkProperties;

    invoke-direct {v0, v1}, Landroid/net/LinkProperties;-><init>(Landroid/net/LinkProperties;)V

    iget-object v1, p0, Landroid/net/a/v;->fB:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v2, :cond_6

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/net/a/t;

    iget-short v5, v5, Landroid/net/a/t;->fw:S

    const/16 v6, 0x20

    if-ne v5, v6, :cond_0

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/net/InetAddress;

    iget-object v5, p0, Landroid/net/a/v;->eL:Landroid/net/LinkProperties;

    invoke-virtual {v5}, Landroid/net/LinkProperties;->getRoutes()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_1
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/net/RouteInfo;

    invoke-virtual {v6}, Landroid/net/RouteInfo;->getGateway()Ljava/net/InetAddress;

    move-result-object v7

    invoke-virtual {v2, v7}, Ljava/net/InetAddress;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-virtual {v0, v6}, Landroid/net/LinkProperties;->removeRoute(Landroid/net/RouteInfo;)Z

    goto :goto_1

    :cond_2
    iget-object v5, p0, Landroid/net/a/v;->eN:Landroid/net/util/c;

    if-eqz v5, :cond_4

    iget-object v5, p0, Landroid/net/a/v;->eN:Landroid/net/util/c;

    invoke-virtual {v5}, Landroid/net/util/c;->ay()Z

    move-result v5

    if-eqz v5, :cond_3

    goto :goto_2

    :cond_3
    move v3, v4

    :cond_4
    :goto_2
    if-nez v3, :cond_5

    instance-of v3, v2, Ljava/net/Inet6Address;

    if-nez v3, :cond_0

    :cond_5
    invoke-virtual {v0, v2}, Landroid/net/LinkProperties;->removeDnsServer(Ljava/net/InetAddress;)Z

    goto :goto_0

    :cond_6
    iget-object v1, p0, Landroid/net/a/v;->eL:Landroid/net/LinkProperties;

    invoke-static {v1, v0}, Landroid/net/LinkProperties;->compareProvisioning(Landroid/net/LinkProperties;Landroid/net/LinkProperties;)Landroid/net/LinkProperties$ProvisioningChange;

    move-result-object v0

    sget-object v1, Landroid/net/LinkProperties$ProvisioningChange;->LOST_PROVISIONING:Landroid/net/LinkProperties$ProvisioningChange;

    if-ne v0, v1, :cond_7

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "FAILURE: LOST_PROVISIONING, "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v1, "IpReachabilityMonitor"

    invoke-static {v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, p0, Landroid/net/a/v;->fz:Landroid/net/a/x;

    if-eqz v1, :cond_7

    iget-object v1, p0, Landroid/net/a/v;->fz:Landroid/net/a/x;

    invoke-interface {v1, p1}, Landroid/net/a/x;->j(Ljava/lang/String;)V

    :cond_7
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    iget-wide v5, p0, Landroid/net/a/v;->fC:J

    sub-long/2addr v1, v5

    const-wide/16 v5, 0xdac

    cmp-long p1, v1, v5

    if-gez p1, :cond_8

    move p1, v3

    goto :goto_3

    :cond_8
    move p1, v4

    :goto_3
    sget-object v1, Landroid/net/LinkProperties$ProvisioningChange;->LOST_PROVISIONING:Landroid/net/LinkProperties$ProvisioningChange;

    if-ne v0, v1, :cond_9

    goto :goto_4

    :cond_9
    move v3, v4

    :goto_4
    invoke-static {p1, v3}, Landroid/net/metrics/IpReachabilityEvent;->nudFailureEventType(ZZ)I

    move-result p1

    iget-object v0, p0, Landroid/net/a/v;->ay:Landroid/net/metrics/IpConnectivityLog;

    iget-object v1, p0, Landroid/net/a/v;->ax:Landroid/net/util/b;

    iget-object v1, v1, Landroid/net/util/b;->name:Ljava/lang/String;

    new-instance v2, Landroid/net/metrics/IpReachabilityEvent;

    invoke-direct {v2, p1}, Landroid/net/metrics/IpReachabilityEvent;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Landroid/net/metrics/IpConnectivityLog;->log(Ljava/lang/String;Landroid/os/Parcelable;)Z

    return-void
.end method

.method private l(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "iface{"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Landroid/net/a/v;->ax:Landroid/net/util/b;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, "},"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "ntable=["

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ""

    iget-object v2, p0, Landroid/net/a/v;->fB:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/net/InetAddress;

    invoke-virtual {v4}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "/"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, ","

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    const-string p1, "]"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public static synthetic lambda$xQcrI_hNaY-ORSz9NkRFqQjM9FQ(Landroid/net/a/v;Landroid/net/a/t;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/net/a/v;->a(Landroid/net/a/t;)V

    return-void
.end method


# virtual methods
.method public final an()V
    .locals 7

    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Landroid/net/a/v;->fB:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Landroid/net/a/v;->fA:Landroid/net/a/y;

    invoke-interface {v1}, Landroid/net/a/y;->ao()V

    :cond_0
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/net/InetAddress;

    iget-object v2, p0, Landroid/net/a/v;->ax:Landroid/net/util/b;

    iget v2, v2, Landroid/net/util/b;->index:I

    invoke-static {v2, v1}, Landroid/net/a/s;->a(ILjava/net/InetAddress;)I

    move-result v2

    iget-object v3, p0, Landroid/net/a/v;->et:Landroid/net/util/SharedLog;

    const-string v4, "put neighbor %s into NUD_PROBE state (rval=%d)"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-virtual {v1}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v5, v6

    const/4 v1, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v1

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Landroid/net/util/SharedLog;->log(Ljava/lang/String;)V

    const/16 v1, 0x100

    and-int/lit16 v2, v2, 0xff

    or-int/2addr v1, v2

    iget-object v2, p0, Landroid/net/a/v;->ay:Landroid/net/metrics/IpConnectivityLog;

    iget-object v3, p0, Landroid/net/a/v;->ax:Landroid/net/util/b;

    iget-object v3, v3, Landroid/net/util/b;->name:Ljava/lang/String;

    new-instance v4, Landroid/net/metrics/IpReachabilityEvent;

    invoke-direct {v4, v1}, Landroid/net/metrics/IpReachabilityEvent;-><init>(I)V

    invoke-virtual {v2, v3, v4}, Landroid/net/metrics/IpConnectivityLog;->log(Ljava/lang/String;Landroid/os/Parcelable;)Z

    goto :goto_0

    :cond_1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Landroid/net/a/v;->fC:J

    return-void
.end method

.method public final dump(Ljava/io/PrintWriter;)V
    .locals 7

    iget-object v0, p0, Landroid/net/a/v;->fy:Landroid/net/a/s;

    invoke-virtual {v0}, Landroid/net/a/s;->getHandler()Landroid/os/Handler;

    move-result-object v1

    new-instance v2, Landroid/net/a/w;

    invoke-direct {v2, p0}, Landroid/net/a/w;-><init>(Landroid/net/a/v;)V

    const-string v4, ""

    const-wide/16 v5, 0x3e8

    move-object v3, p1

    invoke-static/range {v1 .. v6}, Lcom/android/internal/util/DumpUtils;->dumpAsync(Landroid/os/Handler;Lcom/android/internal/util/DumpUtils$Dump;Ljava/io/PrintWriter;Ljava/lang/String;J)V

    return-void
.end method

.method public final f(Landroid/net/LinkProperties;)V
    .locals 6

    iget-object v0, p0, Landroid/net/a/v;->ax:Landroid/net/util/b;

    iget-object v0, v0, Landroid/net/util/b;->name:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/net/LinkProperties;->getInterfaceName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "IpReachabilityMonitor"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "requested LinkProperties interface \'"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/net/LinkProperties;->getInterfaceName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\' does not match: "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Landroid/net/a/v;->ax:Landroid/net/util/b;

    iget-object p1, p1, Landroid/net/util/b;->name:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    new-instance v0, Landroid/net/LinkProperties;

    invoke-direct {v0, p1}, Landroid/net/LinkProperties;-><init>(Landroid/net/LinkProperties;)V

    iput-object v0, p0, Landroid/net/a/v;->eL:Landroid/net/LinkProperties;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iget-object v1, p0, Landroid/net/a/v;->eL:Landroid/net/LinkProperties;

    invoke-virtual {v1}, Landroid/net/LinkProperties;->getRoutes()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/net/RouteInfo;

    invoke-virtual {v3}, Landroid/net/RouteInfo;->hasGateway()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-virtual {v3}, Landroid/net/RouteInfo;->getGateway()Ljava/net/InetAddress;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/net/a/v;->a(Ljava/util/List;Ljava/net/InetAddress;)Z

    move-result v5

    if-eqz v5, :cond_1

    iget-object v5, p0, Landroid/net/a/v;->fB:Ljava/util/Map;

    invoke-interface {v5, v3, v4}, Ljava/util/Map;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/net/a/t;

    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_2
    invoke-virtual {p1}, Landroid/net/LinkProperties;->getDnsServers()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_3
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/net/InetAddress;

    invoke-static {v1, v2}, Landroid/net/a/v;->a(Ljava/util/List;Ljava/net/InetAddress;)Z

    move-result v3

    if-eqz v3, :cond_3

    iget-object v3, p0, Landroid/net/a/v;->fB:Ljava/util/Map;

    invoke-interface {v3, v2, v4}, Ljava/util/Map;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/net/a/t;

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_4
    iput-object v0, p0, Landroid/net/a/v;->fB:Ljava/util/Map;

    sget-boolean p1, Landroid/net/a/v;->DBG:Z

    if-eqz p1, :cond_5

    const-string p1, "IpReachabilityMonitor"

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "watch: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-direct {p0}, Landroid/net/a/v;->am()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_5
    return-void
.end method

.method public final stop()V
    .locals 3

    iget-object v0, p0, Landroid/net/a/v;->fy:Landroid/net/a/s;

    invoke-virtual {v0}, Landroid/net/a/s;->stop()V

    iget-object v0, p0, Landroid/net/a/v;->eL:Landroid/net/LinkProperties;

    invoke-virtual {v0}, Landroid/net/LinkProperties;->clear()V

    iget-object v0, p0, Landroid/net/a/v;->fB:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    sget-boolean v0, Landroid/net/a/v;->DBG:Z

    if-eqz v0, :cond_0

    const-string v0, "IpReachabilityMonitor"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "clear: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-direct {p0}, Landroid/net/a/v;->am()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    return-void
.end method
