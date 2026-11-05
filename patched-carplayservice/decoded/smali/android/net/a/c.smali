.class public final Landroid/net/a/c;
.super Ljava/lang/Object;


# instance fields
.field private final eq:Ljava/lang/String;

.field private final er:Landroid/os/INetworkManagementService;

.field private final es:Landroid/net/INetd;

.field private final et:Landroid/net/util/SharedLog;


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/os/INetworkManagementService;Landroid/net/INetd;Landroid/net/util/SharedLog;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroid/net/a/c;->eq:Ljava/lang/String;

    iput-object p2, p0, Landroid/net/a/c;->er:Landroid/os/INetworkManagementService;

    iput-object p3, p0, Landroid/net/a/c;->es:Landroid/net/INetd;

    iput-object p4, p0, Landroid/net/a/c;->et:Landroid/net/util/SharedLog;

    return-void
.end method

.method private varargs a(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 1

    iget-object v0, p0, Landroid/net/a/c;->et:Landroid/net/util/SharedLog;

    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/net/util/SharedLog;->p(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final W()Z
    .locals 6

    const/4 v0, 0x1

    :try_start_0
    new-instance v1, Landroid/net/InterfaceConfiguration;

    invoke-direct {v1}, Landroid/net/InterfaceConfiguration;-><init>()V

    new-instance v2, Landroid/net/LinkAddress;

    const-string v3, "0.0.0.0/0"

    invoke-direct {v2, v3}, Landroid/net/LinkAddress;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Landroid/net/InterfaceConfiguration;->setLinkAddress(Landroid/net/LinkAddress;)V

    iget-object v2, p0, Landroid/net/a/c;->er:Landroid/os/INetworkManagementService;

    iget-object v3, p0, Landroid/net/a/c;->eq:Ljava/lang/String;

    invoke-interface {v2, v3, v1}, Landroid/os/INetworkManagementService;->setInterfaceConfig(Ljava/lang/String;Landroid/net/InterfaceConfiguration;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :catch_0
    move-exception v1

    const-string v2, "Failed to clear IPv4 address on interface %s: %s"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p0, Landroid/net/a/c;->eq:Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    aput-object v1, v3, v0

    invoke-direct {p0, v2, v3}, Landroid/net/a/c;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    return v5
.end method

.method public final X()Z
    .locals 4

    const/4 v0, 0x1

    :try_start_0
    iget-object v1, p0, Landroid/net/a/c;->er:Landroid/os/INetworkManagementService;

    iget-object v2, p0, Landroid/net/a/c;->eq:Ljava/lang/String;

    invoke-interface {v1, v2}, Landroid/os/INetworkManagementService;->enableIpv6(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :catch_0
    move-exception v1

    const-string v2, "enabling IPv6 failed: %s"

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v1, v0, v3

    invoke-direct {p0, v2, v0}, Landroid/net/a/c;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    return v3
.end method

.method public final Y()Z
    .locals 4

    const/4 v0, 0x1

    :try_start_0
    iget-object v1, p0, Landroid/net/a/c;->er:Landroid/os/INetworkManagementService;

    iget-object v2, p0, Landroid/net/a/c;->eq:Ljava/lang/String;

    invoke-interface {v1, v2}, Landroid/os/INetworkManagementService;->disableIpv6(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :catch_0
    move-exception v1

    const-string v2, "disabling IPv6 failed: %s"

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v1, v0, v3

    invoke-direct {p0, v2, v0}, Landroid/net/a/c;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    return v3
.end method

.method public final Z()Z
    .locals 4

    const/4 v0, 0x1

    :try_start_0
    iget-object v1, p0, Landroid/net/a/c;->er:Landroid/os/INetworkManagementService;

    iget-object v2, p0, Landroid/net/a/c;->eq:Ljava/lang/String;

    invoke-interface {v1, v2, v0}, Landroid/os/INetworkManagementService;->setInterfaceIpv6PrivacyExtensions(Ljava/lang/String;Z)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :catch_0
    move-exception v1

    const-string v2, "error setting IPv6 privacy extensions: %s"

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v1, v0, v3

    invoke-direct {p0, v2, v0}, Landroid/net/a/c;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    return v3
.end method

.method public final a(Landroid/net/LinkAddress;)Z
    .locals 3

    new-instance v0, Landroid/net/InterfaceConfiguration;

    invoke-direct {v0}, Landroid/net/InterfaceConfiguration;-><init>()V

    invoke-virtual {v0, p1}, Landroid/net/InterfaceConfiguration;->setLinkAddress(Landroid/net/LinkAddress;)V

    const/4 p1, 0x1

    :try_start_0
    iget-object v1, p0, Landroid/net/a/c;->er:Landroid/os/INetworkManagementService;

    iget-object v2, p0, Landroid/net/a/c;->eq:Ljava/lang/String;

    invoke-interface {v1, v2, v0}, Landroid/os/INetworkManagementService;->setInterfaceConfig(Ljava/lang/String;Landroid/net/InterfaceConfiguration;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    move-exception v0

    const-string v1, "IPv4 configuration failed: %s"

    new-array p1, p1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v0, p1, v2

    invoke-direct {p0, v1, p1}, Landroid/net/a/c;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    return v2
.end method

.method public final aa()Z
    .locals 4

    const/4 v0, 0x1

    :try_start_0
    iget-object v1, p0, Landroid/net/a/c;->er:Landroid/os/INetworkManagementService;

    iget-object v2, p0, Landroid/net/a/c;->eq:Ljava/lang/String;

    invoke-interface {v1, v2}, Landroid/os/INetworkManagementService;->clearInterfaceAddresses(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :catch_0
    move-exception v1

    const-string v2, "Failed to clear addresses: %s"

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v1, v0, v3

    invoke-direct {p0, v2, v0}, Landroid/net/a/c;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    return v3
.end method

.method public final addAddress(Ljava/net/InetAddress;I)Z
    .locals 5

    const/4 v0, 0x1

    :try_start_0
    iget-object v1, p0, Landroid/net/a/c;->es:Landroid/net/INetd;

    iget-object v2, p0, Landroid/net/a/c;->eq:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3, p2}, Landroid/net/INetd;->interfaceAddAddress(Ljava/lang/String;Ljava/lang/String;I)V
    :try_end_0
    .catch Landroid/os/ServiceSpecificException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :catch_0
    move-exception v1

    const-string v2, "failed to add %s/%d: %s"

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v3, v0

    const/4 p1, 0x2

    aput-object v1, v3, p1

    invoke-direct {p0, v2, v3}, Landroid/net/a/c;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    return v4
.end method

.method public final f(I)Z
    .locals 4

    const/4 v0, 0x1

    const/4 v1, 0x0

    :try_start_0
    iget-object v2, p0, Landroid/net/a/c;->er:Landroid/os/INetworkManagementService;

    iget-object v3, p0, Landroid/net/a/c;->eq:Ljava/lang/String;

    invoke-interface {v2, v3, p1}, Landroid/os/INetworkManagementService;->setIPv6AddrGenMode(Ljava/lang/String;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Landroid/os/ServiceSpecificException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :catch_0
    move-exception p1

    iget v2, p1, Landroid/os/ServiceSpecificException;->errorCode:I

    sget v3, Landroid/system/OsConstants;->EOPNOTSUPP:I

    if-eq v2, v3, :cond_0

    const-string v2, "Unable to set IPv6 addrgen mode: %s"

    new-array v0, v0, [Ljava/lang/Object;

    aput-object p1, v0, v1

    :goto_0
    invoke-direct {p0, v2, v0}, Landroid/net/a/c;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    return v1

    :cond_0
    return v0

    :catch_1
    move-exception p1

    const-string v2, "Unable to set IPv6 addrgen mode: %s"

    new-array v0, v0, [Ljava/lang/Object;

    aput-object p1, v0, v1

    goto :goto_0
.end method
