.class public final Lcom/autochips/carplay/service/z;
.super Ljava/lang/Object;


# static fields
.field private static final rS:Ljava/lang/Object;


# instance fields
.field private uE:Ljava/util/Map;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/autochips/carplay/service/z;->rS:Ljava/lang/Object;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic l()Ljava/lang/Object;
    .locals 1

    sget-object v0, Lcom/autochips/carplay/service/z;->rS:Ljava/lang/Object;

    return-object v0
.end method


# virtual methods
.method public final H(Ljava/lang/String;)Lcom/autochips/carplay/CarplayDevice;
    .locals 1

    iget-object v0, p0, Lcom/autochips/carplay/service/z;->uE:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/autochips/carplay/service/aa;

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    invoke-virtual {p1}, Lcom/autochips/carplay/service/aa;->getDevice()Lcom/autochips/carplay/CarplayDevice;

    move-result-object p1

    return-object p1
.end method

.method public final I(Ljava/lang/String;)Lcom/autochips/carplay/service/aa;
    .locals 3

    iget-object v0, p0, Lcom/autochips/carplay/service/z;->uE:Ljava/util/Map;

    monitor-enter v0

    :try_start_0
    new-instance v1, Lcom/autochips/carplay/service/aa;

    invoke-direct {v1, p0}, Lcom/autochips/carplay/service/aa;-><init>(Lcom/autochips/carplay/service/z;)V

    new-instance v2, Lcom/autochips/carplay/CarplayDevice;

    invoke-direct {v2, p1}, Lcom/autochips/carplay/CarplayDevice;-><init>(Ljava/lang/String;)V

    invoke-static {v1, v2}, Lcom/autochips/carplay/service/aa;->a(Lcom/autochips/carplay/service/aa;Lcom/autochips/carplay/CarplayDevice;)Lcom/autochips/carplay/CarplayDevice;

    invoke-static {v1, p1}, Lcom/autochips/carplay/service/aa;->a(Lcom/autochips/carplay/service/aa;Ljava/lang/String;)Ljava/lang/String;

    iget-object v2, p0, Lcom/autochips/carplay/service/z;->uE:Ljava/util/Map;

    invoke-interface {v2, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public final J(Ljava/lang/String;)V
    .locals 2

    iget-object v0, p0, Lcom/autochips/carplay/service/z;->uE:Ljava/util/Map;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/autochips/carplay/service/z;->uE:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public final b(Lcom/autochips/carplay/CarplayDevice;)Lcom/autochips/carplay/service/aa;
    .locals 2

    iget-object v0, p0, Lcom/autochips/carplay/service/z;->uE:Ljava/util/Map;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/autochips/carplay/service/z;->uE:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/autochips/carplay/CarplayDevice;->getDeviceId()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/autochips/carplay/service/aa;

    monitor-exit v0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public final clone()Ljava/lang/Object;
    .locals 1

    new-instance v0, Ljava/lang/CloneNotSupportedException;

    invoke-direct {v0}, Ljava/lang/CloneNotSupportedException;-><init>()V

    throw v0
.end method

.method final init()V
    .locals 1

    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/autochips/carplay/service/z;->uE:Ljava/util/Map;

    return-void
.end method

.method final reset()V
    .locals 1

    iget-object v0, p0, Lcom/autochips/carplay/service/z;->uE:Ljava/util/Map;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/autochips/carplay/service/z;->uE:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    :cond_0
    return-void
.end method
