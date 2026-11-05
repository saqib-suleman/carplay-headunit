.class public abstract Landroid/support/v4/media/session/g;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/os/IBinder$DeathRecipient;


# instance fields
.field private final lN:Ljava/lang/Object;

.field lO:Landroid/support/v4/media/session/h;

.field lP:Landroid/support/v4/media/session/a;


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    new-instance v0, Landroid/support/v4/media/session/i;

    invoke-direct {v0, p0}, Landroid/support/v4/media/session/i;-><init>(Landroid/support/v4/media/session/g;)V

    new-instance v1, Landroid/support/v4/media/session/p;

    invoke-direct {v1, v0}, Landroid/support/v4/media/session/p;-><init>(Landroid/support/v4/media/session/o;)V

    iput-object v1, p0, Landroid/support/v4/media/session/g;->lN:Ljava/lang/Object;

    return-void

    :cond_0
    new-instance v0, Landroid/support/v4/media/session/j;

    invoke-direct {v0, p0}, Landroid/support/v4/media/session/j;-><init>(Landroid/support/v4/media/session/g;)V

    iput-object v0, p0, Landroid/support/v4/media/session/g;->lP:Landroid/support/v4/media/session/a;

    iput-object v0, p0, Landroid/support/v4/media/session/g;->lN:Ljava/lang/Object;

    return-void
.end method

.method static synthetic b(Landroid/support/v4/media/session/g;)Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Landroid/support/v4/media/session/g;->lN:Ljava/lang/Object;

    return-object p0
.end method


# virtual methods
.method final a(ILjava/lang/Object;Landroid/os/Bundle;)V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/media/session/g;->lO:Landroid/support/v4/media/session/h;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/media/session/g;->lO:Landroid/support/v4/media/session/h;

    invoke-virtual {v0, p1, p2}, Landroid/support/v4/media/session/h;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p1, p3}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    :cond_0
    return-void
.end method

.method public a(Landroid/support/v4/media/MediaMetadataCompat;)V
    .locals 0

    return-void
.end method

.method public a(Landroid/support/v4/media/session/PlaybackStateCompat;)V
    .locals 0

    return-void
.end method

.method public bM()V
    .locals 0

    return-void
.end method

.method public final bU()Landroid/support/v4/media/session/a;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/media/session/g;->lP:Landroid/support/v4/media/session/a;

    return-object v0
.end method

.method final bV()V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/media/session/g;->lO:Landroid/support/v4/media/session/h;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/media/session/g;->lO:Landroid/support/v4/media/session/h;

    const/4 v1, 0x0

    iput-boolean v1, v0, Landroid/support/v4/media/session/h;->mRegistered:Z

    iget-object v0, p0, Landroid/support/v4/media/session/g;->lO:Landroid/support/v4/media/session/h;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v4/media/session/h;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    iput-object v1, p0, Landroid/support/v4/media/session/g;->lO:Landroid/support/v4/media/session/h;

    :cond_0
    return-void
.end method

.method public binderDied()V
    .locals 0

    invoke-virtual {p0}, Landroid/support/v4/media/session/g;->onSessionDestroyed()V

    return-void
.end method

.method public onSessionDestroyed()V
    .locals 0

    return-void
.end method

.method public onSessionEvent(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 0

    return-void
.end method
