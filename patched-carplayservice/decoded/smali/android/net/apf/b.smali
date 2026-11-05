.class final Landroid/net/apf/b;
.super Landroid/content/BroadcastReceiver;


# instance fields
.field final synthetic aP:Landroid/net/apf/ApfFilter;


# direct methods
.method constructor <init>(Landroid/net/apf/ApfFilter;)V
    .locals 0

    iput-object p1, p0, Landroid/net/apf/b;->aP:Landroid/net/apf/ApfFilter;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p2

    const-string v0, "android.os.action.DEVICE_IDLE_MODE_CHANGED"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_0

    const-string p2, "power"

    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/PowerManager;

    invoke-virtual {p1}, Landroid/os/PowerManager;->isDeviceIdleMode()Z

    move-result p1

    iget-object p2, p0, Landroid/net/apf/b;->aP:Landroid/net/apf/ApfFilter;

    invoke-virtual {p2, p1}, Landroid/net/apf/ApfFilter;->setDozeMode(Z)V

    :cond_0
    return-void
.end method
