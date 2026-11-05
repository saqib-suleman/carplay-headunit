.class final Lcom/autochips/carplay/c/b;
.super Landroid/content/BroadcastReceiver;


# instance fields
.field final synthetic vc:Lcom/autochips/carplay/c/a;


# direct methods
.method constructor <init>(Lcom/autochips/carplay/c/a;)V
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/c/b;->vc:Lcom/autochips/carplay/c/a;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    const-string v0, "android.bluetooth.headsetclient.profile.action.AG_CALL_CHANGED"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string p1, "CarplayBluetoothAdapter"

    const-string p2, "onCallStateChanged"

    invoke-static {p1, p2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/autochips/carplay/service/g;->dx()Lcom/autochips/carplay/service/g;

    move-result-object p1

    invoke-virtual {p1}, Lcom/autochips/carplay/service/g;->dz()Lcom/autochips/carplay/service/h;

    move-result-object p1

    if-eqz p1, :cond_0

    const/16 p2, 0x902

    invoke-virtual {p1, p2}, Lcom/autochips/carplay/service/h;->sendMessage(I)V

    :cond_0
    return-void

    :cond_1
    const-string v0, "android.bluetooth.headsetclient.profile.action.AUDIO_STATE_CHANGED"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string p1, "android.bluetooth.profile.extra.STATE"

    const/4 v0, 0x0

    invoke-virtual {p2, p1, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    const-string p2, "CarplayBluetoothAdapter"

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "onAudioStatusChanged, scoState: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/autochips/carplay/service/g;->dx()Lcom/autochips/carplay/service/g;

    move-result-object p2

    invoke-virtual {p2}, Lcom/autochips/carplay/service/g;->dz()Lcom/autochips/carplay/service/h;

    move-result-object p2

    if-eqz p2, :cond_2

    const/16 v0, 0x901

    invoke-virtual {p2, v0, p1}, Lcom/autochips/carplay/service/h;->sendMessage(II)V

    :cond_2
    return-void

    :cond_3
    const-string v0, "android.bluetooth.adapter.action.STATE_CHANGED"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    const-string p1, "android.bluetooth.adapter.extra.STATE"

    const/high16 v0, -0x80000000

    invoke-virtual {p2, p1, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    iget-object p2, p0, Lcom/autochips/carplay/c/b;->vc:Lcom/autochips/carplay/c/a;

    const/16 v0, 0xa

    if-eq p1, v0, :cond_5

    const/16 v0, 0xc

    if-eq p1, v0, :cond_4

    return-void

    :cond_4
    const/16 p1, 0x301

    invoke-virtual {p2, p1}, Lcom/autochips/carplay/c/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p2, p1}, Lcom/autochips/carplay/c/a;->sendMessage(Landroid/os/Message;)Z

    return-void

    :cond_5
    const/16 p1, 0x302

    invoke-virtual {p2, p1}, Lcom/autochips/carplay/c/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p2, p1}, Lcom/autochips/carplay/c/a;->sendMessage(Landroid/os/Message;)Z

    return-void

    :cond_6
    const-string v0, "android.bluetooth.headsetclient.profile.action.CONNECTION_STATE_CHANGED"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_7

    const-string p1, "android.bluetooth.profile.extra.STATE"

    const/4 v0, -0x1

    invoke-virtual {p2, p1, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    const-string v0, "android.bluetooth.device.extra.DEVICE"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getExtra(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/bluetooth/BluetoothDevice;

    invoke-static {}, Lcom/autochips/carplay/service/g;->dx()Lcom/autochips/carplay/service/g;

    move-result-object v0

    invoke-virtual {v0}, Lcom/autochips/carplay/service/g;->dz()Lcom/autochips/carplay/service/h;

    move-result-object v0

    if-eqz v0, :cond_7

    const/16 v1, 0x309

    const/16 v2, 0x10

    invoke-virtual {v0, v1, v2, p1, p2}, Lcom/autochips/carplay/service/h;->sendMessage(IIILjava/lang/Object;)V

    :cond_7
    return-void
.end method
