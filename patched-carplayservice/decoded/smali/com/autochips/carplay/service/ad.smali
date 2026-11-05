.class public final Lcom/autochips/carplay/service/ad;
.super Ljava/lang/Object;


# static fields
.field private static final uM:[Ljava/lang/String;


# instance fields
.field private final tm:Lcom/autochips/carplay/service/a;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    const-string v0, "Last Resort Watchdog"

    const-string v1, "Hal Crash"

    const-string v2, "Usbdaemon Crash"

    const-string v3, "Connect Timeout"

    const-string v4, "Connect Fail"

    const-string v5, "Client Death"

    filled-new-array/range {v0 .. v5}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/autochips/carplay/service/ad;->uM:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/autochips/carplay/service/a;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/autochips/carplay/service/ad;->tm:Lcom/autochips/carplay/service/a;

    return-void
.end method


# virtual methods
.method public final an(I)V
    .locals 3

    if-nez p1, :cond_0

    const-string p1, "CarplaySelfRecovery"

    const-string v0, "Invalid trigger reason. Ignoring..."

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    const-string v0, "CarplaySelfRecovery"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Triggering recovery for reason: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/autochips/carplay/service/ad;->tm:Lcom/autochips/carplay/service/a;

    const/16 v0, 0x102

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/service/a;->sendMessage(I)V

    return-void
.end method
