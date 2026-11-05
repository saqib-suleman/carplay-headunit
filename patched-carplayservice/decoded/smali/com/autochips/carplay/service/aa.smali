.class public final Lcom/autochips/carplay/service/aa;
.super Ljava/lang/Object;


# instance fields
.field private mName:Ljava/lang/String;

.field private rj:Ljava/lang/String;

.field private uF:Ljava/lang/String;

.field private uG:Lcom/autochips/carplay/CarplayDevice;

.field private uH:Ljava/util/Map;

.field final synthetic uI:Lcom/autochips/carplay/service/z;


# direct methods
.method constructor <init>(Lcom/autochips/carplay/service/z;)V
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/service/aa;->uI:Lcom/autochips/carplay/service/z;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {p1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object p1, p0, Lcom/autochips/carplay/service/aa;->uH:Ljava/util/Map;

    return-void
.end method

.method static synthetic a(Lcom/autochips/carplay/service/aa;Lcom/autochips/carplay/CarplayDevice;)Lcom/autochips/carplay/CarplayDevice;
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/service/aa;->uG:Lcom/autochips/carplay/CarplayDevice;

    return-object p1
.end method

.method static synthetic a(Lcom/autochips/carplay/service/aa;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/service/aa;->rj:Ljava/lang/String;

    return-object p1
.end method


# virtual methods
.method final getDevice()Lcom/autochips/carplay/CarplayDevice;
    .locals 2

    invoke-static {}, Lcom/autochips/carplay/service/z;->l()Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/autochips/carplay/service/aa;->uG:Lcom/autochips/carplay/CarplayDevice;

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method final getName()Ljava/lang/String;
    .locals 2

    invoke-static {}, Lcom/autochips/carplay/service/z;->l()Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/autochips/carplay/service/aa;->mName:Ljava/lang/String;

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public final h(III)V
    .locals 4

    invoke-static {}, Lcom/autochips/carplay/service/z;->l()Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    :try_start_0
    const-string v1, "RemoteDevices"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "setStreamState, streamId="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, ", audioType="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, ", streamState="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, p0, Lcom/autochips/carplay/service/aa;->uH:Ljava/util/Map;

    new-instance v2, Ljava/lang/Integer;

    invoke-direct {v2, p1}, Ljava/lang/Integer;-><init>(I)V

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/autochips/carplay/service/ab;

    if-nez v1, :cond_0

    new-instance v1, Lcom/autochips/carplay/service/ab;

    iget-object v2, p0, Lcom/autochips/carplay/service/aa;->uI:Lcom/autochips/carplay/service/z;

    invoke-direct {v1, v2}, Lcom/autochips/carplay/service/ab;-><init>(Lcom/autochips/carplay/service/z;)V

    :cond_0
    invoke-virtual {v1, p2, p3}, Lcom/autochips/carplay/service/ab;->s(II)V

    iget-object p2, p0, Lcom/autochips/carplay/service/aa;->uH:Ljava/util/Map;

    new-instance p3, Ljava/lang/Integer;

    invoke-direct {p3, p1}, Ljava/lang/Integer;-><init>(I)V

    invoke-interface {p2, p3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public final r(II)I
    .locals 5

    invoke-static {}, Lcom/autochips/carplay/service/z;->l()Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/autochips/carplay/service/aa;->uH:Ljava/util/Map;

    new-instance v2, Ljava/lang/Integer;

    invoke-direct {v2, p1}, Ljava/lang/Integer;-><init>(I)V

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/autochips/carplay/service/ab;

    const-string v2, "RemoteDevices"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "getStreamState, streamId="

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ", audioType="

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ", type="

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz v1, :cond_0

    invoke-virtual {v1, p2}, Lcom/autochips/carplay/service/ab;->am(I)I

    move-result p1

    const-string p2, "RemoteDevices"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "getStreamState, state="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p2, v1}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_0
    const/4 p1, 0x1

    :goto_0
    monitor-exit v0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public final setAddress(Ljava/lang/String;)V
    .locals 1

    invoke-static {}, Lcom/autochips/carplay/service/z;->l()Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    :try_start_0
    iput-object p1, p0, Lcom/autochips/carplay/service/aa;->uF:Ljava/lang/String;

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public final setName(Ljava/lang/String;)V
    .locals 1

    invoke-static {}, Lcom/autochips/carplay/service/z;->l()Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    :try_start_0
    iput-object p1, p0, Lcom/autochips/carplay/service/aa;->mName:Ljava/lang/String;

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method
