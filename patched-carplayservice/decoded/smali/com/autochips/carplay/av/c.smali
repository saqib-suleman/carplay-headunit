.class final Lcom/autochips/carplay/av/c;
.super Landroid/os/Handler;


# instance fields
.field private qp:Lcom/autochips/carplay/av/StreamController;

.field final synthetic qq:Lcom/autochips/carplay/av/StreamController;


# direct methods
.method public constructor <init>(Lcom/autochips/carplay/av/StreamController;Lcom/autochips/carplay/av/StreamController;Landroid/os/Looper;)V
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/av/c;->qq:Lcom/autochips/carplay/av/StreamController;

    invoke-direct {p0, p3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object p2, p0, Lcom/autochips/carplay/av/c;->qp:Lcom/autochips/carplay/av/StreamController;

    return-void
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)V
    .locals 4

    iget-object v0, p0, Lcom/autochips/carplay/av/c;->qp:Lcom/autochips/carplay/av/StreamController;

    invoke-static {v0}, Lcom/autochips/carplay/av/StreamController;->access$000(Lcom/autochips/carplay/av/StreamController;)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const-string v0, "StreamController"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "streamCtl went away with unhandled events: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget p1, p1, Landroid/os/Message;->what:I

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    const-string v0, "StreamController"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Unkonwn message type"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget p1, p1, Landroid/os/Message;->what:I

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :pswitch_0
    iget-object v0, p0, Lcom/autochips/carplay/av/c;->qq:Lcom/autochips/carplay/av/StreamController;

    invoke-static {v0}, Lcom/autochips/carplay/av/StreamController;->access$300(Lcom/autochips/carplay/av/StreamController;)Lcom/autochips/carplay/av/d;

    move-result-object v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/autochips/carplay/av/c;->qq:Lcom/autochips/carplay/av/StreamController;

    invoke-static {v0}, Lcom/autochips/carplay/av/StreamController;->access$300(Lcom/autochips/carplay/av/StreamController;)Lcom/autochips/carplay/av/d;

    move-result-object v0

    iget v1, p1, Landroid/os/Message;->arg1:I

    iget p1, p1, Landroid/os/Message;->arg2:I

    invoke-interface {v0}, Lcom/autochips/carplay/av/d;->cP()Z

    move-result p1

    if-nez p1, :cond_4

    const-string p1, "StreamController"

    const-string v0, "not handle"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :pswitch_1
    iget-object v0, p0, Lcom/autochips/carplay/av/c;->qq:Lcom/autochips/carplay/av/StreamController;

    invoke-static {v0}, Lcom/autochips/carplay/av/StreamController;->access$300(Lcom/autochips/carplay/av/StreamController;)Lcom/autochips/carplay/av/d;

    move-result-object v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/autochips/carplay/av/c;->qq:Lcom/autochips/carplay/av/StreamController;

    invoke-static {v0}, Lcom/autochips/carplay/av/StreamController;->access$300(Lcom/autochips/carplay/av/StreamController;)Lcom/autochips/carplay/av/d;

    move-result-object v0

    iget v1, p1, Landroid/os/Message;->arg1:I

    iget p1, p1, Landroid/os/Message;->arg2:I

    invoke-interface {v0}, Lcom/autochips/carplay/av/d;->cP()Z

    move-result p1

    if-nez p1, :cond_4

    const-string p1, "StreamController"

    const-string v0, "not handle"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :pswitch_2
    iget-object v0, p0, Lcom/autochips/carplay/av/c;->qq:Lcom/autochips/carplay/av/StreamController;

    invoke-static {v0}, Lcom/autochips/carplay/av/StreamController;->access$300(Lcom/autochips/carplay/av/StreamController;)Lcom/autochips/carplay/av/d;

    move-result-object v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/autochips/carplay/av/c;->qq:Lcom/autochips/carplay/av/StreamController;

    invoke-static {v0}, Lcom/autochips/carplay/av/StreamController;->access$300(Lcom/autochips/carplay/av/StreamController;)Lcom/autochips/carplay/av/d;

    move-result-object v0

    iget v1, p1, Landroid/os/Message;->arg1:I

    iget p1, p1, Landroid/os/Message;->arg2:I

    invoke-interface {v0}, Lcom/autochips/carplay/av/d;->cP()Z

    move-result p1

    if-nez p1, :cond_4

    const-string p1, "StreamController"

    const-string v0, "not handle"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :pswitch_3
    iget-object v0, p0, Lcom/autochips/carplay/av/c;->qq:Lcom/autochips/carplay/av/StreamController;

    invoke-static {v0}, Lcom/autochips/carplay/av/StreamController;->access$300(Lcom/autochips/carplay/av/StreamController;)Lcom/autochips/carplay/av/d;

    move-result-object v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/autochips/carplay/av/c;->qq:Lcom/autochips/carplay/av/StreamController;

    invoke-static {v0}, Lcom/autochips/carplay/av/StreamController;->access$300(Lcom/autochips/carplay/av/StreamController;)Lcom/autochips/carplay/av/d;

    move-result-object v0

    iget v1, p1, Landroid/os/Message;->arg1:I

    iget p1, p1, Landroid/os/Message;->arg2:I

    invoke-interface {v0}, Lcom/autochips/carplay/av/d;->cP()Z

    move-result p1

    if-nez p1, :cond_4

    const-string p1, "StreamController"

    const-string v0, "not handle"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :pswitch_4
    iget-object v0, p0, Lcom/autochips/carplay/av/c;->qq:Lcom/autochips/carplay/av/StreamController;

    invoke-static {v0}, Lcom/autochips/carplay/av/StreamController;->access$200(Lcom/autochips/carplay/av/StreamController;)Lcom/autochips/carplay/av/e;

    move-result-object v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/autochips/carplay/av/c;->qq:Lcom/autochips/carplay/av/StreamController;

    invoke-static {v0}, Lcom/autochips/carplay/av/StreamController;->access$200(Lcom/autochips/carplay/av/StreamController;)Lcom/autochips/carplay/av/e;

    move-result-object v0

    iget v1, p1, Landroid/os/Message;->arg1:I

    iget p1, p1, Landroid/os/Message;->arg2:I

    invoke-interface {v0, v1, p1}, Lcom/autochips/carplay/av/e;->onError(II)V

    const-string p1, "StreamController"

    const-string v0, "stream error"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :pswitch_5
    iget-object v0, p0, Lcom/autochips/carplay/av/c;->qq:Lcom/autochips/carplay/av/StreamController;

    invoke-static {v0}, Lcom/autochips/carplay/av/StreamController;->access$100(Lcom/autochips/carplay/av/StreamController;)Lcom/autochips/carplay/av/f;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/autochips/carplay/av/c;->qq:Lcom/autochips/carplay/av/StreamController;

    invoke-static {v0}, Lcom/autochips/carplay/av/StreamController;->access$100(Lcom/autochips/carplay/av/StreamController;)Lcom/autochips/carplay/av/f;

    move-result-object v0

    iget v1, p1, Landroid/os/Message;->arg1:I

    invoke-interface {v0, v1}, Lcom/autochips/carplay/av/f;->U(I)V

    :cond_1
    iget-object v0, p0, Lcom/autochips/carplay/av/c;->qq:Lcom/autochips/carplay/av/StreamController;

    invoke-static {v0}, Lcom/autochips/carplay/av/StreamController;->access$200(Lcom/autochips/carplay/av/StreamController;)Lcom/autochips/carplay/av/e;

    move-result-object v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/autochips/carplay/av/c;->qq:Lcom/autochips/carplay/av/StreamController;

    invoke-static {v0}, Lcom/autochips/carplay/av/StreamController;->access$200(Lcom/autochips/carplay/av/StreamController;)Lcom/autochips/carplay/av/e;

    move-result-object v0

    iget v1, p1, Landroid/os/Message;->arg1:I

    iget p1, p1, Landroid/os/Message;->arg2:I

    invoke-interface {v0, v1, p1}, Lcom/autochips/carplay/av/e;->i(II)V

    const-string p1, "StreamController"

    const-string v0, "stream destroyed"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :pswitch_6
    iget-object v0, p0, Lcom/autochips/carplay/av/c;->qq:Lcom/autochips/carplay/av/StreamController;

    invoke-static {v0}, Lcom/autochips/carplay/av/StreamController;->access$100(Lcom/autochips/carplay/av/StreamController;)Lcom/autochips/carplay/av/f;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/autochips/carplay/av/c;->qq:Lcom/autochips/carplay/av/StreamController;

    invoke-static {v0}, Lcom/autochips/carplay/av/StreamController;->access$100(Lcom/autochips/carplay/av/StreamController;)Lcom/autochips/carplay/av/f;

    move-result-object v0

    iget v1, p1, Landroid/os/Message;->arg1:I

    invoke-interface {v0, v1}, Lcom/autochips/carplay/av/f;->T(I)V

    :cond_2
    iget-object v0, p0, Lcom/autochips/carplay/av/c;->qq:Lcom/autochips/carplay/av/StreamController;

    invoke-static {v0}, Lcom/autochips/carplay/av/StreamController;->access$200(Lcom/autochips/carplay/av/StreamController;)Lcom/autochips/carplay/av/e;

    move-result-object v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/autochips/carplay/av/c;->qq:Lcom/autochips/carplay/av/StreamController;

    invoke-static {v0}, Lcom/autochips/carplay/av/StreamController;->access$200(Lcom/autochips/carplay/av/StreamController;)Lcom/autochips/carplay/av/e;

    move-result-object v0

    iget v1, p1, Landroid/os/Message;->arg1:I

    iget v2, p1, Landroid/os/Message;->arg2:I

    invoke-interface {v0, v1, v2}, Lcom/autochips/carplay/av/e;->h(II)V

    iget v0, p1, Landroid/os/Message;->arg1:I

    const/16 v1, 0x64

    if-eq v0, v1, :cond_3

    iget v0, p1, Landroid/os/Message;->arg1:I

    const/16 v1, 0x65

    if-ne v0, v1, :cond_4

    :cond_3
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-eqz v0, :cond_4

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    instance-of v0, v0, Landroid/os/Parcel;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/autochips/carplay/av/c;->qq:Lcom/autochips/carplay/av/StreamController;

    invoke-static {v0}, Lcom/autochips/carplay/av/StreamController;->access$200(Lcom/autochips/carplay/av/StreamController;)Lcom/autochips/carplay/av/e;

    move-result-object v0

    iget v1, p1, Landroid/os/Message;->arg1:I

    iget v2, p1, Landroid/os/Message;->arg2:I

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Landroid/os/Parcel;

    invoke-interface {v0, v1, v2, p1}, Lcom/autochips/carplay/av/e;->a(IILandroid/os/Parcel;)V

    :cond_4
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
