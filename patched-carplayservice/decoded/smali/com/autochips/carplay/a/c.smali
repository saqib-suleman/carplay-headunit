.class final Lcom/autochips/carplay/a/c;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/os/IHwBinder$DeathRecipient;


# instance fields
.field final synthetic rc:Lcom/autochips/carplay/a/a;


# direct methods
.method constructor <init>(Lcom/autochips/carplay/a/a;)V
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/a/c;->rc:Lcom/autochips/carplay/a/a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final serviceDied(J)V
    .locals 1

    const-string p1, "CarplayIAP2Adapter"

    const-string p2, "iapservice is dead"

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/autochips/carplay/a/c;->rc:Lcom/autochips/carplay/a/a;

    iget-object p2, p0, Lcom/autochips/carplay/a/c;->rc:Lcom/autochips/carplay/a/a;

    const/4 v0, 0x3

    invoke-virtual {p2, v0}, Lcom/autochips/carplay/a/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/autochips/carplay/a/a;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method
