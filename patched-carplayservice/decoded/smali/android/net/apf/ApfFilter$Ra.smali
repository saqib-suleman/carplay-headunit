.class Landroid/net/apf/ApfFilter$Ra;
.super Ljava/lang/Object;


# annotations
.annotation build Lcom/android/internal/annotations/VisibleForTesting;
.end annotation


# instance fields
.field final synthetic aP:Landroid/net/apf/ApfFilter;

.field private final bF:Ljava/nio/ByteBuffer;

.field private final bG:Ljava/util/ArrayList;

.field bH:J

.field bI:J

.field private final bJ:Ljava/util/ArrayList;

.field private final bK:Ljava/util/ArrayList;

.field bL:I


# direct methods
.method constructor <init>(Landroid/net/apf/ApfFilter;[BI)V
    .locals 11

    iput-object p1, p0, Landroid/net/apf/ApfFilter$Ra;->aP:Landroid/net/apf/ApfFilter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/net/apf/ApfFilter$Ra;->bG:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/net/apf/ApfFilter$Ra;->bJ:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/net/apf/ApfFilter$Ra;->bK:Ljava/util/ArrayList;

    const/4 v0, 0x0

    iput v0, p0, Landroid/net/apf/ApfFilter$Ra;->bL:I

    const/16 v1, 0x46

    if-lt p3, v1, :cond_5

    invoke-static {p2, p3}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object p3

    invoke-static {p3}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object p3

    iput-object p3, p0, Landroid/net/apf/ApfFilter$Ra;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {p1}, Landroid/net/apf/ApfFilter;->currentTimeSeconds()J

    move-result-wide v2

    iput-wide v2, p0, Landroid/net/apf/ApfFilter$Ra;->bI:J

    iget-object p3, p0, Landroid/net/apf/ApfFilter$Ra;->bF:Ljava/nio/ByteBuffer;

    const/16 v2, 0xc

    invoke-static {p3, v2}, Lcom/android/internal/util/BitUtils;->getUint16(Ljava/nio/ByteBuffer;I)I

    move-result p3

    sget v2, Landroid/system/OsConstants;->ETH_P_IPV6:I

    if-ne p3, v2, :cond_4

    iget-object p3, p0, Landroid/net/apf/ApfFilter$Ra;->bF:Ljava/nio/ByteBuffer;

    const/16 v2, 0x14

    invoke-static {p3, v2}, Lcom/android/internal/util/BitUtils;->getUint8(Ljava/nio/ByteBuffer;I)I

    move-result p3

    sget v2, Landroid/system/OsConstants;->IPPROTO_ICMPV6:I

    if-ne p3, v2, :cond_4

    iget-object p3, p0, Landroid/net/apf/ApfFilter$Ra;->bF:Ljava/nio/ByteBuffer;

    const/16 v2, 0x36

    invoke-static {p3, v2}, Lcom/android/internal/util/BitUtils;->getUint8(Ljava/nio/ByteBuffer;I)I

    move-result p3

    const/16 v2, 0x86

    if-ne p3, v2, :cond_4

    new-instance p3, Landroid/net/metrics/RaEvent$Builder;

    invoke-direct {p3}, Landroid/net/metrics/RaEvent$Builder;-><init>()V

    const/16 v2, 0xf

    const/4 v3, 0x3

    invoke-direct {p0, v0, v2, v3}, Landroid/net/apf/ApfFilter$Ra;->a(III)I

    move-result v2

    const/16 v4, 0x38

    const/4 v5, 0x2

    invoke-direct {p0, v2, v4, v5}, Landroid/net/apf/ApfFilter$Ra;->a(III)I

    move-result v2

    const/16 v4, 0x3c

    invoke-direct {p0, v2, v4, v5}, Landroid/net/apf/ApfFilter$Ra;->a(III)I

    move-result v2

    iget-object v6, p0, Landroid/net/apf/ApfFilter$Ra;->bF:Ljava/nio/ByteBuffer;

    invoke-static {v6, v4}, Lcom/android/internal/util/BitUtils;->getUint16(Ljava/nio/ByteBuffer;I)I

    move-result v4

    int-to-long v6, v4

    invoke-virtual {p3, v6, v7}, Landroid/net/metrics/RaEvent$Builder;->updateRouterLifetime(J)Landroid/net/metrics/RaEvent$Builder;

    iget-object v4, p0, Landroid/net/apf/ApfFilter$Ra;->bF:Ljava/nio/ByteBuffer;

    :goto_0
    invoke-virtual {v4, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    iget-object v1, p0, Landroid/net/apf/ApfFilter$Ra;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v1, p0, Landroid/net/apf/ApfFilter$Ra;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    iget-object v4, p0, Landroid/net/apf/ApfFilter$Ra;->bF:Ljava/nio/ByteBuffer;

    invoke-static {v4, v1}, Lcom/android/internal/util/BitUtils;->getUint8(Ljava/nio/ByteBuffer;I)I

    move-result v4

    iget-object v6, p0, Landroid/net/apf/ApfFilter$Ra;->bF:Ljava/nio/ByteBuffer;

    add-int/lit8 v7, v1, 0x1

    invoke-static {v6, v7}, Lcom/android/internal/util/BitUtils;->getUint8(Ljava/nio/ByteBuffer;I)I

    move-result v6

    const/16 v7, 0x8

    mul-int/2addr v6, v7

    const/4 v8, 0x4

    if-eq v4, v3, :cond_1

    const/16 v7, 0x1f

    if-eq v4, v7, :cond_0

    packed-switch v4, :pswitch_data_0

    goto :goto_1

    :pswitch_0
    iget-object v7, p0, Landroid/net/apf/ApfFilter$Ra;->bK:Ljava/util/ArrayList;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-direct {p0, v2, v8, v8}, Landroid/net/apf/ApfFilter$Ra;->a(III)I

    move-result v2

    iget-object v7, p0, Landroid/net/apf/ApfFilter$Ra;->bF:Ljava/nio/ByteBuffer;

    add-int/lit8 v8, v1, 0x4

    invoke-static {v7, v8}, Lcom/android/internal/util/BitUtils;->getUint32(Ljava/nio/ByteBuffer;I)J

    move-result-wide v7

    invoke-virtual {p3, v7, v8}, Landroid/net/metrics/RaEvent$Builder;->updateRdnssLifetime(J)Landroid/net/metrics/RaEvent$Builder;

    goto :goto_1

    :pswitch_1
    invoke-direct {p0, v2, v8, v8}, Landroid/net/apf/ApfFilter$Ra;->a(III)I

    move-result v2

    iget-object v7, p0, Landroid/net/apf/ApfFilter$Ra;->bF:Ljava/nio/ByteBuffer;

    add-int/lit8 v8, v1, 0x4

    invoke-static {v7, v8}, Lcom/android/internal/util/BitUtils;->getUint32(Ljava/nio/ByteBuffer;I)J

    move-result-wide v7

    invoke-virtual {p3, v7, v8}, Landroid/net/metrics/RaEvent$Builder;->updateRouteInfoLifetime(J)Landroid/net/metrics/RaEvent$Builder;

    goto :goto_1

    :cond_0
    invoke-direct {p0, v2, v8, v8}, Landroid/net/apf/ApfFilter$Ra;->a(III)I

    move-result v2

    iget-object v7, p0, Landroid/net/apf/ApfFilter$Ra;->bF:Ljava/nio/ByteBuffer;

    add-int/lit8 v8, v1, 0x4

    invoke-static {v7, v8}, Lcom/android/internal/util/BitUtils;->getUint32(Ljava/nio/ByteBuffer;I)J

    move-result-wide v7

    invoke-virtual {p3, v7, v8}, Landroid/net/metrics/RaEvent$Builder;->updateDnsslLifetime(J)Landroid/net/metrics/RaEvent$Builder;

    goto :goto_1

    :cond_1
    invoke-direct {p0, v2, v8, v8}, Landroid/net/apf/ApfFilter$Ra;->a(III)I

    move-result v2

    iget-object v9, p0, Landroid/net/apf/ApfFilter$Ra;->bF:Ljava/nio/ByteBuffer;

    add-int/lit8 v10, v1, 0x4

    invoke-static {v9, v10}, Lcom/android/internal/util/BitUtils;->getUint32(Ljava/nio/ByteBuffer;I)J

    move-result-wide v9

    invoke-virtual {p3, v9, v10}, Landroid/net/metrics/RaEvent$Builder;->updatePrefixValidLifetime(J)Landroid/net/metrics/RaEvent$Builder;

    invoke-direct {p0, v2, v7, v8}, Landroid/net/apf/ApfFilter$Ra;->a(III)I

    move-result v2

    iget-object v7, p0, Landroid/net/apf/ApfFilter$Ra;->bF:Ljava/nio/ByteBuffer;

    add-int/lit8 v8, v1, 0x8

    invoke-static {v7, v8}, Lcom/android/internal/util/BitUtils;->getUint32(Ljava/nio/ByteBuffer;I)J

    move-result-wide v7

    invoke-virtual {p3, v7, v8}, Landroid/net/metrics/RaEvent$Builder;->updatePrefixPreferredLifetime(J)Landroid/net/metrics/RaEvent$Builder;

    iget-object v7, p0, Landroid/net/apf/ApfFilter$Ra;->bJ:Ljava/util/ArrayList;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_1
    if-lez v6, :cond_2

    iget-object v4, p0, Landroid/net/apf/ApfFilter$Ra;->bF:Ljava/nio/ByteBuffer;

    add-int/2addr v1, v6

    goto/16 :goto_0

    :cond_2
    new-instance p1, Landroid/net/apf/ApfFilter$InvalidRaException;

    new-array p2, v5, [Ljava/lang/Object;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    aput-object p3, p2, v0

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    const/4 v0, 0x1

    aput-object p3, p2, v0

    const-string p3, "Invalid option length opt=%d len=%d"

    invoke-static {p3, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Landroid/net/apf/ApfFilter$InvalidRaException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_3
    invoke-direct {p0, v2, v0, v0}, Landroid/net/apf/ApfFilter$Ra;->a(III)I

    invoke-virtual {p0, p2}, Landroid/net/apf/ApfFilter$Ra;->b([B)J

    move-result-wide v0

    iput-wide v0, p0, Landroid/net/apf/ApfFilter$Ra;->bH:J

    invoke-static {p1}, Landroid/net/apf/ApfFilter;->d(Landroid/net/apf/ApfFilter;)Landroid/net/metrics/IpConnectivityLog;

    move-result-object p1

    invoke-virtual {p3}, Landroid/net/metrics/RaEvent$Builder;->build()Landroid/net/metrics/RaEvent;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/net/metrics/IpConnectivityLog;->log(Landroid/os/Parcelable;)Z

    return-void

    :cond_4
    new-instance p1, Landroid/net/apf/ApfFilter$InvalidRaException;

    const-string p2, "Not an ICMP6 router advertisement"

    invoke-direct {p1, p2}, Landroid/net/apf/ApfFilter$InvalidRaException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_5
    new-instance p1, Landroid/net/apf/ApfFilter$InvalidRaException;

    const-string p2, "Not an ICMP6 router advertisement"

    invoke-direct {p1, p2}, Landroid/net/apf/ApfFilter$InvalidRaException;-><init>(Ljava/lang/String;)V

    throw p1

    :pswitch_data_0
    .packed-switch 0x18
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private a(III)I
    .locals 3

    iget-object v0, p0, Landroid/net/apf/ApfFilter$Ra;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    add-int/2addr p2, v0

    iget-object v0, p0, Landroid/net/apf/ApfFilter$Ra;->bG:Ljava/util/ArrayList;

    new-instance v1, Landroid/util/Pair;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    sub-int p1, p2, p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-direct {v1, v2, p1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/2addr p2, p3

    return p2
.end method

.method private a(I)Ljava/lang/String;
    .locals 3

    :try_start_0
    iget-object v0, p0, Landroid/net/apf/ApfFilter$Ra;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    if-ltz p1, :cond_1

    add-int/lit8 v1, p1, 0x10

    array-length v2, v0

    if-gt v1, v2, :cond_1

    if-ge v1, p1, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {v0, p1, v1}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object p1

    invoke-static {p1}, Ljava/net/InetAddress;->getByAddress([B)Ljava/net/InetAddress;

    move-result-object p1

    check-cast p1, Ljava/net/Inet6Address;

    invoke-virtual {p1}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_1
    :goto_0
    const-string p1, "???"
    :try_end_0
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    const-string p1, "???"

    return-object p1

    :catch_1
    move-exception p1

    const-string p1, "???"

    return-object p1
.end method

.method private a(Ljava/lang/StringBuffer;I)V
    .locals 5

    iget-object v0, p0, Landroid/net/apf/ApfFilter$Ra;->bF:Ljava/nio/ByteBuffer;

    add-int/lit8 v1, p2, 0x1

    invoke-static {v0, v1}, Lcom/android/internal/util/BitUtils;->getUint8(Ljava/nio/ByteBuffer;I)I

    move-result v0

    mul-int/lit8 v0, v0, 0x8

    const/16 v1, 0x18

    if-ge v0, v1, :cond_0

    return-void

    :cond_0
    iget-object v1, p0, Landroid/net/apf/ApfFilter$Ra;->bF:Ljava/nio/ByteBuffer;

    add-int/lit8 v2, p2, 0x4

    invoke-static {v1, v2}, Lcom/android/internal/util/BitUtils;->getUint32(Ljava/nio/ByteBuffer;I)J

    move-result-wide v1

    add-int/lit8 v0, v0, -0x8

    const/16 v3, 0x10

    div-int/2addr v0, v3

    const-string v4, "DNS "

    invoke-virtual {p1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p1, v1, v2}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    const-string v1, "s"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    const-string v2, " "

    invoke-virtual {p1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    add-int/lit8 v2, p2, 0x8

    mul-int v4, v3, v1

    add-int/2addr v2, v4

    invoke-direct {p0, v2}, Landroid/net/apf/ApfFilter$Ra;->a(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method private x()J
    .locals 6

    iget-wide v0, p0, Landroid/net/apf/ApfFilter$Ra;->bH:J

    iget-object v2, p0, Landroid/net/apf/ApfFilter$Ra;->aP:Landroid/net/apf/ApfFilter;

    invoke-virtual {v2}, Landroid/net/apf/ApfFilter;->currentTimeSeconds()J

    move-result-wide v2

    iget-wide v4, p0, Landroid/net/apf/ApfFilter$Ra;->bI:J

    sub-long/2addr v2, v4

    sub-long/2addr v0, v2

    return-wide v0
.end method


# virtual methods
.method final a([BI)Z
    .locals 6

    iget-object v0, p0, Landroid/net/apf/ApfFilter$Ra;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v0

    const/4 v1, 0x0

    if-eq p2, v0, :cond_0

    return v1

    :cond_0
    iget-object p2, p0, Landroid/net/apf/ApfFilter$Ra;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object p2

    iget-object v0, p0, Landroid/net/apf/ApfFilter$Ra;->bG:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Pair;

    iget-object v3, v2, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    :goto_0
    iget-object v4, v2, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iget-object v5, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    add-int/2addr v4, v5

    if-ge v3, v4, :cond_1

    aget-byte v4, p1, v3

    aget-byte v5, p2, v3

    if-eq v4, v5, :cond_2

    return v1

    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_3
    const/4 p1, 0x1

    return p1
.end method

.method final b(Landroid/net/apf/ApfGenerator;)J
    .locals 10
    .annotation build Lcom/android/internal/annotations/GuardedBy;
        value = "ApfFilter.this"
    .end annotation

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Ra"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Landroid/net/apf/ApfFilter$Ra;->aP:Landroid/net/apf/ApfFilter;

    invoke-static {v1}, Landroid/net/apf/ApfFilter;->e(Landroid/net/apf/ApfFilter;)J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Landroid/net/apf/ApfGenerator$Register;->cL:Landroid/net/apf/ApfGenerator$Register;

    const/16 v2, 0xe

    invoke-virtual {p1, v1, v2}, Landroid/net/apf/ApfGenerator;->e(Landroid/net/apf/ApfGenerator$Register;I)Landroid/net/apf/ApfGenerator;

    iget-object v1, p0, Landroid/net/apf/ApfFilter$Ra;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v1

    invoke-virtual {p1, v1, v0}, Landroid/net/apf/ApfGenerator;->b(ILjava/lang/String;)Landroid/net/apf/ApfGenerator;

    invoke-direct {p0}, Landroid/net/apf/ApfFilter$Ra;->x()J

    move-result-wide v1

    const-wide/16 v3, 0x6

    div-long/2addr v1, v3

    long-to-int v1, v1

    sget-object v2, Landroid/net/apf/ApfGenerator$Register;->cL:Landroid/net/apf/ApfGenerator$Register;

    const/16 v3, 0xf

    invoke-virtual {p1, v2, v3}, Landroid/net/apf/ApfGenerator;->e(Landroid/net/apf/ApfGenerator$Register;I)Landroid/net/apf/ApfGenerator;

    invoke-virtual {p1, v1, v0}, Landroid/net/apf/ApfGenerator;->c(ILjava/lang/String;)Landroid/net/apf/ApfGenerator;

    const/4 v2, 0x0

    :cond_0
    :goto_0
    iget-object v4, p0, Landroid/net/apf/ApfFilter$Ra;->bG:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v2, v4, :cond_4

    iget-object v4, p0, Landroid/net/apf/ApfFilter$Ra;->bG:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/util/Pair;

    iget-object v5, v4, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-eqz v5, :cond_1

    sget-object v5, Landroid/net/apf/ApfGenerator$Register;->cL:Landroid/net/apf/ApfGenerator$Register;

    iget-object v6, v4, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-virtual {p1, v5, v6}, Landroid/net/apf/ApfGenerator;->d(Landroid/net/apf/ApfGenerator$Register;I)Landroid/net/apf/ApfGenerator;

    sget-object v5, Landroid/net/apf/ApfGenerator$Register;->cL:Landroid/net/apf/ApfGenerator$Register;

    iget-object v6, p0, Landroid/net/apf/ApfFilter$Ra;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v6

    iget-object v7, v4, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    iget-object v8, v4, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    iget-object v9, v4, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v9, Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    add-int/2addr v8, v9

    invoke-static {v6, v7, v8}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v6

    invoke-virtual {p1, v5, v6, v0}, Landroid/net/apf/ApfGenerator;->a(Landroid/net/apf/ApfGenerator$Register;[BLjava/lang/String;)Landroid/net/apf/ApfGenerator;

    :cond_1
    add-int/lit8 v2, v2, 0x1

    iget-object v5, p0, Landroid/net/apf/ApfFilter$Ra;->bG:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v2, v5, :cond_0

    iget-object v5, p0, Landroid/net/apf/ApfFilter$Ra;->bG:Ljava/util/ArrayList;

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/util/Pair;

    iget-object v6, v4, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    iget-object v4, v4, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    add-int/2addr v6, v4

    if-eq v6, v3, :cond_0

    const/16 v4, 0x38

    if-eq v6, v4, :cond_0

    iget-object v4, v5, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    sub-int/2addr v4, v6

    const/4 v5, 0x2

    if-eq v4, v5, :cond_3

    const/4 v5, 0x4

    if-ne v4, v5, :cond_2

    sget-object v4, Landroid/net/apf/ApfGenerator$Register;->cL:Landroid/net/apf/ApfGenerator$Register;

    invoke-virtual {p1, v4, v6}, Landroid/net/apf/ApfGenerator;->c(Landroid/net/apf/ApfGenerator$Register;I)Landroid/net/apf/ApfGenerator;

    goto :goto_1

    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "bogus lifetime size "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_3
    sget-object v4, Landroid/net/apf/ApfGenerator$Register;->cL:Landroid/net/apf/ApfGenerator$Register;

    invoke-virtual {p1, v4, v6}, Landroid/net/apf/ApfGenerator;->b(Landroid/net/apf/ApfGenerator$Register;I)Landroid/net/apf/ApfGenerator;

    :goto_1
    invoke-virtual {p1, v1, v0}, Landroid/net/apf/ApfGenerator;->d(ILjava/lang/String;)Landroid/net/apf/ApfGenerator;

    goto/16 :goto_0

    :cond_4
    iget-object v2, p0, Landroid/net/apf/ApfFilter$Ra;->aP:Landroid/net/apf/ApfFilter;

    sget-object v3, Landroid/net/apf/ApfFilter$Counter;->bj:Landroid/net/apf/ApfFilter$Counter;

    invoke-static {v2, p1, v3}, Landroid/net/apf/ApfFilter;->a(Landroid/net/apf/ApfFilter;Landroid/net/apf/ApfGenerator;Landroid/net/apf/ApfFilter$Counter;)V

    iget-object v2, p0, Landroid/net/apf/ApfFilter$Ra;->aP:Landroid/net/apf/ApfFilter;

    invoke-static {v2}, Landroid/net/apf/ApfFilter;->f(Landroid/net/apf/ApfFilter;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroid/net/apf/ApfGenerator;->d(Ljava/lang/String;)Landroid/net/apf/ApfGenerator;

    invoke-virtual {p1, v0}, Landroid/net/apf/ApfGenerator;->c(Ljava/lang/String;)Landroid/net/apf/ApfGenerator;

    int-to-long v0, v1

    return-wide v0
.end method

.method final b([B)J
    .locals 6

    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object p1

    const-wide v0, 0x7fffffffffffffffL

    const/4 v2, 0x0

    :goto_0
    add-int/lit8 v3, v2, 0x1

    iget-object v4, p0, Landroid/net/apf/ApfFilter$Ra;->bG:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v3, v4, :cond_3

    iget-object v4, p0, Landroid/net/apf/ApfFilter$Ra;->bG:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/util/Pair;

    iget-object v4, v4, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iget-object v5, p0, Landroid/net/apf/ApfFilter$Ra;->bG:Ljava/util/ArrayList;

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Pair;

    iget-object v2, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    add-int/2addr v4, v2

    const/16 v2, 0xf

    if-eq v4, v2, :cond_2

    const/16 v2, 0x38

    if-eq v4, v2, :cond_2

    iget-object v2, p0, Landroid/net/apf/ApfFilter$Ra;->bG:Ljava/util/ArrayList;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Pair;

    iget-object v2, v2, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    sub-int/2addr v2, v4

    const/4 v5, 0x2

    if-eq v2, v5, :cond_1

    const/4 v5, 0x4

    if-ne v2, v5, :cond_0

    invoke-static {p1, v4}, Lcom/android/internal/util/BitUtils;->getUint32(Ljava/nio/ByteBuffer;I)J

    move-result-wide v4

    goto :goto_1

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "bogus lifetime size "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    invoke-static {p1, v4}, Lcom/android/internal/util/BitUtils;->getUint16(Ljava/nio/ByteBuffer;I)I

    move-result v2

    int-to-long v4, v2

    :goto_1
    invoke-static {v0, v1, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    :cond_2
    move v2, v3

    goto :goto_0

    :cond_3
    return-wide v0
.end method

.method public toString()Ljava/lang/String;
    .locals 14

    :try_start_0
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v1, "RA %s -> %s %ds "

    const/4 v2, 0x3

    new-array v3, v2, [Ljava/lang/Object;

    const/16 v4, 0x16

    invoke-direct {p0, v4}, Landroid/net/apf/ApfFilter$Ra;->a(I)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const/16 v4, 0x26

    invoke-direct {p0, v4}, Landroid/net/apf/ApfFilter$Ra;->a(I)Ljava/lang/String;

    move-result-object v4

    const/4 v6, 0x1

    aput-object v4, v3, v6

    iget-object v4, p0, Landroid/net/apf/ApfFilter$Ra;->bF:Ljava/nio/ByteBuffer;

    const/16 v7, 0x3c

    invoke-static {v4, v7}, Lcom/android/internal/util/BitUtils;->getUint16(Ljava/nio/ByteBuffer;I)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v7, 0x2

    aput-object v4, v3, v7

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget-object v1, p0, Landroid/net/apf/ApfFilter$Ra;->bJ:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    add-int/lit8 v4, v3, 0x10

    invoke-direct {p0, v4}, Landroid/net/apf/ApfFilter$Ra;->a(I)Ljava/lang/String;

    move-result-object v4

    iget-object v8, p0, Landroid/net/apf/ApfFilter$Ra;->bF:Ljava/nio/ByteBuffer;

    add-int/lit8 v9, v3, 0x2

    invoke-static {v8, v9}, Lcom/android/internal/util/BitUtils;->getUint8(Ljava/nio/ByteBuffer;I)I

    move-result v8

    iget-object v9, p0, Landroid/net/apf/ApfFilter$Ra;->bF:Ljava/nio/ByteBuffer;

    add-int/lit8 v10, v3, 0x4

    invoke-static {v9, v10}, Lcom/android/internal/util/BitUtils;->getUint32(Ljava/nio/ByteBuffer;I)J

    move-result-wide v9

    iget-object v11, p0, Landroid/net/apf/ApfFilter$Ra;->bF:Ljava/nio/ByteBuffer;

    add-int/lit8 v3, v3, 0x8

    invoke-static {v11, v3}, Lcom/android/internal/util/BitUtils;->getUint32(Ljava/nio/ByteBuffer;I)J

    move-result-wide v11

    const-string v3, "%s/%d %ds/%ds "

    const/4 v13, 0x4

    new-array v13, v13, [Ljava/lang/Object;

    aput-object v4, v13, v5

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v13, v6

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v13, v7

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v13, v2

    invoke-static {v3, v13}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    :cond_0
    iget-object v1, p0, Landroid/net/apf/ApfFilter$Ra;->bK:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-direct {p0, v0, v2}, Landroid/net/apf/ApfFilter$Ra;->a(Ljava/lang/StringBuffer;I)V

    goto :goto_1

    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/nio/BufferUnderflowException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    const-string v0, "<Malformed RA>"

    return-object v0
.end method

.method final w()Ljava/lang/String;
    .locals 3

    iget-object v0, p0, Landroid/net/apf/ApfFilter$Ra;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    iget-object v1, p0, Landroid/net/apf/ApfFilter$Ra;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v1

    const/4 v2, 0x0

    invoke-static {v0, v2, v1, v2}, Lcom/android/internal/util/HexDump;->toHexString([BIIZ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method final y()Z
    .locals 4

    invoke-direct {p0}, Landroid/net/apf/ApfFilter$Ra;->x()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-gtz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method
