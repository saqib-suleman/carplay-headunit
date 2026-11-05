.class final enum Landroid/net/apf/ApfFilter$Counter;
.super Ljava/lang/Enum;


# annotations
.annotation build Lcom/android/internal/annotations/VisibleForTesting;
.end annotation


# static fields
.field public static final enum aV:Landroid/net/apf/ApfFilter$Counter;

.field public static final enum aW:Landroid/net/apf/ApfFilter$Counter;

.field public static final enum aX:Landroid/net/apf/ApfFilter$Counter;

.field public static final enum aY:Landroid/net/apf/ApfFilter$Counter;

.field public static final enum aZ:Landroid/net/apf/ApfFilter$Counter;

.field public static final enum ba:Landroid/net/apf/ApfFilter$Counter;

.field public static final enum bb:Landroid/net/apf/ApfFilter$Counter;

.field public static final enum bc:Landroid/net/apf/ApfFilter$Counter;

.field public static final enum bd:Landroid/net/apf/ApfFilter$Counter;

.field public static final enum be:Landroid/net/apf/ApfFilter$Counter;

.field public static final enum bf:Landroid/net/apf/ApfFilter$Counter;

.field public static final enum bg:Landroid/net/apf/ApfFilter$Counter;

.field public static final enum bh:Landroid/net/apf/ApfFilter$Counter;

.field public static final enum bi:Landroid/net/apf/ApfFilter$Counter;

.field public static final enum bj:Landroid/net/apf/ApfFilter$Counter;

.field public static final enum bk:Landroid/net/apf/ApfFilter$Counter;

.field public static final enum bl:Landroid/net/apf/ApfFilter$Counter;

.field public static final enum bm:Landroid/net/apf/ApfFilter$Counter;

.field public static final enum bn:Landroid/net/apf/ApfFilter$Counter;

.field public static final enum bo:Landroid/net/apf/ApfFilter$Counter;

.field public static final enum bp:Landroid/net/apf/ApfFilter$Counter;

.field public static final enum bq:Landroid/net/apf/ApfFilter$Counter;

.field public static final enum br:Landroid/net/apf/ApfFilter$Counter;

.field public static final enum bs:Landroid/net/apf/ApfFilter$Counter;

.field public static final enum bt:Landroid/net/apf/ApfFilter$Counter;

.field public static final enum bu:Landroid/net/apf/ApfFilter$Counter;

.field public static final enum bv:Landroid/net/apf/ApfFilter$Counter;

.field public static final enum bw:Landroid/net/apf/ApfFilter$Counter;

.field private static final synthetic bx:[Landroid/net/apf/ApfFilter$Counter;


# direct methods
.method static constructor <clinit>()V
    .locals 17

    new-instance v0, Landroid/net/apf/ApfFilter$Counter;

    const-string v1, "RESERVED_OOB"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Landroid/net/apf/ApfFilter$Counter;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/net/apf/ApfFilter$Counter;->aV:Landroid/net/apf/ApfFilter$Counter;

    new-instance v0, Landroid/net/apf/ApfFilter$Counter;

    const-string v1, "TOTAL_PACKETS"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Landroid/net/apf/ApfFilter$Counter;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/net/apf/ApfFilter$Counter;->aW:Landroid/net/apf/ApfFilter$Counter;

    new-instance v0, Landroid/net/apf/ApfFilter$Counter;

    const-string v1, "PASSED_ARP"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Landroid/net/apf/ApfFilter$Counter;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/net/apf/ApfFilter$Counter;->aX:Landroid/net/apf/ApfFilter$Counter;

    new-instance v0, Landroid/net/apf/ApfFilter$Counter;

    const-string v1, "PASSED_DHCP"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5}, Landroid/net/apf/ApfFilter$Counter;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/net/apf/ApfFilter$Counter;->aY:Landroid/net/apf/ApfFilter$Counter;

    new-instance v0, Landroid/net/apf/ApfFilter$Counter;

    const-string v1, "PASSED_IPV4"

    const/4 v6, 0x4

    invoke-direct {v0, v1, v6}, Landroid/net/apf/ApfFilter$Counter;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/net/apf/ApfFilter$Counter;->aZ:Landroid/net/apf/ApfFilter$Counter;

    new-instance v0, Landroid/net/apf/ApfFilter$Counter;

    const-string v1, "PASSED_IPV6_NON_ICMP"

    const/4 v7, 0x5

    invoke-direct {v0, v1, v7}, Landroid/net/apf/ApfFilter$Counter;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/net/apf/ApfFilter$Counter;->ba:Landroid/net/apf/ApfFilter$Counter;

    new-instance v0, Landroid/net/apf/ApfFilter$Counter;

    const-string v1, "PASSED_IPV4_UNICAST"

    const/4 v8, 0x6

    invoke-direct {v0, v1, v8}, Landroid/net/apf/ApfFilter$Counter;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/net/apf/ApfFilter$Counter;->bb:Landroid/net/apf/ApfFilter$Counter;

    new-instance v0, Landroid/net/apf/ApfFilter$Counter;

    const-string v1, "PASSED_IPV6_ICMP"

    const/4 v9, 0x7

    invoke-direct {v0, v1, v9}, Landroid/net/apf/ApfFilter$Counter;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/net/apf/ApfFilter$Counter;->bc:Landroid/net/apf/ApfFilter$Counter;

    new-instance v0, Landroid/net/apf/ApfFilter$Counter;

    const-string v1, "PASSED_IPV6_UNICAST_NON_ICMP"

    const/16 v10, 0x8

    invoke-direct {v0, v1, v10}, Landroid/net/apf/ApfFilter$Counter;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/net/apf/ApfFilter$Counter;->bd:Landroid/net/apf/ApfFilter$Counter;

    new-instance v0, Landroid/net/apf/ApfFilter$Counter;

    const-string v1, "PASSED_ARP_NON_IPV4"

    const/16 v11, 0x9

    invoke-direct {v0, v1, v11}, Landroid/net/apf/ApfFilter$Counter;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/net/apf/ApfFilter$Counter;->be:Landroid/net/apf/ApfFilter$Counter;

    new-instance v0, Landroid/net/apf/ApfFilter$Counter;

    const-string v1, "PASSED_ARP_UNKNOWN"

    const/16 v12, 0xa

    invoke-direct {v0, v1, v12}, Landroid/net/apf/ApfFilter$Counter;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/net/apf/ApfFilter$Counter;->bf:Landroid/net/apf/ApfFilter$Counter;

    new-instance v0, Landroid/net/apf/ApfFilter$Counter;

    const-string v1, "PASSED_ARP_UNICAST_REPLY"

    const/16 v13, 0xb

    invoke-direct {v0, v1, v13}, Landroid/net/apf/ApfFilter$Counter;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/net/apf/ApfFilter$Counter;->bg:Landroid/net/apf/ApfFilter$Counter;

    new-instance v0, Landroid/net/apf/ApfFilter$Counter;

    const-string v1, "PASSED_NON_IP_UNICAST"

    const/16 v14, 0xc

    invoke-direct {v0, v1, v14}, Landroid/net/apf/ApfFilter$Counter;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/net/apf/ApfFilter$Counter;->bh:Landroid/net/apf/ApfFilter$Counter;

    new-instance v0, Landroid/net/apf/ApfFilter$Counter;

    const-string v1, "DROPPED_ETH_BROADCAST"

    const/16 v15, 0xd

    invoke-direct {v0, v1, v15}, Landroid/net/apf/ApfFilter$Counter;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/net/apf/ApfFilter$Counter;->bi:Landroid/net/apf/ApfFilter$Counter;

    new-instance v0, Landroid/net/apf/ApfFilter$Counter;

    const-string v1, "DROPPED_RA"

    const/16 v15, 0xe

    invoke-direct {v0, v1, v15}, Landroid/net/apf/ApfFilter$Counter;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/net/apf/ApfFilter$Counter;->bj:Landroid/net/apf/ApfFilter$Counter;

    new-instance v0, Landroid/net/apf/ApfFilter$Counter;

    const-string v1, "DROPPED_GARP_REPLY"

    const/16 v15, 0xf

    invoke-direct {v0, v1, v15}, Landroid/net/apf/ApfFilter$Counter;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/net/apf/ApfFilter$Counter;->bk:Landroid/net/apf/ApfFilter$Counter;

    new-instance v0, Landroid/net/apf/ApfFilter$Counter;

    const-string v1, "DROPPED_ARP_OTHER_HOST"

    const/16 v15, 0x10

    invoke-direct {v0, v1, v15}, Landroid/net/apf/ApfFilter$Counter;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/net/apf/ApfFilter$Counter;->bl:Landroid/net/apf/ApfFilter$Counter;

    new-instance v0, Landroid/net/apf/ApfFilter$Counter;

    const-string v1, "DROPPED_IPV4_L2_BROADCAST"

    const/16 v15, 0x11

    invoke-direct {v0, v1, v15}, Landroid/net/apf/ApfFilter$Counter;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/net/apf/ApfFilter$Counter;->bm:Landroid/net/apf/ApfFilter$Counter;

    new-instance v0, Landroid/net/apf/ApfFilter$Counter;

    const-string v1, "DROPPED_IPV4_BROADCAST_ADDR"

    const/16 v15, 0x12

    invoke-direct {v0, v1, v15}, Landroid/net/apf/ApfFilter$Counter;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/net/apf/ApfFilter$Counter;->bn:Landroid/net/apf/ApfFilter$Counter;

    new-instance v0, Landroid/net/apf/ApfFilter$Counter;

    const-string v1, "DROPPED_IPV4_BROADCAST_NET"

    const/16 v15, 0x13

    invoke-direct {v0, v1, v15}, Landroid/net/apf/ApfFilter$Counter;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/net/apf/ApfFilter$Counter;->bo:Landroid/net/apf/ApfFilter$Counter;

    new-instance v0, Landroid/net/apf/ApfFilter$Counter;

    const-string v1, "DROPPED_IPV4_MULTICAST"

    const/16 v15, 0x14

    invoke-direct {v0, v1, v15}, Landroid/net/apf/ApfFilter$Counter;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/net/apf/ApfFilter$Counter;->bp:Landroid/net/apf/ApfFilter$Counter;

    new-instance v0, Landroid/net/apf/ApfFilter$Counter;

    const-string v1, "DROPPED_IPV6_ROUTER_SOLICITATION"

    const/16 v15, 0x15

    invoke-direct {v0, v1, v15}, Landroid/net/apf/ApfFilter$Counter;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/net/apf/ApfFilter$Counter;->bq:Landroid/net/apf/ApfFilter$Counter;

    new-instance v0, Landroid/net/apf/ApfFilter$Counter;

    const-string v1, "DROPPED_IPV6_MULTICAST_NA"

    const/16 v15, 0x16

    invoke-direct {v0, v1, v15}, Landroid/net/apf/ApfFilter$Counter;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/net/apf/ApfFilter$Counter;->br:Landroid/net/apf/ApfFilter$Counter;

    new-instance v0, Landroid/net/apf/ApfFilter$Counter;

    const-string v1, "DROPPED_IPV6_MULTICAST"

    const/16 v15, 0x17

    invoke-direct {v0, v1, v15}, Landroid/net/apf/ApfFilter$Counter;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/net/apf/ApfFilter$Counter;->bs:Landroid/net/apf/ApfFilter$Counter;

    new-instance v0, Landroid/net/apf/ApfFilter$Counter;

    const-string v1, "DROPPED_IPV6_MULTICAST_PING"

    const/16 v15, 0x18

    invoke-direct {v0, v1, v15}, Landroid/net/apf/ApfFilter$Counter;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/net/apf/ApfFilter$Counter;->bt:Landroid/net/apf/ApfFilter$Counter;

    new-instance v0, Landroid/net/apf/ApfFilter$Counter;

    const-string v1, "DROPPED_IPV6_NON_ICMP_MULTICAST"

    const/16 v15, 0x19

    invoke-direct {v0, v1, v15}, Landroid/net/apf/ApfFilter$Counter;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/net/apf/ApfFilter$Counter;->bu:Landroid/net/apf/ApfFilter$Counter;

    new-instance v0, Landroid/net/apf/ApfFilter$Counter;

    const-string v1, "DROPPED_802_3_FRAME"

    const/16 v15, 0x1a

    invoke-direct {v0, v1, v15}, Landroid/net/apf/ApfFilter$Counter;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/net/apf/ApfFilter$Counter;->bv:Landroid/net/apf/ApfFilter$Counter;

    new-instance v0, Landroid/net/apf/ApfFilter$Counter;

    const-string v1, "DROPPED_ETHERTYPE_BLACKLISTED"

    const/16 v15, 0x1b

    invoke-direct {v0, v1, v15}, Landroid/net/apf/ApfFilter$Counter;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/net/apf/ApfFilter$Counter;->bw:Landroid/net/apf/ApfFilter$Counter;

    const/16 v0, 0x1c

    new-array v0, v0, [Landroid/net/apf/ApfFilter$Counter;

    sget-object v1, Landroid/net/apf/ApfFilter$Counter;->aV:Landroid/net/apf/ApfFilter$Counter;

    aput-object v1, v0, v2

    sget-object v1, Landroid/net/apf/ApfFilter$Counter;->aW:Landroid/net/apf/ApfFilter$Counter;

    aput-object v1, v0, v3

    sget-object v1, Landroid/net/apf/ApfFilter$Counter;->aX:Landroid/net/apf/ApfFilter$Counter;

    aput-object v1, v0, v4

    sget-object v1, Landroid/net/apf/ApfFilter$Counter;->aY:Landroid/net/apf/ApfFilter$Counter;

    aput-object v1, v0, v5

    sget-object v1, Landroid/net/apf/ApfFilter$Counter;->aZ:Landroid/net/apf/ApfFilter$Counter;

    aput-object v1, v0, v6

    sget-object v1, Landroid/net/apf/ApfFilter$Counter;->ba:Landroid/net/apf/ApfFilter$Counter;

    aput-object v1, v0, v7

    sget-object v1, Landroid/net/apf/ApfFilter$Counter;->bb:Landroid/net/apf/ApfFilter$Counter;

    aput-object v1, v0, v8

    sget-object v1, Landroid/net/apf/ApfFilter$Counter;->bc:Landroid/net/apf/ApfFilter$Counter;

    aput-object v1, v0, v9

    sget-object v1, Landroid/net/apf/ApfFilter$Counter;->bd:Landroid/net/apf/ApfFilter$Counter;

    aput-object v1, v0, v10

    sget-object v1, Landroid/net/apf/ApfFilter$Counter;->be:Landroid/net/apf/ApfFilter$Counter;

    aput-object v1, v0, v11

    sget-object v1, Landroid/net/apf/ApfFilter$Counter;->bf:Landroid/net/apf/ApfFilter$Counter;

    aput-object v1, v0, v12

    sget-object v1, Landroid/net/apf/ApfFilter$Counter;->bg:Landroid/net/apf/ApfFilter$Counter;

    aput-object v1, v0, v13

    sget-object v1, Landroid/net/apf/ApfFilter$Counter;->bh:Landroid/net/apf/ApfFilter$Counter;

    aput-object v1, v0, v14

    sget-object v1, Landroid/net/apf/ApfFilter$Counter;->bi:Landroid/net/apf/ApfFilter$Counter;

    const/16 v2, 0xd

    aput-object v1, v0, v2

    sget-object v1, Landroid/net/apf/ApfFilter$Counter;->bj:Landroid/net/apf/ApfFilter$Counter;

    const/16 v2, 0xe

    aput-object v1, v0, v2

    sget-object v1, Landroid/net/apf/ApfFilter$Counter;->bk:Landroid/net/apf/ApfFilter$Counter;

    const/16 v2, 0xf

    aput-object v1, v0, v2

    sget-object v1, Landroid/net/apf/ApfFilter$Counter;->bl:Landroid/net/apf/ApfFilter$Counter;

    const/16 v2, 0x10

    aput-object v1, v0, v2

    sget-object v1, Landroid/net/apf/ApfFilter$Counter;->bm:Landroid/net/apf/ApfFilter$Counter;

    const/16 v2, 0x11

    aput-object v1, v0, v2

    sget-object v1, Landroid/net/apf/ApfFilter$Counter;->bn:Landroid/net/apf/ApfFilter$Counter;

    const/16 v2, 0x12

    aput-object v1, v0, v2

    sget-object v1, Landroid/net/apf/ApfFilter$Counter;->bo:Landroid/net/apf/ApfFilter$Counter;

    const/16 v2, 0x13

    aput-object v1, v0, v2

    sget-object v1, Landroid/net/apf/ApfFilter$Counter;->bp:Landroid/net/apf/ApfFilter$Counter;

    const/16 v2, 0x14

    aput-object v1, v0, v2

    sget-object v1, Landroid/net/apf/ApfFilter$Counter;->bq:Landroid/net/apf/ApfFilter$Counter;

    const/16 v2, 0x15

    aput-object v1, v0, v2

    sget-object v1, Landroid/net/apf/ApfFilter$Counter;->br:Landroid/net/apf/ApfFilter$Counter;

    const/16 v2, 0x16

    aput-object v1, v0, v2

    sget-object v1, Landroid/net/apf/ApfFilter$Counter;->bs:Landroid/net/apf/ApfFilter$Counter;

    const/16 v2, 0x17

    aput-object v1, v0, v2

    sget-object v1, Landroid/net/apf/ApfFilter$Counter;->bt:Landroid/net/apf/ApfFilter$Counter;

    const/16 v2, 0x18

    aput-object v1, v0, v2

    sget-object v1, Landroid/net/apf/ApfFilter$Counter;->bu:Landroid/net/apf/ApfFilter$Counter;

    const/16 v2, 0x19

    aput-object v1, v0, v2

    sget-object v1, Landroid/net/apf/ApfFilter$Counter;->bv:Landroid/net/apf/ApfFilter$Counter;

    const/16 v2, 0x1a

    aput-object v1, v0, v2

    sget-object v1, Landroid/net/apf/ApfFilter$Counter;->bw:Landroid/net/apf/ApfFilter$Counter;

    const/16 v2, 0x1b

    aput-object v1, v0, v2

    sput-object v0, Landroid/net/apf/ApfFilter$Counter;->bx:[Landroid/net/apf/ApfFilter$Counter;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static v()I
    .locals 1

    const-class v0, Landroid/net/apf/ApfFilter$Counter;

    invoke-virtual {v0}, Ljava/lang/Class;->getEnumConstants()[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/net/apf/ApfFilter$Counter;

    array-length v0, v0

    add-int/lit8 v0, v0, -0x1

    mul-int/lit8 v0, v0, 0x4

    return v0
.end method

.method public static valueOf(Ljava/lang/String;)Landroid/net/apf/ApfFilter$Counter;
    .locals 1

    const-class v0, Landroid/net/apf/ApfFilter$Counter;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Landroid/net/apf/ApfFilter$Counter;

    return-object p0
.end method

.method public static values()[Landroid/net/apf/ApfFilter$Counter;
    .locals 1

    sget-object v0, Landroid/net/apf/ApfFilter$Counter;->bx:[Landroid/net/apf/ApfFilter$Counter;

    invoke-virtual {v0}, [Landroid/net/apf/ApfFilter$Counter;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/net/apf/ApfFilter$Counter;

    return-object v0
.end method
