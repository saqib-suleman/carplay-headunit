.class public final Landroid/net/b/a;
.super Ljava/lang/Object;


# direct methods
.method public static a(S)Ljava/lang/String;
    .locals 2

    const/16 v0, 0x44

    if-eq p0, v0, :cond_0

    packed-switch p0, :pswitch_data_0

    packed-switch p0, :pswitch_data_1

    packed-switch p0, :pswitch_data_2

    packed-switch p0, :pswitch_data_3

    packed-switch p0, :pswitch_data_4

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "unknown RTM type: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_0
    const-string p0, "RTM_GETRULE"

    return-object p0

    :pswitch_1
    const-string p0, "RTM_DELRULE"

    return-object p0

    :pswitch_2
    const-string p0, "RTM_NEWRULE"

    return-object p0

    :pswitch_3
    const-string p0, "RTM_GETNEIGH"

    return-object p0

    :pswitch_4
    const-string p0, "RTM_DELNEIGH"

    return-object p0

    :pswitch_5
    const-string p0, "RTM_NEWNEIGH"

    return-object p0

    :pswitch_6
    const-string p0, "RTM_GETROUTE"

    return-object p0

    :pswitch_7
    const-string p0, "RTM_DELROUTE"

    return-object p0

    :pswitch_8
    const-string p0, "RTM_NEWROUTE"

    return-object p0

    :pswitch_9
    const-string p0, "RTM_GETADDR"

    return-object p0

    :pswitch_a
    const-string p0, "RTM_DELADDR"

    return-object p0

    :pswitch_b
    const-string p0, "RTM_NEWADDR"

    return-object p0

    :pswitch_c
    const-string p0, "RTM_SETLINK"

    return-object p0

    :pswitch_d
    const-string p0, "RTM_GETLINK"

    return-object p0

    :pswitch_e
    const-string p0, "RTM_DELLINK"

    return-object p0

    :pswitch_f
    const-string p0, "RTM_NEWLINK"

    return-object p0

    :pswitch_10
    const-string p0, "NLMSG_OVERRUN"

    return-object p0

    :pswitch_11
    const-string p0, "NLMSG_DONE"

    return-object p0

    :pswitch_12
    const-string p0, "NLMSG_ERROR"

    return-object p0

    :pswitch_13
    const-string p0, "NLMSG_NOOP"

    return-object p0

    :cond_0
    const-string p0, "RTM_NEWNDUSEROPT"

    return-object p0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x18
        :pswitch_8
        :pswitch_7
        :pswitch_6
    .end packed-switch

    :pswitch_data_3
    .packed-switch 0x1c
        :pswitch_5
        :pswitch_4
        :pswitch_3
    .end packed-switch

    :pswitch_data_4
    .packed-switch 0x20
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static d(Ljava/nio/ByteBuffer;)Ljava/lang/String;
    .locals 2

    if-nez p0, :cond_0

    const-string p0, "(null)"

    return-object p0

    :cond_0
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result p0

    invoke-static {v0, v1, p0}, Lcom/android/internal/util/HexDump;->toHexString([BII)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static g([B)Ljava/lang/String;
    .locals 0

    if-nez p0, :cond_0

    const-string p0, "(null)"

    return-object p0

    :cond_0
    invoke-static {p0}, Lcom/android/internal/util/HexDump;->toHexString([B)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static final h(I)I
    .locals 0

    if-gtz p0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    add-int/lit8 p0, p0, 0x4

    add-int/lit8 p0, p0, -0x1

    div-int/lit8 p0, p0, 0x4

    mul-int/lit8 p0, p0, 0x4

    return p0
.end method
