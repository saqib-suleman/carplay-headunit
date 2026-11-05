.class Landroid/net/dns/ResolvUtil$1;
.super Landroid/net/Network;


# instance fields
.field final synthetic ek:Landroid/net/Network;


# virtual methods
.method public getAllByName(Ljava/lang/String;)[Ljava/net/InetAddress;
    .locals 2

    iget-object v0, p0, Landroid/net/dns/ResolvUtil$1;->ek:Landroid/net/Network;

    sget v1, Landroid/system/OsConstants;->AI_ADDRCONFIG:I

    invoke-static {v0, p1, v1}, Landroid/net/dns/a;->a(Landroid/net/Network;Ljava/lang/String;I)[Ljava/net/InetAddress;

    move-result-object p1

    return-object p1
.end method
