.class final Landroid/net/dhcp/z;
.super Landroid/net/dhcp/DhcpPacket;


# instance fields
.field private final cO:Ljava/net/Inet4Address;


# direct methods
.method constructor <init>(ISZLjava/net/Inet4Address;Ljava/net/Inet4Address;Ljava/net/Inet4Address;[B)V
    .locals 9

    sget-object v5, Landroid/net/dhcp/z;->dH:Ljava/net/Inet4Address;

    sget-object v6, Landroid/net/dhcp/z;->dH:Ljava/net/Inet4Address;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v3, p5

    move-object v4, p6

    move-object/from16 v7, p7

    move v8, p3

    invoke-direct/range {v0 .. v8}, Landroid/net/dhcp/DhcpPacket;-><init>(ISLjava/net/Inet4Address;Ljava/net/Inet4Address;Ljava/net/Inet4Address;Ljava/net/Inet4Address;[BZ)V

    move-object v1, p4

    iput-object v1, v0, Landroid/net/dhcp/z;->cO:Ljava/net/Inet4Address;

    return-void
.end method


# virtual methods
.method final a(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v0, 0x2

    invoke-static {p1, v0}, Landroid/net/dhcp/z;->a(Ljava/nio/ByteBuffer;B)V

    iget-object v1, p0, Landroid/net/dhcp/z;->dU:Ljava/net/Inet4Address;

    const/16 v2, 0x36

    invoke-static {p1, v2, v1}, Landroid/net/dhcp/z;->a(Ljava/nio/ByteBuffer;BLjava/net/Inet4Address;)V

    iget-object v1, p0, Landroid/net/dhcp/z;->dT:Ljava/lang/Integer;

    const/16 v2, 0x33

    invoke-static {p1, v2, v1}, Landroid/net/dhcp/z;->a(Ljava/nio/ByteBuffer;BLjava/lang/Integer;)V

    iget-object v1, p0, Landroid/net/dhcp/z;->dT:Ljava/lang/Integer;

    if-eqz v1, :cond_0

    const/16 v1, 0x3a

    iget-object v2, p0, Landroid/net/dhcp/z;->dT:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    div-int/2addr v2, v0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {p1, v1, v0}, Landroid/net/dhcp/z;->a(Ljava/nio/ByteBuffer;BLjava/lang/Integer;)V

    :cond_0
    const/4 v0, 0x1

    iget-object v1, p0, Landroid/net/dhcp/z;->dK:Ljava/net/Inet4Address;

    invoke-static {p1, v0, v1}, Landroid/net/dhcp/z;->a(Ljava/nio/ByteBuffer;BLjava/net/Inet4Address;)V

    const/4 v0, 0x3

    iget-object v1, p0, Landroid/net/dhcp/z;->dL:Ljava/util/List;

    invoke-static {p1, v0, v1}, Landroid/net/dhcp/z;->a(Ljava/nio/ByteBuffer;BLjava/util/List;)V

    const/16 v0, 0xf

    iget-object v1, p0, Landroid/net/dhcp/z;->dO:Ljava/lang/String;

    invoke-static {p1, v0, v1}, Landroid/net/dhcp/z;->a(Ljava/nio/ByteBuffer;BLjava/lang/String;)V

    const/16 v0, 0x1c

    iget-object v1, p0, Landroid/net/dhcp/z;->dQ:Ljava/net/Inet4Address;

    invoke-static {p1, v0, v1}, Landroid/net/dhcp/z;->a(Ljava/nio/ByteBuffer;BLjava/net/Inet4Address;)V

    const/4 v0, 0x6

    iget-object v1, p0, Landroid/net/dhcp/z;->dM:Ljava/util/List;

    invoke-static {p1, v0, v1}, Landroid/net/dhcp/z;->a(Ljava/nio/ByteBuffer;BLjava/util/List;)V

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    return-void
.end method

.method public final e(I)Ljava/nio/ByteBuffer;
    .locals 8

    const/16 v0, 0x5dc

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    iget-boolean v1, p0, Landroid/net/dhcp/z;->eg:Z

    if-eqz v1, :cond_0

    sget-object v1, Landroid/net/dhcp/z;->dI:Ljava/net/Inet4Address;

    :goto_0
    move-object v3, v1

    goto :goto_1

    :cond_0
    iget-object v1, p0, Landroid/net/dhcp/z;->ed:Ljava/net/Inet4Address;

    goto :goto_0

    :goto_1
    iget-boolean v1, p0, Landroid/net/dhcp/z;->eg:Z

    if-eqz v1, :cond_1

    sget-object v1, Landroid/net/dhcp/z;->dH:Ljava/net/Inet4Address;

    :goto_2
    move-object v4, v1

    goto :goto_3

    :cond_1
    iget-object v1, p0, Landroid/net/dhcp/z;->cO:Ljava/net/Inet4Address;

    goto :goto_2

    :goto_3
    const/4 v6, 0x2

    iget-boolean v7, p0, Landroid/net/dhcp/z;->eg:Z

    move-object v1, p0

    move v2, p1

    move-object v5, v0

    invoke-virtual/range {v1 .. v7}, Landroid/net/dhcp/z;->a(ILjava/net/Inet4Address;Ljava/net/Inet4Address;Ljava/nio/ByteBuffer;BZ)V

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    return-object v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 5

    invoke-super {p0}, Landroid/net/dhcp/DhcpPacket;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, ", DNS servers: "

    iget-object v2, p0, Landroid/net/dhcp/z;->dM:Ljava/util/List;

    if-eqz v2, :cond_0

    iget-object v2, p0, Landroid/net/dhcp/z;->dM:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/net/Inet4Address;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " OFFER, ip "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Landroid/net/dhcp/z;->ed:Ljava/net/Inet4Address;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", mask "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Landroid/net/dhcp/z;->dK:Ljava/net/Inet4Address;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", gateways "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Landroid/net/dhcp/z;->dL:Ljava/util/List;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, " lease time "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Landroid/net/dhcp/z;->dT:Ljava/lang/Integer;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", domain "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Landroid/net/dhcp/z;->dO:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
