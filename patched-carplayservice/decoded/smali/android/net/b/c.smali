.class public Landroid/net/b/c;
.super Ljava/lang/Object;


# instance fields
.field protected fG:Landroid/net/b/j;


# direct methods
.method public constructor <init>(Landroid/net/b/j;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroid/net/b/c;->fG:Landroid/net/b/j;

    return-void
.end method

.method public static e(Ljava/nio/ByteBuffer;)Landroid/net/b/c;
    .locals 5

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->position()I

    :cond_0
    invoke-static {p0}, Landroid/net/b/j;->i(Ljava/nio/ByteBuffer;)Landroid/net/b/j;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_1

    return-object v1

    :cond_1
    iget v2, v0, Landroid/net/b/j;->gg:I

    invoke-static {v2}, Landroid/net/b/a;->h(I)I

    move-result v2

    add-int/lit8 v2, v2, -0x10

    if-nez p0, :cond_2

    return-object v1

    :cond_2
    if-ltz v2, :cond_5

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v3

    if-le v2, v3, :cond_3

    goto :goto_0

    :cond_3
    iget-short v3, v0, Landroid/net/b/j;->gh:S

    packed-switch v3, :pswitch_data_0

    packed-switch v3, :pswitch_data_1

    iget-short v3, v0, Landroid/net/b/j;->gh:S

    const/16 v4, 0xf

    if-gt v3, v4, :cond_4

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    add-int/2addr v1, v2

    invoke-virtual {p0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    new-instance p0, Landroid/net/b/c;

    invoke-direct {p0, v0}, Landroid/net/b/c;-><init>(Landroid/net/b/j;)V

    return-object p0

    :cond_4
    return-object v1

    :pswitch_0
    invoke-static {v0, p0}, Landroid/net/b/e;->b(Landroid/net/b/j;Ljava/nio/ByteBuffer;)Landroid/net/b/e;

    move-result-object p0

    return-object p0

    :pswitch_1
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    add-int/2addr v1, v2

    invoke-virtual {p0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    new-instance p0, Landroid/net/b/c;

    invoke-direct {p0, v0}, Landroid/net/b/c;-><init>(Landroid/net/b/j;)V

    return-object p0

    :pswitch_2
    invoke-static {v0, p0}, Landroid/net/b/b;->a(Landroid/net/b/j;Ljava/nio/ByteBuffer;)Landroid/net/b/b;

    move-result-object p0

    return-object p0

    :cond_5
    :goto_0
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v0

    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    return-object v1

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_2
        :pswitch_1
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x1c
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public final aq()Landroid/net/b/j;
    .locals 1

    iget-object v0, p0, Landroid/net/b/c;->fG:Landroid/net/b/j;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "NetlinkMessage{"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Landroid/net/b/c;->fG:Landroid/net/b/j;

    if-nez v1, :cond_0

    const-string v1, ""

    goto :goto_0

    :cond_0
    iget-object v1, p0, Landroid/net/b/c;->fG:Landroid/net/b/j;

    invoke-virtual {v1}, Landroid/net/b/j;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
