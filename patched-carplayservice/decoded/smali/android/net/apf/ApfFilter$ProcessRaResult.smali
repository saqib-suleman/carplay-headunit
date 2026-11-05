.class final enum Landroid/net/apf/ApfFilter$ProcessRaResult;
.super Ljava/lang/Enum;


# static fields
.field public static final enum bA:Landroid/net/apf/ApfFilter$ProcessRaResult;

.field public static final enum bB:Landroid/net/apf/ApfFilter$ProcessRaResult;

.field public static final enum bC:Landroid/net/apf/ApfFilter$ProcessRaResult;

.field public static final enum bD:Landroid/net/apf/ApfFilter$ProcessRaResult;

.field private static final synthetic bE:[Landroid/net/apf/ApfFilter$ProcessRaResult;

.field public static final enum by:Landroid/net/apf/ApfFilter$ProcessRaResult;

.field public static final enum bz:Landroid/net/apf/ApfFilter$ProcessRaResult;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    new-instance v0, Landroid/net/apf/ApfFilter$ProcessRaResult;

    const-string v1, "MATCH"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Landroid/net/apf/ApfFilter$ProcessRaResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/net/apf/ApfFilter$ProcessRaResult;->by:Landroid/net/apf/ApfFilter$ProcessRaResult;

    new-instance v0, Landroid/net/apf/ApfFilter$ProcessRaResult;

    const-string v1, "DROPPED"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Landroid/net/apf/ApfFilter$ProcessRaResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/net/apf/ApfFilter$ProcessRaResult;->bz:Landroid/net/apf/ApfFilter$ProcessRaResult;

    new-instance v0, Landroid/net/apf/ApfFilter$ProcessRaResult;

    const-string v1, "PARSE_ERROR"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Landroid/net/apf/ApfFilter$ProcessRaResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/net/apf/ApfFilter$ProcessRaResult;->bA:Landroid/net/apf/ApfFilter$ProcessRaResult;

    new-instance v0, Landroid/net/apf/ApfFilter$ProcessRaResult;

    const-string v1, "ZERO_LIFETIME"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5}, Landroid/net/apf/ApfFilter$ProcessRaResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/net/apf/ApfFilter$ProcessRaResult;->bB:Landroid/net/apf/ApfFilter$ProcessRaResult;

    new-instance v0, Landroid/net/apf/ApfFilter$ProcessRaResult;

    const-string v1, "UPDATE_NEW_RA"

    const/4 v6, 0x4

    invoke-direct {v0, v1, v6}, Landroid/net/apf/ApfFilter$ProcessRaResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/net/apf/ApfFilter$ProcessRaResult;->bC:Landroid/net/apf/ApfFilter$ProcessRaResult;

    new-instance v0, Landroid/net/apf/ApfFilter$ProcessRaResult;

    const-string v1, "UPDATE_EXPIRY"

    const/4 v7, 0x5

    invoke-direct {v0, v1, v7}, Landroid/net/apf/ApfFilter$ProcessRaResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/net/apf/ApfFilter$ProcessRaResult;->bD:Landroid/net/apf/ApfFilter$ProcessRaResult;

    const/4 v0, 0x6

    new-array v0, v0, [Landroid/net/apf/ApfFilter$ProcessRaResult;

    sget-object v1, Landroid/net/apf/ApfFilter$ProcessRaResult;->by:Landroid/net/apf/ApfFilter$ProcessRaResult;

    aput-object v1, v0, v2

    sget-object v1, Landroid/net/apf/ApfFilter$ProcessRaResult;->bz:Landroid/net/apf/ApfFilter$ProcessRaResult;

    aput-object v1, v0, v3

    sget-object v1, Landroid/net/apf/ApfFilter$ProcessRaResult;->bA:Landroid/net/apf/ApfFilter$ProcessRaResult;

    aput-object v1, v0, v4

    sget-object v1, Landroid/net/apf/ApfFilter$ProcessRaResult;->bB:Landroid/net/apf/ApfFilter$ProcessRaResult;

    aput-object v1, v0, v5

    sget-object v1, Landroid/net/apf/ApfFilter$ProcessRaResult;->bC:Landroid/net/apf/ApfFilter$ProcessRaResult;

    aput-object v1, v0, v6

    sget-object v1, Landroid/net/apf/ApfFilter$ProcessRaResult;->bD:Landroid/net/apf/ApfFilter$ProcessRaResult;

    aput-object v1, v0, v7

    sput-object v0, Landroid/net/apf/ApfFilter$ProcessRaResult;->bE:[Landroid/net/apf/ApfFilter$ProcessRaResult;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Landroid/net/apf/ApfFilter$ProcessRaResult;
    .locals 1

    const-class v0, Landroid/net/apf/ApfFilter$ProcessRaResult;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Landroid/net/apf/ApfFilter$ProcessRaResult;

    return-object p0
.end method

.method public static values()[Landroid/net/apf/ApfFilter$ProcessRaResult;
    .locals 1

    sget-object v0, Landroid/net/apf/ApfFilter$ProcessRaResult;->bE:[Landroid/net/apf/ApfFilter$ProcessRaResult;

    invoke-virtual {v0}, [Landroid/net/apf/ApfFilter$ProcessRaResult;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/net/apf/ApfFilter$ProcessRaResult;

    return-object v0
.end method
