.class public final Landroid/net/b/e;
.super Landroid/net/b/c;


# instance fields
.field private fH:Landroid/net/b/f;

.field private fI:Ljava/net/InetAddress;

.field private fJ:[B

.field private fK:I

.field private fL:Landroid/net/b/g;


# direct methods
.method private constructor <init>(Landroid/net/b/j;)V
    .locals 1

    invoke-direct {p0, p1}, Landroid/net/b/c;-><init>(Landroid/net/b/j;)V

    const/4 p1, 0x0

    iput-object p1, p0, Landroid/net/b/e;->fH:Landroid/net/b/f;

    iput-object p1, p0, Landroid/net/b/e;->fI:Ljava/net/InetAddress;

    iput-object p1, p0, Landroid/net/b/e;->fJ:[B

    const/4 v0, 0x0

    iput v0, p0, Landroid/net/b/e;->fK:I

    iput-object p1, p0, Landroid/net/b/e;->fL:Landroid/net/b/g;

    return-void
.end method

.method private static a(SLjava/nio/ByteBuffer;)Landroid/net/b/h;
    .locals 4

    :goto_0
    const/4 v0, 0x0

    if-eqz p1, :cond_4

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    if-lez v1, :cond_4

    invoke-static {p1}, Landroid/net/b/h;->h(Ljava/nio/ByteBuffer;)Landroid/net/b/h;

    move-result-object v1

    if-eqz v1, :cond_4

    iget-short v2, v1, Landroid/net/b/h;->gc:S

    if-ne v2, p0, :cond_3

    invoke-static {p1}, Landroid/net/b/h;->h(Ljava/nio/ByteBuffer;)Landroid/net/b/h;

    move-result-object p0

    if-eqz p0, :cond_2

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    invoke-virtual {p0}, Landroid/net/b/h;->av()I

    move-result v2

    if-ge v1, v2, :cond_0

    return-object v0

    :cond_0
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    add-int/lit8 v1, v0, 0x4

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    iget-short v1, p0, Landroid/net/b/h;->gb:S

    const v2, 0xffff

    and-int/2addr v1, v2

    add-int/lit8 v1, v1, -0x4

    if-lez v1, :cond_1

    new-array v2, v1, [B

    iput-object v2, p0, Landroid/net/b/h;->gd:[B

    iget-object v2, p0, Landroid/net/b/h;->gd:[B

    const/4 v3, 0x0

    invoke-virtual {p1, v2, v3, v1}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    invoke-virtual {p0}, Landroid/net/b/h;->av()I

    move-result v1

    add-int/2addr v0, v1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    :cond_1
    return-object p0

    :cond_2
    return-object v0

    :cond_3
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    invoke-virtual {v1}, Landroid/net/b/h;->av()I

    move-result v3

    if-lt v2, v3, :cond_4

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    invoke-virtual {v1}, Landroid/net/b/h;->av()I

    move-result v1

    add-int/2addr v0, v1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    goto :goto_0

    :cond_4
    return-object v0
.end method

.method private static a(S[BLjava/nio/ByteBuffer;)V
    .locals 2

    new-instance v0, Landroid/net/b/h;

    invoke-direct {v0}, Landroid/net/b/h;-><init>()V

    iput-short p0, v0, Landroid/net/b/h;->gc:S

    iput-object p1, v0, Landroid/net/b/h;->gd:[B

    iget-object p0, v0, Landroid/net/b/h;->gd:[B

    array-length p0, p0

    const/4 p1, 0x4

    add-int/2addr p1, p0

    int-to-short p0, p1

    iput-short p0, v0, Landroid/net/b/h;->gb:S

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->order()Ljava/nio/ByteOrder;

    move-result-object p0

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->position()I

    move-result p1

    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    :try_start_0
    iget-short v1, v0, Landroid/net/b/h;->gb:S

    invoke-virtual {p2, v1}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    iget-short v1, v0, Landroid/net/b/h;->gc:S

    invoke-virtual {p2, v1}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    iget-object v1, v0, Landroid/net/b/h;->gd:[B

    if-eqz v1, :cond_0

    iget-object v1, v0, Landroid/net/b/h;->gd:[B

    invoke-virtual {p2, v1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    invoke-virtual {p2, p0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Landroid/net/b/h;->av()I

    move-result p0

    add-int/2addr p1, p0

    invoke-virtual {p2, p1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    return-void

    :catchall_0
    move-exception p1

    invoke-virtual {p2, p0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    throw p1
.end method

.method public static a(Ljava/net/InetAddress;I)[B
    .locals 6

    new-instance v0, Landroid/net/b/j;

    invoke-direct {v0}, Landroid/net/b/j;-><init>()V

    const/16 v1, 0x1c

    iput-short v1, v0, Landroid/net/b/j;->gh:S

    const/16 v2, 0x105

    iput-short v2, v0, Landroid/net/b/j;->gi:S

    const/4 v2, 0x1

    iput v2, v0, Landroid/net/b/j;->gj:I

    new-instance v3, Landroid/net/b/e;

    invoke-direct {v3, v0}, Landroid/net/b/e;-><init>(Landroid/net/b/j;)V

    new-instance v4, Landroid/net/b/f;

    invoke-direct {v4}, Landroid/net/b/f;-><init>()V

    iput-object v4, v3, Landroid/net/b/e;->fH:Landroid/net/b/f;

    iget-object v4, v3, Landroid/net/b/e;->fH:Landroid/net/b/f;

    instance-of v5, p0, Ljava/net/Inet6Address;

    if-eqz v5, :cond_0

    sget v5, Landroid/system/OsConstants;->AF_INET6:I

    goto :goto_0

    :cond_0
    sget v5, Landroid/system/OsConstants;->AF_INET:I

    :goto_0
    int-to-byte v5, v5

    iput-byte v5, v4, Landroid/net/b/f;->fR:B

    iget-object v4, v3, Landroid/net/b/e;->fH:Landroid/net/b/f;

    iput p1, v4, Landroid/net/b/f;->fS:I

    iget-object p1, v3, Landroid/net/b/e;->fH:Landroid/net/b/f;

    const/16 v4, 0x10

    iput-short v4, p1, Landroid/net/b/f;->fT:S

    iput-object p0, v3, Landroid/net/b/e;->fI:Ljava/net/InetAddress;

    const/4 p0, 0x0

    iput-object p0, v3, Landroid/net/b/e;->fJ:[B

    iget-object p0, v3, Landroid/net/b/e;->fI:Ljava/net/InetAddress;

    const/4 p1, 0x4

    if-eqz p0, :cond_1

    iget-object p0, v3, Landroid/net/b/e;->fI:Ljava/net/InetAddress;

    invoke-virtual {p0}, Ljava/net/InetAddress;->getAddress()[B

    move-result-object p0

    array-length p0, p0

    add-int/2addr p0, p1

    invoke-static {p0}, Landroid/net/b/a;->h(I)I

    move-result p0

    add-int/2addr v1, p0

    :cond_1
    iget-object p0, v3, Landroid/net/b/e;->fJ:[B

    if-eqz p0, :cond_2

    iget-object p0, v3, Landroid/net/b/e;->fJ:[B

    array-length p0, p0

    add-int/2addr p1, p0

    invoke-static {p1}, Landroid/net/b/a;->h(I)I

    move-result p0

    add-int/2addr v1, p0

    :cond_2
    new-array p0, v1, [B

    array-length p1, p0

    iput p1, v0, Landroid/net/b/j;->gg:I

    invoke-static {p0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object p1

    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    invoke-virtual {v3}, Landroid/net/b/e;->aq()Landroid/net/b/j;

    move-result-object v0

    iget v1, v0, Landroid/net/b/j;->gg:I

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    iget-short v1, v0, Landroid/net/b/j;->gh:S

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    iget-short v1, v0, Landroid/net/b/j;->gi:S

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    iget v1, v0, Landroid/net/b/j;->gj:I

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    iget v0, v0, Landroid/net/b/j;->gk:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    iget-object v0, v3, Landroid/net/b/e;->fH:Landroid/net/b/f;

    iget-byte v1, v0, Landroid/net/b/f;->fR:B

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    iget v1, v0, Landroid/net/b/f;->fS:I

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    iget-short v1, v0, Landroid/net/b/f;->fT:S

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    iget-byte v1, v0, Landroid/net/b/f;->fU:B

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-byte v0, v0, Landroid/net/b/f;->fV:B

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, v3, Landroid/net/b/e;->fI:Ljava/net/InetAddress;

    if-eqz v0, :cond_3

    iget-object v0, v3, Landroid/net/b/e;->fI:Ljava/net/InetAddress;

    invoke-virtual {v0}, Ljava/net/InetAddress;->getAddress()[B

    move-result-object v0

    invoke-static {v2, v0, p1}, Landroid/net/b/e;->a(S[BLjava/nio/ByteBuffer;)V

    :cond_3
    iget-object v0, v3, Landroid/net/b/e;->fJ:[B

    if-eqz v0, :cond_4

    const/4 v0, 0x2

    iget-object v1, v3, Landroid/net/b/e;->fJ:[B

    invoke-static {v0, v1, p1}, Landroid/net/b/e;->a(S[BLjava/nio/ByteBuffer;)V

    :cond_4
    return-object p0
.end method

.method public static b(Landroid/net/b/j;Ljava/nio/ByteBuffer;)Landroid/net/b/e;
    .locals 4

    new-instance v0, Landroid/net/b/e;

    invoke-direct {v0, p0}, Landroid/net/b/e;-><init>(Landroid/net/b/j;)V

    invoke-static {p1}, Landroid/net/b/f;->f(Ljava/nio/ByteBuffer;)Landroid/net/b/f;

    move-result-object p0

    iput-object p0, v0, Landroid/net/b/e;->fH:Landroid/net/b/f;

    iget-object p0, v0, Landroid/net/b/e;->fH:Landroid/net/b/f;

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result p0

    const/4 v1, 0x1

    invoke-static {v1, p1}, Landroid/net/b/e;->a(SLjava/nio/ByteBuffer;)Landroid/net/b/h;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Landroid/net/b/h;->ax()Ljava/net/InetAddress;

    move-result-object v1

    iput-object v1, v0, Landroid/net/b/e;->fI:Ljava/net/InetAddress;

    :cond_1
    invoke-virtual {p1, p0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    const/4 v1, 0x2

    invoke-static {v1, p1}, Landroid/net/b/e;->a(SLjava/nio/ByteBuffer;)Landroid/net/b/h;

    move-result-object v1

    if-eqz v1, :cond_2

    iget-object v1, v1, Landroid/net/b/h;->gd:[B

    iput-object v1, v0, Landroid/net/b/e;->fJ:[B

    :cond_2
    invoke-virtual {p1, p0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    const/4 v1, 0x4

    invoke-static {v1, p1}, Landroid/net/b/e;->a(SLjava/nio/ByteBuffer;)Landroid/net/b/h;

    move-result-object v2

    if-eqz v2, :cond_5

    invoke-virtual {v2}, Landroid/net/b/h;->aw()Ljava/nio/ByteBuffer;

    move-result-object v3

    if-eqz v3, :cond_4

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v3

    if-eq v3, v1, :cond_3

    goto :goto_0

    :cond_3
    invoke-virtual {v2}, Landroid/net/b/h;->aw()Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    goto :goto_1

    :cond_4
    :goto_0
    const/4 v1, 0x0

    :goto_1
    iput v1, v0, Landroid/net/b/e;->fK:I

    :cond_5
    invoke-virtual {p1, p0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    const/4 v1, 0x3

    invoke-static {v1, p1}, Landroid/net/b/e;->a(SLjava/nio/ByteBuffer;)Landroid/net/b/h;

    move-result-object v1

    if-eqz v1, :cond_6

    invoke-virtual {v1}, Landroid/net/b/h;->aw()Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-static {v1}, Landroid/net/b/g;->g(Ljava/nio/ByteBuffer;)Landroid/net/b/g;

    move-result-object v1

    iput-object v1, v0, Landroid/net/b/e;->fL:Landroid/net/b/g;

    :cond_6
    iget-object v1, v0, Landroid/net/b/e;->fG:Landroid/net/b/j;

    iget v1, v1, Landroid/net/b/j;->gg:I

    add-int/lit8 v1, v1, -0x1c

    invoke-static {v1}, Landroid/net/b/a;->h(I)I

    move-result v1

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    if-ge v2, v1, :cond_7

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->limit()I

    move-result p0

    :goto_2
    invoke-virtual {p1, p0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    return-object v0

    :cond_7
    add-int/2addr p0, v1

    goto :goto_2

    return-object v0
.end method


# virtual methods
.method public final as()Landroid/net/b/f;
    .locals 1

    iget-object v0, p0, Landroid/net/b/e;->fH:Landroid/net/b/f;

    return-object v0
.end method

.method public final at()Ljava/net/InetAddress;
    .locals 1

    iget-object v0, p0, Landroid/net/b/e;->fI:Ljava/net/InetAddress;

    return-object v0
.end method

.method public final au()[B
    .locals 1

    iget-object v0, p0, Landroid/net/b/e;->fJ:[B

    return-object v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 3

    iget-object v0, p0, Landroid/net/b/e;->fI:Ljava/net/InetAddress;

    if-nez v0, :cond_0

    const-string v0, ""

    goto :goto_0

    :cond_0
    iget-object v0, p0, Landroid/net/b/e;->fI:Ljava/net/InetAddress;

    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v0

    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "RtNetlinkNeighborMessage{ nlmsghdr{"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Landroid/net/b/e;->fG:Landroid/net/b/j;

    if-nez v2, :cond_1

    const-string v2, ""

    goto :goto_1

    :cond_1
    iget-object v2, p0, Landroid/net/b/e;->fG:Landroid/net/b/j;

    invoke-virtual {v2}, Landroid/net/b/j;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_1
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "}, ndmsg{"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Landroid/net/b/e;->fH:Landroid/net/b/f;

    if-nez v2, :cond_2

    const-string v2, ""

    goto :goto_2

    :cond_2
    iget-object v2, p0, Landroid/net/b/e;->fH:Landroid/net/b/f;

    invoke-virtual {v2}, Landroid/net/b/f;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_2
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "}, destination{"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "} linklayeraddr{"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Landroid/net/b/e;->fJ:[B

    invoke-static {v0}, Landroid/net/b/a;->g([B)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "} probes{"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Landroid/net/b/e;->fK:I

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "} cacheinfo{"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Landroid/net/b/e;->fL:Landroid/net/b/g;

    if-nez v0, :cond_3

    const-string v0, ""

    goto :goto_3

    :cond_3
    iget-object v0, p0, Landroid/net/b/e;->fL:Landroid/net/b/g;

    invoke-virtual {v0}, Landroid/net/b/g;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_3
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "} }"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
