.class public abstract Landroid/net/util/h;
.super Ljava/lang/Object;


# instance fields
.field private final bM:[B

.field private gx:Ljava/io/FileDescriptor;

.field private gy:J

.field private final mHandler:Landroid/os/Handler;

.field private final mQueue:Landroid/os/MessageQueue;


# direct methods
.method protected constructor <init>(Landroid/os/Handler;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroid/net/util/h;->mHandler:Landroid/os/Handler;

    iget-object p1, p0, Landroid/net/util/h;->mHandler:Landroid/os/Handler;

    invoke-virtual {p1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/Looper;->getQueue()Landroid/os/MessageQueue;

    move-result-object p1

    iput-object p1, p0, Landroid/net/util/h;->mQueue:Landroid/os/MessageQueue;

    const/16 p1, 0x800

    invoke-static {p2, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    new-array p1, p1, [B

    iput-object p1, p0, Landroid/net/util/h;->bM:[B

    return-void
.end method

.method static synthetic a(Landroid/net/util/h;)Z
    .locals 0

    invoke-direct {p0}, Landroid/net/util/h;->isRunning()Z

    move-result p0

    return p0
.end method

.method private aD()V
    .locals 4

    iget-object v0, p0, Landroid/net/util/h;->gx:Ljava/io/FileDescriptor;

    if-eqz v0, :cond_0

    return-void

    :cond_0
    :try_start_0
    invoke-virtual {p0}, Landroid/net/util/h;->V()Ljava/io/FileDescriptor;

    move-result-object v0

    iput-object v0, p0, Landroid/net/util/h;->gx:Ljava/io/FileDescriptor;

    iget-object v0, p0, Landroid/net/util/h;->gx:Ljava/io/FileDescriptor;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/net/util/h;->gx:Ljava/io/FileDescriptor;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Llibcore/io/IoUtils;->setBlocking(Ljava/io/FileDescriptor;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_1
    iget-object v0, p0, Landroid/net/util/h;->gx:Ljava/io/FileDescriptor;

    if-nez v0, :cond_2

    return-void

    :cond_2
    iget-object v0, p0, Landroid/net/util/h;->mQueue:Landroid/os/MessageQueue;

    iget-object v1, p0, Landroid/net/util/h;->gx:Ljava/io/FileDescriptor;

    const/4 v2, 0x5

    new-instance v3, Landroid/net/util/i;

    invoke-direct {v3, p0}, Landroid/net/util/i;-><init>(Landroid/net/util/h;)V

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/MessageQueue;->addOnFileDescriptorEventListener(Ljava/io/FileDescriptor;ILandroid/os/MessageQueue$OnFileDescriptorEventListener;)V

    invoke-virtual {p0}, Landroid/net/util/h;->onStart()V

    return-void

    :catch_0
    move-exception v0

    const-string v1, "Failed to create socket: "

    invoke-virtual {p0, v1, v0}, Landroid/net/util/h;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    iget-object v0, p0, Landroid/net/util/h;->gx:Ljava/io/FileDescriptor;

    invoke-static {v0}, Llibcore/io/IoUtils;->closeQuietly(Ljava/io/FileDescriptor;)V

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/net/util/h;->gx:Ljava/io/FileDescriptor;

    return-void
.end method

.method private aE()Z
    .locals 6

    :cond_0
    :goto_0
    invoke-direct {p0}, Landroid/net/util/h;->isRunning()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    :try_start_0
    iget-object v0, p0, Landroid/net/util/h;->gx:Ljava/io/FileDescriptor;

    iget-object v2, p0, Landroid/net/util/h;->bM:[B

    array-length v3, v2

    invoke-static {v0, v2, v1, v3}, Landroid/system/Os;->read(Ljava/io/FileDescriptor;[BII)I

    move-result v0

    if-gtz v0, :cond_1

    invoke-direct {p0}, Landroid/net/util/h;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "Socket closed, exiting"

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v2}, Landroid/net/util/h;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    return v1

    :cond_1
    iget-wide v2, p0, Landroid/net/util/h;->gy:J

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    iput-wide v2, p0, Landroid/net/util/h;->gy:J
    :try_end_0
    .catch Landroid/system/ErrnoException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    :try_start_1
    iget-object v2, p0, Landroid/net/util/h;->bM:[B

    invoke-virtual {p0, v2, v0}, Landroid/net/util/h;->c([BI)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v2, "handlePacket error: "

    :goto_1
    invoke-virtual {p0, v2, v0}, Landroid/net/util/h;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    return v1

    :catch_1
    move-exception v0

    invoke-direct {p0}, Landroid/net/util/h;->isRunning()Z

    move-result v2

    if-eqz v2, :cond_3

    :goto_2
    const-string v2, "readPacket error: "

    goto :goto_1

    :catch_2
    move-exception v0

    iget v2, v0, Landroid/system/ErrnoException;->errno:I

    sget v3, Landroid/system/OsConstants;->EAGAIN:I

    if-ne v2, v3, :cond_2

    const/4 v0, 0x1

    return v0

    :cond_2
    iget v2, v0, Landroid/system/ErrnoException;->errno:I

    sget v3, Landroid/system/OsConstants;->EINTR:I

    if-eq v2, v3, :cond_0

    invoke-direct {p0}, Landroid/net/util/h;->isRunning()Z

    move-result v2

    if-eqz v2, :cond_3

    goto :goto_2

    :cond_3
    return v1
.end method

.method private aF()V
    .locals 2

    iget-object v0, p0, Landroid/net/util/h;->gx:Ljava/io/FileDescriptor;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Landroid/net/util/h;->mQueue:Landroid/os/MessageQueue;

    iget-object v1, p0, Landroid/net/util/h;->gx:Ljava/io/FileDescriptor;

    invoke-virtual {v0, v1}, Landroid/os/MessageQueue;->removeOnFileDescriptorEventListener(Ljava/io/FileDescriptor;)V

    iget-object v0, p0, Landroid/net/util/h;->gx:Ljava/io/FileDescriptor;

    invoke-static {v0}, Llibcore/io/IoUtils;->closeQuietly(Ljava/io/FileDescriptor;)V

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/net/util/h;->gx:Ljava/io/FileDescriptor;

    invoke-virtual {p0}, Landroid/net/util/h;->onStop()V

    return-void
.end method

.method private aG()Z
    .locals 2

    iget-object v0, p0, Landroid/net/util/h;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private synthetic aH()V
    .locals 2

    const-string v0, "stop() called from off-thread"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/net/util/h;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    invoke-direct {p0}, Landroid/net/util/h;->aF()V

    return-void
.end method

.method private synthetic aI()V
    .locals 2

    const-string v0, "start() called from off-thread"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/net/util/h;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    invoke-direct {p0}, Landroid/net/util/h;->aD()V

    return-void
.end method

.method static synthetic b(Landroid/net/util/h;)Z
    .locals 0

    invoke-direct {p0}, Landroid/net/util/h;->aE()Z

    move-result p0

    return p0
.end method

.method static synthetic c(Landroid/net/util/h;)V
    .locals 0

    invoke-direct {p0}, Landroid/net/util/h;->aF()V

    return-void
.end method

.method private isRunning()Z
    .locals 1

    iget-object v0, p0, Landroid/net/util/h;->gx:Ljava/io/FileDescriptor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/net/util/h;->gx:Ljava/io/FileDescriptor;

    invoke-virtual {v0}, Ljava/io/FileDescriptor;->valid()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public static synthetic lambda$I-57N33hBKIiOhPfHVG2j7z_gWQ(Landroid/net/util/h;)V
    .locals 0

    invoke-direct {p0}, Landroid/net/util/h;->aH()V

    return-void
.end method

.method public static synthetic lambda$bbYpT7OdnqKbcSrBMhZ0rB5lF-Y(Landroid/net/util/h;)V
    .locals 0

    invoke-direct {p0}, Landroid/net/util/h;->aI()V

    return-void
.end method


# virtual methods
.method protected abstract V()Ljava/io/FileDescriptor;
.end method

.method protected c([BI)V
    .locals 0

    return-void
.end method

.method public final getHandler()Landroid/os/Handler;
    .locals 1

    iget-object v0, p0, Landroid/net/util/h;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method protected logError(Ljava/lang/String;Ljava/lang/Exception;)V
    .locals 0

    return-void
.end method

.method protected onStart()V
    .locals 0

    return-void
.end method

.method protected onStop()V
    .locals 0

    return-void
.end method

.method public final start()V
    .locals 2

    invoke-direct {p0}, Landroid/net/util/h;->aG()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Landroid/net/util/h;->aD()V

    return-void

    :cond_0
    iget-object v0, p0, Landroid/net/util/h;->mHandler:Landroid/os/Handler;

    new-instance v1, Landroid/net/util/-$$Lambda$h$bbYpT7OdnqKbcSrBMhZ0rB5lF-Y;

    invoke-direct {v1, p0}, Landroid/net/util/-$$Lambda$h$bbYpT7OdnqKbcSrBMhZ0rB5lF-Y;-><init>(Landroid/net/util/h;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final stop()V
    .locals 2

    invoke-direct {p0}, Landroid/net/util/h;->aG()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Landroid/net/util/h;->aF()V

    return-void

    :cond_0
    iget-object v0, p0, Landroid/net/util/h;->mHandler:Landroid/os/Handler;

    new-instance v1, Landroid/net/util/-$$Lambda$h$I-57N33hBKIiOhPfHVG2j7z_gWQ;

    invoke-direct {v1, p0}, Landroid/net/util/-$$Lambda$h$I-57N33hBKIiOhPfHVG2j7z_gWQ;-><init>(Landroid/net/util/h;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
