.class abstract Landroid/net/dhcp/p;
.super Landroid/net/dhcp/o;


# instance fields
.field final synthetic dB:Landroid/net/dhcp/b;

.field private dE:I

.field protected dF:I


# direct methods
.method constructor <init>(Landroid/net/dhcp/b;)V
    .locals 0

    iput-object p1, p0, Landroid/net/dhcp/p;->dB:Landroid/net/dhcp/b;

    invoke-direct {p0, p1}, Landroid/net/dhcp/o;-><init>(Landroid/net/dhcp/b;)V

    const/4 p1, 0x0

    iput p1, p0, Landroid/net/dhcp/p;->dF:I

    return-void
.end method


# virtual methods
.method protected abstract O()Z
.end method

.method protected Q()V
    .locals 0

    return-void
.end method

.method protected abstract c(Landroid/net/dhcp/DhcpPacket;)V
.end method

.method public enter()V
    .locals 4

    invoke-super {p0}, Landroid/net/dhcp/o;->enter()V

    const/16 v0, 0x7d0

    iput v0, p0, Landroid/net/dhcp/p;->dE:I

    iget v0, p0, Landroid/net/dhcp/p;->dF:I

    if-lez v0, :cond_0

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget v2, p0, Landroid/net/dhcp/p;->dF:I

    int-to-long v2, v2

    add-long/2addr v0, v2

    iget-object v2, p0, Landroid/net/dhcp/p;->dB:Landroid/net/dhcp/b;

    invoke-static {v2}, Landroid/net/dhcp/b;->n(Landroid/net/dhcp/b;)Lcom/android/internal/util/WakeupMessage;

    move-result-object v2

    invoke-virtual {v2, v0, v1}, Lcom/android/internal/util/WakeupMessage;->schedule(J)V

    :cond_0
    iget-object v0, p0, Landroid/net/dhcp/p;->dB:Landroid/net/dhcp/b;

    const v1, 0x30065

    invoke-virtual {v0, v1}, Landroid/net/dhcp/b;->sendMessage(I)V

    return-void
.end method

.method public exit()V
    .locals 1

    invoke-super {p0}, Landroid/net/dhcp/o;->exit()V

    iget-object v0, p0, Landroid/net/dhcp/p;->dB:Landroid/net/dhcp/b;

    invoke-static {v0}, Landroid/net/dhcp/b;->m(Landroid/net/dhcp/b;)Lcom/android/internal/util/WakeupMessage;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/util/WakeupMessage;->cancel()V

    iget-object v0, p0, Landroid/net/dhcp/p;->dB:Landroid/net/dhcp/b;

    invoke-static {v0}, Landroid/net/dhcp/b;->n(Landroid/net/dhcp/b;)Lcom/android/internal/util/WakeupMessage;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/util/WakeupMessage;->cancel()V

    return-void
.end method

.method public processMessage(Landroid/os/Message;)Z
    .locals 8

    invoke-super {p0, p1}, Landroid/net/dhcp/o;->processMessage(Landroid/os/Message;)Z

    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x1

    packed-switch v0, :pswitch_data_0

    const/4 p1, 0x0

    return p1

    :pswitch_0
    invoke-virtual {p0}, Landroid/net/dhcp/p;->Q()V

    return v1

    :pswitch_1
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Landroid/net/dhcp/DhcpPacket;

    invoke-virtual {p0, p1}, Landroid/net/dhcp/p;->c(Landroid/net/dhcp/DhcpPacket;)V

    return v1

    :pswitch_2
    invoke-virtual {p0}, Landroid/net/dhcp/p;->O()Z

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    iget p1, p0, Landroid/net/dhcp/p;->dE:I

    div-int/lit8 v0, p1, 0xa

    iget-object v4, p0, Landroid/net/dhcp/p;->dB:Landroid/net/dhcp/b;

    invoke-static {v4}, Landroid/net/dhcp/b;->o(Landroid/net/dhcp/b;)Ljava/util/Random;

    move-result-object v4

    const/4 v5, 0x2

    mul-int v6, v5, v0

    invoke-virtual {v4, v6}, Ljava/util/Random;->nextInt(I)I

    move-result v4

    sub-int/2addr v4, v0

    add-int/2addr p1, v4

    int-to-long v6, p1

    add-long/2addr v2, v6

    iget-object p1, p0, Landroid/net/dhcp/p;->dB:Landroid/net/dhcp/b;

    invoke-static {p1}, Landroid/net/dhcp/b;->m(Landroid/net/dhcp/b;)Lcom/android/internal/util/WakeupMessage;

    move-result-object p1

    invoke-virtual {p1, v2, v3}, Lcom/android/internal/util/WakeupMessage;->schedule(J)V

    iget p1, p0, Landroid/net/dhcp/p;->dE:I

    mul-int/2addr p1, v5

    iput p1, p0, Landroid/net/dhcp/p;->dE:I

    iget p1, p0, Landroid/net/dhcp/p;->dE:I

    const v0, 0x1f400

    if-le p1, v0, :cond_0

    iput v0, p0, Landroid/net/dhcp/p;->dE:I

    :cond_0
    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x30065
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
