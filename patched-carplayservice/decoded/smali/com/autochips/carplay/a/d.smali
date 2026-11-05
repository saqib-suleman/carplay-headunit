.class final Lcom/autochips/carplay/a/d;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/autochips/carplay/a/h;


# instance fields
.field final synthetic rc:Lcom/autochips/carplay/a/a;


# direct methods
.method private constructor <init>(Lcom/autochips/carplay/a/a;)V
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/a/d;->rc:Lcom/autochips/carplay/a/a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/autochips/carplay/a/a;B)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/autochips/carplay/a/d;-><init>(Lcom/autochips/carplay/a/a;)V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/autochips/carplay/a/d;->rc:Lcom/autochips/carplay/a/a;

    invoke-static {v0}, Lcom/autochips/carplay/a/a;->a(Lcom/autochips/carplay/a/a;)I

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    return-void

    :cond_1
    new-instance v0, Lvendor/autochips/hardware/iap/V1_0/IAPDev;

    invoke-direct {v0}, Lvendor/autochips/hardware/iap/V1_0/IAPDev;-><init>()V

    iput-object p2, v0, Lvendor/autochips/hardware/iap/V1_0/IAPDev;->id:Ljava/lang/String;

    const/4 p2, 0x0

    iput p2, v0, Lvendor/autochips/hardware/iap/V1_0/IAPDev;->clientType:I

    iput p2, v0, Lvendor/autochips/hardware/iap/V1_0/IAPDev;->transportType:I

    :try_start_0
    iget-object p2, p0, Lcom/autochips/carplay/a/d;->rc:Lcom/autochips/carplay/a/a;

    invoke-static {p2}, Lcom/autochips/carplay/a/a;->b(Lcom/autochips/carplay/a/a;)Lvendor/autochips/hardware/iap/V1_0/IIAPCarplay;

    move-result-object p2

    invoke-interface {p2, v0, p1}, Lvendor/autochips/hardware/iap/V1_0/IIAPCarplay;->updateLocationInfo(Lvendor/autochips/hardware/iap/V1_0/IAPDev;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    const-string p2, "CarplayIAP2Adapter"

    const-string v0, ""

    invoke-static {p2, v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method
