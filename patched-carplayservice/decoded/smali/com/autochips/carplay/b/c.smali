.class final Lcom/autochips/carplay/b/c;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/autochips/backcar/BackCar$Listener;


# instance fields
.field final synthetic rX:Lcom/autochips/carplay/b/a;


# direct methods
.method constructor <init>(Lcom/autochips/carplay/b/a;)V
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/b/c;->rX:Lcom/autochips/carplay/b/a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onEvent(III)V
    .locals 2

    const-string p3, "BackcarMonitor"

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "onEvent evt: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p3, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p3, 0x3

    const/4 v0, 0x1

    const/4 v1, 0x2

    if-ne v1, p1, :cond_1

    if-eqz p2, :cond_0

    iget-object p1, p0, Lcom/autochips/carplay/b/c;->rX:Lcom/autochips/carplay/b/a;

    invoke-static {p1}, Lcom/autochips/carplay/b/a;->f(Lcom/autochips/carplay/b/a;)Landroid/os/Handler;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void

    :cond_0
    iget-object p1, p0, Lcom/autochips/carplay/b/c;->rX:Lcom/autochips/carplay/b/a;

    invoke-static {p1}, Lcom/autochips/carplay/b/a;->f(Lcom/autochips/carplay/b/a;)Landroid/os/Handler;

    move-result-object p1

    invoke-virtual {p1, p3}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void

    :cond_1
    if-ne v0, p1, :cond_3

    if-eqz p2, :cond_2

    iget-object p1, p0, Lcom/autochips/carplay/b/c;->rX:Lcom/autochips/carplay/b/a;

    invoke-static {p1}, Lcom/autochips/carplay/b/a;->f(Lcom/autochips/carplay/b/a;)Landroid/os/Handler;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void

    :cond_2
    iget-object p1, p0, Lcom/autochips/carplay/b/c;->rX:Lcom/autochips/carplay/b/a;

    invoke-static {p1}, Lcom/autochips/carplay/b/a;->f(Lcom/autochips/carplay/b/a;)Landroid/os/Handler;

    move-result-object p1

    invoke-virtual {p1, p3}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void

    :cond_3
    const/4 p2, 0x4

    if-nez p1, :cond_4

    iget-object p1, p0, Lcom/autochips/carplay/b/c;->rX:Lcom/autochips/carplay/b/a;

    invoke-static {p1}, Lcom/autochips/carplay/b/a;->f(Lcom/autochips/carplay/b/a;)Landroid/os/Handler;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void

    :cond_4
    if-ne p2, p1, :cond_5

    iget-object p1, p0, Lcom/autochips/carplay/b/c;->rX:Lcom/autochips/carplay/b/a;

    invoke-static {p1}, Lcom/autochips/carplay/b/a;->f(Lcom/autochips/carplay/b/a;)Landroid/os/Handler;

    move-result-object p1

    const/4 p2, 0x6

    invoke-virtual {p1, p2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void

    :cond_5
    const-string p1, "BackcarMonitor"

    const-string p2, "unknown msg"

    invoke-static {p1, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
