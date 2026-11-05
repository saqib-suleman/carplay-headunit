.class final Landroid/net/dhcp/y;
.super Landroid/net/dhcp/DhcpPacket;


# direct methods
.method constructor <init>(ISLjava/net/Inet4Address;Ljava/net/Inet4Address;[B)V
    .locals 9

    sget-object v3, Landroid/net/dhcp/y;->dH:Ljava/net/Inet4Address;

    sget-object v4, Landroid/net/dhcp/y;->dH:Ljava/net/Inet4Address;

    const/4 v8, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v5, p3

    move-object v6, p4

    move-object v7, p5

    invoke-direct/range {v0 .. v8}, Landroid/net/dhcp/DhcpPacket;-><init>(ISLjava/net/Inet4Address;Ljava/net/Inet4Address;Ljava/net/Inet4Address;Ljava/net/Inet4Address;[BZ)V

    return-void
.end method


# virtual methods
.method final a(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v0, 0x6

    invoke-static {p1, v0}, Landroid/net/dhcp/y;->a(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Landroid/net/dhcp/y;->dU:Ljava/net/Inet4Address;

    const/16 v1, 0x36

    invoke-static {p1, v1, v0}, Landroid/net/dhcp/y;->a(Ljava/nio/ByteBuffer;BLjava/net/Inet4Address;)V

    iget-object v0, p0, Landroid/net/dhcp/y;->dW:Ljava/lang/String;

    const/16 v1, 0x38

    invoke-static {p1, v1, v0}, Landroid/net/dhcp/y;->a(Ljava/nio/ByteBuffer;BLjava/lang/String;)V

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    return-void
.end method

.method public final e(I)Ljava/nio/ByteBuffer;
    .locals 8

    const/16 v0, 0x5dc

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    iget-object v3, p0, Landroid/net/dhcp/y;->ec:Ljava/net/Inet4Address;

    iget-object v4, p0, Landroid/net/dhcp/y;->ed:Ljava/net/Inet4Address;

    iget-boolean v7, p0, Landroid/net/dhcp/y;->eg:Z

    const/4 v6, 0x2

    move-object v1, p0

    move v2, p1

    move-object v5, v0

    invoke-virtual/range {v1 .. v7}, Landroid/net/dhcp/y;->a(ILjava/net/Inet4Address;Ljava/net/Inet4Address;Ljava/nio/ByteBuffer;BZ)V

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    return-object v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    invoke-super {p0}, Landroid/net/dhcp/DhcpPacket;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " NAK, reason "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Landroid/net/dhcp/y;->dW:Ljava/lang/String;

    if-nez v0, :cond_0

    const-string v0, "(none)"

    goto :goto_0

    :cond_0
    iget-object v0, p0, Landroid/net/dhcp/y;->dW:Ljava/lang/String;

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
