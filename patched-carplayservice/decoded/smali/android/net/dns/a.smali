.class public final Landroid/net/dns/a;
.super Ljava/lang/Object;


# direct methods
.method public static a(Landroid/net/Network;Ljava/lang/String;I)[Ljava/net/InetAddress;
    .locals 5

    new-instance v0, Landroid/system/StructAddrinfo;

    invoke-direct {v0}, Landroid/system/StructAddrinfo;-><init>()V

    iput p2, v0, Landroid/system/StructAddrinfo;->ai_flags:I

    sget p2, Landroid/system/OsConstants;->AF_UNSPEC:I

    iput p2, v0, Landroid/system/StructAddrinfo;->ai_family:I

    sget p2, Landroid/system/OsConstants;->SOCK_STREAM:I

    iput p2, v0, Landroid/system/StructAddrinfo;->ai_socktype:I

    iget p0, p0, Landroid/net/Network;->netId:I

    int-to-long v1, p0

    const-wide v3, 0x80000000L

    or-long/2addr v1, v3

    new-instance p0, Landroid/net/Network;

    long-to-int p2, v1

    invoke-direct {p0, p2}, Landroid/net/Network;-><init>(I)V

    :try_start_0
    sget-object p2, Llibcore/io/Libcore;->os:Llibcore/io/Os;

    iget p0, p0, Landroid/net/Network;->netId:I

    invoke-interface {p2, p1, v0, p0}, Llibcore/io/Os;->android_getaddrinfo(Ljava/lang/String;Landroid/system/StructAddrinfo;I)[Ljava/net/InetAddress;

    move-result-object p0
    :try_end_0
    .catch Landroid/system/GaiException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ": TLS-bypass resolution failed"

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/system/GaiException;->rethrowAsUnknownHostException(Ljava/lang/String;)Ljava/net/UnknownHostException;

    const/4 p0, 0x0

    return-object p0
.end method
