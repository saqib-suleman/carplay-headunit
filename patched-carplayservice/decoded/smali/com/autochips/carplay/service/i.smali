.class public final Lcom/autochips/carplay/service/i;
.super Ljava/lang/Object;


# instance fields
.field private final mCarplayMonitor:Lcom/autochips/carplay/service/h;

.field private mLock:Ljava/lang/Object;

.field private final rY:Lcom/autochips/carplay/c/a;

.field private final tI:Lcom/autochips/carplay/wired/a;

.field private final tJ:Lcom/autochips/carplay/plugin/a;

.field private final tK:Lcom/autochips/carplay/a/a;

.field private final tL:Lcom/autochips/carplay/c/e;

.field private final tM:Lcom/autochips/carplay/common/c;

.field private final tN:Lcom/autochips/carplay/service/l;

.field private final tO:Lcom/autochips/carplay/service/k;

.field private tP:Z

.field private final tk:Landroid/os/INetworkManagementService;


# direct methods
.method public constructor <init>(Lcom/autochips/carplay/wired/a;Lcom/autochips/carplay/plugin/a;Lcom/autochips/carplay/a/a;Lcom/autochips/carplay/c/a;Lcom/autochips/carplay/c/e;Lcom/autochips/carplay/common/c;Landroid/os/INetworkManagementService;Lcom/autochips/carplay/service/h;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/autochips/carplay/service/i;->mLock:Ljava/lang/Object;

    new-instance v0, Lcom/autochips/carplay/service/k;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/autochips/carplay/service/k;-><init>(B)V

    iput-object v0, p0, Lcom/autochips/carplay/service/i;->tO:Lcom/autochips/carplay/service/k;

    iput-boolean v1, p0, Lcom/autochips/carplay/service/i;->tP:Z

    iput-object p1, p0, Lcom/autochips/carplay/service/i;->tI:Lcom/autochips/carplay/wired/a;

    iput-object p2, p0, Lcom/autochips/carplay/service/i;->tJ:Lcom/autochips/carplay/plugin/a;

    iput-object p3, p0, Lcom/autochips/carplay/service/i;->tK:Lcom/autochips/carplay/a/a;

    iput-object p4, p0, Lcom/autochips/carplay/service/i;->rY:Lcom/autochips/carplay/c/a;

    iput-object p5, p0, Lcom/autochips/carplay/service/i;->tL:Lcom/autochips/carplay/c/e;

    iput-object p6, p0, Lcom/autochips/carplay/service/i;->tM:Lcom/autochips/carplay/common/c;

    iput-object p7, p0, Lcom/autochips/carplay/service/i;->tk:Landroid/os/INetworkManagementService;

    iput-object p8, p0, Lcom/autochips/carplay/service/i;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    new-instance p1, Lcom/autochips/carplay/service/l;

    invoke-direct {p1, p0, v1}, Lcom/autochips/carplay/service/l;-><init>(Lcom/autochips/carplay/service/i;B)V

    iput-object p1, p0, Lcom/autochips/carplay/service/i;->tN:Lcom/autochips/carplay/service/l;

    iget-object p1, p0, Lcom/autochips/carplay/service/i;->tN:Lcom/autochips/carplay/service/l;

    invoke-direct {p0, p1}, Lcom/autochips/carplay/service/i;->a(Lcom/autochips/carplay/service/l;)Z

    return-void
.end method

.method private E(Ljava/lang/String;)Z
    .locals 6

    iget-object v0, p0, Lcom/autochips/carplay/service/i;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/autochips/carplay/service/i;->tO:Lcom/autochips/carplay/service/k;

    invoke-static {v1, p1}, Lcom/autochips/carplay/service/k;->a(Lcom/autochips/carplay/service/k;Ljava/lang/String;)Lcom/autochips/carplay/service/j;

    move-result-object v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    const-string v1, "CarplayNative"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Trying to get iface state on invalid iface="

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return v2

    :cond_0
    const/4 v1, 0x0

    :try_start_1
    iget-object v3, p0, Lcom/autochips/carplay/service/i;->tk:Landroid/os/INetworkManagementService;

    invoke-interface {v3, p1}, Landroid/os/INetworkManagementService;->getInterfaceConfig(Ljava/lang/String;)Landroid/net/InterfaceConfiguration;

    move-result-object v3
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-object v1, v3

    goto :goto_0

    :catch_0
    move-exception v3

    :try_start_2
    const-string v4, "CarplayNative"

    const-string v5, ""

    invoke-static {v4, v5, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    if-nez v1, :cond_1

    monitor-exit v0

    return v2

    :cond_1
    invoke-virtual {v1}, Landroid/net/InterfaceConfiguration;->getHardwareAddress()Ljava/lang/String;

    move-result-object v1

    const-string v3, "CarplayNative"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "iface "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " hwAddr is "

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v3, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/autochips/carplay/service/i;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    if-eqz p1, :cond_2

    if-eqz v1, :cond_2

    invoke-static {v1}, Landroid/net/MacAddress;->fromString(Ljava/lang/String;)Landroid/net/MacAddress;

    move-result-object p1

    sget-object v3, Landroid/net/MacAddress;->ALL_ZEROS_ADDRESS:Landroid/net/MacAddress;

    invoke-virtual {p1, v3}, Landroid/net/MacAddress;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_2

    iget-object p1, p0, Lcom/autochips/carplay/service/i;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    const/16 v2, 0x804

    invoke-virtual {p1, v2, v1}, Lcom/autochips/carplay/service/h;->sendMessage(ILjava/lang/Object;)V

    const/4 v2, 0x1

    :cond_2
    monitor-exit v0

    return v2

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method

.method static synthetic a(Lcom/autochips/carplay/service/i;)Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/service/i;->mLock:Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic a(Lcom/autochips/carplay/service/i;Lcom/autochips/carplay/service/j;Z)V
    .locals 3

    iget-object v0, p0, Lcom/autochips/carplay/service/i;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-boolean v1, p1, Lcom/autochips/carplay/service/j;->tQ:Z

    if-ne p2, v1, :cond_1

    iget-boolean p0, p0, Lcom/autochips/carplay/service/i;->tP:Z

    if-eqz p0, :cond_0

    const-string p0, "CarplayNative"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Interface status unchanged on "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, " from "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string p1, ", Ignoring..."

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    monitor-exit v0

    return-void

    :cond_1
    const-string p0, "CarplayNative"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "onInterfaceStateChanged "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ", isUp="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iput-boolean p2, p1, Lcom/autochips/carplay/service/j;->tQ:Z

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method private a(Lcom/autochips/carplay/service/l;)Z
    .locals 3

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    :cond_0
    :try_start_0
    iget-object v1, p0, Lcom/autochips/carplay/service/i;->tk:Landroid/os/INetworkManagementService;

    invoke-interface {v1, p1}, Landroid/os/INetworkManagementService;->registerObserver(Landroid/net/INetworkManagementEventObserver;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 p1, 0x1

    return p1

    :catch_0
    move-exception p1

    const-string v1, "CarplayNative"

    const-string v2, ""

    invoke-static {v1, v2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return v0
.end method

.method static synthetic b(Lcom/autochips/carplay/service/i;)Lcom/autochips/carplay/service/k;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/service/i;->tO:Lcom/autochips/carplay/service/k;

    return-object p0
.end method

.method private b(Lcom/autochips/carplay/service/l;)Z
    .locals 3

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    :cond_0
    :try_start_0
    iget-object v1, p0, Lcom/autochips/carplay/service/i;->tk:Landroid/os/INetworkManagementService;

    invoke-interface {v1, p1}, Landroid/os/INetworkManagementService;->unregisterObserver(Landroid/net/INetworkManagementEventObserver;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 p1, 0x1

    return p1

    :catch_0
    move-exception p1

    const-string v1, "CarplayNative"

    const-string v2, ""

    invoke-static {v1, v2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return v0
.end method

.method static synthetic c(Lcom/autochips/carplay/service/i;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/autochips/carplay/service/i;->tP:Z

    return p0
.end method

.method static synthetic d(Lcom/autochips/carplay/service/i;)Lcom/autochips/carplay/service/h;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/service/i;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    return-object p0
.end method


# virtual methods
.method public final D(Ljava/lang/String;)Z
    .locals 5

    iget-object v0, p0, Lcom/autochips/carplay/service/i;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/autochips/carplay/service/i;->tO:Lcom/autochips/carplay/service/k;

    invoke-static {v1, p1}, Lcom/autochips/carplay/service/k;->a(Lcom/autochips/carplay/service/k;Ljava/lang/String;)Lcom/autochips/carplay/service/j;

    move-result-object v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    const-string v1, "CarplayNative"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Trying to get iface state on invalid iface="

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return v2

    :cond_0
    const/4 v1, 0x0

    :try_start_1
    iget-object v3, p0, Lcom/autochips/carplay/service/i;->tk:Landroid/os/INetworkManagementService;

    invoke-interface {v3, p1}, Landroid/os/INetworkManagementService;->getInterfaceConfig(Ljava/lang/String;)Landroid/net/InterfaceConfiguration;

    move-result-object p1
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception p1

    :try_start_2
    const-string v3, "CarplayNative"

    const-string v4, ""

    invoke-static {v3, v4, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-object p1, v1

    :goto_0
    if-nez p1, :cond_1

    monitor-exit v0

    return v2

    :cond_1
    invoke-virtual {p1}, Landroid/net/InterfaceConfiguration;->isUp()Z

    move-result p1

    monitor-exit v0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method

.method public final F(Ljava/lang/String;)Z
    .locals 2

    iget-object v0, p0, Lcom/autochips/carplay/service/i;->rY:Lcom/autochips/carplay/c/a;

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/c/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p1, p0, Lcom/autochips/carplay/service/i;->rY:Lcom/autochips/carplay/c/a;

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/c/a;->sendMessage(Landroid/os/Message;)Z

    move-result p1

    return p1
.end method

.method public final G(Ljava/lang/String;)Z
    .locals 2

    iget-object v0, p0, Lcom/autochips/carplay/service/i;->tJ:Lcom/autochips/carplay/plugin/a;

    const/16 v1, 0x10e

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/plugin/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p1, p0, Lcom/autochips/carplay/service/i;->tJ:Lcom/autochips/carplay/plugin/a;

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/plugin/a;->sendMessage(Landroid/os/Message;)Z

    move-result p1

    return p1
.end method

.method public final a(Lcom/autochips/carplay/common/f;I)Z
    .locals 2

    iget-object v0, p0, Lcom/autochips/carplay/service/i;->tJ:Lcom/autochips/carplay/plugin/a;

    const/16 v1, 0x10a

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/plugin/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iput p2, v0, Landroid/os/Message;->arg1:I

    iget-object p1, p0, Lcom/autochips/carplay/service/i;->tJ:Lcom/autochips/carplay/plugin/a;

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/plugin/a;->sendMessage(Landroid/os/Message;)Z

    move-result p1

    return p1
.end method

.method public final a(Lcom/autochips/carplay/common/h;)Z
    .locals 2

    iget-object v0, p0, Lcom/autochips/carplay/service/i;->tJ:Lcom/autochips/carplay/plugin/a;

    const/16 v1, 0x117

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/plugin/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p1, p0, Lcom/autochips/carplay/service/i;->tJ:Lcom/autochips/carplay/plugin/a;

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/plugin/a;->sendMessage(Landroid/os/Message;)Z

    move-result p1

    return p1
.end method

.method public final a(ZII)Z
    .locals 2

    iget-object v0, p0, Lcom/autochips/carplay/service/i;->tJ:Lcom/autochips/carplay/plugin/a;

    const/16 v1, 0x114

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/plugin/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iput p2, v0, Landroid/os/Message;->arg1:I

    iput p3, v0, Landroid/os/Message;->arg2:I

    iget-object p1, p0, Lcom/autochips/carplay/service/i;->tJ:Lcom/autochips/carplay/plugin/a;

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/plugin/a;->sendMessage(Landroid/os/Message;)Z

    move-result p1

    return p1
.end method

.method public final ad(I)Z
    .locals 4

    iget-object v0, p0, Lcom/autochips/carplay/service/i;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/autochips/carplay/service/i;->tO:Lcom/autochips/carplay/service/k;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/autochips/carplay/service/k;->b(Lcom/autochips/carplay/service/k;I)Lcom/autochips/carplay/service/j;

    move-result-object v1

    const-string v2, "ncm0"

    iput-object v2, v1, Lcom/autochips/carplay/service/j;->name:Ljava/lang/String;

    iget-object v2, p0, Lcom/autochips/carplay/service/i;->tI:Lcom/autochips/carplay/wired/a;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/autochips/carplay/wired/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object v3

    iput p1, v3, Landroid/os/Message;->arg1:I

    invoke-virtual {v2, v3}, Lcom/autochips/carplay/wired/a;->sendMessage(Landroid/os/Message;)Z

    move-result p1

    if-nez p1, :cond_0

    iget-object v2, p0, Lcom/autochips/carplay/service/i;->tO:Lcom/autochips/carplay/service/k;

    iget v1, v1, Lcom/autochips/carplay/service/j;->id:I

    invoke-static {v2, v1}, Lcom/autochips/carplay/service/k;->c(Lcom/autochips/carplay/service/k;I)Lcom/autochips/carplay/service/j;

    :cond_0
    monitor-exit v0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public final ae(I)Z
    .locals 3

    iget-object v0, p0, Lcom/autochips/carplay/service/i;->tI:Lcom/autochips/carplay/wired/a;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/wired/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    iput p1, v1, Landroid/os/Message;->arg1:I

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/wired/a;->sendMessage(Landroid/os/Message;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/autochips/carplay/service/i;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/autochips/carplay/service/i;->tO:Lcom/autochips/carplay/service/k;

    invoke-virtual {v1}, Lcom/autochips/carplay/service/k;->dU()V

    const-string v1, "CarplayNative"

    const-string v2, "Successfully remove ifaces"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    monitor-exit v0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    :cond_0
    return p1
.end method

.method public final af(I)Z
    .locals 2

    iget-object v0, p0, Lcom/autochips/carplay/service/i;->tJ:Lcom/autochips/carplay/plugin/a;

    const/16 v1, 0x115

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/plugin/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    iput p1, v0, Landroid/os/Message;->arg1:I

    iget-object p1, p0, Lcom/autochips/carplay/service/i;->tJ:Lcom/autochips/carplay/plugin/a;

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/plugin/a;->sendMessage(Landroid/os/Message;)Z

    move-result p1

    return p1
.end method

.method public final ag(I)Z
    .locals 2

    iget-object v0, p0, Lcom/autochips/carplay/service/i;->tJ:Lcom/autochips/carplay/plugin/a;

    const/16 v1, 0x116

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/plugin/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    iput p1, v0, Landroid/os/Message;->arg1:I

    iget-object p1, p0, Lcom/autochips/carplay/service/i;->tJ:Lcom/autochips/carplay/plugin/a;

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/plugin/a;->sendMessage(Landroid/os/Message;)Z

    move-result p1

    return p1
.end method

.method public final ah(I)Z
    .locals 2

    iget-object v0, p0, Lcom/autochips/carplay/service/i;->tJ:Lcom/autochips/carplay/plugin/a;

    const/16 v1, 0x107

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/plugin/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    iput p1, v0, Landroid/os/Message;->arg1:I

    iget-object p1, p0, Lcom/autochips/carplay/service/i;->tJ:Lcom/autochips/carplay/plugin/a;

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/plugin/a;->sendMessage(Landroid/os/Message;)Z

    move-result p1

    return p1
.end method

.method public final b(Lcom/autochips/carplay/common/f;)Z
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/autochips/carplay/service/i;->a(Lcom/autochips/carplay/common/f;I)Z

    move-result p1

    return p1
.end method

.method final cleanup()V
    .locals 1

    iget-object v0, p0, Lcom/autochips/carplay/service/i;->tN:Lcom/autochips/carplay/service/l;

    invoke-direct {p0, v0}, Lcom/autochips/carplay/service/i;->b(Lcom/autochips/carplay/service/l;)Z

    return-void
.end method

.method public final dH()Z
    .locals 6

    iget-object v0, p0, Lcom/autochips/carplay/service/i;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/autochips/carplay/service/i;->tO:Lcom/autochips/carplay/service/k;

    invoke-static {v1}, Lcom/autochips/carplay/service/k;->a(Lcom/autochips/carplay/service/k;)Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/autochips/carplay/service/i;->tO:Lcom/autochips/carplay/service/k;

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-static {v2, v3}, Lcom/autochips/carplay/service/k;->a(Lcom/autochips/carplay/service/k;I)Lcom/autochips/carplay/service/j;

    move-result-object v2

    iget-object v3, v2, Lcom/autochips/carplay/service/j;->name:Ljava/lang/String;

    invoke-direct {p0, v3}, Lcom/autochips/carplay/service/i;->E(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v1, 0x1

    const-string v3, "CarplayNative"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "carplayNetIfaceHasHWAddress "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string v0, "CarplayNative"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "carplayNetIfaceHasHWAddress, ret "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public final dI()V
    .locals 2

    iget-object v0, p0, Lcom/autochips/carplay/service/i;->rY:Lcom/autochips/carplay/c/a;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/autochips/carplay/service/i;->rY:Lcom/autochips/carplay/c/a;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/c/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/c/a;->sendMessage(Landroid/os/Message;)Z

    :cond_0
    return-void
.end method

.method public final dJ()Z
    .locals 2

    iget-object v0, p0, Lcom/autochips/carplay/service/i;->rY:Lcom/autochips/carplay/c/a;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/c/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/c/a;->sendMessage(Landroid/os/Message;)Z

    move-result v0

    return v0
.end method

.method public final dK()Z
    .locals 2

    iget-object v0, p0, Lcom/autochips/carplay/service/i;->rY:Lcom/autochips/carplay/c/a;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/c/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/c/a;->sendMessage(Landroid/os/Message;)Z

    move-result v0

    return v0
.end method

.method public final dL()Z
    .locals 4

    iget-object v0, p0, Lcom/autochips/carplay/service/i;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/autochips/carplay/service/i;->tO:Lcom/autochips/carplay/service/k;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/autochips/carplay/service/k;->b(Lcom/autochips/carplay/service/k;I)Lcom/autochips/carplay/service/j;

    move-result-object v1

    const-string v3, "ap0"

    iput-object v3, v1, Lcom/autochips/carplay/service/j;->name:Ljava/lang/String;

    iget-object v3, p0, Lcom/autochips/carplay/service/i;->tL:Lcom/autochips/carplay/c/e;

    invoke-virtual {v3, v2}, Lcom/autochips/carplay/c/e;->obtainMessage(I)Landroid/os/Message;

    move-result-object v2

    invoke-virtual {v3, v2}, Lcom/autochips/carplay/c/e;->sendMessage(Landroid/os/Message;)Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v3, p0, Lcom/autochips/carplay/service/i;->tO:Lcom/autochips/carplay/service/k;

    iget v1, v1, Lcom/autochips/carplay/service/j;->id:I

    invoke-static {v3, v1}, Lcom/autochips/carplay/service/k;->c(Lcom/autochips/carplay/service/k;I)Lcom/autochips/carplay/service/j;

    :cond_0
    monitor-exit v0

    return v2

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public final dM()Z
    .locals 4

    iget-object v0, p0, Lcom/autochips/carplay/service/i;->tL:Lcom/autochips/carplay/c/e;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/c/e;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/c/e;->sendMessage(Landroid/os/Message;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/autochips/carplay/service/i;->mLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v2, p0, Lcom/autochips/carplay/service/i;->tO:Lcom/autochips/carplay/service/k;

    invoke-virtual {v2}, Lcom/autochips/carplay/service/k;->dU()V

    const-string v2, "CarplayNative"

    const-string v3, "Successfully remove ifaces"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    monitor-exit v1

    return v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_0
    return v0
.end method

.method public final dN()Z
    .locals 2

    iget-object v0, p0, Lcom/autochips/carplay/service/i;->tK:Lcom/autochips/carplay/a/a;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/a/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/a/a;->sendMessage(Landroid/os/Message;)Z

    move-result v0

    return v0
.end method

.method public final dO()Z
    .locals 2

    iget-object v0, p0, Lcom/autochips/carplay/service/i;->tK:Lcom/autochips/carplay/a/a;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/a/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/a/a;->sendMessage(Landroid/os/Message;)Z

    move-result v0

    return v0
.end method

.method public final dP()Z
    .locals 2

    iget-object v0, p0, Lcom/autochips/carplay/service/i;->tJ:Lcom/autochips/carplay/plugin/a;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/plugin/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/plugin/a;->sendMessage(Landroid/os/Message;)Z

    move-result v0

    return v0
.end method

.method public final dQ()Z
    .locals 2

    iget-object v0, p0, Lcom/autochips/carplay/service/i;->tJ:Lcom/autochips/carplay/plugin/a;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/plugin/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/plugin/a;->sendMessage(Landroid/os/Message;)Z

    move-result v0

    return v0
.end method

.method public final dR()Z
    .locals 2

    iget-object v0, p0, Lcom/autochips/carplay/service/i;->tM:Lcom/autochips/carplay/common/c;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/common/c;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/common/c;->sendMessage(Landroid/os/Message;)Z

    move-result v0

    return v0
.end method

.method public final dS()Z
    .locals 2

    iget-object v0, p0, Lcom/autochips/carplay/service/i;->tM:Lcom/autochips/carplay/common/c;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/common/c;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/common/c;->sendMessage(Landroid/os/Message;)Z

    move-result v0

    return v0
.end method

.method public final dT()Z
    .locals 3

    iget-object v0, p0, Lcom/autochips/carplay/service/i;->tJ:Lcom/autochips/carplay/plugin/a;

    iget-object v1, p0, Lcom/autochips/carplay/service/i;->tJ:Lcom/autochips/carplay/plugin/a;

    const/16 v2, 0x108

    invoke-virtual {v1, v2}, Lcom/autochips/carplay/plugin/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/plugin/a;->sendMessage(Landroid/os/Message;)Z

    move-result v0

    return v0
.end method

.method public final f(ILjava/lang/String;)Z
    .locals 2

    iget-object v0, p0, Lcom/autochips/carplay/service/i;->tJ:Lcom/autochips/carplay/plugin/a;

    const/16 v1, 0x106

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/plugin/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    iput p1, v0, Landroid/os/Message;->arg1:I

    iput-object p2, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p1, p0, Lcom/autochips/carplay/service/i;->tJ:Lcom/autochips/carplay/plugin/a;

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/plugin/a;->sendMessage(Landroid/os/Message;)Z

    move-result p1

    return p1
.end method

.method public final m(II)Z
    .locals 2

    iget-object v0, p0, Lcom/autochips/carplay/service/i;->tJ:Lcom/autochips/carplay/plugin/a;

    const/16 v1, 0x10c

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/plugin/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    iput p1, v0, Landroid/os/Message;->arg1:I

    iput p2, v0, Landroid/os/Message;->arg2:I

    iget-object p1, p0, Lcom/autochips/carplay/service/i;->tJ:Lcom/autochips/carplay/plugin/a;

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/plugin/a;->sendMessage(Landroid/os/Message;)Z

    move-result p1

    return p1
.end method

.method public final n(II)Z
    .locals 2

    iget-object v0, p0, Lcom/autochips/carplay/service/i;->tJ:Lcom/autochips/carplay/plugin/a;

    const/16 v1, 0x10d

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/plugin/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    iput p1, v0, Landroid/os/Message;->arg1:I

    iput p2, v0, Landroid/os/Message;->arg2:I

    iget-object p1, p0, Lcom/autochips/carplay/service/i;->tJ:Lcom/autochips/carplay/plugin/a;

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/plugin/a;->sendMessage(Landroid/os/Message;)Z

    move-result p1

    return p1
.end method

.method public final o(Z)Z
    .locals 2

    iget-object v0, p0, Lcom/autochips/carplay/service/i;->tJ:Lcom/autochips/carplay/plugin/a;

    const/16 v1, 0x10b

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/plugin/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p1, p0, Lcom/autochips/carplay/service/i;->tJ:Lcom/autochips/carplay/plugin/a;

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/plugin/a;->sendMessage(Landroid/os/Message;)Z

    move-result p1

    return p1
.end method
