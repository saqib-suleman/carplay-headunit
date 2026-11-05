.class public final Landroid/support/v4/media/session/MediaControllerCompat;
.super Ljava/lang/Object;


# instance fields
.field private final lL:Landroid/support/v4/media/session/k;

.field private final lM:Ljava/util/HashSet;


# virtual methods
.method public final a(Landroid/support/v4/media/session/g;)V
    .locals 1

    if-eqz p1, :cond_0

    :try_start_0
    iget-object v0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->lM:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    iget-object v0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->lL:Landroid/support/v4/media/session/k;

    invoke-interface {v0, p1}, Landroid/support/v4/media/session/k;->a(Landroid/support/v4/media/session/g;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {p1}, Landroid/support/v4/media/session/g;->bV()V

    return-void

    :catchall_0
    move-exception v0

    invoke-virtual {p1}, Landroid/support/v4/media/session/g;->bV()V

    throw v0

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "callback must not be null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final sendCommand(Ljava/lang/String;Landroid/os/Bundle;Landroid/os/ResultReceiver;)V
    .locals 1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/media/session/MediaControllerCompat;->lL:Landroid/support/v4/media/session/k;

    invoke-interface {v0, p1, p2, p3}, Landroid/support/v4/media/session/k;->sendCommand(Ljava/lang/String;Landroid/os/Bundle;Landroid/os/ResultReceiver;)V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "command must neither be null nor empty"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
