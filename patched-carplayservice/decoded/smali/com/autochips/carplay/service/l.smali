.class final Lcom/autochips/carplay/service/l;
.super Lcom/android/server/net/BaseNetworkObserver;


# instance fields
.field final synthetic tU:Lcom/autochips/carplay/service/i;


# direct methods
.method private constructor <init>(Lcom/autochips/carplay/service/i;)V
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/service/l;->tU:Lcom/autochips/carplay/service/i;

    invoke-direct {p0}, Lcom/android/server/net/BaseNetworkObserver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/autochips/carplay/service/i;B)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/autochips/carplay/service/l;-><init>(Lcom/autochips/carplay/service/i;)V

    return-void
.end method


# virtual methods
.method public final addressRemoved(Ljava/lang/String;Landroid/net/LinkAddress;)V
    .locals 3

    const-string v0, "CarplayNative"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "addressRemoved, iface="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ", address="

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public final addressUpdated(Ljava/lang/String;Landroid/net/LinkAddress;)V
    .locals 3

    const-string v0, "CarplayNative"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "addressUpdated, iface="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ", address="

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public final interfaceAdded(Ljava/lang/String;)V
    .locals 4

    const-string v0, "CarplayNative"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "interfaceAdded, iface="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/service/l;->tU:Lcom/autochips/carplay/service/i;

    invoke-static {v0}, Lcom/autochips/carplay/service/i;->a(Lcom/autochips/carplay/service/i;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/autochips/carplay/service/l;->tU:Lcom/autochips/carplay/service/i;

    invoke-static {v1}, Lcom/autochips/carplay/service/i;->b(Lcom/autochips/carplay/service/i;)Lcom/autochips/carplay/service/k;

    move-result-object v1

    invoke-static {v1, p1}, Lcom/autochips/carplay/service/k;->a(Lcom/autochips/carplay/service/k;Ljava/lang/String;)Lcom/autochips/carplay/service/j;

    move-result-object v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/autochips/carplay/service/l;->tU:Lcom/autochips/carplay/service/i;

    invoke-static {v1}, Lcom/autochips/carplay/service/i;->c(Lcom/autochips/carplay/service/i;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "CarplayNative"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Received iface add notification on an invalid iface="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    monitor-exit v0

    return-void

    :cond_1
    const/4 v2, 0x1

    iput-boolean v2, v1, Lcom/autochips/carplay/service/j;->tR:Z

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/autochips/carplay/service/l;->tU:Lcom/autochips/carplay/service/i;

    invoke-static {v0}, Lcom/autochips/carplay/service/i;->d(Lcom/autochips/carplay/service/i;)Lcom/autochips/carplay/service/h;

    move-result-object v0

    const/16 v1, 0x801

    invoke-virtual {v0, v1, p1}, Lcom/autochips/carplay/service/h;->sendMessage(ILjava/lang/Object;)V

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public final interfaceLinkStateChanged(Ljava/lang/String;Z)V
    .locals 3

    const-string v0, "CarplayNative"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "interfaceLinkStateChanged, iface="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ", up="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p2, p0, Lcom/autochips/carplay/service/l;->tU:Lcom/autochips/carplay/service/i;

    invoke-static {p2}, Lcom/autochips/carplay/service/i;->a(Lcom/autochips/carplay/service/i;)Ljava/lang/Object;

    move-result-object p2

    monitor-enter p2

    :try_start_0
    iget-object v0, p0, Lcom/autochips/carplay/service/l;->tU:Lcom/autochips/carplay/service/i;

    invoke-static {v0}, Lcom/autochips/carplay/service/i;->b(Lcom/autochips/carplay/service/i;)Lcom/autochips/carplay/service/k;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/autochips/carplay/service/k;->a(Lcom/autochips/carplay/service/k;Ljava/lang/String;)Lcom/autochips/carplay/service/j;

    move-result-object v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/autochips/carplay/service/l;->tU:Lcom/autochips/carplay/service/i;

    invoke-static {v0}, Lcom/autochips/carplay/service/i;->c(Lcom/autochips/carplay/service/i;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "CarplayNative"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Received iface link up/down notification on an invalid iface="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    monitor-exit p2

    return-void

    :cond_1
    iget-object v1, p0, Lcom/autochips/carplay/service/l;->tU:Lcom/autochips/carplay/service/i;

    iget-object v2, p0, Lcom/autochips/carplay/service/l;->tU:Lcom/autochips/carplay/service/i;

    invoke-virtual {v2, p1}, Lcom/autochips/carplay/service/i;->D(Ljava/lang/String;)Z

    move-result v2

    invoke-static {v1, v0, v2}, Lcom/autochips/carplay/service/i;->a(Lcom/autochips/carplay/service/i;Lcom/autochips/carplay/service/j;Z)V

    iget-object v0, p0, Lcom/autochips/carplay/service/l;->tU:Lcom/autochips/carplay/service/i;

    invoke-static {v0}, Lcom/autochips/carplay/service/i;->d(Lcom/autochips/carplay/service/i;)Lcom/autochips/carplay/service/h;

    move-result-object v0

    const/16 v1, 0x803

    invoke-virtual {v0, v1, p1}, Lcom/autochips/carplay/service/h;->sendMessage(ILjava/lang/Object;)V

    monitor-exit p2

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public final interfaceRemoved(Ljava/lang/String;)V
    .locals 4

    const-string v0, "CarplayNative"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "interfaceRemoved, iface="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/service/l;->tU:Lcom/autochips/carplay/service/i;

    invoke-static {v0}, Lcom/autochips/carplay/service/i;->a(Lcom/autochips/carplay/service/i;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/autochips/carplay/service/l;->tU:Lcom/autochips/carplay/service/i;

    invoke-static {v1}, Lcom/autochips/carplay/service/i;->b(Lcom/autochips/carplay/service/i;)Lcom/autochips/carplay/service/k;

    move-result-object v1

    invoke-static {v1, p1}, Lcom/autochips/carplay/service/k;->a(Lcom/autochips/carplay/service/k;Ljava/lang/String;)Lcom/autochips/carplay/service/j;

    move-result-object v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/autochips/carplay/service/l;->tU:Lcom/autochips/carplay/service/i;

    invoke-static {v1}, Lcom/autochips/carplay/service/i;->c(Lcom/autochips/carplay/service/i;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "CarplayNative"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Received iface remove notification on an invalid iface="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    monitor-exit v0

    return-void

    :cond_1
    const/4 v2, 0x0

    iput-boolean v2, v1, Lcom/autochips/carplay/service/j;->tR:Z

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/autochips/carplay/service/l;->tU:Lcom/autochips/carplay/service/i;

    invoke-static {v0}, Lcom/autochips/carplay/service/i;->d(Lcom/autochips/carplay/service/i;)Lcom/autochips/carplay/service/h;

    move-result-object v0

    const/16 v1, 0x802

    invoke-virtual {v0, v1, p1}, Lcom/autochips/carplay/service/h;->sendMessage(ILjava/lang/Object;)V

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public final routeRemoved(Landroid/net/RouteInfo;)V
    .locals 3

    const-string v0, "CarplayNative"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "routeRemoved, route="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public final routeUpdated(Landroid/net/RouteInfo;)V
    .locals 3

    const-string v0, "CarplayNative"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "routeUpdated, route="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
