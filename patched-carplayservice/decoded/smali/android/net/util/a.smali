.class public Landroid/net/util/a;
.super Ljava/lang/Object;


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final bF:Ljava/nio/ByteBuffer;

.field private final de:[B

.field private final gl:Ljava/lang/String;

.field private final mBytes:[B

.field private final mLength:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Landroid/net/util/a;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroid/net/util/a;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Landroid/net/MacAddress;[BI)V
    .locals 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/net/MacAddress;->toByteArray()[B

    move-result-object p1

    iput-object p1, p0, Landroid/net/util/a;->de:[B

    iput-object p2, p0, Landroid/net/util/a;->mBytes:[B

    iget-object p1, p0, Landroid/net/util/a;->mBytes:[B

    array-length p1, p1

    invoke-static {p3, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    iput p1, p0, Landroid/net/util/a;->mLength:I

    iget-object p1, p0, Landroid/net/util/a;->mBytes:[B

    iget p2, p0, Landroid/net/util/a;->mLength:I

    const/4 p3, 0x0

    invoke-static {p1, p3, p2}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object p1

    iput-object p1, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    iget-object p1, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    sget-object p2, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {p1, p2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    new-instance p1, Ljava/util/StringJoiner;

    const-string p2, " "

    invoke-direct {p1, p2}, Ljava/util/StringJoiner;-><init>(Ljava/lang/CharSequence;)V

    iget-object p2, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->remaining()I

    move-result p2

    const/16 v0, 0xe

    if-ge p2, v0, :cond_1

    :cond_0
    :goto_0
    const-string p2, "runt:"

    invoke-virtual {p1, p2}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    move-result-object p2

    iget-object p3, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {p3}, Ljava/nio/ByteBuffer;->remaining()I

    move-result p3

    :goto_1
    invoke-static {p3}, Landroid/net/util/g;->asString(I)Ljava/lang/String;

    move-result-object p3

    :goto_2
    invoke-virtual {p2, p3}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    goto/16 :goto_a

    :cond_1
    iget-object p2, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    const/4 v0, 0x6

    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    iget-object p2, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    move-result-object p2

    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    move-result-object p2

    check-cast p2, Ljava/nio/ByteBuffer;

    iget-object v1, p0, Landroid/net/util/a;->de:[B

    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/nio/ByteBuffer;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v1, "TX"

    goto :goto_3

    :cond_2
    const-string v1, "RX"

    :goto_3
    invoke-virtual {p1, v1}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    invoke-static {p2}, Landroid/net/util/a;->j(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    iget-object p2, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {p2, p3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    iget-object p2, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    move-result-object p2

    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    move-result-object p2

    check-cast p2, Ljava/nio/ByteBuffer;

    const-string v1, ">"

    invoke-virtual {p1, v1}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    move-result-object v1

    invoke-static {p2}, Landroid/net/util/a;->j(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v1, p2}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    iget-object p2, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    const/16 v1, 0xc

    invoke-virtual {p2, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    iget-object p2, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->getShort()S

    move-result p2

    invoke-static {p2}, Landroid/net/util/g;->c(S)I

    move-result p2

    const/16 v2, 0x800

    const/4 v3, 0x1

    const/16 v4, 0x10

    const/4 v5, 0x4

    if-eq p2, v2, :cond_f

    const/16 p3, 0x806

    if-eq p2, p3, :cond_9

    const p3, 0x86dd

    if-eq p2, p3, :cond_3

    const-string p3, "ethtype"

    :goto_4
    invoke-virtual {p1, p3}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    move-result-object p3

    invoke-static {p2}, Landroid/net/util/g;->asString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3, p2}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    goto/16 :goto_a

    :cond_3
    const-string p2, "ipv6"

    invoke-virtual {p1, p2}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    iget-object p2, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->remaining()I

    move-result p2

    const/16 p3, 0x28

    if-ge p2, p3, :cond_4

    goto/16 :goto_0

    :cond_4
    iget-object p2, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->position()I

    move-result p2

    iget-object v0, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    add-int/lit8 v2, p2, 0x6

    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    iget-object v0, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    invoke-static {v0}, Landroid/net/util/g;->a(B)I

    move-result v0

    iget-object v2, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    add-int/lit8 v3, p2, 0x8

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    iget-object v2, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    invoke-static {v2, v4}, Landroid/net/util/a;->a(Ljava/nio/ByteBuffer;I)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    invoke-static {v3, v4}, Landroid/net/util/a;->a(Ljava/nio/ByteBuffer;I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v2}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    move-result-object v2

    const-string v4, ">"

    invoke-virtual {v2, v4}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    iget-object v2, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    add-int/2addr p2, p3

    invoke-virtual {v2, p2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    sget p2, Landroid/system/OsConstants;->IPPROTO_ICMPV6:I

    if-ne v0, p2, :cond_8

    const-string p2, "icmp6"

    invoke-virtual {p1, p2}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    iget-object p2, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->remaining()I

    move-result p2

    if-ge p2, v5, :cond_5

    goto/16 :goto_0

    :cond_5
    iget-object p2, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->get()B

    move-result p2

    invoke-static {p2}, Landroid/net/util/g;->a(B)I

    move-result p2

    iget-object p3, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {p3}, Ljava/nio/ByteBuffer;->get()B

    move-result p3

    invoke-static {p3}, Landroid/net/util/g;->a(B)I

    move-result p3

    iget-object v0, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getShort()S

    packed-switch p2, :pswitch_data_0

    const-string v0, "type"

    invoke-virtual {p1, v0}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    move-result-object v0

    invoke-static {p2}, Landroid/net/util/g;->asString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    const-string p2, "code"

    invoke-virtual {p1, p2}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    move-result-object p2

    goto/16 :goto_1

    :pswitch_0
    const-string p2, "na"

    goto :goto_5

    :pswitch_1
    const-string p2, "ns"

    :goto_5
    invoke-virtual {p1, p2}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    invoke-direct {p0, p1}, Landroid/net/util/a;->a(Ljava/util/StringJoiner;)V

    goto/16 :goto_a

    :pswitch_2
    const-string p2, "ra"

    invoke-virtual {p1, p2}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    iget-object p2, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->remaining()I

    move-result p2

    if-ge p2, v1, :cond_6

    goto/16 :goto_0

    :cond_6
    iget-object p2, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    iget-object p3, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {p3}, Ljava/nio/ByteBuffer;->position()I

    move-result p3

    add-int/2addr p3, v1

    goto :goto_6

    :pswitch_3
    const-string p2, "rs"

    invoke-virtual {p1, p2}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    iget-object p2, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->remaining()I

    move-result p2

    if-ge p2, v5, :cond_7

    goto/16 :goto_0

    :cond_7
    iget-object p2, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    iget-object p3, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {p3}, Ljava/nio/ByteBuffer;->position()I

    move-result p3

    add-int/2addr p3, v5

    :goto_6
    invoke-virtual {p2, p3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    invoke-direct {p0, p1}, Landroid/net/util/a;->b(Ljava/util/StringJoiner;)V

    goto/16 :goto_a

    :cond_8
    const-string p2, "proto"

    invoke-virtual {p1, p2}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    move-result-object p2

    invoke-static {v0}, Landroid/net/util/g;->asString(I)Ljava/lang/String;

    move-result-object p3

    goto/16 :goto_2

    :cond_9
    const-string p2, "arp"

    invoke-virtual {p1, p2}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    iget-object p2, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->remaining()I

    move-result p2

    const/16 p3, 0x1c

    if-ge p2, p3, :cond_a

    goto/16 :goto_0

    :cond_a
    iget-object p2, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->getShort()S

    move-result p2

    invoke-static {p2}, Landroid/net/util/g;->c(S)I

    move-result p2

    if-ne p2, v3, :cond_e

    iget-object p2, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->getShort()S

    move-result p2

    invoke-static {p2}, Landroid/net/util/g;->c(S)I

    move-result p2

    if-ne p2, v2, :cond_e

    iget-object p2, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->get()B

    move-result p2

    invoke-static {p2}, Landroid/net/util/g;->a(B)I

    move-result p2

    if-ne p2, v0, :cond_e

    iget-object p2, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->get()B

    move-result p2

    invoke-static {p2}, Landroid/net/util/g;->a(B)I

    move-result p2

    if-eq p2, v5, :cond_b

    goto :goto_7

    :cond_b
    iget-object p2, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->getShort()S

    move-result p2

    invoke-static {p2}, Landroid/net/util/g;->c(S)I

    move-result p2

    iget-object p3, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    invoke-static {p3}, Landroid/net/util/a;->j(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    move-result-object p3

    iget-object v0, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    invoke-static {v0, v5}, Landroid/net/util/a;->a(Ljava/nio/ByteBuffer;I)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    invoke-static {v1}, Landroid/net/util/a;->j(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    iget-object v1, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    invoke-static {v1, v5}, Landroid/net/util/a;->a(Ljava/nio/ByteBuffer;I)Ljava/lang/String;

    move-result-object v1

    if-ne p2, v3, :cond_c

    const-string p2, "who-has"

    invoke-virtual {p1, p2}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    move-result-object p2

    invoke-virtual {p2, v1}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    goto/16 :goto_a

    :cond_c
    const/4 v1, 0x2

    if-ne p2, v1, :cond_d

    const-string p2, "reply"

    invoke-virtual {p1, p2}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    move-result-object p2

    invoke-virtual {p2, v0}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    move-result-object p2

    goto/16 :goto_2

    :cond_d
    const-string p3, "unknown opcode"

    goto/16 :goto_4

    :cond_e
    :goto_7
    const-string p2, "unexpected header"

    goto :goto_8

    :cond_f
    const-string p2, "ipv4"

    invoke-virtual {p1, p2}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    iget-object p2, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result p2

    if-nez p2, :cond_10

    const-string p2, "runt"

    :goto_8
    invoke-virtual {p1, p2}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    goto/16 :goto_a

    :cond_10
    iget-object p2, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->position()I

    move-result p2

    iget-object v0, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p2}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v0

    and-int/lit8 v0, v0, 0xf

    mul-int/2addr v0, v5

    iget-object v1, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    if-lt v1, v0, :cond_0

    iget-object v1, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    const/16 v2, 0x14

    if-ge v1, v2, :cond_11

    goto/16 :goto_0

    :cond_11
    add-int/2addr v0, p2

    iget-object v1, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    add-int/lit8 v2, p2, 0x6

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    iget-object v1, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v1

    invoke-static {v1}, Landroid/net/util/g;->c(S)I

    move-result v1

    and-int/lit16 v1, v1, 0x1fff

    if-eqz v1, :cond_12

    move p3, v3

    :cond_12
    iget-object v1, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    add-int/lit8 v2, p2, 0x9

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    iget-object v1, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    invoke-static {v1}, Landroid/net/util/g;->a(B)I

    move-result v1

    iget-object v2, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    add-int/lit8 v3, p2, 0xc

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    iget-object v2, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    invoke-static {v2, v5}, Landroid/net/util/a;->a(Ljava/nio/ByteBuffer;I)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    add-int/2addr p2, v4

    invoke-virtual {v3, p2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    iget-object p2, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    invoke-static {p2, v5}, Landroid/net/util/a;->a(Ljava/nio/ByteBuffer;I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, v2}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    move-result-object v2

    const-string v3, ">"

    invoke-virtual {v2, v3}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    iget-object p2, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    sget p2, Landroid/system/OsConstants;->IPPROTO_UDP:I

    if-ne v1, p2, :cond_16

    const-string p2, "udp"

    invoke-virtual {p1, p2}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    if-eqz p3, :cond_13

    :goto_9
    const-string p2, "fragment"

    goto/16 :goto_8

    :cond_13
    iget-object p2, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->remaining()I

    move-result p2

    const/16 p3, 0x8

    if-ge p2, p3, :cond_14

    goto/16 :goto_0

    :cond_14
    iget-object p2, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->position()I

    move-result p2

    iget-object v0, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    invoke-static {v0}, Landroid/net/util/g;->c(S)I

    move-result v0

    iget-object v1, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v1

    invoke-static {v1}, Landroid/net/util/g;->c(S)I

    move-result v1

    invoke-static {v0}, Landroid/net/util/g;->asString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    move-result-object v2

    const-string v3, ">"

    invoke-virtual {v2, v3}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    move-result-object v2

    invoke-static {v1}, Landroid/net/util/g;->asString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    iget-object v2, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    add-int/2addr p2, p3

    invoke-virtual {v2, p2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    const/16 p2, 0x44

    if-eq v0, p2, :cond_15

    if-ne v1, p2, :cond_17

    :cond_15
    const-string p2, "dhcp4"

    invoke-virtual {p1, p2}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    :try_start_0
    iget-object p2, p0, Landroid/net/util/a;->mBytes:[B

    iget p3, p0, Landroid/net/util/a;->mLength:I

    invoke-static {p2, p3}, Landroid/net/dhcp/DhcpPacket;->b([BI)Landroid/net/dhcp/DhcpPacket;

    move-result-object p2

    invoke-virtual {p2}, Landroid/net/dhcp/DhcpPacket;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;
    :try_end_0
    .catch Landroid/net/dhcp/DhcpPacket$ParseException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_a

    :catch_0
    move-exception p2

    new-instance p3, Ljava/lang/StringBuilder;

    const-string v0, "parse error: "

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    goto/16 :goto_8

    :cond_16
    const-string p2, "proto"

    invoke-virtual {p1, p2}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    move-result-object p2

    invoke-static {v1}, Landroid/net/util/g;->asString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    if-eqz p3, :cond_17

    goto/16 :goto_9

    :cond_17
    :goto_a
    invoke-virtual {p1}, Ljava/util/StringJoiner;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Landroid/net/util/a;->gl:Ljava/lang/String;

    return-void

    :pswitch_data_0
    .packed-switch 0x85
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static a(Landroid/net/MacAddress;[BI)Ljava/lang/String;
    .locals 1

    if-eqz p0, :cond_1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    array-length v0, p1

    invoke-static {p2, v0}, Ljava/lang/Math;->min(II)I

    move-result p2

    new-instance v0, Landroid/net/util/a;

    invoke-direct {v0, p0, p1, p2}, Landroid/net/util/a;-><init>(Landroid/net/MacAddress;[BI)V

    invoke-virtual {v0}, Landroid/net/util/a;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1
    :goto_0
    const/4 p0, 0x0

    return-object p0
.end method

.method private static a(Ljava/nio/ByteBuffer;I)Ljava/lang/String;
    .locals 2

    if-eqz p0, :cond_1

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    if-ge v0, p1, :cond_0

    goto :goto_0

    :cond_0
    new-array v0, p1, [B

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1, p1}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    :try_start_0
    invoke-static {v0}, Ljava/net/InetAddress;->getByAddress([B)Ljava/net/InetAddress;

    move-result-object p0

    invoke-virtual {p0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    const-string p0, "unknown"

    return-object p0

    :cond_1
    :goto_0
    const-string p0, "invalid"

    return-object p0
.end method

.method private a(Ljava/util/StringJoiner;)V
    .locals 2

    iget-object v0, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    const/16 v1, 0x14

    if-ge v0, v1, :cond_0

    const-string v0, "runt:"

    invoke-virtual {p1, v0}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    move-result-object p1

    iget-object v0, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    invoke-static {v0}, Landroid/net/util/g;->asString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    return-void

    :cond_0
    iget-object v0, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    iget-object v1, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    add-int/lit8 v1, v1, 0x4

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    iget-object v0, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    const/16 v1, 0x10

    invoke-static {v0, v1}, Landroid/net/util/a;->a(Ljava/nio/ByteBuffer;I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    invoke-direct {p0, p1}, Landroid/net/util/a;->b(Ljava/util/StringJoiner;)V

    return-void
.end method

.method private b(Ljava/util/StringJoiner;)V
    .locals 4

    :goto_0
    iget-object v0, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    const/16 v1, 0x8

    if-lt v0, v1, :cond_3

    iget-object v0, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    invoke-static {v0}, Landroid/net/util/g;->a(B)I

    move-result v0

    iget-object v2, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->get()B

    move-result v2

    invoke-static {v2}, Landroid/net/util/g;->a(B)I

    move-result v2

    mul-int/2addr v2, v1

    add-int/lit8 v2, v2, -0x2

    if-ltz v2, :cond_2

    iget-object v1, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    if-le v2, v1, :cond_0

    goto :goto_4

    :cond_0
    iget-object v1, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    const/4 v3, 0x5

    if-eq v0, v3, :cond_1

    packed-switch v0, :pswitch_data_0

    goto :goto_3

    :pswitch_0
    const-string v0, "tlla"

    goto :goto_1

    :pswitch_1
    const-string v0, "slla"

    :goto_1
    invoke-virtual {p1, v0}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    iget-object v0, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    invoke-static {v0}, Landroid/net/util/a;->j(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    move-result-object v0

    :goto_2
    invoke-virtual {p1, v0}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    goto :goto_3

    :cond_1
    const-string v0, "mtu"

    invoke-virtual {p1, v0}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    iget-object v0, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getShort()S

    iget-object v0, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    invoke-static {v0}, Landroid/net/util/g;->asString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    :goto_3
    iget-object v0, p0, Landroid/net/util/a;->bF:Ljava/nio/ByteBuffer;

    add-int/2addr v1, v2

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    goto :goto_0

    :cond_2
    :goto_4
    const-string v0, "<malformed>"

    invoke-virtual {p1, v0}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    :cond_3
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static j(Ljava/nio/ByteBuffer;)Ljava/lang/String;
    .locals 7

    if-eqz p0, :cond_2

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    const/4 v1, 0x6

    if-ge v0, v1, :cond_0

    goto :goto_1

    :cond_0
    new-array v0, v1, [B

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v2, v1}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    new-array p0, v1, [Ljava/lang/Object;

    move v3, v2

    :goto_0
    if-ge v2, v1, :cond_1

    aget-byte v4, v0, v2

    add-int/lit8 v5, v3, 0x1

    new-instance v6, Ljava/lang/Byte;

    invoke-direct {v6, v4}, Ljava/lang/Byte;-><init>(B)V

    aput-object v6, p0, v3

    add-int/lit8 v2, v2, 0x1

    move v3, v5

    goto :goto_0

    :cond_1
    const-string v0, "%02x:%02x:%02x:%02x:%02x:%02x"

    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2
    :goto_1
    const-string p0, "invalid"

    return-object p0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Landroid/net/util/a;->gl:Ljava/lang/String;

    return-object v0
.end method
