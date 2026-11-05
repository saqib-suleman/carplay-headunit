.class final Lcom/autochips/carplay/wired/b;
.super Lcom/autochips/usbd/INotifyCallback$Stub;


# instance fields
.field final synthetic uQ:Lcom/autochips/carplay/wired/a;


# direct methods
.method private constructor <init>(Lcom/autochips/carplay/wired/a;)V
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/wired/b;->uQ:Lcom/autochips/carplay/wired/a;

    invoke-direct {p0}, Lcom/autochips/usbd/INotifyCallback$Stub;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/autochips/carplay/wired/a;B)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/autochips/carplay/wired/b;-><init>(Lcom/autochips/carplay/wired/a;)V

    return-void
.end method


# virtual methods
.method public final onIfNameCallBack(Lcom/autochips/usbd/USBDev;)V
    .locals 3

    const-string v0, "CarplayUSBNCMAdapter"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "onIfNameCallBack: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/autochips/usbd/USBDev;->getIfName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/wired/b;->uQ:Lcom/autochips/carplay/wired/a;

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/wired/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p1}, Lcom/autochips/usbd/USBDev;->getIfName()Ljava/lang/String;

    move-result-object p1

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p1, p0, Lcom/autochips/carplay/wired/b;->uQ:Lcom/autochips/carplay/wired/a;

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/wired/a;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method
