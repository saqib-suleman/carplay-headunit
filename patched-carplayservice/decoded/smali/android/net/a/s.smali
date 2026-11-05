.class public Landroid/net/a/s;
.super Landroid/net/util/h;


# static fields
.field private static final DBG:Z

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final et:Landroid/net/util/SharedLog;

.field private final fr:Landroid/net/a/u;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Landroid/net/a/s;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroid/net/a/s;->TAG:Ljava/lang/String;

    sget-boolean v0, Landroid/os/Build;->IS_USER:Z

    xor-int/lit8 v0, v0, 0x1

    sput-boolean v0, Landroid/net/a/s;->DBG:Z

    return-void
.end method

.method public constructor <init>(Landroid/os/Handler;Landroid/net/util/SharedLog;Landroid/net/a/u;)V
    .locals 1

    const/16 v0, 0x2000

    invoke-direct {p0, p1, v0}, Landroid/net/util/h;-><init>(Landroid/os/Handler;I)V

    sget-object p1, Landroid/net/a/s;->TAG:Ljava/lang/String;

    invoke-virtual {p2, p1}, Landroid/net/util/SharedLog;->o(Ljava/lang/String;)Landroid/net/util/SharedLog;

    move-result-object p1

    iput-object p1, p0, Landroid/net/a/s;->et:Landroid/net/util/SharedLog;

    if-eqz p3, :cond_0

    goto :goto_0

    :cond_0
    sget-object p3, Landroid/net/a/-$$Lambda$s$xQq0W9fV4hjUSHiwgukPARYFLyU;->INSTANCE:Landroid/net/a/-$$Lambda$s$xQq0W9fV4hjUSHiwgukPARYFLyU;

    :goto_0
    iput-object p3, p0, Landroid/net/a/s;->fr:Landroid/net/a/u;

    return-void
.end method

.method public static a(ILjava/net/InetAddress;)I
    .locals 4

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "probing ip="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "%"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sget-boolean v1, Landroid/net/a/s;->DBG:Z

    if-eqz v1, :cond_0

    sget-object v1, Landroid/net/a/s;->TAG:Ljava/lang/String;

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    invoke-static {p1, p0}, Landroid/net/b/e;->a(Ljava/net/InetAddress;I)[B

    move-result-object p0

    :try_start_0
    sget p1, Landroid/system/OsConstants;->NETLINK_ROUTE:I
    :try_end_0
    .catch Landroid/system/ErrnoException; {:try_start_0 .. :try_end_0} :catch_2

    :try_start_1
    invoke-static {p1}, Landroid/net/b/d;->i(I)Ljava/io/FileDescriptor;

    move-result-object p1

    new-instance v1, Landroid/system/NetlinkSocketAddress;

    const/4 v2, 0x0

    invoke-direct {v1, v2, v2}, Landroid/system/NetlinkSocketAddress;-><init>(II)V

    invoke-static {p1, v1}, Landroid/system/Os;->connect(Ljava/io/FileDescriptor;Ljava/net/SocketAddress;)V

    array-length v1, p0

    invoke-static {p1, p0, v1}, Landroid/net/b/d;->a(Ljava/io/FileDescriptor;[BI)I

    invoke-static {p1}, Landroid/net/b/d;->b(Ljava/io/FileDescriptor;)Ljava/nio/ByteBuffer;

    move-result-object p0

    invoke-static {p0}, Landroid/net/b/c;->e(Ljava/nio/ByteBuffer;)Landroid/net/b/c;

    move-result-object v1

    if-eqz v1, :cond_2

    instance-of v3, v1, Landroid/net/b/b;

    if-eqz v3, :cond_2

    move-object v3, v1

    check-cast v3, Landroid/net/b/b;

    invoke-virtual {v3}, Landroid/net/b/b;->ap()Landroid/net/b/i;

    move-result-object v3

    if-eqz v3, :cond_2

    move-object p0, v1

    check-cast p0, Landroid/net/b/b;

    invoke-virtual {p0}, Landroid/net/b/b;->ap()Landroid/net/b/i;

    move-result-object p0

    iget p0, p0, Landroid/net/b/i;->error:I
    :try_end_1
    .catch Ljava/io/InterruptedIOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/net/SocketException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Landroid/system/ErrnoException; {:try_start_1 .. :try_end_1} :catch_2

    if-nez p0, :cond_1

    :try_start_2
    invoke-static {p1}, Llibcore/io/IoUtils;->closeQuietly(Ljava/io/FileDescriptor;)V
    :try_end_2
    .catch Landroid/system/ErrnoException; {:try_start_2 .. :try_end_2} :catch_2

    return v2

    :cond_1
    :try_start_3
    const-string p1, "NetlinkSocket"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Error in NetlinkSocket.sendOneShotKernelMessage, errmsg="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Landroid/net/b/c;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    new-instance p1, Landroid/system/ErrnoException;

    invoke-virtual {v1}, Landroid/net/b/c;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0}, Ljava/lang/Math;->abs(I)I

    move-result p0

    invoke-direct {p1, v1, p0}, Landroid/system/ErrnoException;-><init>(Ljava/lang/String;I)V

    throw p1

    :cond_2
    if-nez v1, :cond_3

    invoke-virtual {p0, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "raw bytes: "

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p0}, Landroid/net/b/a;->d(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_3
    invoke-virtual {v1}, Landroid/net/b/c;->toString()Ljava/lang/String;

    move-result-object p0

    :goto_0
    const-string p1, "NetlinkSocket"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Error in NetlinkSocket.sendOneShotKernelMessage, errmsg="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    new-instance p1, Landroid/system/ErrnoException;

    sget v1, Landroid/system/OsConstants;->EPROTO:I

    invoke-direct {p1, p0, v1}, Landroid/system/ErrnoException;-><init>(Ljava/lang/String;I)V

    throw p1
    :try_end_3
    .catch Ljava/io/InterruptedIOException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/net/SocketException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Landroid/system/ErrnoException; {:try_start_3 .. :try_end_3} :catch_2

    :catch_0
    move-exception p0

    :try_start_4
    const-string p1, "NetlinkSocket"

    const-string v1, "Error in NetlinkSocket.sendOneShotKernelMessage"

    invoke-static {p1, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    new-instance p1, Landroid/system/ErrnoException;

    const-string v1, "Error in NetlinkSocket.sendOneShotKernelMessage"

    sget v2, Landroid/system/OsConstants;->EIO:I

    invoke-direct {p1, v1, v2, p0}, Landroid/system/ErrnoException;-><init>(Ljava/lang/String;ILjava/lang/Throwable;)V

    throw p1

    :catch_1
    move-exception p0

    const-string p1, "NetlinkSocket"

    const-string v1, "Error in NetlinkSocket.sendOneShotKernelMessage"

    invoke-static {p1, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    new-instance p1, Landroid/system/ErrnoException;

    const-string v1, "Error in NetlinkSocket.sendOneShotKernelMessage"

    sget v2, Landroid/system/OsConstants;->ETIMEDOUT:I

    invoke-direct {p1, v1, v2, p0}, Landroid/system/ErrnoException;-><init>(Ljava/lang/String;ILjava/lang/Throwable;)V

    throw p1
    :try_end_4
    .catch Landroid/system/ErrnoException; {:try_start_4 .. :try_end_4} :catch_2

    :catch_2
    move-exception p0

    sget-object p1, Landroid/net/a/s;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Error "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ": "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget p0, p0, Landroid/system/ErrnoException;->errno:I

    neg-int p0, p0

    return p0
.end method

.method private static synthetic a(Landroid/net/a/t;)V
    .locals 0

    return-void
.end method

.method private static f([B)Landroid/net/MacAddress;
    .locals 3

    if-eqz p0, :cond_0

    :try_start_0
    invoke-static {p0}, Landroid/net/MacAddress;->fromBytes([B)Landroid/net/MacAddress;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    sget-object v0, Landroid/net/a/s;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Failed to parse link-layer address: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p0}, Landroid/net/b/a;->g([B)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static synthetic lambda$xQq0W9fV4hjUSHiwgukPARYFLyU(Landroid/net/a/t;)V
    .locals 0

    invoke-static {p0}, Landroid/net/a/s;->a(Landroid/net/a/t;)V

    return-void
.end method


# virtual methods
.method protected final V()Ljava/io/FileDescriptor;
    .locals 5

    const/4 v0, 0x0

    :try_start_0
    sget v1, Landroid/system/OsConstants;->NETLINK_ROUTE:I

    invoke-static {v1}, Landroid/net/b/d;->i(I)Ljava/io/FileDescriptor;

    move-result-object v1
    :try_end_0
    .catch Landroid/system/ErrnoException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_1

    :try_start_1
    new-instance v2, Landroid/system/NetlinkSocketAddress;

    sget v3, Landroid/system/OsConstants;->RTMGRP_NEIGH:I

    const/4 v4, 0x0

    invoke-direct {v2, v4, v3}, Landroid/system/NetlinkSocketAddress;-><init>(II)V

    invoke-static {v1, v2}, Landroid/system/Os;->bind(Ljava/io/FileDescriptor;Ljava/net/SocketAddress;)V

    new-instance v2, Landroid/system/NetlinkSocketAddress;

    invoke-direct {v2, v4, v4}, Landroid/system/NetlinkSocketAddress;-><init>(II)V

    invoke-static {v1, v2}, Landroid/system/Os;->connect(Ljava/io/FileDescriptor;Ljava/net/SocketAddress;)V
    :try_end_1
    .catch Landroid/system/ErrnoException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/net/SocketException; {:try_start_1 .. :try_end_1} :catch_0

    return-object v1

    :catch_0
    move-exception v2

    goto :goto_0

    :catch_1
    move-exception v2

    move-object v1, v0

    :goto_0
    const-string v3, "Failed to create rtnetlink socket"

    invoke-virtual {p0, v3, v2}, Landroid/net/a/s;->logError(Ljava/lang/String;Ljava/lang/Exception;)V

    invoke-static {v1}, Llibcore/io/IoUtils;->closeQuietly(Ljava/io/FileDescriptor;)V

    return-object v0
.end method

.method protected final c([BI)V
    .locals 11

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v8

    const/4 v10, 0x0

    invoke-static {p1, v10, p2}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object p1

    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    :goto_0
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result p2

    if-lez p2, :cond_8

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result p2

    invoke-static {p1}, Landroid/net/b/c;->e(Ljava/nio/ByteBuffer;)Landroid/net/b/c;

    move-result-object v0

    if-eqz v0, :cond_7

    invoke-virtual {v0}, Landroid/net/b/c;->aq()Landroid/net/b/j;

    move-result-object v1

    if-nez v1, :cond_0

    goto/16 :goto_3

    :cond_0
    invoke-virtual {v0}, Landroid/net/b/c;->aq()Landroid/net/b/j;

    move-result-object p2

    iget p2, p2, Landroid/net/b/j;->gk:I

    if-eqz p2, :cond_1

    iget-object p1, p0, Landroid/net/a/s;->et:Landroid/net/util/SharedLog;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "non-kernel source portId: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p2}, Lcom/android/internal/util/BitUtils;->uint32(I)J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/net/util/SharedLog;->p(Ljava/lang/String;)V

    return-void

    :cond_1
    instance-of p2, v0, Landroid/net/b/b;

    if-eqz p2, :cond_2

    iget-object p2, p0, Landroid/net/a/s;->et:Landroid/net/util/SharedLog;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "netlink error: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_1
    invoke-virtual {p2, v0}, Landroid/net/util/SharedLog;->p(Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    instance-of p2, v0, Landroid/net/b/e;

    if-nez p2, :cond_3

    iget-object p2, p0, Landroid/net/a/s;->et:Landroid/net/util/SharedLog;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "non-rtnetlink neighbor msg: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/net/util/SharedLog;->q(Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    check-cast v0, Landroid/net/b/e;

    invoke-virtual {v0}, Landroid/net/b/e;->aq()Landroid/net/b/j;

    move-result-object p2

    iget-short v3, p2, Landroid/net/b/j;->gh:S

    invoke-virtual {v0}, Landroid/net/b/e;->as()Landroid/net/b/f;

    move-result-object p2

    if-nez p2, :cond_4

    iget-object p2, p0, Landroid/net/a/s;->et:Landroid/net/util/SharedLog;

    const-string v0, "RtNetlinkNeighborMessage without ND message header!"

    goto :goto_1

    :cond_4
    iget v4, p2, Landroid/net/b/f;->fS:I

    invoke-virtual {v0}, Landroid/net/b/e;->at()Ljava/net/InetAddress;

    move-result-object v5

    const/16 v1, 0x1d

    if-ne v3, v1, :cond_5

    move v6, v10

    goto :goto_2

    :cond_5
    iget-short p2, p2, Landroid/net/b/f;->fT:S

    move v6, p2

    :goto_2
    new-instance p2, Landroid/net/a/t;

    invoke-virtual {v0}, Landroid/net/b/e;->au()[B

    move-result-object v0

    invoke-static {v0}, Landroid/net/a/s;->f([B)Landroid/net/MacAddress;

    move-result-object v7

    move-object v0, p2

    move-wide v1, v8

    invoke-direct/range {v0 .. v7}, Landroid/net/a/t;-><init>(JSILjava/net/InetAddress;SLandroid/net/MacAddress;)V

    sget-boolean v0, Landroid/net/a/s;->DBG:Z

    if-eqz v0, :cond_6

    sget-object v0, Landroid/net/a/s;->TAG:Ljava/lang/String;

    invoke-virtual {p2}, Landroid/net/a/t;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_6
    iget-object v0, p0, Landroid/net/a/s;->fr:Landroid/net/a/u;

    invoke-interface {v0, p2}, Landroid/net/a/u;->accept(Landroid/net/a/t;)V

    goto/16 :goto_0

    :cond_7
    :goto_3
    invoke-virtual {p1, p2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    iget-object p2, p0, Landroid/net/a/s;->et:Landroid/net/util/SharedLog;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "unparsable netlink msg: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Landroid/net/b/a;->d(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/net/util/SharedLog;->p(Ljava/lang/String;)V

    :cond_8
    return-void
.end method
