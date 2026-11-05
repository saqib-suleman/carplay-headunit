.class public abstract Landroid/net/dhcp/DhcpPacket;
.super Ljava/lang/Object;


# static fields
.field public static final dH:Ljava/net/Inet4Address;

.field public static final dI:Ljava/net/Inet4Address;

.field public static final dJ:[B

.field static ei:Ljava/lang/String;

.field static ej:Ljava/lang/String;


# instance fields
.field protected dK:Ljava/net/Inet4Address;

.field protected dL:Ljava/util/List;

.field protected dM:Ljava/util/List;

.field protected dN:Ljava/lang/String;

.field protected dO:Ljava/lang/String;

.field protected dP:Ljava/lang/Short;

.field protected dQ:Ljava/net/Inet4Address;

.field protected dR:Ljava/lang/String;

.field protected dS:Ljava/net/Inet4Address;

.field protected dT:Ljava/lang/Integer;

.field protected dU:Ljava/net/Inet4Address;

.field protected dV:[B

.field protected dW:Ljava/lang/String;

.field protected dX:Ljava/lang/Short;

.field protected dY:Ljava/lang/Integer;

.field protected dZ:Ljava/lang/Integer;

.field protected ea:Ljava/lang/String;

.field protected final eb:S

.field protected final ec:Ljava/net/Inet4Address;

.field protected final ed:Ljava/net/Inet4Address;

.field private final ee:Ljava/net/Inet4Address;

.field private final ef:Ljava/net/Inet4Address;

.field protected eg:Z

.field protected final eh:[B

.field protected final mTransId:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    sget-object v0, Ljava/net/Inet4Address;->ANY:Ljava/net/InetAddress;

    check-cast v0, Ljava/net/Inet4Address;

    sput-object v0, Landroid/net/dhcp/DhcpPacket;->dH:Ljava/net/Inet4Address;

    sget-object v0, Ljava/net/Inet4Address;->ALL:Ljava/net/InetAddress;

    check-cast v0, Ljava/net/Inet4Address;

    sput-object v0, Landroid/net/dhcp/DhcpPacket;->dI:Ljava/net/Inet4Address;

    const/4 v0, 0x6

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Landroid/net/dhcp/DhcpPacket;->dJ:[B

    const/4 v0, 0x0

    sput-object v0, Landroid/net/dhcp/DhcpPacket;->ei:Ljava/lang/String;

    sput-object v0, Landroid/net/dhcp/DhcpPacket;->ej:Ljava/lang/String;

    return-void

    :array_0
    .array-data 1
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
    .end array-data
.end method

.method protected constructor <init>(ISLjava/net/Inet4Address;Ljava/net/Inet4Address;Ljava/net/Inet4Address;Ljava/net/Inet4Address;[BZ)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Landroid/net/dhcp/DhcpPacket;->mTransId:I

    iput-short p2, p0, Landroid/net/dhcp/DhcpPacket;->eb:S

    iput-object p3, p0, Landroid/net/dhcp/DhcpPacket;->ec:Ljava/net/Inet4Address;

    iput-object p4, p0, Landroid/net/dhcp/DhcpPacket;->ed:Ljava/net/Inet4Address;

    iput-object p5, p0, Landroid/net/dhcp/DhcpPacket;->ee:Ljava/net/Inet4Address;

    iput-object p6, p0, Landroid/net/dhcp/DhcpPacket;->ef:Ljava/net/Inet4Address;

    iput-object p7, p0, Landroid/net/dhcp/DhcpPacket;->eh:[B

    iput-boolean p8, p0, Landroid/net/dhcp/DhcpPacket;->eg:Z

    return-void
.end method

.method private static a(Ljava/nio/ByteBuffer;III)I
    .locals 5

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    invoke-virtual {p0, p2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->asShortBuffer()Ljava/nio/ShortBuffer;

    move-result-object v1

    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    sub-int v0, p3, p2

    div-int/lit8 v0, v0, 0x2

    new-array v0, v0, [S

    invoke-virtual {v1, v0}, Ljava/nio/ShortBuffer;->get([S)Ljava/nio/ShortBuffer;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    const v3, 0xffff

    if-ge v2, v1, :cond_0

    aget-short v4, v0, v2

    and-int/2addr v3, v4

    add-int/2addr p1, v3

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    array-length v0, v0

    mul-int/lit8 v0, v0, 0x2

    add-int/2addr p2, v0

    if-eq p3, p2, :cond_2

    invoke-virtual {p0, p2}, Ljava/nio/ByteBuffer;->get(I)B

    move-result p0

    int-to-short p0, p0

    if-gez p0, :cond_1

    add-int/lit16 p0, p0, 0x100

    int-to-short p0, p0

    :cond_1
    mul-int/lit16 p0, p0, 0x100

    add-int/2addr p1, p0

    :cond_2
    shr-int/lit8 p0, p1, 0x10

    and-int/2addr p0, v3

    and-int/2addr p1, v3

    add-int/2addr p0, p1

    shr-int/lit8 p1, p0, 0x10

    and-int/2addr p1, v3

    add-int/2addr p0, p1

    and-int/2addr p0, v3

    not-int p0, p0

    int-to-short p0, p0

    and-int/2addr p0, v3

    return p0
.end method

.method private static a(Ljava/nio/ByteBuffer;IZ)Ljava/lang/String;
    .locals 2

    new-array p1, p1, [B

    invoke-virtual {p0, p1}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    array-length p0, p1

    const/4 v0, 0x0

    if-nez p2, :cond_0

    move p0, v0

    :goto_0
    array-length p2, p1

    if-ge p0, p2, :cond_0

    aget-byte p2, p1, p0

    if-eqz p2, :cond_0

    add-int/lit8 p0, p0, 0x1

    goto :goto_0

    :cond_0
    new-instance p2, Ljava/lang/String;

    sget-object v1, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-direct {p2, p1, v0, p0, v1}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    return-object p2
.end method

.method public static a(IISLjava/net/Inet4Address;[BLjava/net/Inet4Address;Ljava/net/Inet4Address;[B)Ljava/nio/ByteBuffer;
    .locals 7

    new-instance v6, Landroid/net/dhcp/aa;

    const/4 v5, 0x0

    move-object v0, v6

    move v1, p1

    move v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Landroid/net/dhcp/aa;-><init>(ISLjava/net/Inet4Address;[BZ)V

    iput-object p5, v6, Landroid/net/dhcp/DhcpPacket;->dS:Ljava/net/Inet4Address;

    iput-object p6, v6, Landroid/net/dhcp/DhcpPacket;->dU:Ljava/net/Inet4Address;

    const/4 p1, 0x0

    iput-object p1, v6, Landroid/net/dhcp/DhcpPacket;->dN:Ljava/lang/String;

    iput-object p7, v6, Landroid/net/dhcp/DhcpPacket;->dV:[B

    invoke-virtual {v6, p0}, Landroid/net/dhcp/DhcpPacket;->e(I)Ljava/nio/ByteBuffer;

    move-result-object p0

    return-object p0
.end method

.method public static a(IS[B[B)Ljava/nio/ByteBuffer;
    .locals 2

    new-instance v0, Landroid/net/dhcp/w;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, p2, v1}, Landroid/net/dhcp/w;-><init>(IS[BZ)V

    iput-object p3, v0, Landroid/net/dhcp/DhcpPacket;->dV:[B

    invoke-virtual {v0, v1}, Landroid/net/dhcp/DhcpPacket;->e(I)Ljava/nio/ByteBuffer;

    move-result-object p0

    return-object p0
.end method

.method protected static a(Ljava/nio/ByteBuffer;B)V
    .locals 1

    const/16 v0, 0x35

    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    invoke-virtual {p0, p1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    return-void
.end method

.method protected static a(Ljava/nio/ByteBuffer;BLjava/lang/Integer;)V
    .locals 0

    if-eqz p2, :cond_0

    invoke-virtual {p0, p1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/4 p1, 0x4

    invoke-virtual {p0, p1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {p0, p1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    :cond_0
    return-void
.end method

.method protected static a(Ljava/nio/ByteBuffer;BLjava/lang/String;)V
    .locals 1

    :try_start_0
    const-string v0, "US-ASCII"

    invoke-virtual {p2, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    invoke-static {p0, p1, v0}, Landroid/net/dhcp/DhcpPacket;->a(Ljava/nio/ByteBuffer;B[B)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "String is not US-ASCII: "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method protected static a(Ljava/nio/ByteBuffer;BLjava/net/Inet4Address;)V
    .locals 0

    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/net/Inet4Address;->getAddress()[B

    move-result-object p2

    invoke-static {p0, p1, p2}, Landroid/net/dhcp/DhcpPacket;->a(Ljava/nio/ByteBuffer;B[B)V

    :cond_0
    return-void
.end method

.method protected static a(Ljava/nio/ByteBuffer;BLjava/util/List;)V
    .locals 2

    if-eqz p2, :cond_3

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x4

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v1

    mul-int/2addr v0, v1

    const/16 v1, 0xff

    if-gt v0, v1, :cond_2

    invoke-virtual {p0, p1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    int-to-byte p1, v0

    invoke-virtual {p0, p1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/net/Inet4Address;

    invoke-virtual {p2}, Ljava/net/Inet4Address;->getAddress()[B

    move-result-object p2

    invoke-virtual {p0, p2}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    goto :goto_0

    :cond_1
    return-void

    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "DHCP option too long: "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, " vs. 255"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_3
    return-void
.end method

.method protected static a(Ljava/nio/ByteBuffer;B[B)V
    .locals 2

    if-eqz p2, :cond_1

    array-length v0, p2

    const/16 v1, 0xff

    if-gt v0, v1, :cond_0

    invoke-virtual {p0, p1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    array-length p1, p2

    int-to-byte p1, p1

    invoke-virtual {p0, p1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    invoke-virtual {p0, p2}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    return-void

    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "DHCP option too long: "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    array-length p2, p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, " vs. 255"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    return-void
.end method

.method public static b([BI)Landroid/net/dhcp/DhcpPacket;
    .locals 2

    const/4 v0, 0x0

    invoke-static {p0, v0, p1}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object p0

    sget-object p1, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {p0, p1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object p0

    :try_start_0
    invoke-static {p0, v0}, Landroid/net/dhcp/DhcpPacket;->decodeFullPacket(Ljava/nio/ByteBuffer;I)Landroid/net/dhcp/DhcpPacket;

    move-result-object p0
    :try_end_0
    .catch Landroid/net/dhcp/DhcpPacket$ParseException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    new-instance p1, Landroid/net/dhcp/DhcpPacket$ParseException;

    sget v1, Landroid/net/metrics/DhcpErrorEvent;->PARSING_ERROR:I

    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p0

    new-array v0, v0, [Ljava/lang/Object;

    invoke-direct {p1, v1, p0, v0}, Landroid/net/dhcp/DhcpPacket$ParseException;-><init>(ILjava/lang/String;[Ljava/lang/Object;)V

    throw p1

    :catch_1
    move-exception p0

    throw p0
.end method

.method protected static b(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/16 v0, 0x5dc

    invoke-static {v0}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v0

    if-eqz v0, :cond_0

    const/16 v1, 0x39

    invoke-virtual {p0, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/lang/Short;->shortValue()S

    move-result v0

    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    :cond_0
    const/16 v0, 0x3c

    sget-object v1, Landroid/net/dhcp/DhcpPacket;->ei:Ljava/lang/String;

    if-eqz v1, :cond_1

    sget-object v1, Landroid/net/dhcp/DhcpPacket;->ei:Ljava/lang/String;

    goto :goto_0

    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "android-dhcp-"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v2, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_0
    invoke-static {p0, v0, v1}, Landroid/net/dhcp/DhcpPacket;->a(Ljava/nio/ByteBuffer;BLjava/lang/String;)V

    sget-object v0, Landroid/net/dhcp/DhcpPacket;->ej:Ljava/lang/String;

    if-eqz v0, :cond_2

    sget-object v0, Landroid/net/dhcp/DhcpPacket;->ej:Ljava/lang/String;

    goto :goto_1

    :cond_2
    const-string v0, "net.hostname"

    invoke-static {v0}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_1
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3

    const/16 v1, 0xc

    invoke-static {p0, v1, v0}, Landroid/net/dhcp/DhcpPacket;->a(Ljava/nio/ByteBuffer;BLjava/lang/String;)V

    :cond_3
    return-void
.end method

.method private static c(Ljava/nio/ByteBuffer;)Ljava/net/Inet4Address;
    .locals 1

    const/4 v0, 0x4

    new-array v0, v0, [B

    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    :try_start_0
    invoke-static {v0}, Ljava/net/Inet4Address;->getByAddress([B)Ljava/net/InetAddress;

    move-result-object p0

    check-cast p0, Ljava/net/Inet4Address;
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    const/4 p0, 0x0

    return-object p0
.end method

.method static decodeFullPacket(Ljava/nio/ByteBuffer;I)Landroid/net/dhcp/DhcpPacket;
    .locals 38
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation

    move-object/from16 v0, p0

    move/from16 v1, p1

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    sget-object v4, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    const/4 v4, 0x6

    const/4 v5, 0x2

    const/4 v6, 0x1

    const/4 v7, 0x0

    if-nez v1, :cond_2

    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v8

    const/16 v9, 0x116

    if-lt v8, v9, :cond_1

    new-array v8, v4, [B

    new-array v9, v4, [B

    invoke-virtual {v0, v8}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    invoke-virtual {v0, v9}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v8

    sget v9, Landroid/system/OsConstants;->ETH_P_IP:I

    if-ne v8, v9, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Landroid/net/dhcp/DhcpPacket$ParseException;

    sget v1, Landroid/net/metrics/DhcpErrorEvent;->L2_WRONG_ETH_TYPE:I

    new-array v2, v5, [Ljava/lang/Object;

    invoke-static {v8}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v3

    aput-object v3, v2, v7

    sget v3, Landroid/system/OsConstants;->ETH_P_IP:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v6

    const-string v3, "Unexpected L2 type 0x%04x, expected 0x%04x"

    invoke-direct {v0, v1, v3, v2}, Landroid/net/dhcp/DhcpPacket$ParseException;-><init>(ILjava/lang/String;[Ljava/lang/Object;)V

    throw v0

    :cond_1
    new-instance v1, Landroid/net/dhcp/DhcpPacket$ParseException;

    sget v2, Landroid/net/metrics/DhcpErrorEvent;->L2_TOO_SHORT:I

    new-array v3, v5, [Ljava/lang/Object;

    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v3, v7

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v3, v6

    const-string v0, "L2 packet too short, %d < %d"

    invoke-direct {v1, v2, v0, v3}, Landroid/net/dhcp/DhcpPacket$ParseException;-><init>(ILjava/lang/String;[Ljava/lang/Object;)V

    throw v1

    :cond_2
    :goto_0
    const/16 v8, 0xf

    const/4 v9, 0x4

    const/4 v10, 0x0

    if-gt v1, v6, :cond_b

    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v11

    const/16 v12, 0x108

    if-lt v11, v12, :cond_a

    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->get()B

    move-result v11

    and-int/lit16 v12, v11, 0xf0

    shr-int/2addr v12, v9

    if-ne v12, v9, :cond_9

    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->get()B

    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->getShort()S

    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->getShort()S

    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->get()B

    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->get()B

    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->get()B

    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->get()B

    move-result v12

    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->getShort()S

    invoke-static/range {p0 .. p0}, Landroid/net/dhcp/DhcpPacket;->c(Ljava/nio/ByteBuffer;)Ljava/net/Inet4Address;

    move-result-object v13

    invoke-static/range {p0 .. p0}, Landroid/net/dhcp/DhcpPacket;->c(Ljava/nio/ByteBuffer;)Ljava/net/Inet4Address;

    const/16 v14, 0x11

    if-ne v12, v14, :cond_8

    and-int/2addr v11, v8

    add-int/lit8 v11, v11, -0x5

    move v12, v7

    :goto_1
    if-ge v12, v11, :cond_3

    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->getInt()I

    add-int/lit8 v12, v12, 0x1

    goto :goto_1

    :cond_3
    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v11

    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v12

    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->getShort()S

    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->getShort()S

    const/16 v14, 0x44

    if-eq v11, v14, :cond_5

    if-ne v12, v14, :cond_4

    goto :goto_2

    :cond_4
    move v14, v7

    goto :goto_3

    :cond_5
    :goto_2
    move v14, v6

    :goto_3
    if-nez v14, :cond_c

    const/16 v14, 0x43

    if-ne v11, v14, :cond_6

    if-ne v12, v14, :cond_6

    move v14, v6

    goto :goto_4

    :cond_6
    move v14, v7

    :goto_4
    if-eqz v14, :cond_7

    goto :goto_5

    :cond_7
    new-instance v0, Landroid/net/dhcp/DhcpPacket$ParseException;

    sget v1, Landroid/net/metrics/DhcpErrorEvent;->L4_WRONG_PORT:I

    new-array v2, v5, [Ljava/lang/Object;

    invoke-static {v11}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v3

    aput-object v3, v2, v7

    invoke-static {v12}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v3

    aput-object v3, v2, v6

    const-string v3, "Unexpected UDP ports %d->%d"

    invoke-direct {v0, v1, v3, v2}, Landroid/net/dhcp/DhcpPacket$ParseException;-><init>(ILjava/lang/String;[Ljava/lang/Object;)V

    throw v0

    :cond_8
    new-instance v0, Landroid/net/dhcp/DhcpPacket$ParseException;

    sget v1, Landroid/net/metrics/DhcpErrorEvent;->L4_NOT_UDP:I

    new-array v2, v6, [Ljava/lang/Object;

    invoke-static {v12}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v3

    aput-object v3, v2, v7

    const-string v3, "Protocol not UDP: %d"

    invoke-direct {v0, v1, v3, v2}, Landroid/net/dhcp/DhcpPacket$ParseException;-><init>(ILjava/lang/String;[Ljava/lang/Object;)V

    throw v0

    :cond_9
    new-instance v0, Landroid/net/dhcp/DhcpPacket$ParseException;

    sget v1, Landroid/net/metrics/DhcpErrorEvent;->L3_NOT_IPV4:I

    new-array v2, v6, [Ljava/lang/Object;

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v7

    const-string v3, "Invalid IP version %d"

    invoke-direct {v0, v1, v3, v2}, Landroid/net/dhcp/DhcpPacket$ParseException;-><init>(ILjava/lang/String;[Ljava/lang/Object;)V

    throw v0

    :cond_a
    new-instance v1, Landroid/net/dhcp/DhcpPacket$ParseException;

    sget v2, Landroid/net/metrics/DhcpErrorEvent;->L3_TOO_SHORT:I

    new-array v3, v5, [Ljava/lang/Object;

    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v3, v7

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v3, v6

    const-string v0, "L3 packet too short, %d < %d"

    invoke-direct {v1, v2, v0, v3}, Landroid/net/dhcp/DhcpPacket$ParseException;-><init>(ILjava/lang/String;[Ljava/lang/Object;)V

    throw v1

    :cond_b
    move-object v13, v10

    :cond_c
    :goto_5
    const/16 v11, 0xec

    if-gt v1, v5, :cond_21

    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    if-lt v1, v11, :cond_21

    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->get()B

    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->get()B

    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->get()B

    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v15

    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v11

    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v12

    const v14, 0x8000

    and-int/2addr v12, v14

    if-eqz v12, :cond_d

    move v12, v6

    goto :goto_6

    :cond_d
    move v12, v7

    :goto_6
    new-array v14, v9, [B

    :try_start_0
    invoke-virtual {v0, v14}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    invoke-static {v14}, Ljava/net/Inet4Address;->getByAddress([B)Ljava/net/InetAddress;

    move-result-object v16

    move-object/from16 v17, v16

    check-cast v17, Ljava/net/Inet4Address;

    invoke-virtual {v0, v14}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    invoke-static {v14}, Ljava/net/Inet4Address;->getByAddress([B)Ljava/net/InetAddress;

    move-result-object v16

    move-object/from16 v18, v16

    check-cast v18, Ljava/net/Inet4Address;

    invoke-virtual {v0, v14}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    invoke-static {v14}, Ljava/net/Inet4Address;->getByAddress([B)Ljava/net/InetAddress;

    move-result-object v16

    move-object/from16 v19, v16

    check-cast v19, Ljava/net/Inet4Address;

    invoke-virtual {v0, v14}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    invoke-static {v14}, Ljava/net/Inet4Address;->getByAddress([B)Ljava/net/InetAddress;

    move-result-object v16

    move-object/from16 v20, v16

    check-cast v20, Ljava/net/Inet4Address;
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_1

    const/16 v14, 0x10

    if-le v1, v14, :cond_e

    sget-object v1, Landroid/net/dhcp/DhcpPacket;->dJ:[B

    array-length v1, v1

    :cond_e
    new-array v5, v1, [B

    invoke-virtual {v0, v5}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->position()I

    move-result v16

    sub-int/2addr v14, v1

    add-int v16, v16, v14

    add-int/lit8 v1, v16, 0x40

    add-int/lit16 v1, v1, 0x80

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    if-lt v1, v9, :cond_20

    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    const v14, 0x63825363

    if-ne v1, v14, :cond_1f

    const/4 v1, -0x1

    move v14, v1

    move-object/from16 v22, v10

    move-object/from16 v23, v22

    move-object/from16 v24, v23

    move-object/from16 v25, v24

    move-object/from16 v26, v25

    move-object/from16 v27, v26

    move-object/from16 v28, v27

    move-object/from16 v29, v28

    move-object/from16 v30, v29

    move-object/from16 v31, v30

    move-object/from16 v32, v31

    move-object/from16 v33, v32

    move-object/from16 v34, v33

    move-object/from16 v35, v34

    move-object/from16 v36, v35

    move v10, v6

    :goto_7
    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->position()I

    move-result v9

    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v7

    if-ge v9, v7, :cond_1c

    if-eqz v10, :cond_1c

    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->get()B

    move-result v7

    if-ne v7, v1, :cond_f

    const/4 v7, 0x0

    const/4 v10, 0x0

    goto :goto_7

    :cond_f
    if-eqz v7, :cond_1b

    :try_start_1
    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->get()B

    move-result v9

    and-int/lit16 v9, v9, 0xff

    if-eq v7, v6, :cond_18

    const/4 v1, 0x3

    if-eq v7, v1, :cond_17

    if-eq v7, v4, :cond_16

    const/16 v1, 0xc

    if-eq v7, v1, :cond_15

    if-eq v7, v8, :cond_14

    const/16 v1, 0x1a

    if-eq v7, v1, :cond_13

    const/16 v1, 0x1c

    if-eq v7, v1, :cond_12

    const/16 v1, 0x2b

    if-eq v7, v1, :cond_11

    packed-switch v7, :pswitch_data_0

    packed-switch v7, :pswitch_data_1

    const/4 v1, 0x0

    const/16 v16, 0x0

    :goto_8
    if-ge v1, v9, :cond_10

    add-int/lit8 v16, v16, 0x1

    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->get()B

    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    :cond_10
    move/from16 v1, v16

    goto/16 :goto_e

    :pswitch_0
    new-array v1, v9, [B

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    goto/16 :goto_a

    :pswitch_1
    invoke-static {v0, v9, v6}, Landroid/net/dhcp/DhcpPacket;->a(Ljava/nio/ByteBuffer;IZ)Ljava/lang/String;

    move-result-object v35

    goto/16 :goto_a

    :pswitch_2
    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v34

    goto/16 :goto_d

    :pswitch_3
    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v33

    goto/16 :goto_d

    :pswitch_4
    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v1

    invoke-static {v1}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v32

    goto :goto_9

    :pswitch_5
    const/4 v1, 0x0

    invoke-static {v0, v9, v1}, Landroid/net/dhcp/DhcpPacket;->a(Ljava/nio/ByteBuffer;IZ)Ljava/lang/String;

    move-result-object v26

    goto :goto_a

    :pswitch_6
    new-array v1, v9, [B

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    move-object/from16 v29, v1

    goto :goto_a

    :pswitch_7
    invoke-static/range {p0 .. p0}, Landroid/net/dhcp/DhcpPacket;->c(Ljava/nio/ByteBuffer;)Ljava/net/Inet4Address;

    move-result-object v30

    goto :goto_d

    :pswitch_8
    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->get()B

    move-result v14

    move v1, v6

    goto :goto_e

    :pswitch_9
    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    goto :goto_d

    :pswitch_a
    invoke-static/range {p0 .. p0}, Landroid/net/dhcp/DhcpPacket;->c(Ljava/nio/ByteBuffer;)Ljava/net/Inet4Address;

    move-result-object v28

    goto :goto_d

    :cond_11
    invoke-static {v0, v9, v6}, Landroid/net/dhcp/DhcpPacket;->a(Ljava/nio/ByteBuffer;IZ)Ljava/lang/String;

    move-result-object v36

    goto :goto_a

    :cond_12
    invoke-static/range {p0 .. p0}, Landroid/net/dhcp/DhcpPacket;->c(Ljava/nio/ByteBuffer;)Ljava/net/Inet4Address;

    move-result-object v22

    goto :goto_d

    :cond_13
    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v1

    invoke-static {v1}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v27

    :goto_9
    const/4 v1, 0x2

    goto :goto_e

    :cond_14
    const/4 v1, 0x0

    invoke-static {v0, v9, v1}, Landroid/net/dhcp/DhcpPacket;->a(Ljava/nio/ByteBuffer;IZ)Ljava/lang/String;

    move-result-object v23

    goto :goto_a

    :cond_15
    const/4 v1, 0x0

    invoke-static {v0, v9, v1}, Landroid/net/dhcp/DhcpPacket;->a(Ljava/nio/ByteBuffer;IZ)Ljava/lang/String;

    move-result-object v24

    :goto_a
    move v1, v9

    goto :goto_e

    :cond_16
    const/4 v1, 0x0

    :goto_b
    if-ge v1, v9, :cond_19

    invoke-static/range {p0 .. p0}, Landroid/net/dhcp/DhcpPacket;->c(Ljava/nio/ByteBuffer;)Ljava/net/Inet4Address;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x4

    const/4 v4, 0x6

    goto :goto_b

    :cond_17
    const/4 v1, 0x0

    :goto_c
    if-ge v1, v9, :cond_19

    invoke-static/range {p0 .. p0}, Landroid/net/dhcp/DhcpPacket;->c(Ljava/nio/ByteBuffer;)Ljava/net/Inet4Address;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x4

    goto :goto_c

    :cond_18
    invoke-static/range {p0 .. p0}, Landroid/net/dhcp/DhcpPacket;->c(Ljava/nio/ByteBuffer;)Ljava/net/Inet4Address;

    move-result-object v31

    :goto_d
    const/4 v1, 0x4

    :cond_19
    :goto_e
    if-ne v1, v9, :cond_1a

    goto :goto_f

    :cond_1a
    sget v0, Landroid/net/metrics/DhcpErrorEvent;->DHCP_INVALID_OPTION_LENGTH:I

    invoke-static {v0, v7}, Landroid/net/metrics/DhcpErrorEvent;->errorCodeWithOption(II)I

    move-result v0

    new-instance v2, Landroid/net/dhcp/DhcpPacket$ParseException;

    const-string v3, "Invalid length %d for option %d, expected %d"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v8, 0x0

    aput-object v5, v4, v8

    invoke-static {v7}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v5, 0x2

    aput-object v1, v4, v5

    invoke-direct {v2, v0, v3, v4}, Landroid/net/dhcp/DhcpPacket$ParseException;-><init>(ILjava/lang/String;[Ljava/lang/Object;)V

    throw v2
    :try_end_1
    .catch Ljava/nio/BufferUnderflowException; {:try_start_1 .. :try_end_1} :catch_0

    :catch_0
    move-exception v0

    sget v0, Landroid/net/metrics/DhcpErrorEvent;->BUFFER_UNDERFLOW:I

    invoke-static {v0, v7}, Landroid/net/metrics/DhcpErrorEvent;->errorCodeWithOption(II)I

    move-result v0

    new-instance v1, Landroid/net/dhcp/DhcpPacket$ParseException;

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    const-string v3, "BufferUnderflowException"

    invoke-direct {v1, v0, v3, v2}, Landroid/net/dhcp/DhcpPacket$ParseException;-><init>(ILjava/lang/String;[Ljava/lang/Object;)V

    throw v1

    :cond_1b
    :goto_f
    const/4 v1, -0x1

    const/4 v4, 0x6

    const/4 v7, 0x0

    goto/16 :goto_7

    :cond_1c
    const/4 v0, -0x1

    if-eq v14, v0, :cond_1e

    const/16 v0, 0x8

    if-eq v14, v0, :cond_1d

    packed-switch v14, :pswitch_data_2

    new-instance v0, Landroid/net/dhcp/DhcpPacket$ParseException;

    sget v1, Landroid/net/metrics/DhcpErrorEvent;->DHCP_UNKNOWN_MSG_TYPE:I

    new-array v2, v6, [Ljava/lang/Object;

    invoke-static {v14}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-string v3, "Unimplemented DHCP type %d"

    invoke-direct {v0, v1, v3, v2}, Landroid/net/dhcp/DhcpPacket$ParseException;-><init>(ILjava/lang/String;[Ljava/lang/Object;)V

    throw v0

    :pswitch_b
    new-instance v0, Landroid/net/dhcp/y;

    move-object v14, v0

    move/from16 v16, v11

    move-object/from16 v17, v19

    move-object/from16 v18, v20

    move-object/from16 v19, v5

    invoke-direct/range {v14 .. v19}, Landroid/net/dhcp/y;-><init>(ISLjava/net/Inet4Address;Ljava/net/Inet4Address;[B)V

    goto :goto_10

    :pswitch_c
    new-instance v0, Landroid/net/dhcp/a;

    move-object v4, v0

    move-object v1, v5

    move v5, v15

    move v6, v11

    move v7, v12

    move-object v8, v13

    move-object/from16 v9, v17

    move-object/from16 v10, v18

    move-object v11, v1

    invoke-direct/range {v4 .. v11}, Landroid/net/dhcp/a;-><init>(ISZLjava/net/Inet4Address;Ljava/net/Inet4Address;Ljava/net/Inet4Address;[B)V

    goto :goto_10

    :pswitch_d
    move-object v1, v5

    new-instance v0, Landroid/net/dhcp/v;

    move-object v14, v0

    move/from16 v16, v11

    move-object/from16 v21, v1

    invoke-direct/range {v14 .. v21}, Landroid/net/dhcp/v;-><init>(ISLjava/net/Inet4Address;Ljava/net/Inet4Address;Ljava/net/Inet4Address;Ljava/net/Inet4Address;[B)V

    goto :goto_10

    :pswitch_e
    move-object v1, v5

    new-instance v0, Landroid/net/dhcp/aa;

    move-object v14, v0

    move/from16 v16, v11

    move-object/from16 v18, v1

    move/from16 v19, v12

    invoke-direct/range {v14 .. v19}, Landroid/net/dhcp/aa;-><init>(ISLjava/net/Inet4Address;[BZ)V

    goto :goto_10

    :pswitch_f
    move-object v1, v5

    new-instance v0, Landroid/net/dhcp/z;

    move-object v4, v0

    move v5, v15

    move v6, v11

    move v7, v12

    move-object v8, v13

    move-object/from16 v9, v17

    move-object/from16 v10, v18

    move-object v11, v1

    invoke-direct/range {v4 .. v11}, Landroid/net/dhcp/z;-><init>(ISZLjava/net/Inet4Address;Ljava/net/Inet4Address;Ljava/net/Inet4Address;[B)V

    goto :goto_10

    :pswitch_10
    move-object v1, v5

    new-instance v0, Landroid/net/dhcp/w;

    invoke-direct {v0, v15, v11, v1, v12}, Landroid/net/dhcp/w;-><init>(IS[BZ)V

    :goto_10
    move-object/from16 v10, v22

    goto :goto_11

    :cond_1d
    move-object v1, v5

    new-instance v0, Landroid/net/dhcp/x;

    move-object v14, v0

    move/from16 v16, v11

    move-object/from16 v21, v1

    invoke-direct/range {v14 .. v21}, Landroid/net/dhcp/x;-><init>(ISLjava/net/Inet4Address;Ljava/net/Inet4Address;Ljava/net/Inet4Address;Ljava/net/Inet4Address;[B)V

    goto :goto_10

    :goto_11
    iput-object v10, v0, Landroid/net/dhcp/DhcpPacket;->dQ:Ljava/net/Inet4Address;

    iput-object v2, v0, Landroid/net/dhcp/DhcpPacket;->dM:Ljava/util/List;

    move-object/from16 v10, v23

    iput-object v10, v0, Landroid/net/dhcp/DhcpPacket;->dO:Ljava/lang/String;

    iput-object v3, v0, Landroid/net/dhcp/DhcpPacket;->dL:Ljava/util/List;

    move-object/from16 v10, v24

    iput-object v10, v0, Landroid/net/dhcp/DhcpPacket;->dN:Ljava/lang/String;

    move-object/from16 v10, v25

    iput-object v10, v0, Landroid/net/dhcp/DhcpPacket;->dT:Ljava/lang/Integer;

    move-object/from16 v10, v26

    iput-object v10, v0, Landroid/net/dhcp/DhcpPacket;->dW:Ljava/lang/String;

    move-object/from16 v10, v27

    iput-object v10, v0, Landroid/net/dhcp/DhcpPacket;->dP:Ljava/lang/Short;

    move-object/from16 v10, v28

    iput-object v10, v0, Landroid/net/dhcp/DhcpPacket;->dS:Ljava/net/Inet4Address;

    move-object/from16 v10, v29

    iput-object v10, v0, Landroid/net/dhcp/DhcpPacket;->dV:[B

    move-object/from16 v10, v30

    iput-object v10, v0, Landroid/net/dhcp/DhcpPacket;->dU:Ljava/net/Inet4Address;

    move-object/from16 v10, v31

    iput-object v10, v0, Landroid/net/dhcp/DhcpPacket;->dK:Ljava/net/Inet4Address;

    move-object/from16 v10, v32

    iput-object v10, v0, Landroid/net/dhcp/DhcpPacket;->dX:Ljava/lang/Short;

    move-object/from16 v10, v33

    iput-object v10, v0, Landroid/net/dhcp/DhcpPacket;->dY:Ljava/lang/Integer;

    move-object/from16 v10, v34

    iput-object v10, v0, Landroid/net/dhcp/DhcpPacket;->dZ:Ljava/lang/Integer;

    move-object/from16 v10, v35

    iput-object v10, v0, Landroid/net/dhcp/DhcpPacket;->ea:Ljava/lang/String;

    move-object/from16 v10, v36

    iput-object v10, v0, Landroid/net/dhcp/DhcpPacket;->dR:Ljava/lang/String;

    return-object v0

    :cond_1e
    new-instance v0, Landroid/net/dhcp/DhcpPacket$ParseException;

    sget v1, Landroid/net/metrics/DhcpErrorEvent;->DHCP_NO_MSG_TYPE:I

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    const-string v3, "No DHCP message type option"

    invoke-direct {v0, v1, v3, v2}, Landroid/net/dhcp/DhcpPacket$ParseException;-><init>(ILjava/lang/String;[Ljava/lang/Object;)V

    throw v0

    :cond_1f
    move v2, v7

    new-instance v0, Landroid/net/dhcp/DhcpPacket$ParseException;

    sget v3, Landroid/net/metrics/DhcpErrorEvent;->DHCP_BAD_MAGIC_COOKIE:I

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v4, v2

    const v1, 0x63825363

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v4, v6

    const-string v1, "Bad magic cookie 0x%08x, should be 0x%08x"

    invoke-direct {v0, v3, v1, v4}, Landroid/net/dhcp/DhcpPacket$ParseException;-><init>(ILjava/lang/String;[Ljava/lang/Object;)V

    throw v0

    :cond_20
    move v2, v7

    new-instance v0, Landroid/net/dhcp/DhcpPacket$ParseException;

    sget v1, Landroid/net/metrics/DhcpErrorEvent;->DHCP_NO_COOKIE:I

    new-array v2, v2, [Ljava/lang/Object;

    const-string v3, "not a DHCP message"

    invoke-direct {v0, v1, v3, v2}, Landroid/net/dhcp/DhcpPacket$ParseException;-><init>(ILjava/lang/String;[Ljava/lang/Object;)V

    throw v0

    :catch_1
    move-exception v0

    new-instance v0, Landroid/net/dhcp/DhcpPacket$ParseException;

    sget v1, Landroid/net/metrics/DhcpErrorEvent;->L3_INVALID_IP:I

    new-array v2, v6, [Ljava/lang/Object;

    invoke-static {v14}, Ljava/util/Arrays;->toString([B)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-string v3, "Invalid IPv4 address: %s"

    invoke-direct {v0, v1, v3, v2}, Landroid/net/dhcp/DhcpPacket$ParseException;-><init>(ILjava/lang/String;[Ljava/lang/Object;)V

    throw v0

    :cond_21
    move v4, v7

    new-instance v1, Landroid/net/dhcp/DhcpPacket$ParseException;

    sget v2, Landroid/net/metrics/DhcpErrorEvent;->BOOTP_TOO_SHORT:I

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v3, v4

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v3, v6

    const-string v0, "Invalid type or BOOTP packet too short, %d < %d"

    invoke-direct {v1, v2, v0, v3}, Landroid/net/dhcp/DhcpPacket$ParseException;-><init>(ILjava/lang/String;[Ljava/lang/Object;)V

    throw v1

    nop

    :pswitch_data_0
    .packed-switch 0x32
        :pswitch_a
        :pswitch_9
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x35
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x1
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
    .end packed-switch
.end method


# virtual methods
.method public final R()[B
    .locals 1

    iget-object v0, p0, Landroid/net/dhcp/DhcpPacket;->eh:[B

    return-object v0
.end method

.method public final S()[B
    .locals 5

    iget-object v0, p0, Landroid/net/dhcp/DhcpPacket;->eh:[B

    array-length v0, v0

    const/4 v1, 0x1

    add-int/2addr v0, v1

    new-array v0, v0, [B

    const/4 v2, 0x0

    aput-byte v1, v0, v2

    iget-object v3, p0, Landroid/net/dhcp/DhcpPacket;->eh:[B

    iget-object v4, p0, Landroid/net/dhcp/DhcpPacket;->eh:[B

    array-length v4, v4

    invoke-static {v3, v2, v0, v1, v4}, Ljava/lang/System;->arraycopy([BI[BII)V

    return-object v0
.end method

.method public final T()Landroid/net/DhcpResults;
    .locals 5

    iget-object v0, p0, Landroid/net/dhcp/DhcpPacket;->ed:Ljava/net/Inet4Address;

    sget-object v1, Ljava/net/Inet4Address;->ANY:Ljava/net/InetAddress;

    invoke-virtual {v0, v1}, Ljava/net/Inet4Address;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    iget-object v0, p0, Landroid/net/dhcp/DhcpPacket;->ec:Ljava/net/Inet4Address;

    sget-object v1, Ljava/net/Inet4Address;->ANY:Ljava/net/InetAddress;

    invoke-virtual {v0, v1}, Ljava/net/Inet4Address;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-object v2

    :cond_0
    iget-object v1, p0, Landroid/net/dhcp/DhcpPacket;->dK:Ljava/net/Inet4Address;

    if-eqz v1, :cond_1

    :try_start_0
    iget-object v1, p0, Landroid/net/dhcp/DhcpPacket;->dK:Ljava/net/Inet4Address;

    invoke-static {v1}, Landroid/net/NetworkUtils;->netmaskToPrefixLength(Ljava/net/Inet4Address;)I

    move-result v1
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    return-object v2

    :cond_1
    invoke-static {v0}, Landroid/net/NetworkUtils;->getImplicitNetmask(Ljava/net/Inet4Address;)I

    move-result v1

    :goto_0
    new-instance v3, Landroid/net/DhcpResults;

    invoke-direct {v3}, Landroid/net/DhcpResults;-><init>()V

    :try_start_1
    new-instance v4, Landroid/net/LinkAddress;

    invoke-direct {v4, v0, v1}, Landroid/net/LinkAddress;-><init>(Ljava/net/InetAddress;I)V

    iput-object v4, v3, Landroid/net/DhcpResults;->ipAddress:Landroid/net/LinkAddress;
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1

    iget-object v0, p0, Landroid/net/dhcp/DhcpPacket;->dL:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x0

    if-lez v0, :cond_2

    iget-object v0, p0, Landroid/net/dhcp/DhcpPacket;->dL:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/InetAddress;

    iput-object v0, v3, Landroid/net/DhcpResults;->gateway:Ljava/net/InetAddress;

    :cond_2
    iget-object v0, v3, Landroid/net/DhcpResults;->dnsServers:Ljava/util/ArrayList;

    iget-object v2, p0, Landroid/net/dhcp/DhcpPacket;->dM:Ljava/util/List;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    iget-object v0, p0, Landroid/net/dhcp/DhcpPacket;->dO:Ljava/lang/String;

    iput-object v0, v3, Landroid/net/DhcpResults;->domains:Ljava/lang/String;

    iget-object v0, p0, Landroid/net/dhcp/DhcpPacket;->dU:Ljava/net/Inet4Address;

    iput-object v0, v3, Landroid/net/DhcpResults;->serverAddress:Ljava/net/Inet4Address;

    iget-object v0, p0, Landroid/net/dhcp/DhcpPacket;->dR:Ljava/lang/String;

    iput-object v0, v3, Landroid/net/DhcpResults;->vendorInfo:Ljava/lang/String;

    iget-object v0, p0, Landroid/net/dhcp/DhcpPacket;->dT:Ljava/lang/Integer;

    if-eqz v0, :cond_3

    iget-object v0, p0, Landroid/net/dhcp/DhcpPacket;->dT:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    goto :goto_1

    :cond_3
    const/4 v0, -0x1

    :goto_1
    iput v0, v3, Landroid/net/DhcpResults;->leaseDuration:I

    iget-object v0, p0, Landroid/net/dhcp/DhcpPacket;->dP:Ljava/lang/Short;

    if-eqz v0, :cond_4

    const/16 v0, 0x500

    iget-object v2, p0, Landroid/net/dhcp/DhcpPacket;->dP:Ljava/lang/Short;

    invoke-virtual {v2}, Ljava/lang/Short;->shortValue()S

    move-result v2

    if-gt v0, v2, :cond_4

    iget-object v0, p0, Landroid/net/dhcp/DhcpPacket;->dP:Ljava/lang/Short;

    invoke-virtual {v0}, Ljava/lang/Short;->shortValue()S

    move-result v0

    const/16 v2, 0x5dc

    if-gt v0, v2, :cond_4

    iget-object v0, p0, Landroid/net/dhcp/DhcpPacket;->dP:Ljava/lang/Short;

    invoke-virtual {v0}, Ljava/lang/Short;->shortValue()S

    move-result v1

    :cond_4
    iput v1, v3, Landroid/net/DhcpResults;->mtu:I

    return-object v3

    :catch_1
    move-exception v0

    return-object v2
.end method

.method public final U()J
    .locals 4

    iget-object v0, p0, Landroid/net/dhcp/DhcpPacket;->dT:Ljava/lang/Integer;

    if-eqz v0, :cond_2

    iget-object v0, p0, Landroid/net/dhcp/DhcpPacket;->dT:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Landroid/net/dhcp/DhcpPacket;->dT:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ltz v0, :cond_1

    iget-object v0, p0, Landroid/net/dhcp/DhcpPacket;->dT:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v1, 0x3c

    if-ge v0, v1, :cond_1

    const-wide/32 v0, 0xea60

    return-wide v0

    :cond_1
    iget-object v0, p0, Landroid/net/dhcp/DhcpPacket;->dT:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    int-to-long v0, v0

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    const-wide/16 v2, 0x3e8

    mul-long/2addr v0, v2

    return-wide v0

    :cond_2
    :goto_0
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method protected final a(ILjava/net/Inet4Address;Ljava/net/Inet4Address;Ljava/nio/ByteBuffer;BZ)V
    .locals 17

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, p4

    invoke-virtual/range {p2 .. p2}, Ljava/net/Inet4Address;->getAddress()[B

    move-result-object v3

    invoke-virtual/range {p3 .. p3}, Ljava/net/Inet4Address;->getAddress()[B

    move-result-object v4

    invoke-virtual/range {p4 .. p4}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    sget-object v5, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v2, v5}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    if-nez v1, :cond_0

    sget-object v5, Landroid/net/dhcp/DhcpPacket;->dJ:[B

    invoke-virtual {v2, v5}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    iget-object v5, v0, Landroid/net/dhcp/DhcpPacket;->eh:[B

    invoke-virtual {v2, v5}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    sget v5, Landroid/system/OsConstants;->ETH_P_IP:I

    int-to-short v5, v5

    invoke-virtual {v2, v5}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    :cond_0
    const/16 v5, 0x11

    const/16 v6, 0x40

    const/16 v7, 0x10

    const/4 v8, 0x1

    const/4 v9, 0x0

    if-gt v1, v8, :cond_1

    invoke-virtual/range {p4 .. p4}, Ljava/nio/ByteBuffer;->position()I

    move-result v10

    const/16 v11, 0x45

    invoke-virtual {v2, v11}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    invoke-virtual {v2, v7}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    invoke-virtual/range {p4 .. p4}, Ljava/nio/ByteBuffer;->position()I

    move-result v11

    invoke-virtual {v2, v9}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    invoke-virtual {v2, v9}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/16 v12, 0x4000

    invoke-virtual {v2, v12}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    invoke-virtual {v2, v6}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    invoke-virtual {v2, v5}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    invoke-virtual/range {p4 .. p4}, Ljava/nio/ByteBuffer;->position()I

    move-result v12

    invoke-virtual {v2, v9}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    invoke-virtual {v2, v4}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    invoke-virtual/range {p4 .. p4}, Ljava/nio/ByteBuffer;->position()I

    move-result v3

    invoke-virtual/range {p4 .. p4}, Ljava/nio/ByteBuffer;->position()I

    move-result v4

    const/16 v13, 0x44

    invoke-virtual {v2, v13}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/16 v13, 0x43

    invoke-virtual {v2, v13}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    invoke-virtual/range {p4 .. p4}, Ljava/nio/ByteBuffer;->position()I

    move-result v13

    invoke-virtual {v2, v9}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    invoke-virtual/range {p4 .. p4}, Ljava/nio/ByteBuffer;->position()I

    move-result v14

    invoke-virtual {v2, v9}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    goto :goto_0

    :cond_1
    move v3, v9

    move v4, v3

    move v10, v4

    move v11, v10

    move v12, v11

    move v13, v12

    move v14, v13

    :goto_0
    invoke-virtual/range {p4 .. p5}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    invoke-virtual {v2, v8}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v15, v0, Landroid/net/dhcp/DhcpPacket;->eh:[B

    array-length v15, v15

    int-to-byte v15, v15

    invoke-virtual {v2, v15}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    invoke-virtual {v2, v9}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget v15, v0, Landroid/net/dhcp/DhcpPacket;->mTransId:I

    invoke-virtual {v2, v15}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    iget-short v15, v0, Landroid/net/dhcp/DhcpPacket;->eb:S

    invoke-virtual {v2, v15}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    if-eqz p6, :cond_2

    const/16 v15, -0x8000

    invoke-virtual {v2, v15}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    goto :goto_1

    :cond_2
    invoke-virtual {v2, v9}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    :goto_1
    iget-object v15, v0, Landroid/net/dhcp/DhcpPacket;->ec:Ljava/net/Inet4Address;

    invoke-virtual {v15}, Ljava/net/Inet4Address;->getAddress()[B

    move-result-object v15

    invoke-virtual {v2, v15}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    iget-object v15, v0, Landroid/net/dhcp/DhcpPacket;->ed:Ljava/net/Inet4Address;

    invoke-virtual {v15}, Ljava/net/Inet4Address;->getAddress()[B

    move-result-object v15

    invoke-virtual {v2, v15}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    iget-object v15, v0, Landroid/net/dhcp/DhcpPacket;->ee:Ljava/net/Inet4Address;

    invoke-virtual {v15}, Ljava/net/Inet4Address;->getAddress()[B

    move-result-object v15

    invoke-virtual {v2, v15}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    iget-object v15, v0, Landroid/net/dhcp/DhcpPacket;->ef:Ljava/net/Inet4Address;

    invoke-virtual {v15}, Ljava/net/Inet4Address;->getAddress()[B

    move-result-object v15

    invoke-virtual {v2, v15}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    iget-object v15, v0, Landroid/net/dhcp/DhcpPacket;->eh:[B

    invoke-virtual {v2, v15}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    invoke-virtual/range {p4 .. p4}, Ljava/nio/ByteBuffer;->position()I

    move-result v15

    iget-object v5, v0, Landroid/net/dhcp/DhcpPacket;->eh:[B

    array-length v5, v5

    sub-int/2addr v7, v5

    add-int/2addr v15, v7

    add-int/2addr v15, v6

    add-int/lit16 v15, v15, 0x80

    invoke-virtual {v2, v15}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    const v5, 0x63825363

    invoke-virtual {v2, v5}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    invoke-virtual {v0, v2}, Landroid/net/dhcp/DhcpPacket;->a(Ljava/nio/ByteBuffer;)V

    invoke-virtual/range {p4 .. p4}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    and-int/2addr v0, v8

    if-ne v0, v8, :cond_3

    invoke-virtual {v2, v9}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    :cond_3
    if-gt v1, v8, :cond_4

    invoke-virtual/range {p4 .. p4}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    sub-int/2addr v0, v4

    int-to-short v0, v0

    invoke-virtual {v2, v13, v0}, Ljava/nio/ByteBuffer;->putShort(IS)Ljava/nio/ByteBuffer;

    add-int/lit8 v1, v12, 0x2

    invoke-virtual {v2, v1}, Ljava/nio/ByteBuffer;->getShort(I)S

    move-result v1

    const v5, 0xffff

    and-int/2addr v1, v5

    add-int/2addr v1, v9

    add-int/lit8 v6, v12, 0x4

    invoke-virtual {v2, v6}, Ljava/nio/ByteBuffer;->getShort(I)S

    move-result v6

    and-int/2addr v6, v5

    add-int/2addr v1, v6

    add-int/lit8 v6, v12, 0x6

    invoke-virtual {v2, v6}, Ljava/nio/ByteBuffer;->getShort(I)S

    move-result v6

    and-int/2addr v6, v5

    add-int/2addr v1, v6

    add-int/lit8 v6, v12, 0x8

    invoke-virtual {v2, v6}, Ljava/nio/ByteBuffer;->getShort(I)S

    move-result v6

    and-int/2addr v5, v6

    add-int/2addr v1, v5

    const/16 v5, 0x11

    add-int/2addr v1, v5

    add-int/2addr v1, v0

    invoke-virtual/range {p4 .. p4}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    invoke-static {v2, v1, v4, v0}, Landroid/net/dhcp/DhcpPacket;->a(Ljava/nio/ByteBuffer;III)I

    move-result v0

    int-to-short v0, v0

    invoke-virtual {v2, v14, v0}, Ljava/nio/ByteBuffer;->putShort(IS)Ljava/nio/ByteBuffer;

    invoke-virtual/range {p4 .. p4}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    sub-int/2addr v0, v10

    int-to-short v0, v0

    invoke-virtual {v2, v11, v0}, Ljava/nio/ByteBuffer;->putShort(IS)Ljava/nio/ByteBuffer;

    invoke-static {v2, v9, v10, v3}, Landroid/net/dhcp/DhcpPacket;->a(Ljava/nio/ByteBuffer;III)I

    move-result v0

    int-to-short v0, v0

    invoke-virtual {v2, v12, v0}, Ljava/nio/ByteBuffer;->putShort(IS)Ljava/nio/ByteBuffer;

    :cond_4
    return-void
.end method

.method abstract a(Ljava/nio/ByteBuffer;)V
.end method

.method public abstract e(I)Ljava/nio/ByteBuffer;
.end method

.method public final getTransactionId()I
    .locals 1

    iget v0, p0, Landroid/net/dhcp/DhcpPacket;->mTransId:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    iget-object v0, p0, Landroid/net/dhcp/DhcpPacket;->eh:[B

    const-string v1, ""

    const/4 v2, 0x0

    :goto_0
    array-length v3, v0

    if-ge v2, v3, :cond_1

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "0"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    aget-byte v4, v0, v2

    invoke-static {v4}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x2

    invoke-virtual {v3, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    array-length v3, v0

    add-int/lit8 v3, v3, -0x1

    if-eq v2, v3, :cond_0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ":"

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-object v1
.end method
