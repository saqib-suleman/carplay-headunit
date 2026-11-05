.class public final Landroid/net/a/k;
.super Ljava/lang/Object;


# instance fields
.field public final eZ:Ljava/util/Set;

.field public final fa:Ljava/util/Set;

.field public final fb:Ljava/util/Set;

.field public fc:Ljava/net/Inet4Address;


# direct methods
.method private static synthetic a(Landroid/net/IpPrefix;Landroid/net/RouteInfo;)Z
    .locals 1

    invoke-virtual {p1}, Landroid/net/RouteInfo;->hasGateway()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Landroid/net/RouteInfo;->getDestination()Landroid/net/IpPrefix;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/net/IpPrefix;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private static synthetic a(Landroid/net/LinkAddress;Landroid/net/LinkAddress;)Z
    .locals 0

    invoke-virtual {p0, p1}, Landroid/net/LinkAddress;->isSameAddressAs(Landroid/net/LinkAddress;)Z

    move-result p0

    return p0
.end method

.method public static synthetic lambda$BhaJuFrxUOete_TdBnypmhIv79k(Landroid/net/LinkAddress;Landroid/net/LinkAddress;)Z
    .locals 0

    invoke-static {p0, p1}, Landroid/net/a/k;->a(Landroid/net/LinkAddress;Landroid/net/LinkAddress;)Z

    move-result p0

    return p0
.end method

.method public static synthetic lambda$qOdN75L8_JOUAWZEkoEGp1TateI(Landroid/net/IpPrefix;Landroid/net/RouteInfo;)Z
    .locals 0

    invoke-static {p0, p1}, Landroid/net/a/k;->a(Landroid/net/IpPrefix;Landroid/net/RouteInfo;)Z

    move-result p0

    return p0
.end method


# virtual methods
.method public final a(Ljava/util/List;Ljava/util/List;)Z
    .locals 4

    iget-object v0, p0, Landroid/net/a/k;->eZ:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    iget-object v0, p0, Landroid/net/a/k;->eZ:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/LinkAddress;

    new-instance v3, Landroid/net/a/-$$Lambda$k$BhaJuFrxUOete_TdBnypmhIv79k;

    invoke-direct {v3, v2}, Landroid/net/a/-$$Lambda$k$BhaJuFrxUOete_TdBnypmhIv79k;-><init>(Landroid/net/LinkAddress;)V

    invoke-static {p1, v3}, Landroid/net/a/d;->a(Ljava/lang/Iterable;Ljava/util/function/Predicate;)Z

    move-result v2

    if-nez v2, :cond_1

    return v1

    :cond_2
    if-eqz p2, :cond_4

    iget-object p1, p0, Landroid/net/a/k;->fa:Ljava/util/Set;

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_3
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/IpPrefix;

    new-instance v2, Landroid/net/a/-$$Lambda$k$qOdN75L8_JOUAWZEkoEGp1TateI;

    invoke-direct {v2, v0}, Landroid/net/a/-$$Lambda$k$qOdN75L8_JOUAWZEkoEGp1TateI;-><init>(Landroid/net/IpPrefix;)V

    invoke-static {p2, v2}, Landroid/net/a/d;->a(Ljava/lang/Iterable;Ljava/util/function/Predicate;)Z

    move-result v0

    if-nez v0, :cond_3

    return v1

    :cond_4
    const/4 p1, 0x1

    return p1
.end method

.method public final toString()Ljava/lang/String;
    .locals 4

    const-string v0, "InitialConfiguration(IPs: {%s}, prefixes: {%s}, DNS: {%s}, v4 gateway: %s)"

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, ", "

    iget-object v3, p0, Landroid/net/a/k;->eZ:Ljava/util/Set;

    invoke-static {v2, v3}, Landroid/net/a/d;->a(Ljava/lang/String;Ljava/util/Collection;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-string v2, ", "

    iget-object v3, p0, Landroid/net/a/k;->fa:Ljava/util/Set;

    invoke-static {v2, v3}, Landroid/net/a/d;->a(Ljava/lang/String;Ljava/util/Collection;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    const-string v2, ", "

    iget-object v3, p0, Landroid/net/a/k;->fb:Ljava/util/Set;

    invoke-static {v2, v3}, Landroid/net/a/d;->a(Ljava/lang/String;Ljava/util/Collection;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x2

    aput-object v2, v1, v3

    iget-object v2, p0, Landroid/net/a/k;->fc:Ljava/net/Inet4Address;

    const/4 v3, 0x3

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
