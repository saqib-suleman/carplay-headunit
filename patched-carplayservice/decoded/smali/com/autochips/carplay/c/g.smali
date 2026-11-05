.class final Lcom/autochips/carplay/c/g;
.super Landroid/net/ConnectivityManager$OnStartTetheringCallback;


# instance fields
.field final synthetic vh:Lcom/autochips/carplay/c/e;


# direct methods
.method constructor <init>(Lcom/autochips/carplay/c/e;)V
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/c/g;->vh:Lcom/autochips/carplay/c/e;

    invoke-direct {p0}, Landroid/net/ConnectivityManager$OnStartTetheringCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public final onTetheringFailed()V
    .locals 3

    invoke-super {p0}, Landroid/net/ConnectivityManager$OnStartTetheringCallback;->onTetheringFailed()V

    const-string v0, "CarplayWifiHotspotAdapter"

    const-string v1, "onTetheringFailed"

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/c/g;->vh:Lcom/autochips/carplay/c/e;

    iget-object v1, p0, Lcom/autochips/carplay/c/g;->vh:Lcom/autochips/carplay/c/e;

    const/16 v2, 0x403

    invoke-virtual {v1, v2}, Lcom/autochips/carplay/c/e;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/c/e;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method public final onTetheringStarted()V
    .locals 2

    invoke-super {p0}, Landroid/net/ConnectivityManager$OnStartTetheringCallback;->onTetheringStarted()V

    const-string v0, "CarplayWifiHotspotAdapter"

    const-string v1, "onTetheringStarted"

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
