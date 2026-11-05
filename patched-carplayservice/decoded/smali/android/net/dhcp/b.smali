.class public Landroid/net/dhcp/b;
.super Lcom/android/internal/util/StateMachine;


# static fields
.field private static final cP:Landroid/util/SparseArray;

.field static final cQ:[B

.field private static final sMessageClasses:[Ljava/lang/Class;


# instance fields
.field private final ay:Landroid/net/metrics/IpConnectivityLog;

.field private final cR:Ljava/util/Random;

.field private cS:Ljava/io/FileDescriptor;

.field private cT:Ljava/io/FileDescriptor;

.field private cU:Landroid/net/dhcp/q;

.field private final cV:Lcom/android/internal/util/StateMachine;

.field private final cW:Lcom/android/internal/util/WakeupMessage;

.field private final cX:Lcom/android/internal/util/WakeupMessage;

.field private final cY:Lcom/android/internal/util/WakeupMessage;

.field private final cZ:Lcom/android/internal/util/WakeupMessage;

.field private dA:Lcom/android/internal/util/State;

.field private final da:Lcom/android/internal/util/WakeupMessage;

.field private final db:Ljava/lang/String;

.field private dc:Z

.field private dd:Landroid/net/util/b;

.field private de:[B

.field private df:Landroid/system/PacketSocketAddress;

.field private dg:I

.field private dh:J

.field private di:Landroid/net/DhcpResults;

.field private dj:J

.field private dk:Landroid/net/DhcpResults;

.field private dl:J

.field private dm:J

.field private dn:Lcom/android/internal/util/State;

.field private do:Lcom/android/internal/util/State;

.field private dp:Lcom/android/internal/util/State;

.field private dq:Lcom/android/internal/util/State;

.field private dr:Lcom/android/internal/util/State;

.field private ds:Lcom/android/internal/util/State;

.field private dt:Lcom/android/internal/util/State;

.field private du:Lcom/android/internal/util/State;

.field private dv:Lcom/android/internal/util/State;

.field private dw:Lcom/android/internal/util/State;

.field private dx:Lcom/android/internal/util/State;

.field private dy:Lcom/android/internal/util/State;

.field private dz:Lcom/android/internal/util/State;

.field private final mContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Class;

    const-class v1, Landroid/net/dhcp/b;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sput-object v0, Landroid/net/dhcp/b;->sMessageClasses:[Ljava/lang/Class;

    invoke-static {v0}, Lcom/android/internal/util/MessageUtils;->findMessageNames([Ljava/lang/Class;)Landroid/util/SparseArray;

    move-result-object v0

    sput-object v0, Landroid/net/dhcp/b;->cP:Landroid/util/SparseArray;

    const/16 v0, 0xa

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Landroid/net/dhcp/b;->cQ:[B

    return-void

    :array_0
    .array-data 1
        0x1t
        0x3t
        0x6t
        0xft
        0x1at
        0x1ct
        0x33t
        0x3at
        0x3bt
        0x2bt
    .end array-data
.end method

.method private constructor <init>(Landroid/content/Context;Lcom/android/internal/util/StateMachine;Ljava/lang/String;)V
    .locals 2

    const-string v0, "DhcpClient"

    invoke-virtual {p2}, Lcom/android/internal/util/StateMachine;->getHandler()Landroid/os/Handler;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/android/internal/util/StateMachine;-><init>(Ljava/lang/String;Landroid/os/Handler;)V

    new-instance v0, Landroid/net/metrics/IpConnectivityLog;

    invoke-direct {v0}, Landroid/net/metrics/IpConnectivityLog;-><init>()V

    iput-object v0, p0, Landroid/net/dhcp/b;->ay:Landroid/net/metrics/IpConnectivityLog;

    new-instance v0, Landroid/net/dhcp/r;

    invoke-direct {v0, p0}, Landroid/net/dhcp/r;-><init>(Landroid/net/dhcp/b;)V

    iput-object v0, p0, Landroid/net/dhcp/b;->dn:Lcom/android/internal/util/State;

    new-instance v0, Landroid/net/dhcp/n;

    invoke-direct {v0, p0}, Landroid/net/dhcp/n;-><init>(Landroid/net/dhcp/b;)V

    iput-object v0, p0, Landroid/net/dhcp/b;->do:Lcom/android/internal/util/State;

    new-instance v0, Landroid/net/dhcp/g;

    invoke-direct {v0, p0}, Landroid/net/dhcp/g;-><init>(Landroid/net/dhcp/b;)V

    iput-object v0, p0, Landroid/net/dhcp/b;->dp:Lcom/android/internal/util/State;

    new-instance v0, Landroid/net/dhcp/m;

    invoke-direct {v0, p0}, Landroid/net/dhcp/m;-><init>(Landroid/net/dhcp/b;)V

    iput-object v0, p0, Landroid/net/dhcp/b;->dq:Lcom/android/internal/util/State;

    new-instance v0, Landroid/net/dhcp/l;

    invoke-direct {v0, p0}, Landroid/net/dhcp/l;-><init>(Landroid/net/dhcp/b;)V

    iput-object v0, p0, Landroid/net/dhcp/b;->dr:Lcom/android/internal/util/State;

    new-instance v0, Landroid/net/dhcp/e;

    invoke-direct {v0, p0}, Landroid/net/dhcp/e;-><init>(Landroid/net/dhcp/b;)V

    iput-object v0, p0, Landroid/net/dhcp/b;->ds:Lcom/android/internal/util/State;

    new-instance v0, Landroid/net/dhcp/c;

    invoke-direct {v0, p0}, Landroid/net/dhcp/c;-><init>(Landroid/net/dhcp/b;)V

    iput-object v0, p0, Landroid/net/dhcp/b;->dt:Lcom/android/internal/util/State;

    new-instance v0, Landroid/net/dhcp/d;

    invoke-direct {v0, p0}, Landroid/net/dhcp/d;-><init>(Landroid/net/dhcp/b;)V

    iput-object v0, p0, Landroid/net/dhcp/b;->du:Lcom/android/internal/util/State;

    new-instance v0, Landroid/net/dhcp/k;

    invoke-direct {v0, p0}, Landroid/net/dhcp/k;-><init>(Landroid/net/dhcp/b;)V

    iput-object v0, p0, Landroid/net/dhcp/b;->dv:Lcom/android/internal/util/State;

    new-instance v0, Landroid/net/dhcp/i;

    invoke-direct {v0, p0}, Landroid/net/dhcp/i;-><init>(Landroid/net/dhcp/b;)V

    iput-object v0, p0, Landroid/net/dhcp/b;->dw:Lcom/android/internal/util/State;

    new-instance v0, Landroid/net/dhcp/f;

    invoke-direct {v0, p0}, Landroid/net/dhcp/f;-><init>(Landroid/net/dhcp/b;)V

    iput-object v0, p0, Landroid/net/dhcp/b;->dx:Lcom/android/internal/util/State;

    new-instance v0, Landroid/net/dhcp/j;

    invoke-direct {v0, p0}, Landroid/net/dhcp/j;-><init>(Landroid/net/dhcp/b;)V

    iput-object v0, p0, Landroid/net/dhcp/b;->dy:Lcom/android/internal/util/State;

    new-instance v0, Landroid/net/dhcp/u;

    iget-object v1, p0, Landroid/net/dhcp/b;->dp:Lcom/android/internal/util/State;

    invoke-direct {v0, p0, v1}, Landroid/net/dhcp/u;-><init>(Landroid/net/dhcp/b;Lcom/android/internal/util/State;)V

    iput-object v0, p0, Landroid/net/dhcp/b;->dz:Lcom/android/internal/util/State;

    new-instance v0, Landroid/net/dhcp/t;

    iget-object v1, p0, Landroid/net/dhcp/b;->dv:Lcom/android/internal/util/State;

    invoke-direct {v0, p0, v1}, Landroid/net/dhcp/t;-><init>(Landroid/net/dhcp/b;Lcom/android/internal/util/State;)V

    iput-object v0, p0, Landroid/net/dhcp/b;->dA:Lcom/android/internal/util/State;

    iput-object p1, p0, Landroid/net/dhcp/b;->mContext:Landroid/content/Context;

    iput-object p2, p0, Landroid/net/dhcp/b;->cV:Lcom/android/internal/util/StateMachine;

    iput-object p3, p0, Landroid/net/dhcp/b;->db:Ljava/lang/String;

    iget-object p1, p0, Landroid/net/dhcp/b;->dn:Lcom/android/internal/util/State;

    invoke-virtual {p0, p1}, Landroid/net/dhcp/b;->addState(Lcom/android/internal/util/State;)V

    iget-object p1, p0, Landroid/net/dhcp/b;->do:Lcom/android/internal/util/State;

    invoke-virtual {p0, p1}, Landroid/net/dhcp/b;->addState(Lcom/android/internal/util/State;)V

    iget-object p1, p0, Landroid/net/dhcp/b;->dp:Lcom/android/internal/util/State;

    iget-object p2, p0, Landroid/net/dhcp/b;->do:Lcom/android/internal/util/State;

    invoke-virtual {p0, p1, p2}, Landroid/net/dhcp/b;->addState(Lcom/android/internal/util/State;Lcom/android/internal/util/State;)V

    iget-object p1, p0, Landroid/net/dhcp/b;->dz:Lcom/android/internal/util/State;

    iget-object p2, p0, Landroid/net/dhcp/b;->do:Lcom/android/internal/util/State;

    invoke-virtual {p0, p1, p2}, Landroid/net/dhcp/b;->addState(Lcom/android/internal/util/State;Lcom/android/internal/util/State;)V

    iget-object p1, p0, Landroid/net/dhcp/b;->dq:Lcom/android/internal/util/State;

    iget-object p2, p0, Landroid/net/dhcp/b;->do:Lcom/android/internal/util/State;

    invoke-virtual {p0, p1, p2}, Landroid/net/dhcp/b;->addState(Lcom/android/internal/util/State;Lcom/android/internal/util/State;)V

    iget-object p1, p0, Landroid/net/dhcp/b;->dr:Lcom/android/internal/util/State;

    iget-object p2, p0, Landroid/net/dhcp/b;->do:Lcom/android/internal/util/State;

    invoke-virtual {p0, p1, p2}, Landroid/net/dhcp/b;->addState(Lcom/android/internal/util/State;Lcom/android/internal/util/State;)V

    iget-object p1, p0, Landroid/net/dhcp/b;->ds:Lcom/android/internal/util/State;

    iget-object p2, p0, Landroid/net/dhcp/b;->do:Lcom/android/internal/util/State;

    invoke-virtual {p0, p1, p2}, Landroid/net/dhcp/b;->addState(Lcom/android/internal/util/State;Lcom/android/internal/util/State;)V

    iget-object p1, p0, Landroid/net/dhcp/b;->dt:Lcom/android/internal/util/State;

    iget-object p2, p0, Landroid/net/dhcp/b;->ds:Lcom/android/internal/util/State;

    invoke-virtual {p0, p1, p2}, Landroid/net/dhcp/b;->addState(Lcom/android/internal/util/State;Lcom/android/internal/util/State;)V

    iget-object p1, p0, Landroid/net/dhcp/b;->du:Lcom/android/internal/util/State;

    iget-object p2, p0, Landroid/net/dhcp/b;->ds:Lcom/android/internal/util/State;

    invoke-virtual {p0, p1, p2}, Landroid/net/dhcp/b;->addState(Lcom/android/internal/util/State;Lcom/android/internal/util/State;)V

    iget-object p1, p0, Landroid/net/dhcp/b;->dA:Lcom/android/internal/util/State;

    iget-object p2, p0, Landroid/net/dhcp/b;->ds:Lcom/android/internal/util/State;

    invoke-virtual {p0, p1, p2}, Landroid/net/dhcp/b;->addState(Lcom/android/internal/util/State;Lcom/android/internal/util/State;)V

    iget-object p1, p0, Landroid/net/dhcp/b;->dv:Lcom/android/internal/util/State;

    iget-object p2, p0, Landroid/net/dhcp/b;->ds:Lcom/android/internal/util/State;

    invoke-virtual {p0, p1, p2}, Landroid/net/dhcp/b;->addState(Lcom/android/internal/util/State;Lcom/android/internal/util/State;)V

    iget-object p1, p0, Landroid/net/dhcp/b;->dw:Lcom/android/internal/util/State;

    iget-object p2, p0, Landroid/net/dhcp/b;->ds:Lcom/android/internal/util/State;

    invoke-virtual {p0, p1, p2}, Landroid/net/dhcp/b;->addState(Lcom/android/internal/util/State;Lcom/android/internal/util/State;)V

    iget-object p1, p0, Landroid/net/dhcp/b;->dx:Lcom/android/internal/util/State;

    iget-object p2, p0, Landroid/net/dhcp/b;->do:Lcom/android/internal/util/State;

    invoke-virtual {p0, p1, p2}, Landroid/net/dhcp/b;->addState(Lcom/android/internal/util/State;Lcom/android/internal/util/State;)V

    iget-object p1, p0, Landroid/net/dhcp/b;->dy:Lcom/android/internal/util/State;

    iget-object p2, p0, Landroid/net/dhcp/b;->do:Lcom/android/internal/util/State;

    invoke-virtual {p0, p1, p2}, Landroid/net/dhcp/b;->addState(Lcom/android/internal/util/State;Lcom/android/internal/util/State;)V

    iget-object p1, p0, Landroid/net/dhcp/b;->dn:Lcom/android/internal/util/State;

    invoke-virtual {p0, p1}, Landroid/net/dhcp/b;->setInitialState(Lcom/android/internal/util/State;)V

    new-instance p1, Ljava/util/Random;

    invoke-direct {p1}, Ljava/util/Random;-><init>()V

    iput-object p1, p0, Landroid/net/dhcp/b;->cR:Ljava/util/Random;

    const-string p1, "KICK"

    const p2, 0x30065

    invoke-direct {p0, p1, p2}, Landroid/net/dhcp/b;->a(Ljava/lang/String;I)Lcom/android/internal/util/WakeupMessage;

    move-result-object p1

    iput-object p1, p0, Landroid/net/dhcp/b;->cW:Lcom/android/internal/util/WakeupMessage;

    const-string p1, "TIMEOUT"

    const p2, 0x30067

    invoke-direct {p0, p1, p2}, Landroid/net/dhcp/b;->a(Ljava/lang/String;I)Lcom/android/internal/util/WakeupMessage;

    move-result-object p1

    iput-object p1, p0, Landroid/net/dhcp/b;->cX:Lcom/android/internal/util/WakeupMessage;

    const-string p1, "RENEW"

    const p2, 0x30068

    invoke-direct {p0, p1, p2}, Landroid/net/dhcp/b;->a(Ljava/lang/String;I)Lcom/android/internal/util/WakeupMessage;

    move-result-object p1

    iput-object p1, p0, Landroid/net/dhcp/b;->cY:Lcom/android/internal/util/WakeupMessage;

    const-string p1, "REBIND"

    const p2, 0x30069

    invoke-direct {p0, p1, p2}, Landroid/net/dhcp/b;->a(Ljava/lang/String;I)Lcom/android/internal/util/WakeupMessage;

    move-result-object p1

    iput-object p1, p0, Landroid/net/dhcp/b;->cZ:Lcom/android/internal/util/WakeupMessage;

    const-string p1, "EXPIRY"

    const p2, 0x3006a

    invoke-direct {p0, p1, p2}, Landroid/net/dhcp/b;->a(Ljava/lang/String;I)Lcom/android/internal/util/WakeupMessage;

    move-result-object p1

    iput-object p1, p0, Landroid/net/dhcp/b;->da:Lcom/android/internal/util/WakeupMessage;

    return-void
.end method

.method static synthetic A(Landroid/net/dhcp/b;)Lcom/android/internal/util/State;
    .locals 0

    iget-object p0, p0, Landroid/net/dhcp/b;->dA:Lcom/android/internal/util/State;

    return-object p0
.end method

.method static synthetic B(Landroid/net/dhcp/b;)Lcom/android/internal/util/State;
    .locals 0

    iget-object p0, p0, Landroid/net/dhcp/b;->dv:Lcom/android/internal/util/State;

    return-object p0
.end method

.method static synthetic C(Landroid/net/dhcp/b;)J
    .locals 2

    iget-wide v0, p0, Landroid/net/dhcp/b;->dm:J

    return-wide v0
.end method

.method static synthetic D(Landroid/net/dhcp/b;)J
    .locals 2

    iget-wide v0, p0, Landroid/net/dhcp/b;->dl:J

    return-wide v0
.end method

.method static synthetic E(Landroid/net/dhcp/b;)Lcom/android/internal/util/State;
    .locals 0

    iget-object p0, p0, Landroid/net/dhcp/b;->dw:Lcom/android/internal/util/State;

    return-object p0
.end method

.method static synthetic F(Landroid/net/dhcp/b;)Ljava/io/FileDescriptor;
    .locals 0

    iget-object p0, p0, Landroid/net/dhcp/b;->cT:Ljava/io/FileDescriptor;

    return-object p0
.end method

.method static synthetic G(Landroid/net/dhcp/b;)Z
    .locals 0

    invoke-direct {p0}, Landroid/net/dhcp/b;->L()Z

    move-result p0

    return p0
.end method

.method private K()Z
    .locals 3

    :try_start_0
    sget v0, Landroid/system/OsConstants;->AF_PACKET:I

    sget v1, Landroid/system/OsConstants;->SOCK_RAW:I

    sget v2, Landroid/system/OsConstants;->ETH_P_IP:I

    invoke-static {v0, v1, v2}, Landroid/system/Os;->socket(III)Ljava/io/FileDescriptor;

    move-result-object v0

    iput-object v0, p0, Landroid/net/dhcp/b;->cS:Ljava/io/FileDescriptor;

    new-instance v0, Landroid/system/PacketSocketAddress;

    sget v1, Landroid/system/OsConstants;->ETH_P_IP:I

    int-to-short v1, v1

    iget-object v2, p0, Landroid/net/dhcp/b;->dd:Landroid/net/util/b;

    iget v2, v2, Landroid/net/util/b;->index:I

    invoke-direct {v0, v1, v2}, Landroid/system/PacketSocketAddress;-><init>(SI)V

    iget-object v1, p0, Landroid/net/dhcp/b;->cS:Ljava/io/FileDescriptor;

    invoke-static {v1, v0}, Landroid/system/Os;->bind(Ljava/io/FileDescriptor;Ljava/net/SocketAddress;)V

    iget-object v0, p0, Landroid/net/dhcp/b;->cS:Ljava/io/FileDescriptor;

    invoke-static {v0}, Landroid/net/NetworkUtils;->attachDhcpFilter(Ljava/io/FileDescriptor;)V
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/system/ErrnoException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v0, 0x1

    return v0

    :catch_0
    move-exception v0

    const-string v1, "DhcpClient"

    const-string v2, "Error creating packet socket"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 v0, 0x0

    return v0
.end method

.method private L()Z
    .locals 7

    const/16 v0, -0xc0

    invoke-static {v0}, Landroid/net/TrafficStats;->getAndSetThreadStatsTag(I)I

    move-result v0

    const/4 v1, 0x0

    :try_start_0
    sget v2, Landroid/system/OsConstants;->AF_INET:I

    sget v3, Landroid/system/OsConstants;->SOCK_DGRAM:I

    sget v4, Landroid/system/OsConstants;->IPPROTO_UDP:I

    invoke-static {v2, v3, v4}, Landroid/system/Os;->socket(III)Ljava/io/FileDescriptor;

    move-result-object v2

    iput-object v2, p0, Landroid/net/dhcp/b;->cT:Ljava/io/FileDescriptor;

    iget-object v2, p0, Landroid/net/dhcp/b;->cT:Ljava/io/FileDescriptor;

    sget v3, Landroid/system/OsConstants;->SOL_SOCKET:I

    sget v4, Landroid/system/OsConstants;->SO_REUSEADDR:I

    const/4 v5, 0x1

    invoke-static {v2, v3, v4, v5}, Landroid/system/Os;->setsockoptInt(Ljava/io/FileDescriptor;III)V

    iget-object v2, p0, Landroid/net/dhcp/b;->cT:Ljava/io/FileDescriptor;

    sget v3, Landroid/system/OsConstants;->SOL_SOCKET:I

    sget v4, Landroid/system/OsConstants;->SO_BINDTODEVICE:I

    iget-object v6, p0, Landroid/net/dhcp/b;->db:Ljava/lang/String;

    invoke-static {v2, v3, v4, v6}, Landroid/system/Os;->setsockoptIfreq(Ljava/io/FileDescriptor;IILjava/lang/String;)V

    iget-object v2, p0, Landroid/net/dhcp/b;->cT:Ljava/io/FileDescriptor;

    sget v3, Landroid/system/OsConstants;->SOL_SOCKET:I

    sget v4, Landroid/system/OsConstants;->SO_BROADCAST:I

    invoke-static {v2, v3, v4, v5}, Landroid/system/Os;->setsockoptInt(Ljava/io/FileDescriptor;III)V

    iget-object v2, p0, Landroid/net/dhcp/b;->cT:Ljava/io/FileDescriptor;

    sget v3, Landroid/system/OsConstants;->SOL_SOCKET:I

    sget v4, Landroid/system/OsConstants;->SO_RCVBUF:I

    invoke-static {v2, v3, v4, v1}, Landroid/system/Os;->setsockoptInt(Ljava/io/FileDescriptor;III)V

    iget-object v2, p0, Landroid/net/dhcp/b;->cT:Ljava/io/FileDescriptor;

    sget-object v3, Ljava/net/Inet4Address;->ANY:Ljava/net/InetAddress;

    const/16 v4, 0x44

    invoke-static {v2, v3, v4}, Landroid/system/Os;->bind(Ljava/io/FileDescriptor;Ljava/net/InetAddress;I)V

    iget-object v2, p0, Landroid/net/dhcp/b;->cT:Ljava/io/FileDescriptor;

    invoke-static {v2}, Landroid/net/NetworkUtils;->protectFromVpn(Ljava/io/FileDescriptor;)Z
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/system/ErrnoException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {v0}, Landroid/net/TrafficStats;->setThreadStatsTag(I)V

    return v5

    :catchall_0
    move-exception v1

    goto :goto_0

    :catch_0
    move-exception v2

    :try_start_1
    const-string v3, "DhcpClient"

    const-string v4, "Error creating UDP socket"

    invoke-static {v3, v4, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-static {v0}, Landroid/net/TrafficStats;->setThreadStatsTag(I)V

    return v1

    :goto_0
    invoke-static {v0}, Landroid/net/TrafficStats;->setThreadStatsTag(I)V

    throw v1
.end method

.method private M()S
    .locals 4

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-wide v2, p0, Landroid/net/dhcp/b;->dh:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    long-to-int v0, v0

    int-to-short v0, v0

    return v0
.end method

.method static synthetic N()Landroid/util/SparseArray;
    .locals 1

    sget-object v0, Landroid/net/dhcp/b;->cP:Landroid/util/SparseArray;

    return-object v0
.end method

.method static synthetic a(Landroid/net/dhcp/b;J)J
    .locals 0

    iput-wide p1, p0, Landroid/net/dhcp/b;->dl:J

    return-wide p1
.end method

.method static synthetic a(Landroid/net/dhcp/b;Landroid/net/DhcpResults;)Landroid/net/DhcpResults;
    .locals 0

    iput-object p1, p0, Landroid/net/dhcp/b;->dk:Landroid/net/DhcpResults;

    return-object p1
.end method

.method public static a(Landroid/content/Context;Lcom/android/internal/util/StateMachine;Landroid/net/util/b;)Landroid/net/dhcp/b;
    .locals 8

    :try_start_0
    new-instance v0, Ldalvik/system/PathClassLoader;

    const-string v1, "/system/framework/mediatek-framework-net.jar"

    invoke-virtual {p0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ldalvik/system/PathClassLoader;-><init>(Ljava/lang/String;Ljava/lang/ClassLoader;)V

    const-string v1, "com.mediatek.net.dhcp.MtkDhcpClient"

    invoke-virtual {v0, v1}, Ldalvik/system/PathClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "makeDhcpClient"

    const/4 v2, 0x3

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Landroid/content/Context;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const-class v4, Lcom/android/internal/util/StateMachine;

    const/4 v6, 0x1

    aput-object v4, v3, v6

    const-class v4, Landroid/net/util/b;

    const/4 v7, 0x2

    aput-object v4, v3, v7

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p0, v2, v5

    aput-object p1, v2, v6

    aput-object p2, v2, v7

    invoke-virtual {v1, v0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/dhcp/b;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    const-string v1, "DhcpClient"

    const-string v2, "No MtkDhcpClient! Used AOSP for instead! %s"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    new-instance v0, Landroid/net/dhcp/b;

    iget-object v1, p2, Landroid/net/util/b;->name:Ljava/lang/String;

    invoke-direct {v0, p0, p1, v1}, Landroid/net/dhcp/b;-><init>(Landroid/content/Context;Lcom/android/internal/util/StateMachine;Ljava/lang/String;)V

    iput-object p2, v0, Landroid/net/dhcp/b;->dd:Landroid/net/util/b;

    invoke-virtual {v0}, Landroid/net/dhcp/b;->start()V

    return-object v0
.end method

.method static synthetic a(Landroid/net/dhcp/b;Landroid/net/dhcp/q;)Landroid/net/dhcp/q;
    .locals 0

    iput-object p1, p0, Landroid/net/dhcp/b;->cU:Landroid/net/dhcp/q;

    return-object p1
.end method

.method private a(Ljava/lang/String;I)Lcom/android/internal/util/WakeupMessage;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-class v1, Landroid/net/dhcp/b;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroid/net/dhcp/b;->db:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance v0, Lcom/android/internal/util/WakeupMessage;

    iget-object v1, p0, Landroid/net/dhcp/b;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/net/dhcp/b;->getHandler()Landroid/os/Handler;

    move-result-object v2

    invoke-direct {v0, v1, v2, p1, p2}, Lcom/android/internal/util/WakeupMessage;-><init>(Landroid/content/Context;Landroid/os/Handler;Ljava/lang/String;I)V

    return-object v0
.end method

.method static synthetic a(Landroid/net/dhcp/b;)V
    .locals 1

    iget-object v0, p0, Landroid/net/dhcp/b;->cT:Ljava/io/FileDescriptor;

    :try_start_0
    invoke-static {v0}, Llibcore/io/IoBridge;->closeAndSignalBlockedThreads(Ljava/io/FileDescriptor;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    :goto_0
    iget-object p0, p0, Landroid/net/dhcp/b;->cS:Ljava/io/FileDescriptor;

    :try_start_1
    invoke-static {p0}, Llibcore/io/IoBridge;->closeAndSignalBlockedThreads(Ljava/io/FileDescriptor;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    return-void

    :catch_1
    move-exception p0

    return-void
.end method

.method static synthetic a(Landroid/net/dhcp/b;I)V
    .locals 2

    iget-object v0, p0, Landroid/net/dhcp/b;->ay:Landroid/net/metrics/IpConnectivityLog;

    iget-object p0, p0, Landroid/net/dhcp/b;->db:Ljava/lang/String;

    new-instance v1, Landroid/net/metrics/DhcpErrorEvent;

    invoke-direct {v1, p1}, Landroid/net/metrics/DhcpErrorEvent;-><init>(I)V

    invoke-virtual {v0, p0, v1}, Landroid/net/metrics/IpConnectivityLog;->log(Ljava/lang/String;Landroid/os/Parcelable;)Z

    return-void
.end method

.method static synthetic a(Landroid/net/dhcp/b;Landroid/net/DhcpResults;Ljava/lang/String;)V
    .locals 2

    iput-object p1, p0, Landroid/net/dhcp/b;->di:Landroid/net/DhcpResults;

    const/4 p1, 0x0

    iput-object p1, p0, Landroid/net/dhcp/b;->dk:Landroid/net/DhcpResults;

    const-string p1, "DhcpClient"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " lease: "

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p2, p0, Landroid/net/dhcp/b;->di:Landroid/net/DhcpResults;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Landroid/net/dhcp/b;->cV:Lcom/android/internal/util/StateMachine;

    new-instance p2, Landroid/net/DhcpResults;

    iget-object p0, p0, Landroid/net/dhcp/b;->di:Landroid/net/DhcpResults;

    invoke-direct {p2, p0}, Landroid/net/DhcpResults;-><init>(Landroid/net/DhcpResults;)V

    const p0, 0x30004

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p1, p0, v0, v1, p2}, Lcom/android/internal/util/StateMachine;->sendMessage(IIILjava/lang/Object;)V

    return-void
.end method

.method static synthetic a(Landroid/net/dhcp/b;Ljava/lang/String;I)V
    .locals 2

    iget-object v0, p0, Landroid/net/dhcp/b;->ay:Landroid/net/metrics/IpConnectivityLog;

    iget-object p0, p0, Landroid/net/dhcp/b;->db:Ljava/lang/String;

    new-instance v1, Landroid/net/metrics/DhcpClientEvent;

    invoke-direct {v1, p1, p2}, Landroid/net/metrics/DhcpClientEvent;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v0, p0, v1}, Landroid/net/metrics/IpConnectivityLog;->log(Ljava/lang/String;Landroid/os/Parcelable;)Z

    return-void
.end method

.method static synthetic a(Ljava/io/FileDescriptor;)V
    .locals 0

    :try_start_0
    invoke-static {p0}, Llibcore/io/IoBridge;->closeAndSignalBlockedThreads(Ljava/io/FileDescriptor;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    return-void
.end method

.method static synthetic a(Landroid/net/dhcp/b;Ljava/net/Inet4Address;)Z
    .locals 0

    invoke-direct {p0, p1}, Landroid/net/dhcp/b;->a(Ljava/net/Inet4Address;)Z

    move-result p0

    return p0
.end method

.method static synthetic a(Landroid/net/dhcp/b;Ljava/net/Inet4Address;Ljava/net/Inet4Address;Ljava/net/Inet4Address;Ljava/net/Inet4Address;)Z
    .locals 9

    sget-object v0, Landroid/net/dhcp/DhcpPacket;->dH:Ljava/net/Inet4Address;

    invoke-virtual {v0, p1}, Ljava/net/Inet4Address;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    :goto_0
    iget v2, p0, Landroid/net/dhcp/b;->dg:I

    invoke-direct {p0}, Landroid/net/dhcp/b;->M()S

    move-result v3

    iget-object v5, p0, Landroid/net/dhcp/b;->de:[B

    sget-object v8, Landroid/net/dhcp/b;->cQ:[B

    move v1, v0

    move-object v4, p1

    move-object v6, p2

    move-object v7, p3

    invoke-static/range {v1 .. v8}, Landroid/net/dhcp/DhcpPacket;->a(IISLjava/net/Inet4Address;[BLjava/net/Inet4Address;Ljava/net/Inet4Address;[B)Ljava/nio/ByteBuffer;

    move-result-object v1

    if-eqz p3, :cond_1

    invoke-virtual {p3}, Ljava/net/Inet4Address;->getHostAddress()Ljava/lang/String;

    move-result-object p3

    goto :goto_1

    :cond_1
    const/4 p3, 0x0

    :goto_1
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "DHCPREQUEST ciaddr="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/net/Inet4Address;->getHostAddress()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " request="

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/net/Inet4Address;->getHostAddress()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " serverid="

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, v1, p1, v0, p4}, Landroid/net/dhcp/b;->a(Ljava/nio/ByteBuffer;Ljava/lang/String;ILjava/net/Inet4Address;)Z

    move-result p0

    return p0
.end method

.method private a(Ljava/net/Inet4Address;)Z
    .locals 2

    :try_start_0
    iget-object v0, p0, Landroid/net/dhcp/b;->cT:Ljava/io/FileDescriptor;

    const/16 v1, 0x43

    invoke-static {v0, p1, v1}, Landroid/system/Os;->connect(Ljava/io/FileDescriptor;Ljava/net/InetAddress;I)V
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/system/ErrnoException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 p1, 0x1

    return p1

    :catch_0
    move-exception p1

    const-string v0, "DhcpClient"

    const-string v1, "Error connecting UDP socket"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 p1, 0x0

    return p1
.end method

.method private a(Ljava/nio/ByteBuffer;Ljava/lang/String;ILjava/net/Inet4Address;)Z
    .locals 8

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-nez p3, :cond_0

    :try_start_0
    const-string p3, "DhcpClient"

    new-instance p4, Ljava/lang/StringBuilder;

    const-string v2, "Broadcasting "

    invoke-direct {p4, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p3, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v2, p0, Landroid/net/dhcp/b;->cS:Ljava/io/FileDescriptor;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v5

    const/4 v6, 0x0

    iget-object v7, p0, Landroid/net/dhcp/b;->df:Landroid/system/PacketSocketAddress;

    invoke-static/range {v2 .. v7}, Landroid/system/Os;->sendto(Ljava/io/FileDescriptor;[BIIILjava/net/SocketAddress;)I

    return v0

    :catch_0
    move-exception p1

    goto :goto_0

    :cond_0
    const/4 v2, 0x2

    if-ne p3, v2, :cond_1

    sget-object p3, Landroid/net/dhcp/DhcpPacket;->dI:Ljava/net/Inet4Address;

    invoke-virtual {p4, p3}, Ljava/net/Inet4Address;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_1

    const-string p3, "DhcpClient"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Broadcasting "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p3, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p2, p0, Landroid/net/dhcp/b;->cT:Ljava/io/FileDescriptor;

    const/16 p3, 0x43

    invoke-static {p2, p1, v1, p4, p3}, Landroid/system/Os;->sendto(Ljava/io/FileDescriptor;Ljava/nio/ByteBuffer;ILjava/net/InetAddress;I)I

    return v0

    :cond_1
    const-string p3, "DhcpClient"

    const-string p4, "Unicasting %s to %s"

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p2, v2, v1

    iget-object p2, p0, Landroid/net/dhcp/b;->cT:Ljava/io/FileDescriptor;

    invoke-static {p2}, Landroid/system/Os;->getpeername(Ljava/io/FileDescriptor;)Ljava/net/SocketAddress;

    move-result-object p2

    aput-object p2, v2, v0

    invoke-static {p4, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p3, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p2, p0, Landroid/net/dhcp/b;->cT:Ljava/io/FileDescriptor;

    invoke-static {p2, p1}, Landroid/system/Os;->write(Ljava/io/FileDescriptor;Ljava/nio/ByteBuffer;)I
    :try_end_0
    .catch Landroid/system/ErrnoException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :goto_0
    const-string p2, "DhcpClient"

    const-string p3, "Can\'t send packet: "

    invoke-static {p2, p3, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return v1
.end method

.method static synthetic b(Landroid/net/dhcp/b;J)J
    .locals 0

    iput-wide p1, p0, Landroid/net/dhcp/b;->dm:J

    return-wide p1
.end method

.method static synthetic b(Landroid/net/dhcp/b;)Ljava/io/FileDescriptor;
    .locals 0

    iget-object p0, p0, Landroid/net/dhcp/b;->cS:Ljava/io/FileDescriptor;

    return-object p0
.end method

.method static synthetic c(Landroid/net/dhcp/b;)Lcom/android/internal/util/StateMachine;
    .locals 0

    iget-object p0, p0, Landroid/net/dhcp/b;->cV:Lcom/android/internal/util/StateMachine;

    return-object p0
.end method

.method static synthetic d(Landroid/net/dhcp/b;)Z
    .locals 0

    iget-boolean p0, p0, Landroid/net/dhcp/b;->dc:Z

    return p0
.end method

.method static synthetic e(Landroid/net/dhcp/b;)Lcom/android/internal/util/State;
    .locals 0

    iget-object p0, p0, Landroid/net/dhcp/b;->dz:Lcom/android/internal/util/State;

    return-object p0
.end method

.method static synthetic f(Landroid/net/dhcp/b;)Lcom/android/internal/util/State;
    .locals 0

    iget-object p0, p0, Landroid/net/dhcp/b;->dp:Lcom/android/internal/util/State;

    return-object p0
.end method

.method static synthetic g(Landroid/net/dhcp/b;)V
    .locals 3

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/net/dhcp/b;->di:Landroid/net/DhcpResults;

    const-wide/16 v1, 0x0

    iput-wide v1, p0, Landroid/net/dhcp/b;->dj:J

    iput-object v0, p0, Landroid/net/dhcp/b;->dk:Landroid/net/DhcpResults;

    return-void
.end method

.method static synthetic h(Landroid/net/dhcp/b;)Z
    .locals 3

    iget-object v0, p0, Landroid/net/dhcp/b;->dd:Landroid/net/util/b;

    if-nez v0, :cond_0

    iget-object v0, p0, Landroid/net/dhcp/b;->db:Ljava/lang/String;

    invoke-static {v0}, Landroid/net/util/b;->m(Ljava/lang/String;)Landroid/net/util/b;

    move-result-object v0

    iput-object v0, p0, Landroid/net/dhcp/b;->dd:Landroid/net/util/b;

    :cond_0
    iget-object v0, p0, Landroid/net/dhcp/b;->dd:Landroid/net/util/b;

    if-nez v0, :cond_1

    const-string v0, "DhcpClient"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Can\'t determine InterfaceParams for "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Landroid/net/dhcp/b;->db:Ljava/lang/String;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p0, 0x0

    return p0

    :cond_1
    iget-object v0, p0, Landroid/net/dhcp/b;->dd:Landroid/net/util/b;

    iget-object v0, v0, Landroid/net/util/b;->fx:Landroid/net/MacAddress;

    invoke-virtual {v0}, Landroid/net/MacAddress;->toByteArray()[B

    move-result-object v0

    iput-object v0, p0, Landroid/net/dhcp/b;->de:[B

    new-instance v0, Landroid/system/PacketSocketAddress;

    iget-object v1, p0, Landroid/net/dhcp/b;->dd:Landroid/net/util/b;

    iget v1, v1, Landroid/net/util/b;->index:I

    sget-object v2, Landroid/net/dhcp/DhcpPacket;->dJ:[B

    invoke-direct {v0, v1, v2}, Landroid/system/PacketSocketAddress;-><init>(I[B)V

    iput-object v0, p0, Landroid/net/dhcp/b;->df:Landroid/system/PacketSocketAddress;

    const/4 p0, 0x1

    return p0
.end method

.method static synthetic i(Landroid/net/dhcp/b;)Z
    .locals 1

    invoke-direct {p0}, Landroid/net/dhcp/b;->K()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Landroid/net/dhcp/b;->L()Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method static synthetic j(Landroid/net/dhcp/b;)Landroid/net/dhcp/q;
    .locals 0

    iget-object p0, p0, Landroid/net/dhcp/b;->cU:Landroid/net/dhcp/q;

    return-object p0
.end method

.method static synthetic k(Landroid/net/dhcp/b;)V
    .locals 4

    iget-object p0, p0, Landroid/net/dhcp/b;->cV:Lcom/android/internal/util/StateMachine;

    const v0, 0x30004

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/android/internal/util/StateMachine;->sendMessage(IIILjava/lang/Object;)V

    return-void
.end method

.method static synthetic l(Landroid/net/dhcp/b;)Lcom/android/internal/util/State;
    .locals 0

    iget-object p0, p0, Landroid/net/dhcp/b;->dn:Lcom/android/internal/util/State;

    return-object p0
.end method

.method static synthetic m(Landroid/net/dhcp/b;)Lcom/android/internal/util/WakeupMessage;
    .locals 0

    iget-object p0, p0, Landroid/net/dhcp/b;->cW:Lcom/android/internal/util/WakeupMessage;

    return-object p0
.end method

.method static synthetic n(Landroid/net/dhcp/b;)Lcom/android/internal/util/WakeupMessage;
    .locals 0

    iget-object p0, p0, Landroid/net/dhcp/b;->cX:Lcom/android/internal/util/WakeupMessage;

    return-object p0
.end method

.method static synthetic o(Landroid/net/dhcp/b;)Ljava/util/Random;
    .locals 0

    iget-object p0, p0, Landroid/net/dhcp/b;->cR:Ljava/util/Random;

    return-object p0
.end method

.method static synthetic p(Landroid/net/dhcp/b;)V
    .locals 2

    iget-object v0, p0, Landroid/net/dhcp/b;->cR:Ljava/util/Random;

    invoke-virtual {v0}, Ljava/util/Random;->nextInt()I

    move-result v0

    iput v0, p0, Landroid/net/dhcp/b;->dg:I

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Landroid/net/dhcp/b;->dh:J

    return-void
.end method

.method static synthetic q(Landroid/net/dhcp/b;)Z
    .locals 4

    iget v0, p0, Landroid/net/dhcp/b;->dg:I

    invoke-direct {p0}, Landroid/net/dhcp/b;->M()S

    move-result v1

    iget-object v2, p0, Landroid/net/dhcp/b;->de:[B

    sget-object v3, Landroid/net/dhcp/b;->cQ:[B

    invoke-static {v0, v1, v2, v3}, Landroid/net/dhcp/DhcpPacket;->a(IS[B[B)Ljava/nio/ByteBuffer;

    move-result-object v0

    const-string v1, "DHCPDISCOVER"

    sget-object v2, Landroid/net/dhcp/DhcpPacket;->dI:Ljava/net/Inet4Address;

    const/4 v3, 0x0

    invoke-direct {p0, v0, v1, v3, v2}, Landroid/net/dhcp/b;->a(Ljava/nio/ByteBuffer;Ljava/lang/String;ILjava/net/Inet4Address;)Z

    move-result p0

    return p0
.end method

.method static synthetic r(Landroid/net/dhcp/b;)Landroid/net/DhcpResults;
    .locals 0

    iget-object p0, p0, Landroid/net/dhcp/b;->dk:Landroid/net/DhcpResults;

    return-object p0
.end method

.method static synthetic s(Landroid/net/dhcp/b;)Lcom/android/internal/util/State;
    .locals 0

    iget-object p0, p0, Landroid/net/dhcp/b;->dr:Lcom/android/internal/util/State;

    return-object p0
.end method

.method static synthetic t(Landroid/net/dhcp/b;)Lcom/android/internal/util/State;
    .locals 0

    iget-object p0, p0, Landroid/net/dhcp/b;->dt:Lcom/android/internal/util/State;

    return-object p0
.end method

.method static synthetic u(Landroid/net/dhcp/b;)Lcom/android/internal/util/WakeupMessage;
    .locals 0

    iget-object p0, p0, Landroid/net/dhcp/b;->cY:Lcom/android/internal/util/WakeupMessage;

    return-object p0
.end method

.method static synthetic v(Landroid/net/dhcp/b;)Lcom/android/internal/util/WakeupMessage;
    .locals 0

    iget-object p0, p0, Landroid/net/dhcp/b;->cZ:Lcom/android/internal/util/WakeupMessage;

    return-object p0
.end method

.method static synthetic w(Landroid/net/dhcp/b;)Lcom/android/internal/util/WakeupMessage;
    .locals 0

    iget-object p0, p0, Landroid/net/dhcp/b;->da:Lcom/android/internal/util/WakeupMessage;

    return-object p0
.end method

.method static synthetic x(Landroid/net/dhcp/b;)Landroid/net/DhcpResults;
    .locals 0

    iget-object p0, p0, Landroid/net/dhcp/b;->di:Landroid/net/DhcpResults;

    return-object p0
.end method

.method static synthetic y(Landroid/net/dhcp/b;)Lcom/android/internal/util/State;
    .locals 0

    iget-object p0, p0, Landroid/net/dhcp/b;->du:Lcom/android/internal/util/State;

    return-object p0
.end method

.method static synthetic z(Landroid/net/dhcp/b;)V
    .locals 11

    iget-wide v0, p0, Landroid/net/dhcp/b;->dj:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const-string p0, "DhcpClient"

    const-string v0, "Infinite lease, no timer scheduling needed"

    :goto_0
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-wide v2, p0, Landroid/net/dhcp/b;->dj:J

    sub-long/2addr v2, v0

    const-wide/16 v4, 0x2

    div-long v4, v2, v4

    const-wide/16 v6, 0x7

    mul-long/2addr v6, v2

    const-wide/16 v8, 0x8

    div-long/2addr v6, v8

    iget-object v8, p0, Landroid/net/dhcp/b;->cY:Lcom/android/internal/util/WakeupMessage;

    add-long v9, v0, v4

    invoke-virtual {v8, v9, v10}, Lcom/android/internal/util/WakeupMessage;->schedule(J)V

    iget-object v8, p0, Landroid/net/dhcp/b;->cZ:Lcom/android/internal/util/WakeupMessage;

    add-long v9, v0, v6

    invoke-virtual {v8, v9, v10}, Lcom/android/internal/util/WakeupMessage;->schedule(J)V

    iget-object p0, p0, Landroid/net/dhcp/b;->da:Lcom/android/internal/util/WakeupMessage;

    add-long/2addr v0, v2

    invoke-virtual {p0, v0, v1}, Lcom/android/internal/util/WakeupMessage;->schedule(J)V

    const-string p0, "DhcpClient"

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Scheduling renewal in "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-wide/16 v8, 0x3e8

    div-long/2addr v4, v8

    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, "s"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string p0, "DhcpClient"

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Scheduling rebind in "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    div-long/2addr v6, v8

    invoke-virtual {v0, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, "s"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string p0, "DhcpClient"

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Scheduling expiry in "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    div-long/2addr v2, v8

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, "s"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method


# virtual methods
.method public final J()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/net/dhcp/b;->dc:Z

    return-void
.end method

.method public final a(Landroid/net/dhcp/DhcpPacket;)Z
    .locals 4

    invoke-virtual {p1}, Landroid/net/dhcp/DhcpPacket;->getTransactionId()I

    move-result v0

    iget v1, p0, Landroid/net/dhcp/b;->dg:I

    const/4 v2, 0x0

    if-eq v0, v1, :cond_0

    const-string p1, "DhcpClient"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "Unexpected transaction ID "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ", expected "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Landroid/net/dhcp/b;->dg:I

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v2

    :cond_0
    invoke-virtual {p1}, Landroid/net/dhcp/DhcpPacket;->R()[B

    move-result-object v0

    iget-object v1, p0, Landroid/net/dhcp/b;->de:[B

    invoke-static {v0, v1}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "DhcpClient"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "MAC addr mismatch: got "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/net/dhcp/DhcpPacket;->R()[B

    move-result-object v3

    invoke-static {v3}, Lcom/android/internal/util/HexDump;->toHexString([B)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ", expected "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/net/dhcp/DhcpPacket;->R()[B

    move-result-object p1

    invoke-static {p1}, Lcom/android/internal/util/HexDump;->toHexString([B)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v2

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method public final b(Landroid/net/dhcp/DhcpPacket;)V
    .locals 4

    invoke-virtual {p1}, Landroid/net/dhcp/DhcpPacket;->U()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long p1, v0, v2

    if-lez p1, :cond_0

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    add-long/2addr v2, v0

    :cond_0
    iput-wide v2, p0, Landroid/net/dhcp/b;->dj:J

    return-void
.end method

.method protected onQuitting()V
    .locals 2

    const-string v0, "DhcpClient"

    const-string v1, "onQuitting"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Landroid/net/dhcp/b;->cV:Lcom/android/internal/util/StateMachine;

    const v1, 0x30005

    invoke-virtual {v0, v1}, Lcom/android/internal/util/StateMachine;->sendMessage(I)V

    return-void
.end method
