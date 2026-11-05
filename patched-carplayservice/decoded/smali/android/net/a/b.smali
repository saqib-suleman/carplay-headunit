.class final Landroid/net/a/b;
.super Landroid/net/util/h;


# instance fields
.field private final eo:Landroid/net/util/b;

.field final synthetic ep:Landroid/net/a/a;


# direct methods
.method constructor <init>(Landroid/net/a/a;Landroid/os/Handler;Landroid/net/util/b;)V
    .locals 0

    iput-object p1, p0, Landroid/net/a/b;->ep:Landroid/net/a/a;

    iget p1, p3, Landroid/net/util/b;->gm:I

    invoke-direct {p0, p2, p1}, Landroid/net/util/h;-><init>(Landroid/os/Handler;I)V

    iput-object p3, p0, Landroid/net/a/b;->eo:Landroid/net/util/b;

    return-void
.end method

.method private g(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Landroid/net/a/b;->ep:Landroid/net/a/a;

    invoke-static {v0}, Landroid/net/a/a;->b(Landroid/net/a/a;)Landroid/util/LocalLog;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/util/LocalLog;->log(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method protected final V()Ljava/io/FileDescriptor;
    .locals 5

    const/4 v0, 0x0

    :try_start_0
    sget v1, Landroid/system/OsConstants;->AF_PACKET:I

    sget v2, Landroid/system/OsConstants;->SOCK_RAW:I

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/system/Os;->socket(III)Ljava/io/FileDescriptor;

    move-result-object v1
    :try_end_0
    .catch Landroid/system/ErrnoException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    :try_start_1
    sget v2, Landroid/system/OsConstants;->ARPHRD_ETHER:I

    invoke-static {v1, v2}, Landroid/net/NetworkUtils;->attachControlPacketFilter(Ljava/io/FileDescriptor;I)V

    new-instance v2, Landroid/system/PacketSocketAddress;

    sget v3, Landroid/system/OsConstants;->ETH_P_ALL:I

    int-to-short v3, v3

    iget-object v4, p0, Landroid/net/a/b;->eo:Landroid/net/util/b;

    iget v4, v4, Landroid/net/util/b;->index:I

    invoke-direct {v2, v3, v4}, Landroid/system/PacketSocketAddress;-><init>(SI)V

    invoke-static {v1, v2}, Landroid/system/Os;->bind(Ljava/io/FileDescriptor;Ljava/net/SocketAddress;)V
    :try_end_1
    .catch Landroid/system/ErrnoException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    return-object v1

    :catch_0
    move-exception v2

    goto :goto_0

    :catch_1
    move-exception v2

    move-object v1, v0

    :goto_0
    const-string v3, "Failed to create packet tracking socket: "

    invoke-virtual {p0, v3, v2}, Landroid/net/a/b;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    invoke-static {v1}, Llibcore/io/IoUtils;->closeQuietly(Ljava/io/FileDescriptor;)V

    return-object v0
.end method

.method protected final c([BI)V
    .locals 3

    iget-object v0, p0, Landroid/net/a/b;->eo:Landroid/net/util/b;

    iget-object v0, v0, Landroid/net/util/b;->fx:Landroid/net/MacAddress;

    invoke-static {v0, p1, p2}, Landroid/net/util/a;->a(Landroid/net/MacAddress;[BI)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\n["

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance v0, Ljava/lang/String;

    const/4 v2, 0x0

    invoke-static {p1, v2, p2}, Llibcore/util/HexEncoding;->encode([BII)[C

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/String;-><init>([C)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "]"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Landroid/net/a/b;->g(Ljava/lang/String;)V

    return-void
.end method

.method protected final logError(Ljava/lang/String;Ljava/lang/Exception;)V
    .locals 1

    iget-object v0, p0, Landroid/net/a/b;->ep:Landroid/net/a/a;

    invoke-static {v0}, Landroid/net/a/a;->d(Landroid/net/a/a;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Landroid/net/a/b;->g(Ljava/lang/String;)V

    return-void
.end method

.method protected final onStart()V
    .locals 4

    iget-object v0, p0, Landroid/net/a/b;->ep:Landroid/net/a/a;

    invoke-static {v0}, Landroid/net/a/a;->a(Landroid/net/a/a;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "--- START ---"

    goto :goto_0

    :cond_0
    const-string v0, "--- START (%s) ---"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Landroid/net/a/b;->ep:Landroid/net/a/a;

    invoke-static {v3}, Landroid/net/a/a;->a(Landroid/net/a/a;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    iget-object v1, p0, Landroid/net/a/b;->ep:Landroid/net/a/a;

    invoke-static {v1}, Landroid/net/a/a;->b(Landroid/net/a/a;)Landroid/util/LocalLog;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/util/LocalLog;->log(Ljava/lang/String;)V

    return-void
.end method

.method protected final onStop()V
    .locals 4

    iget-object v0, p0, Landroid/net/a/b;->ep:Landroid/net/a/a;

    invoke-static {v0}, Landroid/net/a/a;->a(Landroid/net/a/a;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "--- STOP ---"

    goto :goto_0

    :cond_0
    const-string v0, "--- STOP (%s) ---"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Landroid/net/a/b;->ep:Landroid/net/a/a;

    invoke-static {v3}, Landroid/net/a/a;->a(Landroid/net/a/a;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    iget-object v1, p0, Landroid/net/a/b;->ep:Landroid/net/a/a;

    invoke-static {v1}, Landroid/net/a/a;->c(Landroid/net/a/a;)Z

    move-result v1

    if-nez v1, :cond_1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " (packet listener stopped unexpectedly)"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_1
    iget-object v1, p0, Landroid/net/a/b;->ep:Landroid/net/a/a;

    invoke-static {v1}, Landroid/net/a/a;->b(Landroid/net/a/a;)Landroid/util/LocalLog;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/util/LocalLog;->log(Ljava/lang/String;)V

    return-void
.end method
