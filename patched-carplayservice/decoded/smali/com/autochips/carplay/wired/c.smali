.class final Lcom/autochips/carplay/wired/c;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/os/IBinder$DeathRecipient;


# instance fields
.field private mBinder:Landroid/os/IBinder;

.field final synthetic uQ:Lcom/autochips/carplay/wired/a;

.field private uR:I


# direct methods
.method constructor <init>(Lcom/autochips/carplay/wired/a;Landroid/os/IBinder;)V
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/wired/c;->uQ:Lcom/autochips/carplay/wired/a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/autochips/carplay/wired/c;->mBinder:Landroid/os/IBinder;

    const/4 p1, 0x0

    iput p1, p0, Lcom/autochips/carplay/wired/c;->uR:I

    return-void
.end method


# virtual methods
.method public final binderDied()V
    .locals 3

    const-string v0, "CarplayUSBNCMAdapter"

    const-string v1, "usbdservice is dead"

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/wired/c;->mBinder:Landroid/os/IBinder;

    const/4 v1, 0x0

    invoke-interface {v0, p0, v1}, Landroid/os/IBinder;->unlinkToDeath(Landroid/os/IBinder$DeathRecipient;I)Z

    iget-object v0, p0, Lcom/autochips/carplay/wired/c;->uQ:Lcom/autochips/carplay/wired/a;

    iget-object v1, p0, Lcom/autochips/carplay/wired/c;->uQ:Lcom/autochips/carplay/wired/a;

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Lcom/autochips/carplay/wired/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/wired/a;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method
