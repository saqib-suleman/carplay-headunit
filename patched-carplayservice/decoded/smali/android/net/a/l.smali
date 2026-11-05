.class final Landroid/net/a/l;
.super Landroid/net/a/i;


# instance fields
.field final synthetic eX:Landroid/net/a/d;

.field private mCallback:Landroid/net/a/i;


# direct methods
.method public constructor <init>(Landroid/net/a/d;Landroid/net/a/i;)V
    .locals 0

    iput-object p1, p0, Landroid/net/a/l;->eX:Landroid/net/a/d;

    invoke-direct {p0}, Landroid/net/a/i;-><init>()V

    iput-object p2, p0, Landroid/net/a/l;->mCallback:Landroid/net/a/i;

    return-void
.end method

.method private log(Ljava/lang/String;)V
    .locals 3

    iget-object v0, p0, Landroid/net/a/l;->eX:Landroid/net/a/d;

    invoke-static {v0}, Landroid/net/a/d;->a(Landroid/net/a/d;)Landroid/net/util/SharedLog;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "INVOKE "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/net/util/SharedLog;->log(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final ae()V
    .locals 1

    iget-object v0, p0, Landroid/net/a/l;->mCallback:Landroid/net/a/i;

    invoke-virtual {v0}, Landroid/net/a/i;->ae()V

    const-string v0, "onPreDhcpAction()"

    invoke-direct {p0, v0}, Landroid/net/a/l;->log(Ljava/lang/String;)V

    return-void
.end method

.method public final af()V
    .locals 1

    iget-object v0, p0, Landroid/net/a/l;->mCallback:Landroid/net/a/i;

    invoke-virtual {v0}, Landroid/net/a/i;->af()V

    const-string v0, "onPostDhcpAction()"

    invoke-direct {p0, v0}, Landroid/net/a/l;->log(Ljava/lang/String;)V

    return-void
.end method

.method public final ag()V
    .locals 1

    iget-object v0, p0, Landroid/net/a/l;->mCallback:Landroid/net/a/i;

    invoke-virtual {v0}, Landroid/net/a/i;->ag()V

    const-string v0, "onQuit()"

    invoke-direct {p0, v0}, Landroid/net/a/l;->log(Ljava/lang/String;)V

    return-void
.end method

.method public final ah()V
    .locals 1

    iget-object v0, p0, Landroid/net/a/l;->mCallback:Landroid/net/a/i;

    invoke-virtual {v0}, Landroid/net/a/i;->ah()V

    const-string v0, "startReadPacketFilter()"

    invoke-direct {p0, v0}, Landroid/net/a/l;->log(Ljava/lang/String;)V

    return-void
.end method

.method public final b(Landroid/net/DhcpResults;)V
    .locals 2

    iget-object v0, p0, Landroid/net/a/l;->mCallback:Landroid/net/a/i;

    invoke-virtual {v0, p1}, Landroid/net/a/i;->b(Landroid/net/DhcpResults;)V

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "onNewDhcpResults({"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, "})"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Landroid/net/a/l;->log(Ljava/lang/String;)V

    return-void
.end method

.method public final c(Landroid/net/LinkProperties;)V
    .locals 2

    iget-object v0, p0, Landroid/net/a/l;->mCallback:Landroid/net/a/i;

    invoke-virtual {v0, p1}, Landroid/net/a/i;->c(Landroid/net/LinkProperties;)V

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "onProvisioningSuccess({"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, "})"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Landroid/net/a/l;->log(Ljava/lang/String;)V

    return-void
.end method

.method public final c(Z)V
    .locals 2

    iget-object v0, p0, Landroid/net/a/l;->mCallback:Landroid/net/a/i;

    invoke-virtual {v0, p1}, Landroid/net/a/i;->c(Z)V

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "setFallbackMulticastFilter("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string p1, ")"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Landroid/net/a/l;->log(Ljava/lang/String;)V

    return-void
.end method

.method public final d(Landroid/net/LinkProperties;)V
    .locals 2

    iget-object v0, p0, Landroid/net/a/l;->mCallback:Landroid/net/a/i;

    invoke-virtual {v0, p1}, Landroid/net/a/i;->d(Landroid/net/LinkProperties;)V

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "onProvisioningFailure({"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, "})"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Landroid/net/a/l;->log(Ljava/lang/String;)V

    return-void
.end method

.method public final d(Z)V
    .locals 2

    iget-object v0, p0, Landroid/net/a/l;->mCallback:Landroid/net/a/i;

    invoke-virtual {v0, p1}, Landroid/net/a/i;->d(Z)V

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "setNeighborDiscoveryOffload("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string p1, ")"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Landroid/net/a/l;->log(Ljava/lang/String;)V

    return-void
.end method

.method public final e(Landroid/net/LinkProperties;)V
    .locals 2

    iget-object v0, p0, Landroid/net/a/l;->mCallback:Landroid/net/a/i;

    invoke-virtual {v0, p1}, Landroid/net/a/i;->e(Landroid/net/LinkProperties;)V

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "onLinkPropertiesChange({"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, "})"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Landroid/net/a/l;->log(Ljava/lang/String;)V

    return-void
.end method

.method public final e([B)V
    .locals 2

    iget-object v0, p0, Landroid/net/a/l;->mCallback:Landroid/net/a/i;

    invoke-virtual {v0, p1}, Landroid/net/a/i;->e([B)V

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "installPacketFilter(byte["

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    array-length p1, p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, "])"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Landroid/net/a/l;->log(Ljava/lang/String;)V

    return-void
.end method

.method public final k(Ljava/lang/String;)V
    .locals 2

    iget-object v0, p0, Landroid/net/a/l;->mCallback:Landroid/net/a/i;

    invoke-virtual {v0, p1}, Landroid/net/a/i;->k(Ljava/lang/String;)V

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "onReachabilityLost("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ")"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Landroid/net/a/l;->log(Ljava/lang/String;)V

    return-void
.end method
