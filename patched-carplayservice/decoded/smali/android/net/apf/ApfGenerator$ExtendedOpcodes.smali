.class final enum Landroid/net/apf/ApfGenerator$ExtendedOpcodes;
.super Ljava/lang/Enum;


# static fields
.field public static final enum bV:Landroid/net/apf/ApfGenerator$ExtendedOpcodes;

.field public static final enum bW:Landroid/net/apf/ApfGenerator$ExtendedOpcodes;

.field public static final enum bX:Landroid/net/apf/ApfGenerator$ExtendedOpcodes;

.field public static final enum bY:Landroid/net/apf/ApfGenerator$ExtendedOpcodes;

.field public static final enum bZ:Landroid/net/apf/ApfGenerator$ExtendedOpcodes;

.field public static final enum ca:Landroid/net/apf/ApfGenerator$ExtendedOpcodes;

.field private static final synthetic cb:[Landroid/net/apf/ApfGenerator$ExtendedOpcodes;


# instance fields
.field final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 9

    new-instance v0, Landroid/net/apf/ApfGenerator$ExtendedOpcodes;

    const-string v1, "LDM"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Landroid/net/apf/ApfGenerator$ExtendedOpcodes;-><init>(Ljava/lang/String;II)V

    sput-object v0, Landroid/net/apf/ApfGenerator$ExtendedOpcodes;->bV:Landroid/net/apf/ApfGenerator$ExtendedOpcodes;

    new-instance v0, Landroid/net/apf/ApfGenerator$ExtendedOpcodes;

    const-string v1, "STM"

    const/4 v3, 0x1

    const/16 v4, 0x10

    invoke-direct {v0, v1, v3, v4}, Landroid/net/apf/ApfGenerator$ExtendedOpcodes;-><init>(Ljava/lang/String;II)V

    sput-object v0, Landroid/net/apf/ApfGenerator$ExtendedOpcodes;->bW:Landroid/net/apf/ApfGenerator$ExtendedOpcodes;

    new-instance v0, Landroid/net/apf/ApfGenerator$ExtendedOpcodes;

    const-string v1, "NOT"

    const/4 v4, 0x2

    const/16 v5, 0x20

    invoke-direct {v0, v1, v4, v5}, Landroid/net/apf/ApfGenerator$ExtendedOpcodes;-><init>(Ljava/lang/String;II)V

    sput-object v0, Landroid/net/apf/ApfGenerator$ExtendedOpcodes;->bX:Landroid/net/apf/ApfGenerator$ExtendedOpcodes;

    new-instance v0, Landroid/net/apf/ApfGenerator$ExtendedOpcodes;

    const-string v1, "NEG"

    const/4 v5, 0x3

    const/16 v6, 0x21

    invoke-direct {v0, v1, v5, v6}, Landroid/net/apf/ApfGenerator$ExtendedOpcodes;-><init>(Ljava/lang/String;II)V

    sput-object v0, Landroid/net/apf/ApfGenerator$ExtendedOpcodes;->bY:Landroid/net/apf/ApfGenerator$ExtendedOpcodes;

    new-instance v0, Landroid/net/apf/ApfGenerator$ExtendedOpcodes;

    const-string v1, "SWAP"

    const/4 v6, 0x4

    const/16 v7, 0x22

    invoke-direct {v0, v1, v6, v7}, Landroid/net/apf/ApfGenerator$ExtendedOpcodes;-><init>(Ljava/lang/String;II)V

    sput-object v0, Landroid/net/apf/ApfGenerator$ExtendedOpcodes;->bZ:Landroid/net/apf/ApfGenerator$ExtendedOpcodes;

    new-instance v0, Landroid/net/apf/ApfGenerator$ExtendedOpcodes;

    const-string v1, "MOVE"

    const/4 v7, 0x5

    const/16 v8, 0x23

    invoke-direct {v0, v1, v7, v8}, Landroid/net/apf/ApfGenerator$ExtendedOpcodes;-><init>(Ljava/lang/String;II)V

    sput-object v0, Landroid/net/apf/ApfGenerator$ExtendedOpcodes;->ca:Landroid/net/apf/ApfGenerator$ExtendedOpcodes;

    const/4 v0, 0x6

    new-array v0, v0, [Landroid/net/apf/ApfGenerator$ExtendedOpcodes;

    sget-object v1, Landroid/net/apf/ApfGenerator$ExtendedOpcodes;->bV:Landroid/net/apf/ApfGenerator$ExtendedOpcodes;

    aput-object v1, v0, v2

    sget-object v1, Landroid/net/apf/ApfGenerator$ExtendedOpcodes;->bW:Landroid/net/apf/ApfGenerator$ExtendedOpcodes;

    aput-object v1, v0, v3

    sget-object v1, Landroid/net/apf/ApfGenerator$ExtendedOpcodes;->bX:Landroid/net/apf/ApfGenerator$ExtendedOpcodes;

    aput-object v1, v0, v4

    sget-object v1, Landroid/net/apf/ApfGenerator$ExtendedOpcodes;->bY:Landroid/net/apf/ApfGenerator$ExtendedOpcodes;

    aput-object v1, v0, v5

    sget-object v1, Landroid/net/apf/ApfGenerator$ExtendedOpcodes;->bZ:Landroid/net/apf/ApfGenerator$ExtendedOpcodes;

    aput-object v1, v0, v6

    sget-object v1, Landroid/net/apf/ApfGenerator$ExtendedOpcodes;->ca:Landroid/net/apf/ApfGenerator$ExtendedOpcodes;

    aput-object v1, v0, v7

    sput-object v0, Landroid/net/apf/ApfGenerator$ExtendedOpcodes;->cb:[Landroid/net/apf/ApfGenerator$ExtendedOpcodes;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Landroid/net/apf/ApfGenerator$ExtendedOpcodes;->value:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Landroid/net/apf/ApfGenerator$ExtendedOpcodes;
    .locals 1

    const-class v0, Landroid/net/apf/ApfGenerator$ExtendedOpcodes;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Landroid/net/apf/ApfGenerator$ExtendedOpcodes;

    return-object p0
.end method

.method public static values()[Landroid/net/apf/ApfGenerator$ExtendedOpcodes;
    .locals 1

    sget-object v0, Landroid/net/apf/ApfGenerator$ExtendedOpcodes;->cb:[Landroid/net/apf/ApfGenerator$ExtendedOpcodes;

    invoke-virtual {v0}, [Landroid/net/apf/ApfGenerator$ExtendedOpcodes;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/net/apf/ApfGenerator$ExtendedOpcodes;

    return-object v0
.end method
