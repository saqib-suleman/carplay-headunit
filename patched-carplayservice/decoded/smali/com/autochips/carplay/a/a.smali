.class public Lcom/autochips/carplay/a/a;
.super Lcom/autochips/carplay/common/a;


# static fields
.field private static final qZ:Ljava/lang/String;

.field private static final ra:Z

.field private static final rb:Ljava/lang/String;


# instance fields
.field private final mContext:Landroid/content/Context;

.field private mEnabled:Z

.field private final qT:Lcom/autochips/carplay/a/c;

.field private qU:Lvendor/autochips/hardware/iap/V1_0/IIAPService;

.field private qV:Lvendor/autochips/hardware/iap/V1_0/IIAPCarplay;

.field private qW:I

.field private qX:Lcom/autochips/carplay/a/e;

.field private qY:Lcom/autochips/carplay/a/d;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    sget-object v0, Landroid/os/Build;->SERIAL:Ljava/lang/String;

    sput-object v0, Lcom/autochips/carplay/a/a;->qZ:Ljava/lang/String;

    const-string v0, "persist.carplay.uuid.enable"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lcom/autochips/carplay/a/a;->ra:Z

    const-string v0, "persist.carplay.uuid.value"

    const-string v1, ""

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/autochips/carplay/a/a;->rb:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/os/Looper;)V
    .locals 1

    invoke-direct {p0, p2}, Lcom/autochips/carplay/common/a;-><init>(Landroid/os/Looper;)V

    const/4 p2, 0x0

    iput-boolean p2, p0, Lcom/autochips/carplay/a/a;->mEnabled:Z

    iput p2, p0, Lcom/autochips/carplay/a/a;->qW:I

    iput-object p1, p0, Lcom/autochips/carplay/a/a;->mContext:Landroid/content/Context;

    new-instance p1, Lcom/autochips/carplay/a/c;

    invoke-direct {p1, p0}, Lcom/autochips/carplay/a/c;-><init>(Lcom/autochips/carplay/a/a;)V

    iput-object p1, p0, Lcom/autochips/carplay/a/a;->qT:Lcom/autochips/carplay/a/c;

    new-instance p1, Lcom/autochips/carplay/a/d;

    invoke-direct {p1, p0, p2}, Lcom/autochips/carplay/a/d;-><init>(Lcom/autochips/carplay/a/a;B)V

    iput-object p1, p0, Lcom/autochips/carplay/a/a;->qY:Lcom/autochips/carplay/a/d;

    new-instance p1, Lcom/autochips/carplay/a/e;

    iget-object p2, p0, Lcom/autochips/carplay/a/a;->mContext:Landroid/content/Context;

    iget-object v0, p0, Lcom/autochips/carplay/a/a;->qY:Lcom/autochips/carplay/a/d;

    invoke-direct {p1, p2, v0}, Lcom/autochips/carplay/a/e;-><init>(Landroid/content/Context;Lcom/autochips/carplay/a/h;)V

    iput-object p1, p0, Lcom/autochips/carplay/a/a;->qX:Lcom/autochips/carplay/a/e;

    return-void
.end method

.method static synthetic a(Lcom/autochips/carplay/a/a;)I
    .locals 1

    iget-object p0, p0, Lcom/autochips/carplay/a/a;->qV:Lvendor/autochips/hardware/iap/V1_0/IIAPCarplay;

    if-nez p0, :cond_0

    const-string p0, "CarplayIAP2Adapter"

    const-string v0, "Proxy not attached to service"

    invoke-static {p0, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p0, -0x2

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method static synthetic b(Lcom/autochips/carplay/a/a;)Lvendor/autochips/hardware/iap/V1_0/IIAPCarplay;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/a/a;->qV:Lvendor/autochips/hardware/iap/V1_0/IIAPCarplay;

    return-object p0
.end method

.method private cW()I
    .locals 6

    const-string v0, "CarplayIAP2Adapter"

    const-string v1, "enableIAP2"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    const/4 v1, -0x1

    :try_start_0
    invoke-static {}, Lvendor/autochips/hardware/iap/V1_0/IIAPService;->getService()Lvendor/autochips/hardware/iap/V1_0/IIAPService;

    move-result-object v2

    iput-object v2, p0, Lcom/autochips/carplay/a/a;->qU:Lvendor/autochips/hardware/iap/V1_0/IIAPService;

    iget-object v2, p0, Lcom/autochips/carplay/a/a;->qU:Lvendor/autochips/hardware/iap/V1_0/IIAPService;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/autochips/carplay/a/a;->qU:Lvendor/autochips/hardware/iap/V1_0/IIAPService;

    iget-object v3, p0, Lcom/autochips/carplay/a/a;->qT:Lcom/autochips/carplay/a/c;

    const-wide/16 v4, 0x0

    invoke-interface {v2, v3, v4, v5}, Lvendor/autochips/hardware/iap/V1_0/IIAPService;->linkToDeath(Landroid/os/IHwBinder$DeathRecipient;J)Z

    new-instance v2, Lcom/autochips/carplay/a/b;

    invoke-direct {v2, p0, v0}, Lcom/autochips/carplay/a/b;-><init>(Lcom/autochips/carplay/a/a;B)V

    invoke-virtual {v2}, Lcom/autochips/carplay/a/b;->asBinder()Landroid/os/IHwBinder;

    move-result-object v2

    invoke-static {v2}, Lvendor/autochips/hardware/iap/V1_0/IIAPClient;->asInterface(Landroid/os/IHwBinder;)Lvendor/autochips/hardware/iap/V1_0/IIAPClient;

    move-result-object v2

    iget-object v3, p0, Lcom/autochips/carplay/a/a;->qU:Lvendor/autochips/hardware/iap/V1_0/IIAPService;

    invoke-interface {v3, v2}, Lvendor/autochips/hardware/iap/V1_0/IIAPService;->createCarplay(Lvendor/autochips/hardware/iap/V1_0/IIAPClient;)Lvendor/autochips/hardware/iap/V1_0/IIAPCarplay;

    move-result-object v2

    iput-object v2, p0, Lcom/autochips/carplay/a/a;->qV:Lvendor/autochips/hardware/iap/V1_0/IIAPCarplay;

    iget-object v2, p0, Lcom/autochips/carplay/a/a;->qV:Lvendor/autochips/hardware/iap/V1_0/IIAPCarplay;

    if-eqz v2, :cond_0

    const-string v2, "CarplayIAP2Adapter"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "enableIAP2, mCarplay:"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/autochips/carplay/a/a;->qV:Lvendor/autochips/hardware/iap/V1_0/IIAPCarplay;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v2, Lcom/autochips/carplay/a/a;->qZ:Ljava/lang/String;

    const-string v3, "CarplayIAP2Adapter"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "ro.serialno:"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v3, p0, Lcom/autochips/carplay/a/a;->qV:Lvendor/autochips/hardware/iap/V1_0/IIAPCarplay;

    const/4 v4, 0x7

    invoke-interface {v3, v4, v2, v0}, Lvendor/autochips/hardware/iap/V1_0/IIAPCarplay;->setDeviceConfigInfo(ILjava/lang/String;Z)I

    iget-object v2, p0, Lcom/autochips/carplay/a/a;->qV:Lvendor/autochips/hardware/iap/V1_0/IIAPCarplay;

    const/16 v3, 0x14

    const-string v4, ""

    const/4 v5, 0x1

    invoke-interface {v2, v3, v4, v5}, Lvendor/autochips/hardware/iap/V1_0/IIAPCarplay;->setDeviceConfigInfo(ILjava/lang/String;Z)I

    iget-object v2, p0, Lcom/autochips/carplay/a/a;->qV:Lvendor/autochips/hardware/iap/V1_0/IIAPCarplay;

    const/16 v3, 0x15

    const-string v4, ""

    invoke-interface {v2, v3, v4, v5}, Lvendor/autochips/hardware/iap/V1_0/IIAPCarplay;->setDeviceConfigInfo(ILjava/lang/String;Z)I

    iget-object v2, p0, Lcom/autochips/carplay/a/a;->qV:Lvendor/autochips/hardware/iap/V1_0/IIAPCarplay;

    const/16 v3, 0x16

    const-string v4, ""

    invoke-interface {v2, v3, v4, v5}, Lvendor/autochips/hardware/iap/V1_0/IIAPCarplay;->setDeviceConfigInfo(ILjava/lang/String;Z)I

    iget-object v2, p0, Lcom/autochips/carplay/a/a;->qV:Lvendor/autochips/hardware/iap/V1_0/IIAPCarplay;

    const/16 v3, 0x8

    sget-object v4, Lcom/autochips/carplay/a/a;->rb:Ljava/lang/String;

    sget-boolean v5, Lcom/autochips/carplay/a/a;->ra:Z

    invoke-interface {v2, v3, v4, v5}, Lvendor/autochips/hardware/iap/V1_0/IIAPCarplay;->setDeviceConfigInfo(ILjava/lang/String;Z)I

    move v1, v0

    return v1

    :cond_0
    const-string v0, "CarplayIAP2Adapter"

    const-string v2, "enableIAP2 fail, carplay obj is null"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    :cond_1
    const-string v0, "CarplayIAP2Adapter"

    const-string v2, "iap service is null"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v1

    :catch_0
    move-exception v0

    const-string v2, "CarplayIAP2Adapter"

    const-string v3, ""

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return v1
.end method

.method private cX()I
    .locals 4

    const-string v0, "CarplayIAP2Adapter"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "disableIAP2, mCarplay:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/autochips/carplay/a/a;->qV:Lvendor/autochips/hardware/iap/V1_0/IIAPCarplay;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Lcom/autochips/carplay/a/a;->qV:Lvendor/autochips/hardware/iap/V1_0/IIAPCarplay;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/autochips/carplay/a/a;->qU:Lvendor/autochips/hardware/iap/V1_0/IIAPService;

    iget-object v2, p0, Lcom/autochips/carplay/a/a;->qV:Lvendor/autochips/hardware/iap/V1_0/IIAPCarplay;

    invoke-interface {v1, v2}, Lvendor/autochips/hardware/iap/V1_0/IIAPService;->destroyCarplay(Lvendor/autochips/hardware/iap/V1_0/IIAPCarplay;)I

    iput-object v0, p0, Lcom/autochips/carplay/a/a;->qV:Lvendor/autochips/hardware/iap/V1_0/IIAPCarplay;

    :cond_0
    iget-object v1, p0, Lcom/autochips/carplay/a/a;->qU:Lvendor/autochips/hardware/iap/V1_0/IIAPService;

    iget-object v2, p0, Lcom/autochips/carplay/a/a;->qT:Lcom/autochips/carplay/a/c;

    invoke-interface {v1, v2}, Lvendor/autochips/hardware/iap/V1_0/IIAPService;->unlinkToDeath(Landroid/os/IHwBinder$DeathRecipient;)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v1, 0x0

    goto :goto_1

    :catch_0
    move-exception v1

    const-string v2, "CarplayIAP2Adapter"

    const-string v3, ""

    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    :catch_1
    move-exception v1

    invoke-virtual {v1}, Landroid/os/RemoteException;->printStackTrace()V

    :goto_0
    const/4 v1, -0x1

    :goto_1
    iput-object v0, p0, Lcom/autochips/carplay/a/a;->qU:Lvendor/autochips/hardware/iap/V1_0/IIAPService;

    return v1
.end method

.method private cY()I
    .locals 4

    iget v0, p0, Lcom/autochips/carplay/a/a;->qW:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/autochips/carplay/a/a;->qW:I

    const/4 v1, 0x0

    const/4 v2, 0x6

    if-ge v0, v2, :cond_0

    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/a/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    const-wide/16 v2, 0x1f4

    invoke-virtual {p0, v0, v2, v3}, Lcom/autochips/carplay/a/a;->sendMessageDelayed(Landroid/os/Message;J)Z

    move-result v0

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    if-eqz v0, :cond_1

    return v1

    :cond_1
    const/4 v0, -0x1

    return v0
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 5

    const-string v0, "CarplayIAP2Adapter"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "handleMessage, what:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p1, Landroid/os/Message;->what:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x532

    if-eq v0, v1, :cond_6

    const/16 v1, 0x502

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_0

    packed-switch v0, :pswitch_data_1

    packed-switch v0, :pswitch_data_2

    packed-switch v0, :pswitch_data_3

    packed-switch v0, :pswitch_data_4

    const-string v0, "CarplayIAP2Adapter"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "ignoring msg="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :pswitch_0
    iget v0, p1, Landroid/os/Message;->arg1:I

    iget v1, p1, Landroid/os/Message;->arg2:I

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    const-string v2, "CarplayIAP2Adapter"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "updateLocationChange, locationChange="

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ", deviceID = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ", locationDataType = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v2, p0, Lcom/autochips/carplay/a/a;->qX:Lcom/autochips/carplay/a/e;

    invoke-virtual {v2, v1, p1}, Lcom/autochips/carplay/a/e;->e(ILjava/lang/String;)V

    packed-switch v0, :pswitch_data_5

    const-string p1, "CarplayIAP2Adapter"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Info not support"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :pswitch_1
    iget-object p1, p0, Lcom/autochips/carplay/a/a;->qX:Lcom/autochips/carplay/a/e;

    invoke-virtual {p1}, Lcom/autochips/carplay/a/e;->start()Z

    return-void

    :pswitch_2
    iget-object p1, p0, Lcom/autochips/carplay/a/a;->qX:Lcom/autochips/carplay/a/e;

    invoke-virtual {p1}, Lcom/autochips/carplay/a/e;->cZ()Z

    return-void

    :pswitch_3
    iget v0, p1, Landroid/os/Message;->arg1:I

    iget v1, p1, Landroid/os/Message;->arg2:I

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    const-string v2, "CarplayIAP2Adapter"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "updateConnectionState, connectionStatus="

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ", transportType = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ", deviceID = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/16 p1, 0xff

    if-eq v0, p1, :cond_0

    packed-switch v0, :pswitch_data_6

    return-void

    :pswitch_4
    packed-switch v1, :pswitch_data_7

    return-void

    :pswitch_5
    const/16 p1, 0x521

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/a/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/a/a;->sendMessage(Landroid/os/Message;)Z

    return-void

    :pswitch_6
    const/16 p1, 0x517

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/a/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/a/a;->sendMessage(Landroid/os/Message;)Z

    return-void

    :pswitch_7
    const/16 p1, 0x50d

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/a/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/a/a;->sendMessage(Landroid/os/Message;)Z

    return-void

    :pswitch_8
    packed-switch v1, :pswitch_data_8

    return-void

    :pswitch_9
    const/16 p1, 0x520

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/a/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/a/a;->sendMessage(Landroid/os/Message;)Z

    return-void

    :pswitch_a
    const/16 p1, 0x516

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/a/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/a/a;->sendMessage(Landroid/os/Message;)Z

    return-void

    :pswitch_b
    const/16 p1, 0x50c

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/a/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/a/a;->sendMessage(Landroid/os/Message;)Z

    return-void

    :pswitch_c
    packed-switch v1, :pswitch_data_9

    return-void

    :pswitch_d
    const/16 p1, 0x51f

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/a/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/a/a;->sendMessage(Landroid/os/Message;)Z

    return-void

    :pswitch_e
    const/16 p1, 0x515

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/a/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/a/a;->sendMessage(Landroid/os/Message;)Z

    return-void

    :pswitch_f
    const/16 p1, 0x50b

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/a/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/a/a;->sendMessage(Landroid/os/Message;)Z

    return-void

    :pswitch_10
    packed-switch v1, :pswitch_data_a

    return-void

    :pswitch_11
    const/16 p1, 0x51e

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/a/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/a/a;->sendMessage(Landroid/os/Message;)Z

    return-void

    :pswitch_12
    const/16 p1, 0x514

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/a/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/a/a;->sendMessage(Landroid/os/Message;)Z

    return-void

    :pswitch_13
    const/16 p1, 0x50a

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/a/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/a/a;->sendMessage(Landroid/os/Message;)Z

    return-void

    :cond_0
    packed-switch v1, :pswitch_data_b

    return-void

    :pswitch_14
    const/16 p1, 0x522

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/a/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/a/a;->sendMessage(Landroid/os/Message;)Z

    return-void

    :pswitch_15
    const/16 p1, 0x518

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/a/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/a/a;->sendMessage(Landroid/os/Message;)Z

    return-void

    :pswitch_16
    const/16 p1, 0x50e

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/a/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/a/a;->sendMessage(Landroid/os/Message;)Z

    return-void

    :pswitch_17
    iget-boolean p1, p0, Lcom/autochips/carplay/a/a;->mEnabled:Z

    if-eqz p1, :cond_5

    invoke-direct {p0}, Lcom/autochips/carplay/a/a;->cY()I

    move-result p1

    if-eqz p1, :cond_5

    iput-boolean v2, p0, Lcom/autochips/carplay/a/a;->mEnabled:Z

    invoke-static {v1}, Lcom/autochips/carplay/a/a;->V(I)V

    return-void

    :pswitch_18
    const/4 p1, 0x4

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/a/a;->removeMessages(I)V

    iget-boolean p1, p0, Lcom/autochips/carplay/a/a;->mEnabled:Z

    if-eqz p1, :cond_2

    invoke-direct {p0}, Lcom/autochips/carplay/a/a;->cX()I

    move-result p1

    if-nez p1, :cond_1

    goto :goto_0

    :cond_1
    const/16 p1, 0x504

    invoke-static {p1}, Lcom/autochips/carplay/a/a;->V(I)V

    return-void

    :cond_2
    :goto_0
    iput-boolean v2, p0, Lcom/autochips/carplay/a/a;->mEnabled:Z

    invoke-static {v1}, Lcom/autochips/carplay/a/a;->V(I)V

    return-void

    :pswitch_19
    invoke-direct {p0}, Lcom/autochips/carplay/a/a;->cW()I

    move-result p1

    if-nez p1, :cond_4

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/autochips/carplay/a/a;->mEnabled:Z

    iget p1, p0, Lcom/autochips/carplay/a/a;->qW:I

    if-eqz p1, :cond_3

    const-string p1, "CarplayIAP2Adapter"

    const-string v0, "iapService is recovered from error"

    invoke-static {p1, v0}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    iput v2, p0, Lcom/autochips/carplay/a/a;->qW:I

    :cond_3
    const/16 p1, 0x501

    invoke-static {p1}, Lcom/autochips/carplay/a/a;->V(I)V

    return-void

    :cond_4
    invoke-direct {p0}, Lcom/autochips/carplay/a/a;->cY()I

    move-result p1

    if-eqz p1, :cond_5

    const/16 p1, 0x503

    invoke-static {p1}, Lcom/autochips/carplay/a/a;->V(I)V

    :cond_5
    return-void

    :cond_6
    :pswitch_1a
    iget v0, p1, Landroid/os/Message;->what:I

    iget v1, p1, Landroid/os/Message;->arg1:I

    iget v2, p1, Landroid/os/Message;->arg2:I

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-static {}, Lcom/autochips/carplay/service/g;->dx()Lcom/autochips/carplay/service/g;

    move-result-object v3

    invoke-virtual {v3}, Lcom/autochips/carplay/service/g;->dz()Lcom/autochips/carplay/service/h;

    move-result-object v3

    invoke-virtual {v3, v0, v1, v2, p1}, Lcom/autochips/carplay/service/h;->sendMessage(IIILjava/lang/Object;)V

    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_19
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0xa
        :pswitch_3
        :pswitch_0
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x50a
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
    .end packed-switch

    :pswitch_data_3
    .packed-switch 0x514
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
    .end packed-switch

    :pswitch_data_4
    .packed-switch 0x51e
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
    .end packed-switch

    :pswitch_data_5
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
    .end packed-switch

    :pswitch_data_6
    .packed-switch 0x0
        :pswitch_10
        :pswitch_c
        :pswitch_8
        :pswitch_4
    .end packed-switch

    :pswitch_data_7
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
    .end packed-switch

    :pswitch_data_8
    .packed-switch 0x0
        :pswitch_b
        :pswitch_a
        :pswitch_9
    .end packed-switch

    :pswitch_data_9
    .packed-switch 0x0
        :pswitch_f
        :pswitch_e
        :pswitch_d
    .end packed-switch

    :pswitch_data_a
    .packed-switch 0x0
        :pswitch_13
        :pswitch_12
        :pswitch_11
    .end packed-switch

    :pswitch_data_b
    .packed-switch 0x0
        :pswitch_16
        :pswitch_15
        :pswitch_14
    .end packed-switch
.end method
