.class final Landroid/net/dhcp/x;
.super Landroid/net/dhcp/DhcpPacket;


# direct methods
.method constructor <init>(ISLjava/net/Inet4Address;Ljava/net/Inet4Address;Ljava/net/Inet4Address;Ljava/net/Inet4Address;[B)V
    .locals 9

    const/4 v8, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    move-object/from16 v7, p7

    invoke-direct/range {v0 .. v8}, Landroid/net/dhcp/DhcpPacket;-><init>(ISLjava/net/Inet4Address;Ljava/net/Inet4Address;Ljava/net/Inet4Address;Ljava/net/Inet4Address;[BZ)V

    return-void
.end method


# virtual methods
.method final a(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/16 v0, 0x8

    invoke-static {p1, v0}, Landroid/net/dhcp/x;->a(Ljava/nio/ByteBuffer;B)V

    invoke-virtual {p0}, Landroid/net/dhcp/x;->S()[B

    move-result-object v0

    const/16 v1, 0x3d

    invoke-static {p1, v1, v0}, Landroid/net/dhcp/x;->a(Ljava/nio/ByteBuffer;B[B)V

    invoke-static {p1}, Landroid/net/dhcp/x;->b(Ljava/nio/ByteBuffer;)V

    iget-object v0, p0, Landroid/net/dhcp/x;->dV:[B

    const/16 v1, 0x37

    invoke-static {p1, v1, v0}, Landroid/net/dhcp/x;->a(Ljava/nio/ByteBuffer;B[B)V

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    return-void
.end method

.method public final e(I)Ljava/nio/ByteBuffer;
    .locals 8

    const/16 v0, 0x5dc

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    iget-object v3, p0, Landroid/net/dhcp/x;->ec:Ljava/net/Inet4Address;

    iget-object v4, p0, Landroid/net/dhcp/x;->ed:Ljava/net/Inet4Address;

    const/4 v6, 0x1

    const/4 v7, 0x0

    move-object v1, p0

    move v2, p1

    move-object v5, v0

    invoke-virtual/range {v1 .. v7}, Landroid/net/dhcp/x;->a(ILjava/net/Inet4Address;Ljava/net/Inet4Address;Ljava/nio/ByteBuffer;BZ)V

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

    const-string v0, " INFORM"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
