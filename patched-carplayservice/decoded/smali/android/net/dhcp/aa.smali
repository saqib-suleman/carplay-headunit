.class final Landroid/net/dhcp/aa;
.super Landroid/net/dhcp/DhcpPacket;


# direct methods
.method constructor <init>(ISLjava/net/Inet4Address;[BZ)V
    .locals 9

    sget-object v4, Landroid/net/dhcp/aa;->dH:Ljava/net/Inet4Address;

    sget-object v5, Landroid/net/dhcp/aa;->dH:Ljava/net/Inet4Address;

    sget-object v6, Landroid/net/dhcp/aa;->dH:Ljava/net/Inet4Address;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v3, p3

    move-object v7, p4

    move v8, p5

    invoke-direct/range {v0 .. v8}, Landroid/net/dhcp/DhcpPacket;-><init>(ISLjava/net/Inet4Address;Ljava/net/Inet4Address;Ljava/net/Inet4Address;Ljava/net/Inet4Address;[BZ)V

    return-void
.end method


# virtual methods
.method final a(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v0, 0x3

    invoke-static {p1, v0}, Landroid/net/dhcp/aa;->a(Ljava/nio/ByteBuffer;B)V

    invoke-virtual {p0}, Landroid/net/dhcp/aa;->S()[B

    move-result-object v0

    const/16 v1, 0x3d

    invoke-static {p1, v1, v0}, Landroid/net/dhcp/aa;->a(Ljava/nio/ByteBuffer;B[B)V

    sget-object v0, Landroid/net/dhcp/aa;->dH:Ljava/net/Inet4Address;

    iget-object v1, p0, Landroid/net/dhcp/aa;->dS:Ljava/net/Inet4Address;

    invoke-virtual {v0, v1}, Ljava/net/Inet4Address;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/16 v0, 0x32

    iget-object v1, p0, Landroid/net/dhcp/aa;->dS:Ljava/net/Inet4Address;

    invoke-static {p1, v0, v1}, Landroid/net/dhcp/aa;->a(Ljava/nio/ByteBuffer;BLjava/net/Inet4Address;)V

    :cond_0
    sget-object v0, Landroid/net/dhcp/aa;->dH:Ljava/net/Inet4Address;

    iget-object v1, p0, Landroid/net/dhcp/aa;->dU:Ljava/net/Inet4Address;

    invoke-virtual {v0, v1}, Ljava/net/Inet4Address;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const/16 v0, 0x36

    iget-object v1, p0, Landroid/net/dhcp/aa;->dU:Ljava/net/Inet4Address;

    invoke-static {p1, v0, v1}, Landroid/net/dhcp/aa;->a(Ljava/nio/ByteBuffer;BLjava/net/Inet4Address;)V

    :cond_1
    invoke-static {p1}, Landroid/net/dhcp/aa;->b(Ljava/nio/ByteBuffer;)V

    const/16 v0, 0x37

    iget-object v1, p0, Landroid/net/dhcp/aa;->dV:[B

    invoke-static {p1, v0, v1}, Landroid/net/dhcp/aa;->a(Ljava/nio/ByteBuffer;B[B)V

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    return-void
.end method

.method public final e(I)Ljava/nio/ByteBuffer;
    .locals 8

    const/16 v0, 0x5dc

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    sget-object v3, Landroid/net/dhcp/aa;->dI:Ljava/net/Inet4Address;

    sget-object v4, Landroid/net/dhcp/aa;->dH:Ljava/net/Inet4Address;

    iget-boolean v7, p0, Landroid/net/dhcp/aa;->eg:Z

    const/4 v6, 0x1

    move-object v1, p0

    move v2, p1

    move-object v5, v0

    invoke-virtual/range {v1 .. v7}, Landroid/net/dhcp/aa;->a(ILjava/net/Inet4Address;Ljava/net/Inet4Address;Ljava/nio/ByteBuffer;BZ)V

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

    const-string v0, " REQUEST, desired IP "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Landroid/net/dhcp/aa;->dS:Ljava/net/Inet4Address;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, " from host \'"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Landroid/net/dhcp/aa;->dN:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\', param list length "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Landroid/net/dhcp/aa;->dV:[B

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Landroid/net/dhcp/aa;->dV:[B

    array-length v0, v0

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
