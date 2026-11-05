.class public final Landroid/net/apf/ApfFilter;
.super Ljava/lang/Object;


# static fields
.field private static final as:[B

.field private static final at:[B

.field private static final au:[B


# instance fields
.field private aA:Z
    .annotation build Lcom/android/internal/annotations/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private aB:Z
    .annotation build Lcom/android/internal/annotations/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private final aC:Z

.field private final aD:[I

.field private final aE:Landroid/content/BroadcastReceiver;

.field private aF:[B
    .annotation build Lcom/android/internal/annotations/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private aG:I
    .annotation build Lcom/android/internal/annotations/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private aH:Ljava/util/ArrayList;
    .annotation build Lcom/android/internal/annotations/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private aI:J
    .annotation build Lcom/android/internal/annotations/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private aJ:J
    .annotation build Lcom/android/internal/annotations/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private aK:Landroid/net/metrics/ApfProgramEvent;
    .annotation build Lcom/android/internal/annotations/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private aL:[B
    .annotation build Lcom/android/internal/annotations/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private aM:[B
    .annotation build Lcom/android/internal/annotations/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private aN:I
    .annotation build Lcom/android/internal/annotations/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private aO:I
    .annotation build Lcom/android/internal/annotations/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private final aq:Ljava/lang/String;

.field private final ar:Ljava/lang/String;

.field private final av:Landroid/net/apf/a;

.field private final aw:Landroid/net/a/i;

.field private final ax:Landroid/net/util/b;

.field private final ay:Landroid/net/metrics/IpConnectivityLog;

.field private az:J
    .annotation build Lcom/android/internal/annotations/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private final mContext:Landroid/content/Context;

.field mHardwareAddress:[B
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation
.end field

.field mReceiveThread:Landroid/net/apf/ApfFilter$ReceiveThread;
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/4 v0, 0x6

    new-array v1, v0, [B

    fill-array-data v1, :array_0

    sput-object v1, Landroid/net/apf/ApfFilter;->as:[B

    const/16 v1, 0x10

    new-array v1, v1, [B

    fill-array-data v1, :array_1

    sput-object v1, Landroid/net/apf/ApfFilter;->at:[B

    new-array v0, v0, [B

    fill-array-data v0, :array_2

    sput-object v0, Landroid/net/apf/ApfFilter;->au:[B

    return-void

    nop

    :array_0
    .array-data 1
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
    .end array-data

    nop

    :array_1
    .array-data 1
        -0x1t
        0x2t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x1t
    .end array-data

    :array_2
    .array-data 1
        0x0t
        0x1t
        0x8t
        0x0t
        0x6t
        0x4t
    .end array-data
.end method

.method constructor <init>(Landroid/content/Context;Landroid/net/apf/d;Landroid/net/util/b;Landroid/net/a/i;Landroid/net/metrics/IpConnectivityLog;)V
    .locals 1
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/net/apf/b;

    invoke-direct {v0, p0}, Landroid/net/apf/b;-><init>(Landroid/net/apf/ApfFilter;)V

    iput-object v0, p0, Landroid/net/apf/ApfFilter;->aE:Landroid/content/BroadcastReceiver;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/net/apf/ApfFilter;->aH:Ljava/util/ArrayList;

    const/4 v0, 0x0

    iput v0, p0, Landroid/net/apf/ApfFilter;->aN:I

    iput v0, p0, Landroid/net/apf/ApfFilter;->aO:I

    iget-object v0, p2, Landroid/net/apf/d;->aR:Landroid/net/apf/a;

    iput-object v0, p0, Landroid/net/apf/ApfFilter;->av:Landroid/net/apf/a;

    iput-object p4, p0, Landroid/net/apf/ApfFilter;->aw:Landroid/net/a/i;

    iput-object p3, p0, Landroid/net/apf/ApfFilter;->ax:Landroid/net/util/b;

    iget-boolean p3, p2, Landroid/net/apf/d;->aS:Z

    iput-boolean p3, p0, Landroid/net/apf/ApfFilter;->aA:Z

    iget-boolean p3, p2, Landroid/net/apf/d;->aT:Z

    iput-boolean p3, p0, Landroid/net/apf/ApfFilter;->aC:Z

    iput-object p1, p0, Landroid/net/apf/ApfFilter;->mContext:Landroid/content/Context;

    iget-object p1, p0, Landroid/net/apf/ApfFilter;->av:Landroid/net/apf/a;

    invoke-virtual {p1}, Landroid/net/apf/a;->s()Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "countAndPass"

    iput-object p1, p0, Landroid/net/apf/ApfFilter;->aq:Ljava/lang/String;

    const-string p1, "countAndDrop"

    :goto_0
    iput-object p1, p0, Landroid/net/apf/ApfFilter;->ar:Ljava/lang/String;

    goto :goto_1

    :cond_0
    const-string p1, "__PASS__"

    iput-object p1, p0, Landroid/net/apf/ApfFilter;->aq:Ljava/lang/String;

    const-string p1, "__DROP__"

    goto :goto_0

    :goto_1
    iget-object p1, p2, Landroid/net/apf/d;->aU:[I

    invoke-static {p1}, Landroid/net/apf/ApfFilter;->a([I)[I

    move-result-object p1

    iput-object p1, p0, Landroid/net/apf/ApfFilter;->aD:[I

    iput-object p5, p0, Landroid/net/apf/ApfFilter;->ay:Landroid/net/metrics/IpConnectivityLog;

    invoke-virtual {p0}, Landroid/net/apf/ApfFilter;->maybeStartFilter()V

    iget-object p1, p0, Landroid/net/apf/ApfFilter;->mContext:Landroid/content/Context;

    iget-object p2, p0, Landroid/net/apf/ApfFilter;->aE:Landroid/content/BroadcastReceiver;

    new-instance p3, Landroid/content/IntentFilter;

    const-string p4, "android.os.action.DEVICE_IDLE_MODE_CHANGED"

    invoke-direct {p3, p4}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2, p3}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    return-void
.end method

.method private static a([BLandroid/net/apf/ApfFilter$Counter;)J
    .locals 6

    invoke-virtual {p1}, Landroid/net/apf/ApfFilter$Counter;->ordinal()I

    move-result p1

    neg-int p1, p1

    const/4 v0, 0x4

    mul-int/2addr p1, v0

    if-gez p1, :cond_0

    array-length v1, p0

    add-int/2addr p1, v1

    :cond_0
    const-wide/16 v1, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v0, :cond_1

    const/16 v4, 0x8

    shl-long/2addr v1, v4

    aget-byte v4, p0, p1

    and-int/lit16 v4, v4, 0xff

    int-to-long v4, v4

    or-long/2addr v1, v4

    add-int/lit8 p1, p1, 0x1

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    return-wide v1
.end method

.method public static a(Landroid/content/Context;Landroid/net/apf/d;Landroid/net/util/b;Landroid/net/a/i;)Landroid/net/apf/ApfFilter;
    .locals 7

    const/4 v0, 0x0

    if-eqz p0, :cond_7

    if-nez p2, :cond_0

    return-object v0

    :cond_0
    iget-object v1, p1, Landroid/net/apf/d;->aR:Landroid/net/apf/a;

    if-nez v1, :cond_1

    return-object v0

    :cond_1
    iget v2, v1, Landroid/net/apf/a;->an:I

    if-nez v2, :cond_2

    return-object v0

    :cond_2
    iget v2, v1, Landroid/net/apf/a;->ao:I

    const/16 v3, 0x200

    if-ge v2, v3, :cond_3

    const-string p0, "ApfFilter"

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "Unacceptably small APF limit: "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget p2, v1, Landroid/net/apf/a;->ao:I

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-object v0

    :cond_3
    iget v2, v1, Landroid/net/apf/a;->ap:I

    sget v3, Landroid/system/OsConstants;->ARPHRD_ETHER:I

    if-eq v2, v3, :cond_4

    return-object v0

    :cond_4
    iget v2, v1, Landroid/net/apf/a;->an:I

    const/4 v3, 0x2

    if-lt v2, v3, :cond_5

    const/4 v2, 0x1

    goto :goto_0

    :cond_5
    const/4 v2, 0x0

    :goto_0
    if-nez v2, :cond_6

    const-string p0, "ApfFilter"

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "Unsupported APF version: "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget p2, v1, Landroid/net/apf/a;->an:I

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-object v0

    :cond_6
    new-instance v0, Landroid/net/apf/ApfFilter;

    new-instance v6, Landroid/net/metrics/IpConnectivityLog;

    invoke-direct {v6}, Landroid/net/metrics/IpConnectivityLog;-><init>()V

    move-object v1, v0

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    invoke-direct/range {v1 .. v6}, Landroid/net/apf/ApfFilter;-><init>(Landroid/content/Context;Landroid/net/apf/d;Landroid/net/util/b;Landroid/net/a/i;Landroid/net/metrics/IpConnectivityLog;)V

    :cond_7
    return-object v0
.end method

.method static synthetic a(Landroid/net/apf/ApfFilter;)Landroid/net/apf/a;
    .locals 0

    iget-object p0, p0, Landroid/net/apf/ApfFilter;->av:Landroid/net/apf/a;

    return-object p0
.end method

.method private a(J)V
    .locals 3
    .annotation build Lcom/android/internal/annotations/GuardedBy;
        value = "this"
    .end annotation

    iget-object v0, p0, Landroid/net/apf/ApfFilter;->aK:Landroid/net/metrics/ApfProgramEvent;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Landroid/net/apf/ApfFilter;->aK:Landroid/net/metrics/ApfProgramEvent;

    const/4 v1, 0x0

    iput-object v1, p0, Landroid/net/apf/ApfFilter;->aK:Landroid/net/metrics/ApfProgramEvent;

    iget-wide v1, p0, Landroid/net/apf/ApfFilter;->aI:J

    sub-long/2addr p1, v1

    iput-wide p1, v0, Landroid/net/metrics/ApfProgramEvent;->actualLifetime:J

    iget-wide p1, v0, Landroid/net/metrics/ApfProgramEvent;->actualLifetime:J

    const-wide/16 v1, 0x2

    cmp-long p1, p1, v1

    if-gez p1, :cond_1

    return-void

    :cond_1
    iget-object p1, p0, Landroid/net/apf/ApfFilter;->ay:Landroid/net/metrics/IpConnectivityLog;

    invoke-virtual {p1, v0}, Landroid/net/metrics/IpConnectivityLog;->log(Landroid/os/Parcelable;)Z

    return-void
.end method

.method static synthetic a(Landroid/net/apf/ApfFilter;J)V
    .locals 0

    invoke-direct {p0, p1, p2}, Landroid/net/apf/ApfFilter;->a(J)V

    return-void
.end method

.method static synthetic a(Landroid/net/apf/ApfFilter;Landroid/net/apf/ApfGenerator;Landroid/net/apf/ApfFilter$Counter;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Landroid/net/apf/ApfFilter;->a(Landroid/net/apf/ApfGenerator;Landroid/net/apf/ApfFilter$Counter;)V

    return-void
.end method

.method static synthetic a(Landroid/net/apf/ApfFilter;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/net/apf/ApfFilter;->log(Ljava/lang/String;)V

    return-void
.end method

.method private a(Landroid/net/apf/ApfGenerator;)V
    .locals 1
    .annotation build Lcom/android/internal/annotations/GuardedBy;
        value = "this"
    .end annotation

    iget-object v0, p0, Landroid/net/apf/ApfFilter;->av:Landroid/net/apf/a;

    invoke-virtual {v0}, Landroid/net/apf/a;->s()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    sget-object v0, Landroid/net/apf/ApfFilter$Counter;->bc:Landroid/net/apf/ApfFilter$Counter;

    invoke-direct {p0, p1, v0}, Landroid/net/apf/ApfFilter;->a(Landroid/net/apf/ApfGenerator;Landroid/net/apf/ApfFilter$Counter;)V

    iget-object v0, p0, Landroid/net/apf/ApfFilter;->aq:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/net/apf/ApfGenerator;->c(Ljava/lang/String;)Landroid/net/apf/ApfGenerator;

    sget-object v0, Landroid/net/apf/ApfGenerator$Register;->cL:Landroid/net/apf/ApfGenerator$Register;

    invoke-virtual {p1, v0}, Landroid/net/apf/ApfGenerator;->b(Landroid/net/apf/ApfGenerator$Register;)Landroid/net/apf/ApfGenerator;

    invoke-virtual {p1}, Landroid/net/apf/ApfGenerator;->A()Landroid/net/apf/ApfGenerator;

    sget-object v0, Landroid/net/apf/ApfGenerator$Register;->cL:Landroid/net/apf/ApfGenerator$Register;

    invoke-virtual {p1, v0}, Landroid/net/apf/ApfGenerator;->c(Landroid/net/apf/ApfGenerator$Register;)Landroid/net/apf/ApfGenerator;

    const-string v0, "__PASS__"

    invoke-virtual {p1, v0}, Landroid/net/apf/ApfGenerator;->d(Ljava/lang/String;)Landroid/net/apf/ApfGenerator;

    iget-object v0, p0, Landroid/net/apf/ApfFilter;->ar:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/net/apf/ApfGenerator;->c(Ljava/lang/String;)Landroid/net/apf/ApfGenerator;

    sget-object v0, Landroid/net/apf/ApfGenerator$Register;->cL:Landroid/net/apf/ApfGenerator$Register;

    invoke-virtual {p1, v0}, Landroid/net/apf/ApfGenerator;->b(Landroid/net/apf/ApfGenerator$Register;)Landroid/net/apf/ApfGenerator;

    invoke-virtual {p1}, Landroid/net/apf/ApfGenerator;->A()Landroid/net/apf/ApfGenerator;

    sget-object v0, Landroid/net/apf/ApfGenerator$Register;->cL:Landroid/net/apf/ApfGenerator$Register;

    invoke-virtual {p1, v0}, Landroid/net/apf/ApfGenerator;->c(Landroid/net/apf/ApfGenerator$Register;)Landroid/net/apf/ApfGenerator;

    const-string v0, "__DROP__"

    invoke-virtual {p1, v0}, Landroid/net/apf/ApfGenerator;->d(Ljava/lang/String;)Landroid/net/apf/ApfGenerator;

    return-void
.end method

.method private a(Landroid/net/apf/ApfGenerator;Landroid/net/apf/ApfFilter$Counter;)V
    .locals 1

    iget-object v0, p0, Landroid/net/apf/ApfFilter;->av:Landroid/net/apf/a;

    invoke-virtual {v0}, Landroid/net/apf/a;->s()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Landroid/net/apf/ApfGenerator$Register;->cM:Landroid/net/apf/ApfGenerator$Register;

    invoke-virtual {p2}, Landroid/net/apf/ApfFilter$Counter;->ordinal()I

    move-result p2

    neg-int p2, p2

    mul-int/lit8 p2, p2, 0x4

    invoke-virtual {p1, v0, p2}, Landroid/net/apf/ApfGenerator;->d(Landroid/net/apf/ApfGenerator$Register;I)Landroid/net/apf/ApfGenerator;

    :cond_0
    return-void
.end method

.method private static a([I)[I
    .locals 6
    .annotation build Lcom/android/internal/annotations/GuardedBy;
        value = "this"
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    array-length v1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_2

    aget v3, p0, v2

    const/16 v4, 0x600

    if-lt v3, v4, :cond_1

    const v4, 0xffff

    if-gt v3, v4, :cond_1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/16 v5, 0x14

    if-ne v4, v5, :cond_0

    const-string p0, "ApfFilter"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Passed EthType Black List size too large ("

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ") using top 20 protocols"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    :cond_0
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    :goto_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->stream()Ljava/util/stream/Stream;

    move-result-object p0

    sget-object v0, Landroid/net/apf/-$$Lambda$ApfFilter$UV1wDVoVlbcxpr8zevj_aMFtUGw;->INSTANCE:Landroid/net/apf/-$$Lambda$ApfFilter$UV1wDVoVlbcxpr8zevj_aMFtUGw;

    invoke-interface {p0, v0}, Ljava/util/stream/Stream;->mapToInt(Ljava/util/function/ToIntFunction;)Ljava/util/stream/IntStream;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/stream/IntStream;->toArray()[I

    move-result-object p0

    return-object p0
.end method

.method static synthetic b(Landroid/net/apf/ApfFilter;)I
    .locals 0

    iget p0, p0, Landroid/net/apf/ApfFilter;->aN:I

    return p0
.end method

.method static synthetic c(Landroid/net/apf/ApfFilter;)I
    .locals 0

    iget p0, p0, Landroid/net/apf/ApfFilter;->aO:I

    return p0
.end method

.method static synthetic d(Landroid/net/apf/ApfFilter;)Landroid/net/metrics/IpConnectivityLog;
    .locals 0

    iget-object p0, p0, Landroid/net/apf/ApfFilter;->ay:Landroid/net/metrics/IpConnectivityLog;

    return-object p0
.end method

.method static synthetic e(Landroid/net/apf/ApfFilter;)J
    .locals 4

    iget-wide v0, p0, Landroid/net/apf/ApfFilter;->az:J

    const-wide/16 v2, 0x1

    add-long/2addr v2, v0

    iput-wide v2, p0, Landroid/net/apf/ApfFilter;->az:J

    return-wide v0
.end method

.method static synthetic f(Landroid/net/apf/ApfFilter;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Landroid/net/apf/ApfFilter;->ar:Ljava/lang/String;

    return-object p0
.end method

.method public static ipv4BroadcastAddress([BI)I
    .locals 2
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation

    invoke-static {p0}, Lcom/android/internal/util/BitUtils;->bytesToBEInt([B)I

    move-result p0

    const/4 v0, -0x1

    invoke-static {v0}, Lcom/android/internal/util/BitUtils;->uint32(I)J

    move-result-wide v0

    ushr-long/2addr v0, p1

    long-to-int p1, v0

    or-int/2addr p0, p1

    return p0
.end method

.method public static synthetic lambda$UV1wDVoVlbcxpr8zevj_aMFtUGw(Ljava/lang/Integer;)I
    .locals 0

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    return p0
.end method

.method private log(Ljava/lang/String;)V
    .locals 3

    const-string v0, "ApfFilter"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "("

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Landroid/net/apf/ApfFilter;->ax:Landroid/net/util/b;

    iget-object v2, v2, Landroid/net/util/b;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "): "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private t()Landroid/net/apf/ApfGenerator;
    .locals 8
    .annotation build Lcom/android/internal/annotations/GuardedBy;
        value = "this"
    .end annotation

    new-instance v0, Landroid/net/apf/ApfGenerator;

    iget-object v1, p0, Landroid/net/apf/ApfFilter;->av:Landroid/net/apf/a;

    iget v1, v1, Landroid/net/apf/a;->an:I

    invoke-direct {v0, v1}, Landroid/net/apf/ApfGenerator;-><init>(I)V

    iget-object v1, p0, Landroid/net/apf/ApfFilter;->av:Landroid/net/apf/a;

    invoke-virtual {v1}, Landroid/net/apf/a;->s()Z

    move-result v1

    if-eqz v1, :cond_0

    sget-object v1, Landroid/net/apf/ApfFilter$Counter;->aW:Landroid/net/apf/ApfFilter$Counter;

    invoke-direct {p0, v0, v1}, Landroid/net/apf/ApfFilter;->a(Landroid/net/apf/ApfGenerator;Landroid/net/apf/ApfFilter$Counter;)V

    sget-object v1, Landroid/net/apf/ApfGenerator$Register;->cL:Landroid/net/apf/ApfGenerator$Register;

    invoke-virtual {v0, v1}, Landroid/net/apf/ApfGenerator;->b(Landroid/net/apf/ApfGenerator$Register;)Landroid/net/apf/ApfGenerator;

    invoke-virtual {v0}, Landroid/net/apf/ApfGenerator;->A()Landroid/net/apf/ApfGenerator;

    sget-object v1, Landroid/net/apf/ApfGenerator$Register;->cL:Landroid/net/apf/ApfGenerator$Register;

    invoke-virtual {v0, v1}, Landroid/net/apf/ApfGenerator;->c(Landroid/net/apf/ApfGenerator$Register;)Landroid/net/apf/ApfGenerator;

    :cond_0
    sget-object v1, Landroid/net/apf/ApfGenerator$Register;->cL:Landroid/net/apf/ApfGenerator$Register;

    const/16 v2, 0xc

    invoke-virtual {v0, v1, v2}, Landroid/net/apf/ApfGenerator;->b(Landroid/net/apf/ApfGenerator$Register;I)Landroid/net/apf/ApfGenerator;

    iget-boolean v1, p0, Landroid/net/apf/ApfFilter;->aC:Z

    if-eqz v1, :cond_1

    sget-object v1, Landroid/net/apf/ApfFilter$Counter;->bv:Landroid/net/apf/ApfFilter$Counter;

    invoke-direct {p0, v0, v1}, Landroid/net/apf/ApfFilter;->a(Landroid/net/apf/ApfGenerator;Landroid/net/apf/ApfFilter$Counter;)V

    const/16 v1, 0x600

    iget-object v2, p0, Landroid/net/apf/ApfFilter;->ar:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/net/apf/ApfGenerator;->d(ILjava/lang/String;)Landroid/net/apf/ApfGenerator;

    :cond_1
    sget-object v1, Landroid/net/apf/ApfFilter$Counter;->bw:Landroid/net/apf/ApfFilter$Counter;

    invoke-direct {p0, v0, v1}, Landroid/net/apf/ApfFilter;->a(Landroid/net/apf/ApfGenerator;Landroid/net/apf/ApfFilter$Counter;)V

    iget-object v1, p0, Landroid/net/apf/ApfFilter;->aD:[I

    array-length v2, v1

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    if-ge v4, v2, :cond_2

    aget v5, v1, v4

    iget-object v6, p0, Landroid/net/apf/ApfFilter;->ar:Ljava/lang/String;

    invoke-virtual {v0, v5, v6}, Landroid/net/apf/ApfGenerator;->a(ILjava/lang/String;)Landroid/net/apf/ApfGenerator;

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_2
    const-string v1, "skipArpFilters"

    sget v2, Landroid/system/OsConstants;->ETH_P_ARP:I

    invoke-virtual {v0, v2, v1}, Landroid/net/apf/ApfGenerator;->b(ILjava/lang/String;)Landroid/net/apf/ApfGenerator;

    sget-object v2, Landroid/net/apf/ApfGenerator$Register;->cL:Landroid/net/apf/ApfGenerator$Register;

    const/16 v4, 0xe

    invoke-virtual {v0, v2, v4}, Landroid/net/apf/ApfGenerator;->d(Landroid/net/apf/ApfGenerator$Register;I)Landroid/net/apf/ApfGenerator;

    sget-object v2, Landroid/net/apf/ApfFilter$Counter;->be:Landroid/net/apf/ApfFilter$Counter;

    invoke-direct {p0, v0, v2}, Landroid/net/apf/ApfFilter;->a(Landroid/net/apf/ApfGenerator;Landroid/net/apf/ApfFilter$Counter;)V

    sget-object v2, Landroid/net/apf/ApfGenerator$Register;->cL:Landroid/net/apf/ApfGenerator$Register;

    sget-object v4, Landroid/net/apf/ApfFilter;->au:[B

    iget-object v5, p0, Landroid/net/apf/ApfFilter;->aq:Ljava/lang/String;

    invoke-virtual {v0, v2, v4, v5}, Landroid/net/apf/ApfGenerator;->a(Landroid/net/apf/ApfGenerator$Register;[BLjava/lang/String;)Landroid/net/apf/ApfGenerator;

    sget-object v2, Landroid/net/apf/ApfGenerator$Register;->cL:Landroid/net/apf/ApfGenerator$Register;

    const/16 v4, 0x14

    invoke-virtual {v0, v2, v4}, Landroid/net/apf/ApfGenerator;->b(Landroid/net/apf/ApfGenerator$Register;I)Landroid/net/apf/ApfGenerator;

    const-string v2, "checkTargetIPv4"

    const/4 v5, 0x1

    invoke-virtual {v0, v5, v2}, Landroid/net/apf/ApfGenerator;->a(ILjava/lang/String;)Landroid/net/apf/ApfGenerator;

    sget-object v2, Landroid/net/apf/ApfFilter$Counter;->bf:Landroid/net/apf/ApfFilter$Counter;

    invoke-direct {p0, v0, v2}, Landroid/net/apf/ApfFilter;->a(Landroid/net/apf/ApfGenerator;Landroid/net/apf/ApfFilter$Counter;)V

    const/4 v2, 0x2

    iget-object v5, p0, Landroid/net/apf/ApfFilter;->aq:Ljava/lang/String;

    invoke-virtual {v0, v2, v5}, Landroid/net/apf/ApfGenerator;->b(ILjava/lang/String;)Landroid/net/apf/ApfGenerator;

    sget-object v2, Landroid/net/apf/ApfGenerator$Register;->cL:Landroid/net/apf/ApfGenerator$Register;

    invoke-virtual {v0, v2, v3}, Landroid/net/apf/ApfGenerator;->d(Landroid/net/apf/ApfGenerator$Register;I)Landroid/net/apf/ApfGenerator;

    sget-object v2, Landroid/net/apf/ApfFilter$Counter;->bg:Landroid/net/apf/ApfFilter$Counter;

    invoke-direct {p0, v0, v2}, Landroid/net/apf/ApfFilter;->a(Landroid/net/apf/ApfGenerator;Landroid/net/apf/ApfFilter$Counter;)V

    sget-object v2, Landroid/net/apf/ApfGenerator$Register;->cL:Landroid/net/apf/ApfGenerator$Register;

    sget-object v5, Landroid/net/apf/ApfFilter;->as:[B

    iget-object v6, p0, Landroid/net/apf/ApfFilter;->aq:Ljava/lang/String;

    invoke-virtual {v0, v2, v5, v6}, Landroid/net/apf/ApfGenerator;->a(Landroid/net/apf/ApfGenerator$Register;[BLjava/lang/String;)Landroid/net/apf/ApfGenerator;

    const-string v2, "checkTargetIPv4"

    invoke-virtual {v0, v2}, Landroid/net/apf/ApfGenerator;->c(Ljava/lang/String;)Landroid/net/apf/ApfGenerator;

    iget-object v2, p0, Landroid/net/apf/ApfFilter;->aF:[B

    const/16 v5, 0x26

    if-nez v2, :cond_3

    sget-object v2, Landroid/net/apf/ApfGenerator$Register;->cL:Landroid/net/apf/ApfGenerator$Register;

    invoke-virtual {v0, v2, v5}, Landroid/net/apf/ApfGenerator;->c(Landroid/net/apf/ApfGenerator$Register;I)Landroid/net/apf/ApfGenerator;

    sget-object v2, Landroid/net/apf/ApfFilter$Counter;->bk:Landroid/net/apf/ApfFilter$Counter;

    invoke-direct {p0, v0, v2}, Landroid/net/apf/ApfFilter;->a(Landroid/net/apf/ApfGenerator;Landroid/net/apf/ApfFilter$Counter;)V

    iget-object v2, p0, Landroid/net/apf/ApfFilter;->ar:Ljava/lang/String;

    invoke-virtual {v0, v3, v2}, Landroid/net/apf/ApfGenerator;->a(ILjava/lang/String;)Landroid/net/apf/ApfGenerator;

    goto :goto_1

    :cond_3
    sget-object v2, Landroid/net/apf/ApfGenerator$Register;->cL:Landroid/net/apf/ApfGenerator$Register;

    invoke-virtual {v0, v2, v5}, Landroid/net/apf/ApfGenerator;->d(Landroid/net/apf/ApfGenerator$Register;I)Landroid/net/apf/ApfGenerator;

    sget-object v2, Landroid/net/apf/ApfFilter$Counter;->bl:Landroid/net/apf/ApfFilter$Counter;

    invoke-direct {p0, v0, v2}, Landroid/net/apf/ApfFilter;->a(Landroid/net/apf/ApfGenerator;Landroid/net/apf/ApfFilter$Counter;)V

    sget-object v2, Landroid/net/apf/ApfGenerator$Register;->cL:Landroid/net/apf/ApfGenerator$Register;

    iget-object v6, p0, Landroid/net/apf/ApfFilter;->aF:[B

    iget-object v7, p0, Landroid/net/apf/ApfFilter;->ar:Ljava/lang/String;

    invoke-virtual {v0, v2, v6, v7}, Landroid/net/apf/ApfGenerator;->a(Landroid/net/apf/ApfGenerator$Register;[BLjava/lang/String;)Landroid/net/apf/ApfGenerator;

    :goto_1
    sget-object v2, Landroid/net/apf/ApfFilter$Counter;->aX:Landroid/net/apf/ApfFilter$Counter;

    invoke-direct {p0, v0, v2}, Landroid/net/apf/ApfFilter;->a(Landroid/net/apf/ApfGenerator;Landroid/net/apf/ApfFilter$Counter;)V

    iget-object v2, p0, Landroid/net/apf/ApfFilter;->aq:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/net/apf/ApfGenerator;->d(Ljava/lang/String;)Landroid/net/apf/ApfGenerator;

    invoke-virtual {v0, v1}, Landroid/net/apf/ApfGenerator;->c(Ljava/lang/String;)Landroid/net/apf/ApfGenerator;

    const-string v1, "skipIPv4Filters"

    sget v2, Landroid/system/OsConstants;->ETH_P_IP:I

    invoke-virtual {v0, v2, v1}, Landroid/net/apf/ApfGenerator;->b(ILjava/lang/String;)Landroid/net/apf/ApfGenerator;

    iget-boolean v2, p0, Landroid/net/apf/ApfFilter;->aA:Z

    if-eqz v2, :cond_5

    sget-object v2, Landroid/net/apf/ApfGenerator$Register;->cL:Landroid/net/apf/ApfGenerator$Register;

    const/16 v6, 0x17

    invoke-virtual {v0, v2, v6}, Landroid/net/apf/ApfGenerator;->a(Landroid/net/apf/ApfGenerator$Register;I)Landroid/net/apf/ApfGenerator;

    sget v2, Landroid/system/OsConstants;->IPPROTO_UDP:I

    const-string v6, "skip_dhcp_v4_filter"

    invoke-virtual {v0, v2, v6}, Landroid/net/apf/ApfGenerator;->b(ILjava/lang/String;)Landroid/net/apf/ApfGenerator;

    sget-object v2, Landroid/net/apf/ApfGenerator$Register;->cL:Landroid/net/apf/ApfGenerator$Register;

    invoke-virtual {v0, v2, v4}, Landroid/net/apf/ApfGenerator;->b(Landroid/net/apf/ApfGenerator$Register;I)Landroid/net/apf/ApfGenerator;

    const-string v2, "skip_dhcp_v4_filter"

    invoke-virtual {v0, v2}, Landroid/net/apf/ApfGenerator;->e(Ljava/lang/String;)Landroid/net/apf/ApfGenerator;

    sget-object v2, Landroid/net/apf/ApfGenerator$Register;->cM:Landroid/net/apf/ApfGenerator$Register;

    const/16 v6, 0xd

    invoke-virtual {v0, v2, v6}, Landroid/net/apf/ApfGenerator;->e(Landroid/net/apf/ApfGenerator$Register;I)Landroid/net/apf/ApfGenerator;

    sget-object v2, Landroid/net/apf/ApfGenerator$Register;->cL:Landroid/net/apf/ApfGenerator$Register;

    invoke-virtual {v0, v2}, Landroid/net/apf/ApfGenerator;->a(Landroid/net/apf/ApfGenerator$Register;)Landroid/net/apf/ApfGenerator;

    const/16 v2, 0x44

    const-string v6, "skip_dhcp_v4_filter"

    invoke-virtual {v0, v2, v6}, Landroid/net/apf/ApfGenerator;->b(ILjava/lang/String;)Landroid/net/apf/ApfGenerator;

    sget-object v2, Landroid/net/apf/ApfGenerator$Register;->cL:Landroid/net/apf/ApfGenerator$Register;

    const/16 v6, 0x32

    invoke-virtual {v0, v2, v6}, Landroid/net/apf/ApfGenerator;->d(Landroid/net/apf/ApfGenerator$Register;I)Landroid/net/apf/ApfGenerator;

    invoke-virtual {v0}, Landroid/net/apf/ApfGenerator;->C()Landroid/net/apf/ApfGenerator;

    sget-object v2, Landroid/net/apf/ApfGenerator$Register;->cL:Landroid/net/apf/ApfGenerator$Register;

    iget-object v6, p0, Landroid/net/apf/ApfFilter;->mHardwareAddress:[B

    const-string v7, "skip_dhcp_v4_filter"

    invoke-virtual {v0, v2, v6, v7}, Landroid/net/apf/ApfGenerator;->a(Landroid/net/apf/ApfGenerator$Register;[BLjava/lang/String;)Landroid/net/apf/ApfGenerator;

    sget-object v2, Landroid/net/apf/ApfFilter$Counter;->aY:Landroid/net/apf/ApfFilter$Counter;

    invoke-direct {p0, v0, v2}, Landroid/net/apf/ApfFilter;->a(Landroid/net/apf/ApfGenerator;Landroid/net/apf/ApfFilter$Counter;)V

    iget-object v2, p0, Landroid/net/apf/ApfFilter;->aq:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/net/apf/ApfGenerator;->d(Ljava/lang/String;)Landroid/net/apf/ApfGenerator;

    const-string v2, "skip_dhcp_v4_filter"

    invoke-virtual {v0, v2}, Landroid/net/apf/ApfGenerator;->c(Ljava/lang/String;)Landroid/net/apf/ApfGenerator;

    sget-object v2, Landroid/net/apf/ApfGenerator$Register;->cL:Landroid/net/apf/ApfGenerator$Register;

    const/16 v6, 0x1e

    invoke-virtual {v0, v2, v6}, Landroid/net/apf/ApfGenerator;->a(Landroid/net/apf/ApfGenerator$Register;I)Landroid/net/apf/ApfGenerator;

    invoke-virtual {v0}, Landroid/net/apf/ApfGenerator;->B()Landroid/net/apf/ApfGenerator;

    sget-object v2, Landroid/net/apf/ApfFilter$Counter;->bp:Landroid/net/apf/ApfFilter$Counter;

    invoke-direct {p0, v0, v2}, Landroid/net/apf/ApfFilter;->a(Landroid/net/apf/ApfGenerator;Landroid/net/apf/ApfFilter$Counter;)V

    const/16 v2, 0xe0

    iget-object v7, p0, Landroid/net/apf/ApfFilter;->ar:Ljava/lang/String;

    invoke-virtual {v0, v2, v7}, Landroid/net/apf/ApfGenerator;->a(ILjava/lang/String;)Landroid/net/apf/ApfGenerator;

    sget-object v2, Landroid/net/apf/ApfFilter$Counter;->bn:Landroid/net/apf/ApfFilter$Counter;

    invoke-direct {p0, v0, v2}, Landroid/net/apf/ApfFilter;->a(Landroid/net/apf/ApfGenerator;Landroid/net/apf/ApfFilter$Counter;)V

    sget-object v2, Landroid/net/apf/ApfGenerator$Register;->cL:Landroid/net/apf/ApfGenerator$Register;

    invoke-virtual {v0, v2, v6}, Landroid/net/apf/ApfGenerator;->c(Landroid/net/apf/ApfGenerator$Register;I)Landroid/net/apf/ApfGenerator;

    const/4 v2, -0x1

    iget-object v6, p0, Landroid/net/apf/ApfFilter;->ar:Ljava/lang/String;

    invoke-virtual {v0, v2, v6}, Landroid/net/apf/ApfGenerator;->a(ILjava/lang/String;)Landroid/net/apf/ApfGenerator;

    iget-object v2, p0, Landroid/net/apf/ApfFilter;->aF:[B

    if-eqz v2, :cond_4

    iget v2, p0, Landroid/net/apf/ApfFilter;->aG:I

    const/16 v6, 0x1f

    if-ge v2, v6, :cond_4

    sget-object v2, Landroid/net/apf/ApfFilter$Counter;->bo:Landroid/net/apf/ApfFilter$Counter;

    invoke-direct {p0, v0, v2}, Landroid/net/apf/ApfFilter;->a(Landroid/net/apf/ApfGenerator;Landroid/net/apf/ApfFilter$Counter;)V

    iget-object v2, p0, Landroid/net/apf/ApfFilter;->aF:[B

    iget v6, p0, Landroid/net/apf/ApfFilter;->aG:I

    invoke-static {v2, v6}, Landroid/net/apf/ApfFilter;->ipv4BroadcastAddress([BI)I

    move-result v2

    iget-object v6, p0, Landroid/net/apf/ApfFilter;->ar:Ljava/lang/String;

    invoke-virtual {v0, v2, v6}, Landroid/net/apf/ApfGenerator;->a(ILjava/lang/String;)Landroid/net/apf/ApfGenerator;

    :cond_4
    sget-object v2, Landroid/net/apf/ApfFilter$Counter;->bb:Landroid/net/apf/ApfFilter$Counter;

    invoke-direct {p0, v0, v2}, Landroid/net/apf/ApfFilter;->a(Landroid/net/apf/ApfGenerator;Landroid/net/apf/ApfFilter$Counter;)V

    sget-object v2, Landroid/net/apf/ApfGenerator$Register;->cL:Landroid/net/apf/ApfGenerator$Register;

    invoke-virtual {v0, v2, v3}, Landroid/net/apf/ApfGenerator;->d(Landroid/net/apf/ApfGenerator$Register;I)Landroid/net/apf/ApfGenerator;

    sget-object v2, Landroid/net/apf/ApfGenerator$Register;->cL:Landroid/net/apf/ApfGenerator$Register;

    sget-object v6, Landroid/net/apf/ApfFilter;->as:[B

    iget-object v7, p0, Landroid/net/apf/ApfFilter;->aq:Ljava/lang/String;

    invoke-virtual {v0, v2, v6, v7}, Landroid/net/apf/ApfGenerator;->a(Landroid/net/apf/ApfGenerator$Register;[BLjava/lang/String;)Landroid/net/apf/ApfGenerator;

    sget-object v2, Landroid/net/apf/ApfFilter$Counter;->bm:Landroid/net/apf/ApfFilter$Counter;

    invoke-direct {p0, v0, v2}, Landroid/net/apf/ApfFilter;->a(Landroid/net/apf/ApfGenerator;Landroid/net/apf/ApfFilter$Counter;)V

    iget-object v2, p0, Landroid/net/apf/ApfFilter;->ar:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/net/apf/ApfGenerator;->d(Ljava/lang/String;)Landroid/net/apf/ApfGenerator;

    :cond_5
    sget-object v2, Landroid/net/apf/ApfFilter$Counter;->aZ:Landroid/net/apf/ApfFilter$Counter;

    invoke-direct {p0, v0, v2}, Landroid/net/apf/ApfFilter;->a(Landroid/net/apf/ApfGenerator;Landroid/net/apf/ApfFilter$Counter;)V

    iget-object v2, p0, Landroid/net/apf/ApfFilter;->aq:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/net/apf/ApfGenerator;->d(Ljava/lang/String;)Landroid/net/apf/ApfGenerator;

    invoke-virtual {v0, v1}, Landroid/net/apf/ApfGenerator;->c(Ljava/lang/String;)Landroid/net/apf/ApfGenerator;

    const-string v1, "IPv6Filters"

    sget v2, Landroid/system/OsConstants;->ETH_P_IPV6:I

    invoke-virtual {v0, v2, v1}, Landroid/net/apf/ApfGenerator;->a(ILjava/lang/String;)Landroid/net/apf/ApfGenerator;

    sget-object v2, Landroid/net/apf/ApfGenerator$Register;->cL:Landroid/net/apf/ApfGenerator$Register;

    invoke-virtual {v0, v2, v3}, Landroid/net/apf/ApfGenerator;->d(Landroid/net/apf/ApfGenerator$Register;I)Landroid/net/apf/ApfGenerator;

    sget-object v2, Landroid/net/apf/ApfFilter$Counter;->bh:Landroid/net/apf/ApfFilter$Counter;

    invoke-direct {p0, v0, v2}, Landroid/net/apf/ApfFilter;->a(Landroid/net/apf/ApfGenerator;Landroid/net/apf/ApfFilter$Counter;)V

    sget-object v2, Landroid/net/apf/ApfGenerator$Register;->cL:Landroid/net/apf/ApfGenerator$Register;

    sget-object v3, Landroid/net/apf/ApfFilter;->as:[B

    iget-object v6, p0, Landroid/net/apf/ApfFilter;->aq:Ljava/lang/String;

    invoke-virtual {v0, v2, v3, v6}, Landroid/net/apf/ApfGenerator;->a(Landroid/net/apf/ApfGenerator$Register;[BLjava/lang/String;)Landroid/net/apf/ApfGenerator;

    sget-object v2, Landroid/net/apf/ApfFilter$Counter;->bi:Landroid/net/apf/ApfFilter$Counter;

    invoke-direct {p0, v0, v2}, Landroid/net/apf/ApfFilter;->a(Landroid/net/apf/ApfGenerator;Landroid/net/apf/ApfFilter$Counter;)V

    iget-object v2, p0, Landroid/net/apf/ApfFilter;->ar:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/net/apf/ApfGenerator;->d(Ljava/lang/String;)Landroid/net/apf/ApfGenerator;

    invoke-virtual {v0, v1}, Landroid/net/apf/ApfGenerator;->c(Ljava/lang/String;)Landroid/net/apf/ApfGenerator;

    sget-object v1, Landroid/net/apf/ApfGenerator$Register;->cL:Landroid/net/apf/ApfGenerator$Register;

    invoke-virtual {v0, v1, v4}, Landroid/net/apf/ApfGenerator;->a(Landroid/net/apf/ApfGenerator$Register;I)Landroid/net/apf/ApfGenerator;

    iget-boolean v1, p0, Landroid/net/apf/ApfFilter;->aA:Z

    const/16 v2, 0x36

    if-eqz v1, :cond_7

    iget-boolean v1, p0, Landroid/net/apf/ApfFilter;->aB:Z

    if-eqz v1, :cond_6

    sget v1, Landroid/system/OsConstants;->IPPROTO_ICMPV6:I

    const-string v3, "dropAllIPv6Multicast"

    invoke-virtual {v0, v1, v3}, Landroid/net/apf/ApfGenerator;->b(ILjava/lang/String;)Landroid/net/apf/ApfGenerator;

    sget-object v1, Landroid/net/apf/ApfGenerator$Register;->cL:Landroid/net/apf/ApfGenerator$Register;

    invoke-virtual {v0, v1, v2}, Landroid/net/apf/ApfGenerator;->a(Landroid/net/apf/ApfGenerator$Register;I)Landroid/net/apf/ApfGenerator;

    const/16 v1, 0x80

    const-string v3, "skipIPv6MulticastFilter"

    invoke-virtual {v0, v1, v3}, Landroid/net/apf/ApfGenerator;->b(ILjava/lang/String;)Landroid/net/apf/ApfGenerator;

    goto :goto_2

    :cond_6
    sget v1, Landroid/system/OsConstants;->IPPROTO_ICMPV6:I

    const-string v3, "skipIPv6MulticastFilter"

    invoke-virtual {v0, v1, v3}, Landroid/net/apf/ApfGenerator;->a(ILjava/lang/String;)Landroid/net/apf/ApfGenerator;

    :goto_2
    const-string v1, "dropAllIPv6Multicast"

    invoke-virtual {v0, v1}, Landroid/net/apf/ApfGenerator;->c(Ljava/lang/String;)Landroid/net/apf/ApfGenerator;

    sget-object v1, Landroid/net/apf/ApfFilter$Counter;->bu:Landroid/net/apf/ApfFilter$Counter;

    invoke-direct {p0, v0, v1}, Landroid/net/apf/ApfFilter;->a(Landroid/net/apf/ApfGenerator;Landroid/net/apf/ApfFilter$Counter;)V

    sget-object v1, Landroid/net/apf/ApfGenerator$Register;->cL:Landroid/net/apf/ApfGenerator$Register;

    invoke-virtual {v0, v1, v5}, Landroid/net/apf/ApfGenerator;->a(Landroid/net/apf/ApfGenerator$Register;I)Landroid/net/apf/ApfGenerator;

    const/16 v1, 0xff

    iget-object v3, p0, Landroid/net/apf/ApfFilter;->ar:Ljava/lang/String;

    invoke-virtual {v0, v1, v3}, Landroid/net/apf/ApfGenerator;->a(ILjava/lang/String;)Landroid/net/apf/ApfGenerator;

    sget-object v1, Landroid/net/apf/ApfFilter$Counter;->bd:Landroid/net/apf/ApfFilter$Counter;

    invoke-direct {p0, v0, v1}, Landroid/net/apf/ApfFilter;->a(Landroid/net/apf/ApfGenerator;Landroid/net/apf/ApfFilter$Counter;)V

    iget-object v1, p0, Landroid/net/apf/ApfFilter;->aq:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/net/apf/ApfGenerator;->d(Ljava/lang/String;)Landroid/net/apf/ApfGenerator;

    const-string v1, "skipIPv6MulticastFilter"

    invoke-virtual {v0, v1}, Landroid/net/apf/ApfGenerator;->c(Ljava/lang/String;)Landroid/net/apf/ApfGenerator;

    goto :goto_3

    :cond_7
    sget-object v1, Landroid/net/apf/ApfFilter$Counter;->ba:Landroid/net/apf/ApfFilter$Counter;

    invoke-direct {p0, v0, v1}, Landroid/net/apf/ApfFilter;->a(Landroid/net/apf/ApfGenerator;Landroid/net/apf/ApfFilter$Counter;)V

    sget v1, Landroid/system/OsConstants;->IPPROTO_ICMPV6:I

    iget-object v3, p0, Landroid/net/apf/ApfFilter;->aq:Ljava/lang/String;

    invoke-virtual {v0, v1, v3}, Landroid/net/apf/ApfGenerator;->b(ILjava/lang/String;)Landroid/net/apf/ApfGenerator;

    :goto_3
    const-string v1, "skipUnsolicitedMulticastNA"

    sget-object v3, Landroid/net/apf/ApfGenerator$Register;->cL:Landroid/net/apf/ApfGenerator$Register;

    invoke-virtual {v0, v3, v2}, Landroid/net/apf/ApfGenerator;->a(Landroid/net/apf/ApfGenerator$Register;I)Landroid/net/apf/ApfGenerator;

    sget-object v2, Landroid/net/apf/ApfFilter$Counter;->bq:Landroid/net/apf/ApfFilter$Counter;

    invoke-direct {p0, v0, v2}, Landroid/net/apf/ApfFilter;->a(Landroid/net/apf/ApfGenerator;Landroid/net/apf/ApfFilter$Counter;)V

    const/16 v2, 0x85

    iget-object v3, p0, Landroid/net/apf/ApfFilter;->ar:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/net/apf/ApfGenerator;->a(ILjava/lang/String;)Landroid/net/apf/ApfGenerator;

    const/16 v2, 0x88

    invoke-virtual {v0, v2, v1}, Landroid/net/apf/ApfGenerator;->b(ILjava/lang/String;)Landroid/net/apf/ApfGenerator;

    sget-object v2, Landroid/net/apf/ApfGenerator$Register;->cL:Landroid/net/apf/ApfGenerator$Register;

    invoke-virtual {v0, v2, v5}, Landroid/net/apf/ApfGenerator;->d(Landroid/net/apf/ApfGenerator$Register;I)Landroid/net/apf/ApfGenerator;

    sget-object v2, Landroid/net/apf/ApfGenerator$Register;->cL:Landroid/net/apf/ApfGenerator$Register;

    sget-object v3, Landroid/net/apf/ApfFilter;->at:[B

    invoke-virtual {v0, v2, v3, v1}, Landroid/net/apf/ApfGenerator;->a(Landroid/net/apf/ApfGenerator$Register;[BLjava/lang/String;)Landroid/net/apf/ApfGenerator;

    sget-object v2, Landroid/net/apf/ApfFilter$Counter;->br:Landroid/net/apf/ApfFilter$Counter;

    invoke-direct {p0, v0, v2}, Landroid/net/apf/ApfFilter;->a(Landroid/net/apf/ApfGenerator;Landroid/net/apf/ApfFilter$Counter;)V

    iget-object v2, p0, Landroid/net/apf/ApfFilter;->ar:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/net/apf/ApfGenerator;->d(Ljava/lang/String;)Landroid/net/apf/ApfGenerator;

    invoke-virtual {v0, v1}, Landroid/net/apf/ApfGenerator;->c(Ljava/lang/String;)Landroid/net/apf/ApfGenerator;

    return-object v0
.end method

.method private u()V
    .locals 3
    .annotation build Lcom/android/internal/annotations/GuardedBy;
        value = "this"
    .end annotation

    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Landroid/net/apf/ApfFilter;->aH:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    iget-object v1, p0, Landroid/net/apf/ApfFilter;->aH:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/apf/ApfFilter$Ra;

    invoke-virtual {v1}, Landroid/net/apf/ApfFilter$Ra;->y()Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Expiring "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Landroid/net/apf/ApfFilter;->aH:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Landroid/net/apf/ApfFilter;->log(Ljava/lang/String;)V

    iget-object v1, p0, Landroid/net/apf/ApfFilter;->aH:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method


# virtual methods
.method public final declared-synchronized a(Landroid/net/LinkProperties;)V
    .locals 4

    monitor-enter p0

    :try_start_0
    invoke-virtual {p1}, Landroid/net/LinkProperties;->getLinkAddresses()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 v0, 0x0

    move-object v1, v0

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/LinkAddress;

    invoke-virtual {v2}, Landroid/net/LinkAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v3

    instance-of v3, v3, Ljava/net/Inet4Address;

    if-eqz v3, :cond_0

    if-eqz v1, :cond_1

    invoke-virtual {v1, v2}, Landroid/net/LinkAddress;->isSameAddressAs(Landroid/net/LinkAddress;)Z

    move-result v1

    if-nez v1, :cond_1

    move-object v1, v0

    goto :goto_1

    :cond_1
    move-object v1, v2

    goto :goto_0

    :cond_2
    :goto_1
    if-eqz v1, :cond_3

    invoke-virtual {v1}, Landroid/net/LinkAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object p1

    invoke-virtual {p1}, Ljava/net/InetAddress;->getAddress()[B

    move-result-object v0

    :cond_3
    if-eqz v1, :cond_4

    invoke-virtual {v1}, Landroid/net/LinkAddress;->getPrefixLength()I

    move-result p1

    goto :goto_2

    :cond_4
    const/4 p1, 0x0

    :goto_2
    iget v1, p0, Landroid/net/apf/ApfFilter;->aG:I

    if-ne p1, v1, :cond_5

    iget-object v1, p0, Landroid/net/apf/ApfFilter;->aF:[B

    invoke-static {v0, v1}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_5

    monitor-exit p0

    return-void

    :cond_5
    :try_start_1
    iput-object v0, p0, Landroid/net/apf/ApfFilter;->aF:[B

    iput p1, p0, Landroid/net/apf/ApfFilter;->aG:I

    invoke-virtual {p0}, Landroid/net/apf/ApfFilter;->installNewProgramLocked()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public final declared-synchronized a([B)V
    .locals 0

    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Landroid/net/apf/ApfFilter;->aM:[B
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public final declared-synchronized b(Z)V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Landroid/net/apf/ApfFilter;->aA:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-ne v0, p1, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    iput-boolean p1, p0, Landroid/net/apf/ApfFilter;->aA:Z

    if-nez p1, :cond_1

    iget p1, p0, Landroid/net/apf/ApfFilter;->aO:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Landroid/net/apf/ApfFilter;->aO:I

    :cond_1
    invoke-virtual {p0}, Landroid/net/apf/ApfFilter;->installNewProgramLocked()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method protected final currentTimeSeconds()J
    .locals 4
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    return-wide v0
.end method

.method public final declared-synchronized dump(Lcom/android/internal/util/IndentingPrintWriter;)V
    .locals 13

    monitor-enter p0

    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Capabilities: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Landroid/net/apf/ApfFilter;->av:Landroid/net/apf/a;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Receive thread: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Landroid/net/apf/ApfFilter;->mReceiveThread:Landroid/net/apf/ApfFilter$ReceiveThread;

    if-eqz v1, :cond_0

    const-string v1, "RUNNING"

    goto :goto_0

    :cond_0
    const-string v1, "STOPPED"

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Multicast: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean v1, p0, Landroid/net/apf/ApfFilter;->aA:Z

    if-eqz v1, :cond_1

    const-string v1, "DROP"

    goto :goto_1

    :cond_1
    const-string v1, "ALLOW"

    :goto_1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "IPv4 address: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Landroid/net/apf/ApfFilter;->aF:[B

    invoke-static {v1}, Ljava/net/InetAddress;->getByAddress([B)Ljava/net/InetAddress;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/net/UnknownHostException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2

    :catch_0
    move-exception v0

    :goto_2
    :try_start_2
    iget-wide v0, p0, Landroid/net/apf/ApfFilter;->aI:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_2

    const-string v0, "No program installed."

    invoke-virtual {p1, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-void

    :cond_2
    :try_start_3
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Program updates: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Landroid/net/apf/ApfFilter;->aN:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    const-string v0, "Last program length %d, installed %ds ago, lifetime %ds"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v4, p0, Landroid/net/apf/ApfFilter;->aL:[B

    array-length v4, v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v1, v5

    invoke-virtual {p0}, Landroid/net/apf/ApfFilter;->currentTimeSeconds()J

    move-result-wide v6

    iget-wide v8, p0, Landroid/net/apf/ApfFilter;->aI:J

    sub-long/2addr v6, v8

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    const/4 v6, 0x1

    aput-object v4, v1, v6

    iget-wide v7, p0, Landroid/net/apf/ApfFilter;->aJ:J

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    const/4 v7, 0x2

    aput-object v4, v1, v7

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    const-string v0, "RA filters:"

    invoke-virtual {p1, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/android/internal/util/IndentingPrintWriter;->increaseIndent()Lcom/android/internal/util/IndentingPrintWriter;

    iget-object v0, p0, Landroid/net/apf/ApfFilter;->aH:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/apf/ApfFilter$Ra;

    invoke-virtual {p1, v1}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/Object;)V

    invoke-virtual {p1}, Lcom/android/internal/util/IndentingPrintWriter;->increaseIndent()Lcom/android/internal/util/IndentingPrintWriter;

    const-string v4, "Seen: %d, last %ds ago"

    new-array v8, v7, [Ljava/lang/Object;

    iget v9, v1, Landroid/net/apf/ApfFilter$Ra;->bL:I

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v5

    invoke-virtual {p0}, Landroid/net/apf/ApfFilter;->currentTimeSeconds()J

    move-result-wide v9

    iget-wide v11, v1, Landroid/net/apf/ApfFilter$Ra;->bI:J

    sub-long/2addr v9, v11

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    aput-object v9, v8, v6

    invoke-static {v4, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    const-string v4, "Last match:"

    invoke-virtual {p1, v4}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/android/internal/util/IndentingPrintWriter;->increaseIndent()Lcom/android/internal/util/IndentingPrintWriter;

    invoke-virtual {v1}, Landroid/net/apf/ApfFilter$Ra;->w()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/android/internal/util/IndentingPrintWriter;->decreaseIndent()Lcom/android/internal/util/IndentingPrintWriter;

    invoke-virtual {p1}, Lcom/android/internal/util/IndentingPrintWriter;->decreaseIndent()Lcom/android/internal/util/IndentingPrintWriter;

    goto :goto_3

    :cond_3
    invoke-virtual {p1}, Lcom/android/internal/util/IndentingPrintWriter;->decreaseIndent()Lcom/android/internal/util/IndentingPrintWriter;

    const-string v0, "Last program:"

    invoke-virtual {p1, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/android/internal/util/IndentingPrintWriter;->increaseIndent()Lcom/android/internal/util/IndentingPrintWriter;

    iget-object v0, p0, Landroid/net/apf/ApfFilter;->aL:[B

    invoke-static {v0, v5}, Lcom/android/internal/util/HexDump;->toHexString([BZ)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/android/internal/util/IndentingPrintWriter;->decreaseIndent()Lcom/android/internal/util/IndentingPrintWriter;

    const-string v0, "APF packet counters: "

    invoke-virtual {p1, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/android/internal/util/IndentingPrintWriter;->increaseIndent()Lcom/android/internal/util/IndentingPrintWriter;

    iget-object v0, p0, Landroid/net/apf/ApfFilter;->av:Landroid/net/apf/a;

    invoke-virtual {v0}, Landroid/net/apf/a;->s()Z

    move-result v0

    if-nez v0, :cond_4

    const-string v0, "APF counters not supported"

    :goto_4
    invoke-virtual {p1, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    goto :goto_6

    :cond_4
    iget-object v0, p0, Landroid/net/apf/ApfFilter;->aM:[B

    if-nez v0, :cond_5

    const-string v0, "No last snapshot."
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_4

    :cond_5
    :try_start_4
    const-class v0, Landroid/net/apf/ApfFilter$Counter;

    invoke-virtual {v0}, Ljava/lang/Class;->getEnumConstants()[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/net/apf/ApfFilter$Counter;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    array-length v0, v0

    invoke-interface {v1, v6, v0}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_6
    :goto_5
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_7

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/apf/ApfFilter$Counter;

    iget-object v4, p0, Landroid/net/apf/ApfFilter;->aM:[B

    invoke-static {v4, v1}, Landroid/net/apf/ApfFilter;->a([BLandroid/net/apf/ApfFilter$Counter;)J

    move-result-wide v4

    cmp-long v6, v4, v2

    if-eqz v6, :cond_6

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Landroid/net/apf/ApfFilter$Counter;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ": "

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_5

    :catch_1
    move-exception v0

    :try_start_5
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Uh-oh: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_4

    :cond_7
    :goto_6
    invoke-virtual {p1}, Lcom/android/internal/util/IndentingPrintWriter;->decreaseIndent()Lcom/android/internal/util/IndentingPrintWriter;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method final installNewProgramLocked()V
    .locals 8
    .annotation build Lcom/android/internal/annotations/GuardedBy;
        value = "this"
    .end annotation

    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation

    invoke-direct {p0}, Landroid/net/apf/ApfFilter;->u()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Landroid/net/apf/ApfFilter;->av:Landroid/net/apf/a;

    iget v1, v1, Landroid/net/apf/a;->ao:I

    int-to-long v1, v1

    iget-object v3, p0, Landroid/net/apf/ApfFilter;->av:Landroid/net/apf/a;

    invoke-virtual {v3}, Landroid/net/apf/a;->s()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-static {}, Landroid/net/apf/ApfFilter$Counter;->v()I

    move-result v3

    int-to-long v3, v3

    sub-long/2addr v1, v3

    :cond_0
    :try_start_0
    invoke-direct {p0}, Landroid/net/apf/ApfFilter;->t()Landroid/net/apf/ApfGenerator;

    move-result-object v3

    invoke-direct {p0, v3}, Landroid/net/apf/ApfFilter;->a(Landroid/net/apf/ApfGenerator;)V

    invoke-virtual {v3}, Landroid/net/apf/ApfGenerator;->E()I

    move-result v4

    int-to-long v4, v4

    cmp-long v4, v4, v1

    if-lez v4, :cond_1

    const-string v0, "ApfFilter"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Program exceeds maximum size "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_1
    iget-object v4, p0, Landroid/net/apf/ApfFilter;->aH:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/net/apf/ApfFilter$Ra;

    invoke-virtual {v5, v3}, Landroid/net/apf/ApfFilter$Ra;->b(Landroid/net/apf/ApfGenerator;)J

    invoke-virtual {v3}, Landroid/net/apf/ApfGenerator;->E()I

    move-result v6

    int-to-long v6, v6

    cmp-long v6, v6, v1

    if-gtz v6, :cond_2

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    invoke-direct {p0}, Landroid/net/apf/ApfFilter;->t()Landroid/net/apf/ApfGenerator;

    move-result-object v1

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    const-wide v3, 0x7fffffffffffffffL

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/net/apf/ApfFilter$Ra;

    invoke-virtual {v5, v1}, Landroid/net/apf/ApfFilter$Ra;->b(Landroid/net/apf/ApfGenerator;)J

    move-result-wide v5

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v3

    goto :goto_1

    :cond_3
    invoke-direct {p0, v1}, Landroid/net/apf/ApfFilter;->a(Landroid/net/apf/ApfGenerator;)V

    invoke-virtual {v1}, Landroid/net/apf/ApfGenerator;->F()[B

    move-result-object v1
    :try_end_0
    .catch Landroid/net/apf/ApfGenerator$IllegalInstructionException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    invoke-virtual {p0}, Landroid/net/apf/ApfFilter;->currentTimeSeconds()J

    move-result-wide v5

    iput-wide v5, p0, Landroid/net/apf/ApfFilter;->aI:J

    iput-wide v3, p0, Landroid/net/apf/ApfFilter;->aJ:J

    iput-object v1, p0, Landroid/net/apf/ApfFilter;->aL:[B

    iget v2, p0, Landroid/net/apf/ApfFilter;->aN:I

    const/4 v7, 0x1

    add-int/2addr v2, v7

    iput v2, p0, Landroid/net/apf/ApfFilter;->aN:I

    iget-object v2, p0, Landroid/net/apf/ApfFilter;->aw:Landroid/net/a/i;

    invoke-virtual {v2, v1}, Landroid/net/a/i;->e([B)V

    invoke-direct {p0, v5, v6}, Landroid/net/apf/ApfFilter;->a(J)V

    new-instance v2, Landroid/net/metrics/ApfProgramEvent;

    invoke-direct {v2}, Landroid/net/metrics/ApfProgramEvent;-><init>()V

    iput-object v2, p0, Landroid/net/apf/ApfFilter;->aK:Landroid/net/metrics/ApfProgramEvent;

    iget-object v2, p0, Landroid/net/apf/ApfFilter;->aK:Landroid/net/metrics/ApfProgramEvent;

    iput-wide v3, v2, Landroid/net/metrics/ApfProgramEvent;->lifetime:J

    iget-object v2, p0, Landroid/net/apf/ApfFilter;->aK:Landroid/net/metrics/ApfProgramEvent;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    iput v0, v2, Landroid/net/metrics/ApfProgramEvent;->filteredRas:I

    iget-object v0, p0, Landroid/net/apf/ApfFilter;->aK:Landroid/net/metrics/ApfProgramEvent;

    iget-object v2, p0, Landroid/net/apf/ApfFilter;->aH:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    iput v2, v0, Landroid/net/metrics/ApfProgramEvent;->currentRas:I

    iget-object v0, p0, Landroid/net/apf/ApfFilter;->aK:Landroid/net/metrics/ApfProgramEvent;

    array-length v1, v1

    iput v1, v0, Landroid/net/metrics/ApfProgramEvent;->programLength:I

    iget-object v0, p0, Landroid/net/apf/ApfFilter;->aK:Landroid/net/metrics/ApfProgramEvent;

    iget-object v1, p0, Landroid/net/apf/ApfFilter;->aF:[B

    if-eqz v1, :cond_4

    goto :goto_2

    :cond_4
    const/4 v7, 0x0

    :goto_2
    iget-boolean v1, p0, Landroid/net/apf/ApfFilter;->aA:Z

    invoke-static {v7, v1}, Landroid/net/metrics/ApfProgramEvent;->flagsFor(ZZ)I

    move-result v1

    iput v1, v0, Landroid/net/metrics/ApfProgramEvent;->flags:I

    return-void

    :catch_0
    move-exception v0

    const-string v1, "ApfFilter"

    const-string v2, "Failed to generate APF program."

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method

.method final maybeStartFilter()V
    .locals 4
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation

    :try_start_0
    iget-object v0, p0, Landroid/net/apf/ApfFilter;->ax:Landroid/net/util/b;

    iget-object v0, v0, Landroid/net/util/b;->fx:Landroid/net/MacAddress;

    invoke-virtual {v0}, Landroid/net/MacAddress;->toByteArray()[B

    move-result-object v0

    iput-object v0, p0, Landroid/net/apf/ApfFilter;->mHardwareAddress:[B

    monitor-enter p0
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/system/ErrnoException; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    iget-object v0, p0, Landroid/net/apf/ApfFilter;->av:Landroid/net/apf/a;

    invoke-virtual {v0}, Landroid/net/apf/a;->s()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/net/apf/ApfFilter;->av:Landroid/net/apf/a;

    iget v0, v0, Landroid/net/apf/a;->ao:I

    new-array v0, v0, [B

    iget-object v1, p0, Landroid/net/apf/ApfFilter;->aw:Landroid/net/a/i;

    invoke-virtual {v1, v0}, Landroid/net/a/i;->e([B)V

    :cond_0
    invoke-virtual {p0}, Landroid/net/apf/ApfFilter;->installNewProgramLocked()V

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    sget v0, Landroid/system/OsConstants;->AF_PACKET:I

    sget v1, Landroid/system/OsConstants;->SOCK_RAW:I

    sget v2, Landroid/system/OsConstants;->ETH_P_IPV6:I

    invoke-static {v0, v1, v2}, Landroid/system/Os;->socket(III)Ljava/io/FileDescriptor;

    move-result-object v0

    new-instance v1, Landroid/system/PacketSocketAddress;

    sget v2, Landroid/system/OsConstants;->ETH_P_IPV6:I

    int-to-short v2, v2

    iget-object v3, p0, Landroid/net/apf/ApfFilter;->ax:Landroid/net/util/b;

    iget v3, v3, Landroid/net/util/b;->index:I

    invoke-direct {v1, v2, v3}, Landroid/system/PacketSocketAddress;-><init>(SI)V

    invoke-static {v0, v1}, Landroid/system/Os;->bind(Ljava/io/FileDescriptor;Ljava/net/SocketAddress;)V

    iget-object v1, p0, Landroid/net/apf/ApfFilter;->av:Landroid/net/apf/a;

    iget v1, v1, Landroid/net/apf/a;->ap:I

    invoke-static {v0, v1}, Landroid/net/NetworkUtils;->attachRaFilter(Ljava/io/FileDescriptor;I)V
    :try_end_2
    .catch Ljava/net/SocketException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Landroid/system/ErrnoException; {:try_start_2 .. :try_end_2} :catch_0

    new-instance v1, Landroid/net/apf/ApfFilter$ReceiveThread;

    invoke-direct {v1, p0, v0}, Landroid/net/apf/ApfFilter$ReceiveThread;-><init>(Landroid/net/apf/ApfFilter;Ljava/io/FileDescriptor;)V

    iput-object v1, p0, Landroid/net/apf/ApfFilter;->mReceiveThread:Landroid/net/apf/ApfFilter$ReceiveThread;

    iget-object v0, p0, Landroid/net/apf/ApfFilter;->mReceiveThread:Landroid/net/apf/ApfFilter$ReceiveThread;

    invoke-virtual {v0}, Landroid/net/apf/ApfFilter$ReceiveThread;->start()V

    return-void

    :catchall_0
    move-exception v0

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v0
    :try_end_4
    .catch Ljava/net/SocketException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Landroid/system/ErrnoException; {:try_start_4 .. :try_end_4} :catch_0

    :catch_0
    move-exception v0

    const-string v1, "ApfFilter"

    const-string v2, "Error starting filter"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method

.method final declared-synchronized processRa([BI)Landroid/net/apf/ApfFilter$ProcessRaResult;
    .locals 7
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation

    monitor-enter p0

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    :try_start_0
    iget-object v2, p0, Landroid/net/apf/ApfFilter;->aH:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_3

    iget-object v2, p0, Landroid/net/apf/ApfFilter;->aH:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/apf/ApfFilter$Ra;

    invoke-virtual {v2, p1, p2}, Landroid/net/apf/ApfFilter$Ra;->a([BI)Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-virtual {p0}, Landroid/net/apf/ApfFilter;->currentTimeSeconds()J

    move-result-wide v3

    iput-wide v3, v2, Landroid/net/apf/ApfFilter$Ra;->bI:J

    invoke-virtual {v2, p1}, Landroid/net/apf/ApfFilter$Ra;->b([B)J

    move-result-wide p1

    iput-wide p1, v2, Landroid/net/apf/ApfFilter$Ra;->bH:J

    iget p1, v2, Landroid/net/apf/ApfFilter$Ra;->bL:I

    const/4 p2, 0x1

    add-int/2addr p1, p2

    iput p1, v2, Landroid/net/apf/ApfFilter$Ra;->bL:I

    iget-object p1, p0, Landroid/net/apf/ApfFilter;->aH:Ljava/util/ArrayList;

    iget-object v2, p0, Landroid/net/apf/ApfFilter;->aH:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/apf/ApfFilter$Ra;

    invoke-virtual {p1, v0, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    iget-wide v1, p0, Landroid/net/apf/ApfFilter;->aI:J

    iget-wide v3, p0, Landroid/net/apf/ApfFilter;->aJ:J

    add-long/2addr v1, v3

    invoke-virtual {p0}, Landroid/net/apf/ApfFilter;->currentTimeSeconds()J

    move-result-wide v3

    const-wide/16 v5, 0x1e

    add-long/2addr v3, v5

    cmp-long p1, v1, v3

    if-gez p1, :cond_0

    goto :goto_1

    :cond_0
    move p2, v0

    :goto_1
    if-eqz p2, :cond_1

    invoke-virtual {p0}, Landroid/net/apf/ApfFilter;->installNewProgramLocked()V

    sget-object p1, Landroid/net/apf/ApfFilter$ProcessRaResult;->bD:Landroid/net/apf/ApfFilter$ProcessRaResult;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :cond_1
    :try_start_1
    sget-object p1, Landroid/net/apf/ApfFilter$ProcessRaResult;->by:Landroid/net/apf/ApfFilter$ProcessRaResult;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object p1

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_3
    :try_start_2
    invoke-direct {p0}, Landroid/net/apf/ApfFilter;->u()V

    iget-object v0, p0, Landroid/net/apf/ApfFilter;->aH:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/16 v1, 0xa

    if-lt v0, v1, :cond_4

    sget-object p1, Landroid/net/apf/ApfFilter$ProcessRaResult;->bz:Landroid/net/apf/ApfFilter$ProcessRaResult;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-object p1

    :cond_4
    :try_start_3
    new-instance v0, Landroid/net/apf/ApfFilter$Ra;

    invoke-direct {v0, p0, p1, p2}, Landroid/net/apf/ApfFilter$Ra;-><init>(Landroid/net/apf/ApfFilter;[BI)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    invoke-virtual {v0}, Landroid/net/apf/ApfFilter$Ra;->y()Z

    move-result p1

    if-eqz p1, :cond_5

    sget-object p1, Landroid/net/apf/ApfFilter$ProcessRaResult;->bB:Landroid/net/apf/ApfFilter$ProcessRaResult;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    monitor-exit p0

    return-object p1

    :cond_5
    :try_start_5
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "Adding "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Landroid/net/apf/ApfFilter;->log(Ljava/lang/String;)V

    iget-object p1, p0, Landroid/net/apf/ApfFilter;->aH:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Landroid/net/apf/ApfFilter;->installNewProgramLocked()V

    sget-object p1, Landroid/net/apf/ApfFilter$ProcessRaResult;->bC:Landroid/net/apf/ApfFilter$ProcessRaResult;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    monitor-exit p0

    return-object p1

    :catch_0
    move-exception p1

    :try_start_6
    const-string p2, "ApfFilter"

    const-string v0, "Error parsing RA"

    invoke-static {p2, v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    sget-object p1, Landroid/net/apf/ApfFilter$ProcessRaResult;->bA:Landroid/net/apf/ApfFilter$ProcessRaResult;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public final declared-synchronized setDozeMode(Z)V
    .locals 1
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Landroid/net/apf/ApfFilter;->aB:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-ne v0, p1, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    iput-boolean p1, p0, Landroid/net/apf/ApfFilter;->aB:Z

    invoke-virtual {p0}, Landroid/net/apf/ApfFilter;->installNewProgramLocked()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public final declared-synchronized shutdown()V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Landroid/net/apf/ApfFilter;->mReceiveThread:Landroid/net/apf/ApfFilter$ReceiveThread;

    if-eqz v0, :cond_0

    const-string v0, "shutting down"

    invoke-direct {p0, v0}, Landroid/net/apf/ApfFilter;->log(Ljava/lang/String;)V

    iget-object v0, p0, Landroid/net/apf/ApfFilter;->mReceiveThread:Landroid/net/apf/ApfFilter$ReceiveThread;

    invoke-virtual {v0}, Landroid/net/apf/ApfFilter$ReceiveThread;->z()V

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/net/apf/ApfFilter;->mReceiveThread:Landroid/net/apf/ApfFilter$ReceiveThread;

    :cond_0
    iget-object v0, p0, Landroid/net/apf/ApfFilter;->aH:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget-object v0, p0, Landroid/net/apf/ApfFilter;->mContext:Landroid/content/Context;

    iget-object v1, p0, Landroid/net/apf/ApfFilter;->aE:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
