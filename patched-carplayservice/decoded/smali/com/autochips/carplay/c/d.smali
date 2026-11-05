.class final Lcom/autochips/carplay/c/d;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/bluetooth/BluetoothProfile$ServiceListener;


# instance fields
.field final synthetic vc:Lcom/autochips/carplay/c/a;


# direct methods
.method private constructor <init>(Lcom/autochips/carplay/c/a;)V
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/c/d;->vc:Lcom/autochips/carplay/c/a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/autochips/carplay/c/a;B)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/autochips/carplay/c/d;-><init>(Lcom/autochips/carplay/c/a;)V

    return-void
.end method


# virtual methods
.method public final onServiceConnected(ILandroid/bluetooth/BluetoothProfile;)V
    .locals 3

    const-string v0, "CarplayBluetoothAdapter"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "onServiceConnected, profile: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", proxy: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/16 v0, 0x10

    if-eq p1, v0, :cond_0

    packed-switch p1, :pswitch_data_0

    return-void

    :pswitch_0
    iget-object p1, p0, Lcom/autochips/carplay/c/d;->vc:Lcom/autochips/carplay/c/a;

    check-cast p2, Landroid/bluetooth/BluetoothAvrcpController;

    invoke-static {p1, p2}, Lcom/autochips/carplay/c/a;->a(Lcom/autochips/carplay/c/a;Landroid/bluetooth/BluetoothAvrcpController;)Landroid/bluetooth/BluetoothAvrcpController;

    return-void

    :pswitch_1
    iget-object p1, p0, Lcom/autochips/carplay/c/d;->vc:Lcom/autochips/carplay/c/a;

    check-cast p2, Landroid/bluetooth/BluetoothA2dpSink;

    invoke-static {p1, p2}, Lcom/autochips/carplay/c/a;->a(Lcom/autochips/carplay/c/a;Landroid/bluetooth/BluetoothA2dpSink;)Landroid/bluetooth/BluetoothA2dpSink;

    return-void

    :cond_0
    iget-object p1, p0, Lcom/autochips/carplay/c/d;->vc:Lcom/autochips/carplay/c/a;

    check-cast p2, Landroid/bluetooth/BluetoothHeadsetClient;

    invoke-static {p1, p2}, Lcom/autochips/carplay/c/a;->a(Lcom/autochips/carplay/c/a;Landroid/bluetooth/BluetoothHeadsetClient;)Landroid/bluetooth/BluetoothHeadsetClient;

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0xb
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final onServiceDisconnected(I)V
    .locals 3

    const-string v0, "CarplayBluetoothAdapter"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "onServiceDisconnected, profile: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/16 v0, 0x10

    const/4 v1, 0x0

    if-eq p1, v0, :cond_0

    packed-switch p1, :pswitch_data_0

    return-void

    :pswitch_0
    iget-object p1, p0, Lcom/autochips/carplay/c/d;->vc:Lcom/autochips/carplay/c/a;

    invoke-static {p1, v1}, Lcom/autochips/carplay/c/a;->a(Lcom/autochips/carplay/c/a;Landroid/bluetooth/BluetoothAvrcpController;)Landroid/bluetooth/BluetoothAvrcpController;

    return-void

    :pswitch_1
    iget-object p1, p0, Lcom/autochips/carplay/c/d;->vc:Lcom/autochips/carplay/c/a;

    invoke-static {p1, v1}, Lcom/autochips/carplay/c/a;->a(Lcom/autochips/carplay/c/a;Landroid/bluetooth/BluetoothA2dpSink;)Landroid/bluetooth/BluetoothA2dpSink;

    return-void

    :cond_0
    iget-object p1, p0, Lcom/autochips/carplay/c/d;->vc:Lcom/autochips/carplay/c/a;

    invoke-static {p1, v1}, Lcom/autochips/carplay/c/a;->a(Lcom/autochips/carplay/c/a;Landroid/bluetooth/BluetoothHeadsetClient;)Landroid/bluetooth/BluetoothHeadsetClient;

    return-void

    :pswitch_data_0
    .packed-switch 0xb
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
