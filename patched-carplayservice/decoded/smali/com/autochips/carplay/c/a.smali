.class public final Lcom/autochips/carplay/c/a;
.super Lcom/autochips/carplay/common/a;


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final mReceiver:Landroid/content/BroadcastReceiver;

.field private mTelephonyManager:Landroid/telephony/TelephonyManager;

.field private qW:I

.field private uS:Z

.field private uT:Landroid/bluetooth/BluetoothAdapter;

.field private uU:Landroid/bluetooth/BluetoothDevice;

.field private uV:Landroid/bluetooth/BluetoothHeadsetClient;

.field private uW:Landroid/bluetooth/BluetoothA2dpSink;

.field private uX:Landroid/bluetooth/BluetoothAvrcpController;

.field private uY:Ljava/lang/String;

.field private final uZ:Z

.field private va:Lcom/autochips/carplay/c/d;

.field private final vb:Landroid/telephony/PhoneStateListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/os/Looper;)V
    .locals 3

    invoke-direct {p0, p2}, Lcom/autochips/carplay/common/a;-><init>(Landroid/os/Looper;)V

    const/4 p2, 0x0

    iput-boolean p2, p0, Lcom/autochips/carplay/c/a;->uS:Z

    iput p2, p0, Lcom/autochips/carplay/c/a;->qW:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/autochips/carplay/c/a;->uY:Ljava/lang/String;

    const-string v0, "ro.atc.carplay.disable_bt"

    invoke-static {v0, p2}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/autochips/carplay/c/a;->uZ:Z

    new-instance v0, Lcom/autochips/carplay/c/d;

    invoke-direct {v0, p0, p2}, Lcom/autochips/carplay/c/d;-><init>(Lcom/autochips/carplay/c/a;B)V

    iput-object v0, p0, Lcom/autochips/carplay/c/a;->va:Lcom/autochips/carplay/c/d;

    new-instance p2, Lcom/autochips/carplay/c/b;

    invoke-direct {p2, p0}, Lcom/autochips/carplay/c/b;-><init>(Lcom/autochips/carplay/c/a;)V

    iput-object p2, p0, Lcom/autochips/carplay/c/a;->mReceiver:Landroid/content/BroadcastReceiver;

    new-instance p2, Lcom/autochips/carplay/c/c;

    invoke-direct {p2, p0}, Lcom/autochips/carplay/c/c;-><init>(Lcom/autochips/carplay/c/a;)V

    iput-object p2, p0, Lcom/autochips/carplay/c/a;->vb:Landroid/telephony/PhoneStateListener;

    iput-object p1, p0, Lcom/autochips/carplay/c/a;->mContext:Landroid/content/Context;

    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object p2

    iput-object p2, p0, Lcom/autochips/carplay/c/a;->uT:Landroid/bluetooth/BluetoothAdapter;

    iget-object p2, p0, Lcom/autochips/carplay/c/a;->uT:Landroid/bluetooth/BluetoothAdapter;

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/autochips/carplay/c/a;->uT:Landroid/bluetooth/BluetoothAdapter;

    iget-object v0, p0, Lcom/autochips/carplay/c/a;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/autochips/carplay/c/a;->va:Lcom/autochips/carplay/c/d;

    const/16 v2, 0x10

    invoke-virtual {p2, v0, v1, v2}, Landroid/bluetooth/BluetoothAdapter;->getProfileProxy(Landroid/content/Context;Landroid/bluetooth/BluetoothProfile$ServiceListener;I)Z

    iget-object p2, p0, Lcom/autochips/carplay/c/a;->uT:Landroid/bluetooth/BluetoothAdapter;

    iget-object v0, p0, Lcom/autochips/carplay/c/a;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/autochips/carplay/c/a;->va:Lcom/autochips/carplay/c/d;

    const/16 v2, 0xb

    invoke-virtual {p2, v0, v1, v2}, Landroid/bluetooth/BluetoothAdapter;->getProfileProxy(Landroid/content/Context;Landroid/bluetooth/BluetoothProfile$ServiceListener;I)Z

    iget-object p2, p0, Lcom/autochips/carplay/c/a;->uT:Landroid/bluetooth/BluetoothAdapter;

    iget-object v0, p0, Lcom/autochips/carplay/c/a;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/autochips/carplay/c/a;->va:Lcom/autochips/carplay/c/d;

    const/16 v2, 0xc

    invoke-virtual {p2, v0, v1, v2}, Landroid/bluetooth/BluetoothAdapter;->getProfileProxy(Landroid/content/Context;Landroid/bluetooth/BluetoothProfile$ServiceListener;I)Z

    :cond_0
    invoke-static {p1}, Landroid/telephony/TelephonyManager;->from(Landroid/content/Context;)Landroid/telephony/TelephonyManager;

    move-result-object p1

    iput-object p1, p0, Lcom/autochips/carplay/c/a;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    iget-object p1, p0, Lcom/autochips/carplay/c/a;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/autochips/carplay/c/a;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    iget-object p2, p0, Lcom/autochips/carplay/c/a;->vb:Landroid/telephony/PhoneStateListener;

    const/16 v0, 0x20

    invoke-virtual {p1, p2, v0}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V

    :cond_1
    invoke-static {}, Lcom/autochips/carplay/service/g;->dx()Lcom/autochips/carplay/service/g;

    move-result-object p1

    invoke-virtual {p1}, Lcom/autochips/carplay/service/g;->dz()Lcom/autochips/carplay/service/h;

    move-result-object p1

    if-eqz p1, :cond_2

    const/16 p2, 0x70a

    invoke-virtual {p1, p2, p0}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    const/16 p2, 0x804

    invoke-virtual {p1, p2, p0}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    :cond_2
    new-instance p1, Landroid/content/IntentFilter;

    invoke-direct {p1}, Landroid/content/IntentFilter;-><init>()V

    const-string p2, "android.bluetooth.adapter.action.STATE_CHANGED"

    invoke-virtual {p1, p2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string p2, "android.bluetooth.headsetclient.profile.action.CONNECTION_STATE_CHANGED"

    invoke-virtual {p1, p2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string p2, "android.bluetooth.headsetclient.profile.action.AG_CALL_CHANGED"

    invoke-virtual {p1, p2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string p2, "android.bluetooth.headsetclient.profile.action.AUDIO_STATE_CHANGED"

    invoke-virtual {p1, p2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const/16 p2, 0x3e8

    invoke-virtual {p1, p2}, Landroid/content/IntentFilter;->setPriority(I)V

    iget-object p2, p0, Lcom/autochips/carplay/c/a;->mContext:Landroid/content/Context;

    iget-object v0, p0, Lcom/autochips/carplay/c/a;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p2, v0, p1}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    return-void
.end method

.method static synthetic a(Lcom/autochips/carplay/c/a;Landroid/bluetooth/BluetoothA2dpSink;)Landroid/bluetooth/BluetoothA2dpSink;
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/c/a;->uW:Landroid/bluetooth/BluetoothA2dpSink;

    return-object p1
.end method

.method static synthetic a(Lcom/autochips/carplay/c/a;Landroid/bluetooth/BluetoothAvrcpController;)Landroid/bluetooth/BluetoothAvrcpController;
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/c/a;->uX:Landroid/bluetooth/BluetoothAvrcpController;

    return-object p1
.end method

.method static synthetic a(Lcom/autochips/carplay/c/a;Landroid/bluetooth/BluetoothHeadsetClient;)Landroid/bluetooth/BluetoothHeadsetClient;
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/c/a;->uV:Landroid/bluetooth/BluetoothHeadsetClient;

    return-object p1
.end method

.method private static a(Landroid/bluetooth/BluetoothAdapter;)Ljava/lang/String;
    .locals 5

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "mService"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "getAddress"

    const/4 v3, 0x0

    new-array v4, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v2, v3, [Ljava/lang/Object;

    invoke-virtual {v1, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :cond_0
    return-object v0

    :catch_0
    move-exception p0

    const-string v1, "CarplayBluetoothAdapter"

    const-string v2, ""

    invoke-static {v1, v2, p0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-object v0
.end method

.method private declared-synchronized e(Ljava/util/List;)Z
    .locals 3

    monitor-enter p0

    const/4 v0, 0x0

    if-eqz p1, :cond_2

    :try_start_0
    iget-object v1, p0, Lcom/autochips/carplay/c/a;->uW:Landroid/bluetooth/BluetoothA2dpSink;

    if-nez v1, :cond_0

    goto :goto_1

    :cond_0
    move v1, v0

    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_1

    iget-object v1, p0, Lcom/autochips/carplay/c/a;->uW:Landroid/bluetooth/BluetoothA2dpSink;

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v1, v2}, Landroid/bluetooth/BluetoothA2dpSink;->isA2dpPlaying(Landroid/bluetooth/BluetoothDevice;)Z

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_1

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    monitor-exit p0

    return v1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1

    :cond_2
    :goto_1
    monitor-exit p0

    return v0
.end method

.method private eg()I
    .locals 4

    iget-object v0, p0, Lcom/autochips/carplay/c/a;->uT:Landroid/bluetooth/BluetoothAdapter;

    if-nez v0, :cond_0

    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    iput-object v0, p0, Lcom/autochips/carplay/c/a;->uT:Landroid/bluetooth/BluetoothAdapter;

    :cond_0
    iget-object v0, p0, Lcom/autochips/carplay/c/a;->uT:Landroid/bluetooth/BluetoothAdapter;

    const/4 v1, -0x1

    if-nez v0, :cond_1

    const-string v0, "CarplayBluetoothAdapter"

    const-string v2, "mBluetoothAdapter is null"

    invoke-static {v0, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    :cond_1
    iget-object v0, p0, Lcom/autochips/carplay/c/a;->uT:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->getLeState()I

    move-result v0

    const/16 v2, 0xc

    const/4 v3, 0x0

    if-ne v2, v0, :cond_2

    iget-object v0, p0, Lcom/autochips/carplay/c/a;->uT:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->disable()Z

    move-result v0

    goto :goto_0

    :cond_2
    const/16 v2, 0xa

    if-ne v2, v0, :cond_3

    const/16 v0, 0x302

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/c/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/c/a;->sendMessage(Landroid/os/Message;)Z

    const/4 v0, 0x1

    goto :goto_0

    :cond_3
    move v0, v3

    :goto_0
    if-eqz v0, :cond_4

    return v3

    :cond_4
    return v1
.end method

.method private eh()I
    .locals 2

    iget-boolean v0, p0, Lcom/autochips/carplay/c/a;->uZ:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/c/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    const/4 v1, 0x1

    iput v1, v0, Landroid/os/Message;->arg1:I

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/c/a;->sendMessage(Landroid/os/Message;)Z

    const/4 v0, 0x0

    return v0

    :cond_0
    const/4 v0, -0x1

    return v0
.end method

.method private ei()I
    .locals 4

    iget v0, p0, Lcom/autochips/carplay/c/a;->qW:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/autochips/carplay/c/a;->qW:I

    const/4 v1, 0x0

    const/4 v2, 0x6

    if-ge v0, v2, :cond_0

    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/c/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    const-wide/16 v2, 0x3e8

    invoke-virtual {p0, v0, v2, v3}, Lcom/autochips/carplay/c/a;->sendMessageDelayed(Landroid/os/Message;J)Z

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

.method private ej()I
    .locals 4

    iget-object v0, p0, Lcom/autochips/carplay/c/a;->mContext:Landroid/content/Context;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/autochips/carplay/c/a;->uU:Landroid/bluetooth/BluetoothDevice;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/autochips/carplay/c/a;->uU:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v1}, Landroid/bluetooth/BluetoothDevice;->isConnected()Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, "CarplayBluetoothAdapter"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "disconnect device: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/autochips/carplay/c/a;->uU:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, p0, Lcom/autochips/carplay/c/a;->uV:Landroid/bluetooth/BluetoothHeadsetClient;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/autochips/carplay/c/a;->uV:Landroid/bluetooth/BluetoothHeadsetClient;

    iget-object v2, p0, Lcom/autochips/carplay/c/a;->uU:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v1, v2}, Landroid/bluetooth/BluetoothHeadsetClient;->disconnect(Landroid/bluetooth/BluetoothDevice;)Z

    :cond_0
    iget-object v1, p0, Lcom/autochips/carplay/c/a;->uW:Landroid/bluetooth/BluetoothA2dpSink;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/autochips/carplay/c/a;->uW:Landroid/bluetooth/BluetoothA2dpSink;

    iget-object v2, p0, Lcom/autochips/carplay/c/a;->uU:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v1, v2}, Landroid/bluetooth/BluetoothA2dpSink;->disconnect(Landroid/bluetooth/BluetoothDevice;)Z

    :cond_1
    monitor-exit v0

    const/4 v0, 0x0

    return v0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private en()Ljava/util/List;
    .locals 3

    iget-object v0, p0, Lcom/autochips/carplay/c/a;->uV:Landroid/bluetooth/BluetoothHeadsetClient;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const-string v0, "CarplayBluetoothAdapter"

    const-string v2, "get hf profile fail!"

    :goto_0
    invoke-static {v0, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-object v1

    :cond_0
    iget-object v0, p0, Lcom/autochips/carplay/c/a;->uV:Landroid/bluetooth/BluetoothHeadsetClient;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothHeadsetClient;->getConnectedDevices()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-nez v2, :cond_1

    goto :goto_1

    :cond_1
    return-object v0

    :cond_2
    :goto_1
    const-string v0, "CarplayBluetoothAdapter"

    const-string v2, "hf client is not connected!"

    goto :goto_0
.end method

.method private eo()V
    .locals 4

    iget-object v0, p0, Lcom/autochips/carplay/c/a;->uT:Landroid/bluetooth/BluetoothAdapter;

    if-nez v0, :cond_0

    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    iput-object v0, p0, Lcom/autochips/carplay/c/a;->uT:Landroid/bluetooth/BluetoothAdapter;

    :cond_0
    iget-object v0, p0, Lcom/autochips/carplay/c/a;->uT:Landroid/bluetooth/BluetoothAdapter;

    invoke-static {v0}, Lcom/autochips/carplay/c/a;->a(Landroid/bluetooth/BluetoothAdapter;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "CarplayBluetoothAdapter"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "updateBluetoothAddress, address: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, p0, Lcom/autochips/carplay/c/a;->uY:Ljava/lang/String;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/autochips/carplay/c/a;->uY:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    :cond_1
    if-eqz v0, :cond_2

    iput-object v0, p0, Lcom/autochips/carplay/c/a;->uY:Ljava/lang/String;

    iget-object v0, p0, Lcom/autochips/carplay/c/a;->uY:Ljava/lang/String;

    invoke-static {}, Lcom/autochips/carplay/service/g;->dx()Lcom/autochips/carplay/service/g;

    move-result-object v1

    invoke-virtual {v1}, Lcom/autochips/carplay/service/g;->dz()Lcom/autochips/carplay/service/h;

    move-result-object v1

    const/16 v2, 0x30a

    invoke-virtual {v1, v2, v0}, Lcom/autochips/carplay/service/h;->sendMessage(ILjava/lang/Object;)V

    :cond_2
    return-void
.end method

.method private getCurrentCalls()Ljava/util/List;
    .locals 3

    invoke-direct {p0}, Lcom/autochips/carplay/c/a;->en()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v1, p0, Lcom/autochips/carplay/c/a;->uV:Landroid/bluetooth/BluetoothHeadsetClient;

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/autochips/carplay/c/a;->uV:Landroid/bluetooth/BluetoothHeadsetClient;

    const/4 v2, 0x0

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v1, v0}, Landroid/bluetooth/BluetoothHeadsetClient;->getCurrentCalls(Landroid/bluetooth/BluetoothDevice;)Ljava/util/List;

    move-result-object v0

    if-nez v0, :cond_1

    const-string v1, "CarplayBluetoothAdapter"

    const-string v2, "callList is null!"

    invoke-static {v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    return-object v0

    :cond_2
    :goto_0
    const-string v0, "CarplayBluetoothAdapter"

    const-string v1, "get getCurrentCalls is null!"

    invoke-static {v0, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    return-object v0
.end method


# virtual methods
.method public final cleanup()V
    .locals 3

    iget-object v0, p0, Lcom/autochips/carplay/c/a;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/autochips/carplay/c/a;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    iget-object v1, p0, Lcom/autochips/carplay/c/a;->vb:Landroid/telephony/PhoneStateListener;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V

    :cond_0
    iget-object v0, p0, Lcom/autochips/carplay/c/a;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/autochips/carplay/c/a;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/autochips/carplay/c/a;->uT:Landroid/bluetooth/BluetoothAdapter;

    iput-object v0, p0, Lcom/autochips/carplay/c/a;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    return-void
.end method

.method public final declared-synchronized ek()I
    .locals 5

    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/autochips/carplay/c/a;->getCurrentCalls()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v2, 0x2

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    if-lez v0, :cond_1

    move v1, v2

    :cond_1
    :goto_0
    const-string v0, "CarplayBluetoothAdapter"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "bluetooth call type: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_2

    monitor-exit p0

    return v2

    :cond_2
    :try_start_1
    iget-object v0, p0, Lcom/autochips/carplay/c/a;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/autochips/carplay/c/a;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getCallState()I

    move-result v0

    const-string v2, "CarplayBluetoothAdapter"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "telehony callState: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v0, :cond_3

    const/4 v1, 0x1

    :cond_3
    monitor-exit p0

    return v1

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized el()Z
    .locals 5

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/autochips/carplay/c/a;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/autochips/carplay/c/a;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getCallState()I

    move-result v0

    const-string v2, "CarplayBluetoothAdapter"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "telehony callState: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    monitor-exit p0

    return v1

    :cond_0
    :try_start_1
    invoke-direct {p0}, Lcom/autochips/carplay/c/a;->getCurrentCalls()Ljava/util/List;

    move-result-object v0

    const/4 v2, 0x0

    if-eqz v0, :cond_2

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    if-lez v0, :cond_2

    move v2, v1

    :cond_2
    :goto_0
    monitor-exit p0

    return v2

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized em()I
    .locals 4

    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/autochips/carplay/c/a;->en()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v2, p0, Lcom/autochips/carplay/c/a;->uV:Landroid/bluetooth/BluetoothHeadsetClient;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/autochips/carplay/c/a;->uV:Landroid/bluetooth/BluetoothHeadsetClient;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v2, v0}, Landroid/bluetooth/BluetoothHeadsetClient;->getAudioState(Landroid/bluetooth/BluetoothDevice;)I

    move-result v1

    :cond_0
    const-string v0, "CarplayBluetoothAdapter"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "getAudioState: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v1

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final handleMessage(Landroid/os/Message;)V
    .locals 11

    const-string v0, "CarplayBluetoothAdapter"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "handleMessage, what: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p1, Landroid/os/Message;->what:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x309

    if-eq v0, v1, :cond_17

    const/16 v1, 0x70a

    if-eq v0, v1, :cond_16

    const/16 v1, 0x804

    if-eq v0, v1, :cond_15

    const/16 v1, 0x301

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x0

    packed-switch v0, :pswitch_data_0

    const/16 v3, 0x302

    packed-switch v0, :pswitch_data_1

    const-string v0, "CarplayBluetoothAdapter"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "handleMessage ignoring msg="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :pswitch_0
    iget-boolean p1, p0, Lcom/autochips/carplay/c/a;->uS:Z

    if-eqz p1, :cond_0

    invoke-direct {p0}, Lcom/autochips/carplay/c/a;->ei()I

    move-result p1

    if-eqz p1, :cond_18

    :cond_0
    invoke-static {v3}, Lcom/autochips/carplay/c/a;->V(I)V

    return-void

    :pswitch_1
    iget-boolean p1, p0, Lcom/autochips/carplay/c/a;->uS:Z

    if-eqz p1, :cond_1

    invoke-direct {p0}, Lcom/autochips/carplay/c/a;->ei()I

    move-result p1

    if-eqz p1, :cond_2

    :cond_1
    invoke-static {v3}, Lcom/autochips/carplay/c/a;->V(I)V

    :cond_2
    iput-object v2, p0, Lcom/autochips/carplay/c/a;->uY:Ljava/lang/String;

    return-void

    :pswitch_2
    invoke-static {}, Lcom/autochips/carplay/service/g;->dx()Lcom/autochips/carplay/service/g;

    move-result-object p1

    invoke-virtual {p1}, Lcom/autochips/carplay/service/g;->dy()Lcom/autochips/carplay/service/CarplayService;

    move-result-object p1

    if-eqz p1, :cond_3

    invoke-virtual {p1}, Lcom/autochips/carplay/service/CarplayService;->getConnectedDevices()Ljava/util/List;

    move-result-object p1

    if-eqz p1, :cond_3

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    if-eqz p1, :cond_3

    invoke-direct {p0}, Lcom/autochips/carplay/c/a;->eh()I

    move-result p1

    if-eqz p1, :cond_18

    :cond_3
    iget p1, p0, Lcom/autochips/carplay/c/a;->qW:I

    if-eqz p1, :cond_4

    const-string p1, "CarplayBluetoothAdapter"

    const-string v0, "bluetooth is recovered from error"

    invoke-static {p1, v0}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    iput v4, p0, Lcom/autochips/carplay/c/a;->qW:I

    :cond_4
    invoke-static {v1}, Lcom/autochips/carplay/c/a;->V(I)V

    invoke-direct {p0}, Lcom/autochips/carplay/c/a;->eo()V

    return-void

    :pswitch_3
    invoke-direct {p0}, Lcom/autochips/carplay/c/a;->eh()I

    move-result v0

    if-eqz v0, :cond_18

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    const-string v0, "CarplayBluetoothAdapter"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v5, "disconnect bluetooth device: "

    invoke-direct {v1, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-direct {p0}, Lcom/autochips/carplay/c/a;->en()Ljava/util/List;

    move-result-object v0

    iget-object v1, p0, Lcom/autochips/carplay/c/a;->uW:Landroid/bluetooth/BluetoothA2dpSink;

    if-nez v1, :cond_5

    const-string v1, "CarplayBluetoothAdapter"

    const-string v5, "get a2dp sink profile fail!"

    :goto_0
    invoke-static {v1, v5}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-object v1, v2

    goto :goto_1

    :cond_5
    iget-object v1, p0, Lcom/autochips/carplay/c/a;->uW:Landroid/bluetooth/BluetoothA2dpSink;

    invoke-virtual {v1}, Landroid/bluetooth/BluetoothA2dpSink;->getConnectedDevices()Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_6

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v5

    if-nez v5, :cond_7

    :cond_6
    const-string v1, "CarplayBluetoothAdapter"

    const-string v5, "a2dp sink is not connected!"

    goto :goto_0

    :cond_7
    :goto_1
    invoke-virtual {p0}, Lcom/autochips/carplay/c/a;->el()Z

    move-result v5

    invoke-direct {p0, v1}, Lcom/autochips/carplay/c/a;->e(Ljava/util/List;)Z

    move-result v6

    iget-object v7, p0, Lcom/autochips/carplay/c/a;->mContext:Landroid/content/Context;

    monitor-enter v7

    :try_start_0
    iget-object v8, p0, Lcom/autochips/carplay/c/a;->uT:Landroid/bluetooth/BluetoothAdapter;

    if-eqz v8, :cond_8

    iget-object v8, p0, Lcom/autochips/carplay/c/a;->uT:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v8, p1}, Landroid/bluetooth/BluetoothAdapter;->getRemoteDevice(Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v8

    iput-object v8, p0, Lcom/autochips/carplay/c/a;->uU:Landroid/bluetooth/BluetoothDevice;

    :cond_8
    monitor-exit v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-direct {p0}, Lcom/autochips/carplay/c/a;->ej()I

    iget-object v7, p0, Lcom/autochips/carplay/c/a;->uT:Landroid/bluetooth/BluetoothAdapter;

    const/16 v8, 0x106

    if-eqz v7, :cond_9

    const-string v7, "CarplayBluetoothAdapter"

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "handlePhoneContinus: deviceID: "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v7, "CarplayBluetoothAdapter"

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "handlePhoneContinus: hfpDevices: "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v7, "CarplayBluetoothAdapter"

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "handlePhoneContinus: callOn: "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v7, p0, Lcom/autochips/carplay/c/a;->uT:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v7, p1}, Landroid/bluetooth/BluetoothAdapter;->getRemoteDevice(Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v7

    if-eqz v0, :cond_9

    invoke-interface {v0, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    if-eqz v5, :cond_9

    const-string v0, "CarplayBluetoothAdapter"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v7, "Route Phone Call from Bluetooth to Carplay: "

    invoke-direct {v5, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v0, v5}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/autochips/carplay/service/g;->dx()Lcom/autochips/carplay/service/g;

    move-result-object v0

    invoke-virtual {v0}, Lcom/autochips/carplay/service/g;->dC()Lcom/autochips/carplay/service/p;

    move-result-object v0

    if-eqz v0, :cond_9

    invoke-virtual {v0}, Lcom/autochips/carplay/service/p;->getConnectedDevices()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v7

    if-eqz v7, :cond_9

    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    if-eqz v7, :cond_9

    iget-object v7, p0, Lcom/autochips/carplay/c/a;->mContext:Landroid/content/Context;

    invoke-static {v7}, Lcom/autochips/carplay/service/ac;->a(Landroid/content/Context;)Lcom/autochips/carplay/service/ac;

    move-result-object v7

    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/autochips/carplay/CarplayDevice;

    invoke-virtual {v5}, Lcom/autochips/carplay/CarplayDevice;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v7, v5}, Lcom/autochips/carplay/service/ac;->K(Ljava/lang/String;)I

    move-result v5

    if-nez v5, :cond_9

    const-string v5, "CarplayBluetoothAdapter"

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v9, "UI State is background, requestUI to show carplay: "

    invoke-direct {v7, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v7}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v0, v8}, Lcom/autochips/carplay/service/p;->obtainMessage(I)Landroid/os/Message;

    move-result-object v5

    iput v3, v5, Landroid/os/Message;->arg1:I

    iput-object v2, v5, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-virtual {v0, v5}, Lcom/autochips/carplay/service/p;->sendMessage(Landroid/os/Message;)V

    :cond_9
    iget-object v0, p0, Lcom/autochips/carplay/c/a;->uT:Landroid/bluetooth/BluetoothAdapter;

    if-eqz v0, :cond_b

    if-eqz p1, :cond_b

    const-string v0, "CarplayBluetoothAdapter"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v7, "handleMusicContinus: deviceID: "

    invoke-direct {v5, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v0, v5}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "CarplayBluetoothAdapter"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v7, "handleMusicContinus: a2dpDevices: "

    invoke-direct {v5, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v0, v5}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "CarplayBluetoothAdapter"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v7, "handleMusicContinus: musicOn: "

    invoke-direct {v5, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v0, v5}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/c/a;->uT:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v0, p1}, Landroid/bluetooth/BluetoothAdapter;->getRemoteDevice(Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v0

    if-eqz v1, :cond_b

    invoke-interface {v1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    if-eqz v6, :cond_b

    const-string v0, "CarplayBluetoothAdapter"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v5, "Route Music from Bluetooth to Carplay: "

    invoke-direct {v1, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/autochips/carplay/service/g;->dx()Lcom/autochips/carplay/service/g;

    move-result-object v0

    invoke-virtual {v0}, Lcom/autochips/carplay/service/g;->dC()Lcom/autochips/carplay/service/p;

    move-result-object v0

    if-eqz v0, :cond_a

    invoke-virtual {v0}, Lcom/autochips/carplay/service/p;->getConnectedDevices()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v5

    if-eqz v5, :cond_a

    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_a

    iget-object v5, p0, Lcom/autochips/carplay/c/a;->mContext:Landroid/content/Context;

    invoke-static {v5}, Lcom/autochips/carplay/service/ac;->a(Landroid/content/Context;)Lcom/autochips/carplay/service/ac;

    move-result-object v5

    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/autochips/carplay/CarplayDevice;

    invoke-virtual {v1}, Lcom/autochips/carplay/CarplayDevice;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v5, v1}, Lcom/autochips/carplay/service/ac;->K(Ljava/lang/String;)I

    move-result v1

    if-nez v1, :cond_a

    const-string v1, "CarplayBluetoothAdapter"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "UI State is background, requestUI to show carplay: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v0, v8}, Lcom/autochips/carplay/service/p;->obtainMessage(I)Landroid/os/Message;

    move-result-object p1

    iput v3, p1, Landroid/os/Message;->arg1:I

    iput-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-virtual {v0, p1}, Lcom/autochips/carplay/service/p;->sendMessage(Landroid/os/Message;)V

    :cond_a
    new-instance p1, Lcom/autochips/carplay/common/f;

    invoke-direct {p1}, Lcom/autochips/carplay/common/f;-><init>()V

    iget-object v1, p1, Lcom/autochips/carplay/common/f;->qG:Lcom/autochips/carplay/common/g;

    iput v3, v1, Lcom/autochips/carplay/common/g;->qK:I

    iget-object v1, p1, Lcom/autochips/carplay/common/f;->qG:Lcom/autochips/carplay/common/g;

    const/16 v2, 0x64

    iput v2, v1, Lcom/autochips/carplay/common/g;->qL:I

    iget-object v1, p1, Lcom/autochips/carplay/common/f;->qG:Lcom/autochips/carplay/common/g;

    iput v2, v1, Lcom/autochips/carplay/common/g;->qM:I

    iget-object v1, p1, Lcom/autochips/carplay/common/f;->qG:Lcom/autochips/carplay/common/g;

    iput v2, v1, Lcom/autochips/carplay/common/g;->qN:I

    if-eqz v0, :cond_b

    const/16 v1, 0x10a

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/service/p;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    iput-object p1, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/service/p;->sendMessage(Landroid/os/Message;)V

    :cond_b
    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :pswitch_4
    iput-object v2, p0, Lcom/autochips/carplay/c/a;->uU:Landroid/bluetooth/BluetoothDevice;

    return-void

    :pswitch_5
    iget p1, p1, Landroid/os/Message;->arg1:I

    if-ne p1, v3, :cond_c

    goto :goto_2

    :cond_c
    move v3, v4

    :goto_2
    const/4 p1, 0x3

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/c/a;->removeMessages(I)V

    if-eqz v3, :cond_d

    invoke-direct {p0}, Lcom/autochips/carplay/c/a;->eg()I

    move-result p1

    if-nez p1, :cond_d

    const-string p1, "CarplayBluetoothAdapter"

    const-string v0, "force to disable bluetooth"

    invoke-static {p1, v0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput-boolean v4, p0, Lcom/autochips/carplay/c/a;->uS:Z

    return-void

    :cond_d
    iget-boolean p1, p0, Lcom/autochips/carplay/c/a;->uS:Z

    if-eqz p1, :cond_e

    invoke-direct {p0}, Lcom/autochips/carplay/c/a;->eg()I

    move-result p1

    if-nez p1, :cond_18

    :cond_e
    iput-boolean v4, p0, Lcom/autochips/carplay/c/a;->uS:Z

    return-void

    :pswitch_6
    iget-object p1, p0, Lcom/autochips/carplay/c/a;->uT:Landroid/bluetooth/BluetoothAdapter;

    if-nez p1, :cond_f

    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object p1

    iput-object p1, p0, Lcom/autochips/carplay/c/a;->uT:Landroid/bluetooth/BluetoothAdapter;

    :cond_f
    iget-object p1, p0, Lcom/autochips/carplay/c/a;->uT:Landroid/bluetooth/BluetoothAdapter;

    if-nez p1, :cond_10

    const-string p1, "CarplayBluetoothAdapter"

    const-string v0, "mBluetoothAdapter is null"

    invoke-static {p1, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_4

    :cond_10
    iget-object p1, p0, Lcom/autochips/carplay/c/a;->uT:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothAdapter;->getLeState()I

    move-result p1

    const/16 v0, 0xa

    if-ne v0, p1, :cond_11

    iget-object p1, p0, Lcom/autochips/carplay/c/a;->uT:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothAdapter;->enable()Z

    move-result p1

    if-eqz p1, :cond_13

    iput-boolean v3, p0, Lcom/autochips/carplay/c/a;->uS:Z

    goto :goto_3

    :cond_11
    const/16 v0, 0xc

    if-ne v0, p1, :cond_12

    invoke-virtual {p0, v1}, Lcom/autochips/carplay/c/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/c/a;->sendMessage(Landroid/os/Message;)Z

    move p1, v3

    goto :goto_3

    :cond_12
    move p1, v4

    :cond_13
    :goto_3
    if-eqz p1, :cond_14

    goto :goto_5

    :cond_14
    :goto_4
    const/4 v4, -0x1

    :goto_5
    if-eqz v4, :cond_18

    const/16 p1, 0x303

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/c/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/c/a;->sendMessage(Landroid/os/Message;)Z

    return-void

    :cond_15
    invoke-direct {p0}, Lcom/autochips/carplay/c/a;->eo()V

    return-void

    :cond_16
    invoke-direct {p0}, Lcom/autochips/carplay/c/a;->eh()I

    return-void

    :cond_17
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Landroid/bluetooth/BluetoothDevice;

    if-eqz p1, :cond_18

    iget-object v0, p0, Lcom/autochips/carplay/c/a;->uU:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {p1, v0}, Landroid/bluetooth/BluetoothDevice;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_18

    invoke-direct {p0}, Lcom/autochips/carplay/c/a;->ej()I

    :cond_18
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_6
        :pswitch_4
        :pswitch_3
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x301
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
