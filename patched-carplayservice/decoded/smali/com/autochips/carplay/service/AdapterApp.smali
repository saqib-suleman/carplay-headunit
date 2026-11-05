.class public Lcom/autochips/carplay/service/AdapterApp;
.super Landroid/app/Application;


# static fields
.field private static sY:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    sput v0, Lcom/autochips/carplay/service/AdapterApp;->sY:I

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    const-class v0, Lcom/autochips/carplay/service/AdapterApp;

    monitor-enter v0

    :try_start_0
    sget v1, Lcom/autochips/carplay/service/AdapterApp;->sY:I

    add-int/lit8 v1, v1, 0x1

    sput v1, Lcom/autochips/carplay/service/AdapterApp;->sY:I

    const-string v1, "CarplayAdapter_App"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "REFCOUNT: Constructed "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, " Instance Count = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v3, Lcom/autochips/carplay/service/AdapterApp;->sY:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method


# virtual methods
.method protected finalize()V
    .locals 4

    const-class v0, Lcom/autochips/carplay/service/AdapterApp;

    monitor-enter v0

    :try_start_0
    sget v1, Lcom/autochips/carplay/service/AdapterApp;->sY:I

    add-int/lit8 v1, v1, -0x1

    sput v1, Lcom/autochips/carplay/service/AdapterApp;->sY:I

    const-string v1, "CarplayAdapter_App"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "REFCOUNT: Finalized: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, ", Instance Count = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v3, Lcom/autochips/carplay/service/AdapterApp;->sY:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onCreate()V
    .locals 2

    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    const-string v0, "CarplayAdapter_App"

    const-string v1, "onCreate"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
