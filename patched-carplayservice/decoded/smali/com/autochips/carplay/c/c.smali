.class final Lcom/autochips/carplay/c/c;
.super Landroid/telephony/PhoneStateListener;


# instance fields
.field final synthetic vc:Lcom/autochips/carplay/c/a;


# direct methods
.method constructor <init>(Lcom/autochips/carplay/c/a;)V
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/c/c;->vc:Lcom/autochips/carplay/c/a;

    invoke-direct {p0}, Landroid/telephony/PhoneStateListener;-><init>()V

    return-void
.end method


# virtual methods
.method public final onCallStateChanged(ILjava/lang/String;)V
    .locals 3

    const-string v0, "CarplayBluetoothAdapter"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "PhoneStateListener.onCallStateChanged: state="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ", phoneNumber="

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/autochips/carplay/service/g;->dx()Lcom/autochips/carplay/service/g;

    move-result-object p1

    invoke-virtual {p1}, Lcom/autochips/carplay/service/g;->dz()Lcom/autochips/carplay/service/h;

    move-result-object p1

    if-eqz p1, :cond_0

    const/16 p2, 0x902

    const/4 v0, 0x1

    invoke-virtual {p1, p2, v0}, Lcom/autochips/carplay/service/h;->sendMessage(II)V

    :cond_0
    return-void
.end method
