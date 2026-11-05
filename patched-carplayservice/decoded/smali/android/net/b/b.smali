.class public final Landroid/net/b/b;
.super Landroid/net/b/c;


# instance fields
.field private fF:Landroid/net/b/i;


# direct methods
.method private constructor <init>(Landroid/net/b/j;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/net/b/c;-><init>(Landroid/net/b/j;)V

    const/4 p1, 0x0

    iput-object p1, p0, Landroid/net/b/b;->fF:Landroid/net/b/i;

    return-void
.end method

.method public static a(Landroid/net/b/j;Ljava/nio/ByteBuffer;)Landroid/net/b/b;
    .locals 3

    new-instance v0, Landroid/net/b/b;

    invoke-direct {v0, p0}, Landroid/net/b/b;-><init>(Landroid/net/b/j;)V

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result p0

    const/16 v1, 0x14

    if-lt p0, v1, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    const/4 v1, 0x0

    if-nez p0, :cond_1

    move-object p0, v1

    goto :goto_1

    :cond_1
    new-instance p0, Landroid/net/b/i;

    invoke-direct {p0}, Landroid/net/b/i;-><init>()V

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v2

    iput v2, p0, Landroid/net/b/i;->error:I

    invoke-static {p1}, Landroid/net/b/j;->i(Ljava/nio/ByteBuffer;)Landroid/net/b/j;

    move-result-object p1

    iput-object p1, p0, Landroid/net/b/i;->gf:Landroid/net/b/j;

    :goto_1
    iput-object p0, v0, Landroid/net/b/b;->fF:Landroid/net/b/i;

    iget-object p0, v0, Landroid/net/b/b;->fF:Landroid/net/b/i;

    if-nez p0, :cond_2

    return-object v1

    :cond_2
    return-object v0
.end method


# virtual methods
.method public final ap()Landroid/net/b/i;
    .locals 1

    iget-object v0, p0, Landroid/net/b/b;->fF:Landroid/net/b/i;

    return-object v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "NetlinkErrorMessage{ nlmsghdr{"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Landroid/net/b/b;->fG:Landroid/net/b/j;

    if-nez v1, :cond_0

    const-string v1, ""

    goto :goto_0

    :cond_0
    iget-object v1, p0, Landroid/net/b/b;->fG:Landroid/net/b/j;

    invoke-virtual {v1}, Landroid/net/b/j;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "}, nlmsgerr{"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroid/net/b/b;->fF:Landroid/net/b/i;

    if-nez v1, :cond_1

    const-string v1, ""

    goto :goto_1

    :cond_1
    iget-object v1, p0, Landroid/net/b/b;->fF:Landroid/net/b/i;

    invoke-virtual {v1}, Landroid/net/b/i;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "} }"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
