.class public Lcom/autochips/carplay/common/c;
.super Lcom/autochips/carplay/common/a;


# instance fields
.field private final mContext:Landroid/content/Context;

.field private qy:Landroid/net/nsd/NsdManager;

.field private qz:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/os/Looper;)V
    .locals 0

    invoke-direct {p0, p2}, Lcom/autochips/carplay/common/a;-><init>(Landroid/os/Looper;)V

    const/4 p2, 0x0

    iput-object p2, p0, Lcom/autochips/carplay/common/c;->qy:Landroid/net/nsd/NsdManager;

    const/4 p2, 0x0

    iput p2, p0, Lcom/autochips/carplay/common/c;->qz:I

    iput-object p1, p0, Lcom/autochips/carplay/common/c;->mContext:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3

    const-string v0, "CarplayNsdAdapter"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "handleMessage, what: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p1, Landroid/os/Message;->what:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    const-string v0, "CarplayNsdAdapter"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "CarplayNSDAdapter.handleMessage ignoring msg="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :pswitch_0
    iget-object p1, p0, Lcom/autochips/carplay/common/c;->qy:Landroid/net/nsd/NsdManager;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/autochips/carplay/common/c;->qy:Landroid/net/nsd/NsdManager;

    invoke-virtual {p1}, Landroid/net/nsd/NsdManager;->disconnect()V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/autochips/carplay/common/c;->qy:Landroid/net/nsd/NsdManager;

    :cond_0
    const/16 p1, 0x602

    invoke-static {p1}, Lcom/autochips/carplay/common/c;->V(I)V

    return-void

    :pswitch_1
    const-string p1, "CarplayNsdAdapter"

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "mNsdManager +++:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/autochips/carplay/common/c;->qy:Landroid/net/nsd/NsdManager;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/autochips/carplay/common/c;->mContext:Landroid/content/Context;

    const-string v0, "servicediscovery"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/net/nsd/NsdManager;

    iput-object p1, p0, Lcom/autochips/carplay/common/c;->qy:Landroid/net/nsd/NsdManager;

    const-string p1, "CarplayNsdAdapter"

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "mNsdManager ---:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/autochips/carplay/common/c;->qy:Landroid/net/nsd/NsdManager;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/autochips/carplay/common/c;->qy:Landroid/net/nsd/NsdManager;

    if-eqz p1, :cond_1

    const/4 p1, 0x0

    iput p1, p0, Lcom/autochips/carplay/common/c;->qz:I

    const/16 p1, 0x601

    invoke-static {p1}, Lcom/autochips/carplay/common/c;->V(I)V

    return-void

    :cond_1
    iget p1, p0, Lcom/autochips/carplay/common/c;->qz:I

    const/4 v0, 0x3

    if-ge p1, v0, :cond_2

    iget p1, p0, Lcom/autochips/carplay/common/c;->qz:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/autochips/carplay/common/c;->qz:I

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/common/c;->obtainMessage(I)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/common/c;->sendMessage(Landroid/os/Message;)Z

    return-void

    :cond_2
    const/16 p1, 0x603

    invoke-static {p1}, Lcom/autochips/carplay/common/c;->V(I)V

    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
