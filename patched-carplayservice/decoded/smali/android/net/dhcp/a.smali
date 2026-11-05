.class final Landroid/net/dhcp/a;
.super Landroid/net/dhcp/DhcpPacket;


# instance fields
.field private final cO:Ljava/net/Inet4Address;


# direct methods
.method constructor <init>(ISZLjava/net/Inet4Address;Ljava/net/Inet4Address;Ljava/net/Inet4Address;[B)V
    .locals 10

    move-object v9, p0

    sget-object v6, Landroid/net/dhcp/a;->dH:Ljava/net/Inet4Address;

    move-object v0, v9

    move v1, p1

    move v2, p2

    move-object v3, p5

    move-object/from16 v4, p6

    move-object v5, p4

    move-object/from16 v7, p7

    move v8, p3

    invoke-direct/range {v0 .. v8}, Landroid/net/dhcp/DhcpPacket;-><init>(ISLjava/net/Inet4Address;Ljava/net/Inet4Address;Ljava/net/Inet4Address;Ljava/net/Inet4Address;[BZ)V

    move v0, p3

    iput-boolean v0, v9, Landroid/net/dhcp/a;->eg:Z

    move-object v0, p4

    iput-object v0, v9, Landroid/net/dhcp/a;->cO:Ljava/net/Inet4Address;

    return-void
.end method


# virtual methods
.method final a(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v0, 0x5

    invoke-static {p1, v0}, Landroid/net/dhcp/a;->a(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Landroid/net/dhcp/a;->dU:Ljava/net/Inet4Address;

    const/16 v1, 0x36

    invoke-static {p1, v1, v0}, Landroid/net/dhcp/a;->a(Ljava/nio/ByteBuffer;BLjava/net/Inet4Address;)V

    iget-object v0, p0, Landroid/net/dhcp/a;->dT:Ljava/lang/Integer;

    const/16 v1, 0x33

    invoke-static {p1, v1, v0}, Landroid/net/dhcp/a;->a(Ljava/nio/ByteBuffer;BLjava/lang/Integer;)V

    iget-object v0, p0, Landroid/net/dhcp/a;->dT:Ljava/lang/Integer;

    if-eqz v0, :cond_0

    const/16 v0, 0x3a

    iget-object v1, p0, Landroid/net/dhcp/a;->dT:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p1, v0, v1}, Landroid/net/dhcp/a;->a(Ljava/nio/ByteBuffer;BLjava/lang/Integer;)V

    :cond_0
    const/4 v0, 0x1

    iget-object v1, p0, Landroid/net/dhcp/a;->dK:Ljava/net/Inet4Address;

    invoke-static {p1, v0, v1}, Landroid/net/dhcp/a;->a(Ljava/nio/ByteBuffer;BLjava/net/Inet4Address;)V

    const/4 v0, 0x3

    iget-object v1, p0, Landroid/net/dhcp/a;->dL:Ljava/util/List;

    invoke-static {p1, v0, v1}, Landroid/net/dhcp/a;->a(Ljava/nio/ByteBuffer;BLjava/util/List;)V

    const/16 v0, 0xf

    iget-object v1, p0, Landroid/net/dhcp/a;->dO:Ljava/lang/String;

    invoke-static {p1, v0, v1}, Landroid/net/dhcp/a;->a(Ljava/nio/ByteBuffer;BLjava/lang/String;)V

    const/16 v0, 0x1c

    iget-object v1, p0, Landroid/net/dhcp/a;->dQ:Ljava/net/Inet4Address;

    invoke-static {p1, v0, v1}, Landroid/net/dhcp/a;->a(Ljava/nio/ByteBuffer;BLjava/net/Inet4Address;)V

    const/4 v0, 0x6

    iget-object v1, p0, Landroid/net/dhcp/a;->dM:Ljava/util/List;

    invoke-static {p1, v0, v1}, Landroid/net/dhcp/a;->a(Ljava/nio/ByteBuffer;BLjava/util/List;)V

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    return-void
.end method

.method public final e(I)Ljava/nio/ByteBuffer;
    .locals 8

    const/16 v0, 0x5dc

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    iget-boolean v1, p0, Landroid/net/dhcp/a;->eg:Z

    if-eqz v1, :cond_0

    sget-object v1, Landroid/net/dhcp/a;->dI:Ljava/net/Inet4Address;

    :goto_0
    move-object v3, v1

    goto :goto_1

    :cond_0
    iget-object v1, p0, Landroid/net/dhcp/a;->ed:Ljava/net/Inet4Address;

    goto :goto_0

    :goto_1
    iget-boolean v1, p0, Landroid/net/dhcp/a;->eg:Z

    if-eqz v1, :cond_1

    sget-object v1, Landroid/net/dhcp/a;->dH:Ljava/net/Inet4Address;

    :goto_2
    move-object v4, v1

    goto :goto_3

    :cond_1
    iget-object v1, p0, Landroid/net/dhcp/a;->cO:Ljava/net/Inet4Address;

    goto :goto_2

    :goto_3
    const/4 v6, 0x2

    iget-boolean v7, p0, Landroid/net/dhcp/a;->eg:Z

    move-object v1, p0

    move v2, p1

    move-object v5, v0

    invoke-virtual/range {v1 .. v7}, Landroid/net/dhcp/a;->a(ILjava/net/Inet4Address;Ljava/net/Inet4Address;Ljava/nio/ByteBuffer;BZ)V

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    return-object v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 5

    invoke-super {p0}, Landroid/net/dhcp/DhcpPacket;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, " DNS servers: "

    iget-object v2, p0, Landroid/net/dhcp/a;->dM:Ljava/util/List;

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

    invoke-virtual {v3}, Ljava/net/Inet4Address;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " ACK: your new IP "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Landroid/net/dhcp/a;->ed:Ljava/net/Inet4Address;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", netmask "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Landroid/net/dhcp/a;->dK:Ljava/net/Inet4Address;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", gateways "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Landroid/net/dhcp/a;->dL:Ljava/util/List;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", lease time "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Landroid/net/dhcp/a;->dT:Ljava/lang/Integer;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
