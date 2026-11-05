.class public final Lcom/autochips/carplay/b/aa;
.super Lcom/autochips/carplay/av/g;

# interfaces
.implements Lcom/autochips/carplay/b/z;


# static fields
.field static si:Lcom/autochips/carplay/b/aa;


# instance fields
.field private mCarplayMonitor:Lcom/autochips/carplay/service/h;

.field private final mContext:Landroid/content/Context;

.field private rY:Lcom/autochips/carplay/c/a;

.field final sQ:Lcom/autochips/carplay/b/ac;

.field private sR:Z

.field private sS:Landroid/widget/Toast;

.field private sg:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/os/Looper;)V
    .locals 1

    invoke-direct {p0}, Lcom/autochips/carplay/av/g;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/autochips/carplay/b/aa;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    iput-object v0, p0, Lcom/autochips/carplay/b/aa;->rY:Lcom/autochips/carplay/c/a;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/autochips/carplay/b/aa;->sg:Z

    iput-boolean v0, p0, Lcom/autochips/carplay/b/aa;->sR:Z

    iput-object p1, p0, Lcom/autochips/carplay/b/aa;->mContext:Landroid/content/Context;

    new-instance p1, Lcom/autochips/carplay/b/ac;

    invoke-direct {p1, p0, p2}, Lcom/autochips/carplay/b/ac;-><init>(Lcom/autochips/carplay/b/aa;Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/autochips/carplay/b/aa;->sQ:Lcom/autochips/carplay/b/ac;

    new-instance p1, Lcom/autochips/carplay/b/ab;

    invoke-direct {p1, p0}, Lcom/autochips/carplay/b/ab;-><init>(Lcom/autochips/carplay/b/aa;)V

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/b/aa;->setOnStreamListener(Lcom/autochips/carplay/av/e;)V

    return-void
.end method

.method static synthetic a(Lcom/autochips/carplay/b/aa;Landroid/widget/Toast;)Landroid/widget/Toast;
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/b/aa;->sS:Landroid/widget/Toast;

    return-object p1
.end method

.method static synthetic a(Lcom/autochips/carplay/b/aa;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/autochips/carplay/b/aa;->sg:Z

    return p0
.end method

.method static synthetic a(Lcom/autochips/carplay/b/aa;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/autochips/carplay/b/aa;->sg:Z

    return p1
.end method

.method static synthetic ac(I)Z
    .locals 1

    const/16 v0, 0x6e

    if-ne v0, p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method static synthetic b(Lcom/autochips/carplay/b/aa;)Lcom/autochips/carplay/c/a;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/b/aa;->rY:Lcom/autochips/carplay/c/a;

    return-object p0
.end method

.method static synthetic c(Lcom/autochips/carplay/b/aa;)Z
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/autochips/carplay/b/aa;->sR:Z

    return v0
.end method

.method static synthetic d(Lcom/autochips/carplay/b/aa;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/autochips/carplay/b/aa;->sR:Z

    return p0
.end method

.method static synthetic e(Lcom/autochips/carplay/b/aa;)Landroid/widget/Toast;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/b/aa;->sS:Landroid/widget/Toast;

    return-object p0
.end method

.method static synthetic f(Lcom/autochips/carplay/b/aa;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/b/aa;->mContext:Landroid/content/Context;

    return-object p0
.end method


# virtual methods
.method public final W(I)V
    .locals 1

    if-eqz p1, :cond_1

    const/4 v0, 0x2

    if-eq p1, v0, :cond_0

    return-void

    :cond_0
    iget-object p1, p0, Lcom/autochips/carplay/b/aa;->sQ:Lcom/autochips/carplay/b/ac;

    const/16 v0, 0xe

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/b/ac;->sendMessage(I)V

    return-void

    :cond_1
    iget-object p1, p0, Lcom/autochips/carplay/b/aa;->sQ:Lcom/autochips/carplay/b/ac;

    const/16 v0, 0xf

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/b/ac;->sendMessage(I)V

    return-void
.end method

.method public final a(Lcom/autochips/carplay/service/h;Lcom/autochips/carplay/c/a;)V
    .locals 1

    iput-object p1, p0, Lcom/autochips/carplay/b/aa;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    iput-object p2, p0, Lcom/autochips/carplay/b/aa;->rY:Lcom/autochips/carplay/c/a;

    iget-object p1, p0, Lcom/autochips/carplay/b/aa;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/autochips/carplay/b/aa;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    const/16 p2, 0x901

    iget-object v0, p0, Lcom/autochips/carplay/b/aa;->sQ:Lcom/autochips/carplay/b/ac;

    invoke-virtual {v0}, Lcom/autochips/carplay/b/ac;->getHandler()Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/b/aa;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    const/16 p2, 0x902

    iget-object v0, p0, Lcom/autochips/carplay/b/aa;->sQ:Lcom/autochips/carplay/b/ac;

    invoke-virtual {v0}, Lcom/autochips/carplay/b/ac;->getHandler()Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/b/aa;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    const/16 p2, 0x1001

    iget-object v0, p0, Lcom/autochips/carplay/b/aa;->sQ:Lcom/autochips/carplay/b/ac;

    invoke-virtual {v0}, Lcom/autochips/carplay/b/ac;->getHandler()Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/b/aa;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    const/16 p2, 0x1002

    iget-object v0, p0, Lcom/autochips/carplay/b/aa;->sQ:Lcom/autochips/carplay/b/ac;

    invoke-virtual {v0}, Lcom/autochips/carplay/b/ac;->getHandler()Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/b/aa;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    const/16 p2, 0x1003

    iget-object v0, p0, Lcom/autochips/carplay/b/aa;->sQ:Lcom/autochips/carplay/b/ac;

    invoke-virtual {v0}, Lcom/autochips/carplay/b/ac;->getHandler()Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/b/aa;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    const/16 p2, 0x1004

    iget-object v0, p0, Lcom/autochips/carplay/b/aa;->sQ:Lcom/autochips/carplay/b/ac;

    invoke-virtual {v0}, Lcom/autochips/carplay/b/ac;->getHandler()Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    :cond_0
    return-void
.end method

.method public final disable(I)V
    .locals 2

    iget-object v0, p0, Lcom/autochips/carplay/b/aa;->sQ:Lcom/autochips/carplay/b/ac;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/b/ac;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    iput p1, v0, Landroid/os/Message;->arg1:I

    iget-object p1, p0, Lcom/autochips/carplay/b/aa;->sQ:Lcom/autochips/carplay/b/ac;

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/b/ac;->sendMessage(Landroid/os/Message;)V

    return-void
.end method
