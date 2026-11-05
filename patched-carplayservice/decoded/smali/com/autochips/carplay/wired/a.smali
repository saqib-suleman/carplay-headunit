.class public Lcom/autochips/carplay/wired/a;
.super Lcom/autochips/carplay/common/a;


# instance fields
.field private mBinder:Landroid/os/IBinder;

.field private final mCarplayMonitor:Lcom/autochips/carplay/service/h;

.field private final mContext:Landroid/content/Context;

.field private mEnabled:Z

.field private qW:I

.field private final tk:Landroid/os/INetworkManagementService;

.field private uN:Lcom/autochips/usbd/IUSBDService;

.field private uO:Lcom/autochips/carplay/wired/b;

.field private uP:Lcom/autochips/carplay/wired/c;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/os/Looper;Landroid/os/INetworkManagementService;Lcom/autochips/carplay/service/h;)V
    .locals 0

    invoke-direct {p0, p2}, Lcom/autochips/carplay/common/a;-><init>(Landroid/os/Looper;)V

    const/4 p2, 0x0

    iput-boolean p2, p0, Lcom/autochips/carplay/wired/a;->mEnabled:Z

    iput p2, p0, Lcom/autochips/carplay/wired/a;->qW:I

    iput-object p1, p0, Lcom/autochips/carplay/wired/a;->mContext:Landroid/content/Context;

    iput-object p3, p0, Lcom/autochips/carplay/wired/a;->tk:Landroid/os/INetworkManagementService;

    iput-object p4, p0, Lcom/autochips/carplay/wired/a;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    const-string p1, "CarplayUSBNCMAdapter"

    const-string p2, "registerForMonitorEvents"

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/autochips/carplay/wired/a;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    const/16 p2, 0x801

    invoke-virtual {p1, p2, p0}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/wired/a;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    const/16 p2, 0x802

    invoke-virtual {p1, p2, p0}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/wired/a;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    const/16 p2, 0x803

    invoke-virtual {p1, p2, p0}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    return-void
.end method

.method private D(Ljava/lang/String;)Z
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/autochips/carplay/wired/a;->tk:Landroid/os/INetworkManagementService;

    invoke-interface {v0, p1}, Landroid/os/INetworkManagementService;->getInterfaceConfig(Ljava/lang/String;)Landroid/net/InterfaceConfiguration;

    move-result-object p1
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "CarplayUSBNCMAdapter"

    const-string v1, ""

    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 p1, 0x0

    :goto_0
    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    invoke-virtual {p1}, Landroid/net/InterfaceConfiguration;->isUp()Z

    move-result p1

    return p1
.end method

.method private E(Ljava/lang/String;)Z
    .locals 5

    :try_start_0
    iget-object v0, p0, Lcom/autochips/carplay/wired/a;->tk:Landroid/os/INetworkManagementService;

    invoke-interface {v0, p1}, Landroid/os/INetworkManagementService;->getInterfaceConfig(Ljava/lang/String;)Landroid/net/InterfaceConfiguration;

    move-result-object v0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "CarplayUSBNCMAdapter"

    const-string v2, ""

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 v0, 0x0

    :goto_0
    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    invoke-virtual {v0}, Landroid/net/InterfaceConfiguration;->getHardwareAddress()Ljava/lang/String;

    move-result-object v0

    const-string v2, "CarplayUSBNCMAdapter"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "iface "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " hwAddr is "

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz v0, :cond_1

    invoke-static {v0}, Landroid/net/MacAddress;->fromString(Ljava/lang/String;)Landroid/net/MacAddress;

    move-result-object p1

    sget-object v0, Landroid/net/MacAddress;->ALL_ZEROS_ADDRESS:Landroid/net/MacAddress;

    invoke-virtual {p1, v0}, Landroid/net/MacAddress;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    const/4 p1, 0x1

    return p1

    :cond_1
    return v1
.end method

.method private ao(I)I
    .locals 4

    const-string v0, "CarplayUSBNCMAdapter"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "enableUsbNcm, reason: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "usb_daemon"

    invoke-static {v0}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    iput-object v0, p0, Lcom/autochips/carplay/wired/a;->mBinder:Landroid/os/IBinder;

    iget-object v0, p0, Lcom/autochips/carplay/wired/a;->mBinder:Landroid/os/IBinder;

    invoke-static {v0}, Lcom/autochips/usbd/IUSBDService$Stub;->asInterface(Landroid/os/IBinder;)Lcom/autochips/usbd/IUSBDService;

    move-result-object v0

    iput-object v0, p0, Lcom/autochips/carplay/wired/a;->uN:Lcom/autochips/usbd/IUSBDService;

    iget-object v0, p0, Lcom/autochips/carplay/wired/a;->uN:Lcom/autochips/usbd/IUSBDService;

    const/4 v1, -0x1

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/autochips/carplay/wired/a;->mBinder:Landroid/os/IBinder;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const-string v0, "CarplayUSBNCMAdapter"

    const-string v2, "get usbdservice success"

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Lcom/autochips/carplay/wired/c;

    iget-object v2, p0, Lcom/autochips/carplay/wired/a;->mBinder:Landroid/os/IBinder;

    invoke-direct {v0, p0, v2}, Lcom/autochips/carplay/wired/c;-><init>(Lcom/autochips/carplay/wired/a;Landroid/os/IBinder;)V

    iput-object v0, p0, Lcom/autochips/carplay/wired/a;->uP:Lcom/autochips/carplay/wired/c;

    :try_start_0
    iget-object v0, p0, Lcom/autochips/carplay/wired/a;->mBinder:Landroid/os/IBinder;

    iget-object v2, p0, Lcom/autochips/carplay/wired/a;->uP:Lcom/autochips/carplay/wired/c;

    const/4 v3, 0x0

    invoke-interface {v0, v2, v3}, Landroid/os/IBinder;->linkToDeath(Landroid/os/IBinder$DeathRecipient;I)V

    iget-object v0, p0, Lcom/autochips/carplay/wired/a;->uO:Lcom/autochips/carplay/wired/b;

    if-nez v0, :cond_1

    new-instance v0, Lcom/autochips/carplay/wired/b;

    invoke-direct {v0, p0, v3}, Lcom/autochips/carplay/wired/b;-><init>(Lcom/autochips/carplay/wired/a;B)V

    iput-object v0, p0, Lcom/autochips/carplay/wired/a;->uO:Lcom/autochips/carplay/wired/b;

    :cond_1
    iget-object v0, p0, Lcom/autochips/carplay/wired/a;->uO:Lcom/autochips/carplay/wired/b;

    if-eqz v0, :cond_2

    move v1, v3

    :cond_2
    if-nez v1, :cond_4

    iget-object v0, p0, Lcom/autochips/carplay/wired/a;->uN:Lcom/autochips/usbd/IUSBDService;

    const/4 v2, 0x1

    invoke-interface {v0, v2}, Lcom/autochips/usbd/IUSBDService;->setLinkType(I)V

    iget-object v0, p0, Lcom/autochips/carplay/wired/a;->uN:Lcom/autochips/usbd/IUSBDService;

    iget-object v3, p0, Lcom/autochips/carplay/wired/a;->uO:Lcom/autochips/carplay/wired/b;

    invoke-interface {v0, v2, p1, v3}, Lcom/autochips/usbd/IUSBDService;->enbaleCarplay(ZILcom/autochips/usbd/INotifyCallback;)V

    iget-object v0, p0, Lcom/autochips/carplay/wired/a;->uN:Lcom/autochips/usbd/IUSBDService;

    invoke-interface {v0, v2, p1}, Lcom/autochips/usbd/IUSBDService;->enableCarplayAutoSwitch(ZI)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return v1

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Landroid/os/RemoteException;->printStackTrace()V

    return v1

    :cond_3
    :goto_0
    const-string p1, "CarplayUSBNCMAdapter"

    const-string v0, "get usbdservice failed"

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_4
    return v1
.end method

.method private ap(I)I
    .locals 4

    iget-object v0, p0, Lcom/autochips/carplay/wired/a;->uN:Lcom/autochips/usbd/IUSBDService;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/autochips/carplay/wired/a;->mBinder:Landroid/os/IBinder;

    if-eqz v0, :cond_1

    const-string v0, "CarplayUSBNCMAdapter"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "disableUsbNcm, reason: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_0
    iget-object v0, p0, Lcom/autochips/carplay/wired/a;->uN:Lcom/autochips/usbd/IUSBDService;

    invoke-interface {v0, v1, p1}, Lcom/autochips/usbd/IUSBDService;->enableCarplayAutoSwitch(ZI)V

    iget-object v0, p0, Lcom/autochips/carplay/wired/a;->uN:Lcom/autochips/usbd/IUSBDService;

    iget-object v2, p0, Lcom/autochips/carplay/wired/a;->uO:Lcom/autochips/carplay/wired/b;

    invoke-interface {v0, v1, p1, v2}, Lcom/autochips/usbd/IUSBDService;->enbaleCarplay(ZILcom/autochips/usbd/INotifyCallback;)V

    iget-object p1, p0, Lcom/autochips/carplay/wired/a;->uO:Lcom/autochips/carplay/wired/b;

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    iput-object v0, p0, Lcom/autochips/carplay/wired/a;->uO:Lcom/autochips/carplay/wired/b;

    :cond_0
    iget-object p1, p0, Lcom/autochips/carplay/wired/a;->mBinder:Landroid/os/IBinder;

    iget-object v2, p0, Lcom/autochips/carplay/wired/a;->uP:Lcom/autochips/carplay/wired/c;

    invoke-interface {p1, v2, v1}, Landroid/os/IBinder;->unlinkToDeath(Landroid/os/IBinder$DeathRecipient;I)Z

    iput-object v0, p0, Lcom/autochips/carplay/wired/a;->uP:Lcom/autochips/carplay/wired/c;

    iput-object v0, p0, Lcom/autochips/carplay/wired/a;->uN:Lcom/autochips/usbd/IUSBDService;

    iput-object v0, p0, Lcom/autochips/carplay/wired/a;->mBinder:Landroid/os/IBinder;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return v1

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_0

    :cond_1
    const-string p1, "CarplayUSBNCMAdapter"

    const-string v0, "usbdservice is null"

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    const/4 v1, -0x1

    return v1
.end method

.method private ef()I
    .locals 4

    iget v0, p0, Lcom/autochips/carplay/wired/a;->qW:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/autochips/carplay/wired/a;->qW:I

    const/4 v1, 0x0

    const/4 v2, 0x6

    if-ge v0, v2, :cond_0

    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/wired/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    const-wide/16 v2, 0x1f4

    invoke-virtual {p0, v0, v2, v3}, Lcom/autochips/carplay/wired/a;->sendMessageDelayed(Landroid/os/Message;J)Z

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
    .locals 3

    const-string v0, "CarplayUSBNCMAdapter"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "handleMessage, what: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p1, Landroid/os/Message;->what:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x801

    if-eq v0, v1, :cond_5

    const/16 v1, 0x803

    if-eq v0, v1, :cond_5

    const/16 v1, 0x202

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_0

    const-string v0, "CarplayUSBNCMAdapter"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "ignoring msg="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :pswitch_0
    iget-boolean p1, p0, Lcom/autochips/carplay/wired/a;->mEnabled:Z

    if-eqz p1, :cond_4

    invoke-direct {p0}, Lcom/autochips/carplay/wired/a;->ef()I

    move-result p1

    if-eqz p1, :cond_4

    iput-boolean v2, p0, Lcom/autochips/carplay/wired/a;->mEnabled:Z

    invoke-static {v1}, Lcom/autochips/carplay/wired/a;->V(I)V

    return-void

    :pswitch_1
    iget p1, p1, Landroid/os/Message;->arg1:I

    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/wired/a;->removeMessages(I)V

    iget-boolean v0, p0, Lcom/autochips/carplay/wired/a;->mEnabled:Z

    if-eqz v0, :cond_1

    invoke-direct {p0, p1}, Lcom/autochips/carplay/wired/a;->ap(I)I

    move-result p1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    const/16 p1, 0x204

    invoke-static {p1}, Lcom/autochips/carplay/wired/a;->V(I)V

    return-void

    :cond_1
    :goto_0
    iput-boolean v2, p0, Lcom/autochips/carplay/wired/a;->mEnabled:Z

    invoke-static {v1}, Lcom/autochips/carplay/wired/a;->V(I)V

    return-void

    :pswitch_2
    iget p1, p1, Landroid/os/Message;->arg1:I

    invoke-direct {p0, p1}, Lcom/autochips/carplay/wired/a;->ao(I)I

    move-result p1

    if-nez p1, :cond_3

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/autochips/carplay/wired/a;->mEnabled:Z

    iget p1, p0, Lcom/autochips/carplay/wired/a;->qW:I

    if-eqz p1, :cond_2

    const-string p1, "CarplayUSBNCMAdapter"

    const-string v0, "usb ncm is recovered from error"

    invoke-static {p1, v0}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    iput v2, p0, Lcom/autochips/carplay/wired/a;->qW:I

    :cond_2
    const/16 p1, 0x201

    invoke-static {p1}, Lcom/autochips/carplay/wired/a;->V(I)V

    return-void

    :cond_3
    invoke-direct {p0}, Lcom/autochips/carplay/wired/a;->ef()I

    move-result p1

    if-eqz p1, :cond_4

    const/16 p1, 0x203

    invoke-static {p1}, Lcom/autochips/carplay/wired/a;->V(I)V

    :cond_4
    return-void

    :cond_5
    :pswitch_3
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    if-eqz p1, :cond_9

    const-string v0, "ncm0"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    goto :goto_1

    :cond_6
    invoke-direct {p0, p1}, Lcom/autochips/carplay/wired/a;->D(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    const-string v0, "CarplayUSBNCMAdapter"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "iface="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " already up"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_7
    invoke-direct {p0, p1}, Lcom/autochips/carplay/wired/a;->E(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_8

    const-string v0, "CarplayUSBNCMAdapter"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "iface="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "is no hw address"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_8
    :try_start_0
    const-string v0, "CarplayUSBNCMAdapter"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "setInterfaceUp ="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/wired/a;->tk:Landroid/os/INetworkManagementService;

    invoke-interface {v0, p1}, Landroid/os/INetworkManagementService;->setInterfaceUp(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    const-string v0, "CarplayUSBNCMAdapter"

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_9
    :goto_1
    const-string v0, "CarplayUSBNCMAdapter"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "iface="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "is not usb net dev"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method
