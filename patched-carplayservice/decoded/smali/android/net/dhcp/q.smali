.class final Landroid/net/dhcp/q;
.super Ljava/lang/Thread;


# instance fields
.field private final bM:[B

.field final synthetic dB:Landroid/net/dhcp/b;

.field private volatile mStopped:Z


# direct methods
.method constructor <init>(Landroid/net/dhcp/b;)V
    .locals 0

    iput-object p1, p0, Landroid/net/dhcp/q;->dB:Landroid/net/dhcp/b;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    const/16 p1, 0x5dc

    new-array p1, p1, [B

    iput-object p1, p0, Landroid/net/dhcp/q;->bM:[B

    const/4 p1, 0x0

    iput-boolean p1, p0, Landroid/net/dhcp/q;->mStopped:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    const-string v0, "DhcpClient"

    const-string v1, "Receive thread started"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    :goto_0
    iget-boolean v0, p0, Landroid/net/dhcp/q;->mStopped:Z

    if-nez v0, :cond_2

    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Landroid/net/dhcp/q;->dB:Landroid/net/dhcp/b;

    invoke-static {v1}, Landroid/net/dhcp/b;->b(Landroid/net/dhcp/b;)Ljava/io/FileDescriptor;

    move-result-object v1

    iget-object v2, p0, Landroid/net/dhcp/q;->bM:[B

    iget-object v3, p0, Landroid/net/dhcp/q;->bM:[B

    array-length v3, v3

    invoke-static {v1, v2, v0, v3}, Landroid/system/Os;->read(Ljava/io/FileDescriptor;[BII)I

    move-result v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Landroid/system/ErrnoException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Landroid/net/dhcp/DhcpPacket$ParseException; {:try_start_0 .. :try_end_0} :catch_1

    :try_start_1
    iget-object v2, p0, Landroid/net/dhcp/q;->bM:[B

    invoke-static {v2, v1}, Landroid/net/dhcp/DhcpPacket;->b([BI)Landroid/net/dhcp/DhcpPacket;

    move-result-object v2

    const-string v3, "DhcpClient"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Received packet: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v3, p0, Landroid/net/dhcp/q;->dB:Landroid/net/dhcp/b;

    const v4, 0x30066

    invoke-virtual {v3, v4, v2}, Landroid/net/dhcp/b;->sendMessage(ILjava/lang/Object;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Landroid/system/ErrnoException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Landroid/net/dhcp/DhcpPacket$ParseException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception v2

    goto :goto_1

    :catch_1
    move-exception v2

    move v1, v0

    :goto_1
    const-string v3, "DhcpClient"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Can\'t parse packet: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Landroid/net/dhcp/DhcpPacket$ParseException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const-string v3, "DhcpClient"

    iget-object v4, p0, Landroid/net/dhcp/q;->bM:[B

    invoke-static {v4, v0, v1}, Lcom/android/internal/util/HexDump;->dumpHexString([BII)Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget v1, v2, Landroid/net/dhcp/DhcpPacket$ParseException;->errorCode:I

    sget v3, Landroid/net/metrics/DhcpErrorEvent;->DHCP_NO_COOKIE:I

    if-ne v1, v3, :cond_1

    const-string v1, "31850211"

    const-class v3, Landroid/net/dhcp/DhcpPacket$ParseException;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    const v4, 0x534e4554

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v1, v5, v0

    const/4 v0, 0x1

    const/4 v1, -0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v5, v0

    const/4 v0, 0x2

    aput-object v3, v5, v0

    invoke-static {v4, v5}, Landroid/util/EventLog;->writeEvent(I[Ljava/lang/Object;)I

    :cond_1
    iget-object v0, p0, Landroid/net/dhcp/q;->dB:Landroid/net/dhcp/b;

    iget v1, v2, Landroid/net/dhcp/DhcpPacket$ParseException;->errorCode:I

    :goto_2
    invoke-static {v0, v1}, Landroid/net/dhcp/b;->a(Landroid/net/dhcp/b;I)V

    goto/16 :goto_0

    :catch_2
    move-exception v0

    iget-boolean v1, p0, Landroid/net/dhcp/q;->mStopped:Z

    if-nez v1, :cond_0

    const-string v1, "DhcpClient"

    const-string v2, "Read error"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    iget-object v0, p0, Landroid/net/dhcp/q;->dB:Landroid/net/dhcp/b;

    sget v1, Landroid/net/metrics/DhcpErrorEvent;->RECEIVE_ERROR:I

    goto :goto_2

    :cond_2
    const-string v0, "DhcpClient"

    const-string v1, "Receive thread stopped"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public final z()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/net/dhcp/q;->mStopped:Z

    iget-object v0, p0, Landroid/net/dhcp/q;->dB:Landroid/net/dhcp/b;

    invoke-static {v0}, Landroid/net/dhcp/b;->a(Landroid/net/dhcp/b;)V

    return-void
.end method
