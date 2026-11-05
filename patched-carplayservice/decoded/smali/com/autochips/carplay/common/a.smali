.class public abstract Lcom/autochips/carplay/common/a;
.super Landroid/os/Handler;


# instance fields
.field TAG:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/os/Looper;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    const-string p1, "CarplayAdapter"

    iput-object p1, p0, Lcom/autochips/carplay/common/a;->TAG:Ljava/lang/String;

    return-void
.end method

.method protected static V(I)V
    .locals 1

    invoke-static {}, Lcom/autochips/carplay/service/g;->dx()Lcom/autochips/carplay/service/g;

    move-result-object v0

    invoke-virtual {v0}, Lcom/autochips/carplay/service/g;->dz()Lcom/autochips/carplay/service/h;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/autochips/carplay/service/h;->sendMessage(I)V

    return-void
.end method
