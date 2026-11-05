.class public Lcom/autochips/carplay/c/e;
.super Lcom/autochips/carplay/common/a;


# instance fields
.field private final mContext:Landroid/content/Context;

.field mReceiver:Landroid/content/BroadcastReceiver;

.field private qW:I

.field private uS:Z

.field private final vd:Landroid/net/ConnectivityManager;

.field private final ve:Landroid/net/wifi/WifiManager;

.field vf:Lcom/autochips/carplay/c/i;

.field vg:Landroid/net/ConnectivityManager$OnStartTetheringCallback;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/os/Looper;)V
    .locals 1

    invoke-direct {p0, p2}, Lcom/autochips/carplay/common/a;-><init>(Landroid/os/Looper;)V

    const/4 p2, 0x0

    iput-boolean p2, p0, Lcom/autochips/carplay/c/e;->uS:Z

    iput p2, p0, Lcom/autochips/carplay/c/e;->qW:I

    iput-object p1, p0, Lcom/autochips/carplay/c/e;->mContext:Landroid/content/Context;

    const-string p2, "connectivity"

    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/net/ConnectivityManager;

    iput-object p2, p0, Lcom/autochips/carplay/c/e;->vd:Landroid/net/ConnectivityManager;

    const-string p2, "wifi"

    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/net/wifi/WifiManager;

    iput-object p1, p0, Lcom/autochips/carplay/c/e;->ve:Landroid/net/wifi/WifiManager;

    new-instance p1, Lcom/autochips/carplay/c/i;

    iget-object p2, p0, Lcom/autochips/carplay/c/e;->ve:Landroid/net/wifi/WifiManager;

    new-instance v0, Lcom/autochips/carplay/c/f;

    invoke-direct {v0, p0}, Lcom/autochips/carplay/c/f;-><init>(Lcom/autochips/carplay/c/e;)V

    invoke-direct {p1, p2, v0}, Lcom/autochips/carplay/c/i;-><init>(Landroid/net/wifi/WifiManager;Lcom/autochips/carplay/c/j;)V

    iput-object p1, p0, Lcom/autochips/carplay/c/e;->vf:Lcom/autochips/carplay/c/i;

    new-instance p1, Lcom/autochips/carplay/c/g;

    invoke-direct {p1, p0}, Lcom/autochips/carplay/c/g;-><init>(Lcom/autochips/carplay/c/e;)V

    iput-object p1, p0, Lcom/autochips/carplay/c/e;->vg:Landroid/net/ConnectivityManager$OnStartTetheringCallback;

    new-instance p1, Lcom/autochips/carplay/c/h;

    invoke-direct {p1, p0}, Lcom/autochips/carplay/c/h;-><init>(Lcom/autochips/carplay/c/e;)V

    iput-object p1, p0, Lcom/autochips/carplay/c/e;->mReceiver:Landroid/content/BroadcastReceiver;

    new-instance p1, Landroid/content/IntentFilter;

    const-string p2, "android.net.wifi.WIFI_AP_STATE_CHANGED"

    invoke-direct {p1, p2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    iget-object p2, p0, Lcom/autochips/carplay/c/e;->mContext:Landroid/content/Context;

    iget-object v0, p0, Lcom/autochips/carplay/c/e;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p2, v0, p1}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    return-void
.end method

.method private ep()I
    .locals 4

    iget v0, p0, Lcom/autochips/carplay/c/e;->qW:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/autochips/carplay/c/e;->qW:I

    const/4 v1, 0x0

    const/4 v2, 0x6

    if-ge v0, v2, :cond_0

    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/c/e;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    const-wide/16 v2, 0x3e8

    invoke-virtual {p0, v0, v2, v3}, Lcom/autochips/carplay/c/e;->sendMessageDelayed(Landroid/os/Message;J)Z

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
.method public final cleanup()V
    .locals 2

    iget-object v0, p0, Lcom/autochips/carplay/c/e;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/autochips/carplay/c/e;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    iget-object v0, p0, Lcom/autochips/carplay/c/e;->vf:Lcom/autochips/carplay/c/i;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iput-object v1, p0, Lcom/autochips/carplay/c/e;->vf:Lcom/autochips/carplay/c/i;

    :cond_0
    iget-object v0, p0, Lcom/autochips/carplay/c/e;->vg:Landroid/net/ConnectivityManager$OnStartTetheringCallback;

    if-eqz v0, :cond_1

    iput-object v1, p0, Lcom/autochips/carplay/c/e;->vg:Landroid/net/ConnectivityManager$OnStartTetheringCallback;

    :cond_1
    return-void
.end method

.method public handleMessage(Landroid/os/Message;)V
    .locals 5

    const-string v0, "CarplayWifiHotspotAdapter"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "handleMessage, what:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p1, Landroid/os/Message;->what:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x402

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_0

    packed-switch v0, :pswitch_data_1

    const-string v0, "CarplayWifiHotspotAdapter"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "ignoring msg="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :pswitch_0
    invoke-direct {p0}, Lcom/autochips/carplay/c/e;->ep()I

    move-result v0

    if-eqz v0, :cond_0

    iget p1, p1, Landroid/os/Message;->what:I

    invoke-static {p1}, Lcom/autochips/carplay/c/e;->V(I)V

    return-void

    :pswitch_1
    iget-boolean p1, p0, Lcom/autochips/carplay/c/e;->uS:Z

    if-eqz p1, :cond_1

    invoke-direct {p0}, Lcom/autochips/carplay/c/e;->ep()I

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    return-void

    :cond_1
    :goto_0
    invoke-static {v1}, Lcom/autochips/carplay/c/e;->V(I)V

    return-void

    :pswitch_2
    iget v0, p0, Lcom/autochips/carplay/c/e;->qW:I

    if-eqz v0, :cond_2

    const-string v0, "CarplayWifiHotspotAdapter"

    const-string v1, "wifi hotspot is recovered from error"

    invoke-static {v0, v1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    iput v2, p0, Lcom/autochips/carplay/c/e;->qW:I

    :cond_2
    iget p1, p1, Landroid/os/Message;->what:I

    invoke-static {p1}, Lcom/autochips/carplay/c/e;->V(I)V

    return-void

    :pswitch_3
    const/4 p1, 0x3

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/c/e;->removeMessages(I)V

    iget-boolean p1, p0, Lcom/autochips/carplay/c/e;->uS:Z

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/autochips/carplay/c/e;->ve:Landroid/net/wifi/WifiManager;

    invoke-virtual {p1}, Landroid/net/wifi/WifiManager;->getWifiApState()I

    move-result p1

    const-string v0, "CarplayWifiHotspotAdapter"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "disableWifiHotspot, currentAPState="

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/16 v0, 0xb

    if-eq v0, p1, :cond_3

    iget-object p1, p0, Lcom/autochips/carplay/c/e;->vd:Landroid/net/ConnectivityManager;

    invoke-virtual {p1, v2}, Landroid/net/ConnectivityManager;->stopTethering(I)V

    goto :goto_1

    :cond_3
    invoke-virtual {p0, v1}, Lcom/autochips/carplay/c/e;->obtainMessage(I)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/c/e;->sendMessage(Landroid/os/Message;)Z

    :cond_4
    :goto_1
    iput-boolean v2, p0, Lcom/autochips/carplay/c/e;->uS:Z

    return-void

    :pswitch_4
    iget-object p1, p0, Lcom/autochips/carplay/c/e;->ve:Landroid/net/wifi/WifiManager;

    invoke-virtual {p1}, Landroid/net/wifi/WifiManager;->getWifiApState()I

    move-result p1

    const-string v0, "CarplayWifiHotspotAdapter"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "enableWifiHotspot, currentAPState="

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/16 v0, 0xd

    if-eq v0, p1, :cond_5

    iget-object p1, p0, Lcom/autochips/carplay/c/e;->vd:Landroid/net/ConnectivityManager;

    iget-object v0, p0, Lcom/autochips/carplay/c/e;->vg:Landroid/net/ConnectivityManager$OnStartTetheringCallback;

    invoke-static {}, Lcom/autochips/carplay/c/e;->getMain()Landroid/os/Handler;

    move-result-object v1

    const/4 v3, 0x1

    invoke-virtual {p1, v2, v3, v0, v1}, Landroid/net/ConnectivityManager;->startTethering(IZLandroid/net/ConnectivityManager$OnStartTetheringCallback;Landroid/os/Handler;)V

    iput-boolean v3, p0, Lcom/autochips/carplay/c/e;->uS:Z

    return-void

    :cond_5
    const/16 p1, 0x401

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/c/e;->obtainMessage(I)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/c/e;->sendMessage(Landroid/os/Message;)Z

    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_4
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x401
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
