.class public final Landroid/net/util/g;
.super Ljava/lang/Object;


# static fields
.field public static final gv:B

.field public static final gw:[B


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/4 v0, -0x1

    sput-byte v0, Landroid/net/util/g;->gv:B

    const/4 v0, 0x6

    new-array v0, v0, [B

    sget-byte v1, Landroid/net/util/g;->gv:B

    const/4 v2, 0x0

    aput-byte v1, v0, v2

    sget-byte v1, Landroid/net/util/g;->gv:B

    const/4 v2, 0x1

    aput-byte v1, v0, v2

    sget-byte v1, Landroid/net/util/g;->gv:B

    const/4 v2, 0x2

    aput-byte v1, v0, v2

    sget-byte v1, Landroid/net/util/g;->gv:B

    const/4 v2, 0x3

    aput-byte v1, v0, v2

    sget-byte v1, Landroid/net/util/g;->gv:B

    const/4 v2, 0x4

    aput-byte v1, v0, v2

    sget-byte v1, Landroid/net/util/g;->gv:B

    const/4 v2, 0x5

    aput-byte v1, v0, v2

    sput-object v0, Landroid/net/util/g;->gw:[B

    return-void
.end method

.method public static a(B)I
    .locals 0

    and-int/lit16 p0, p0, 0xff

    return p0
.end method

.method public static asString(I)Ljava/lang/String;
    .locals 0

    invoke-static {p0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static c(S)I
    .locals 1

    const v0, 0xffff

    and-int/2addr p0, v0

    return p0
.end method
