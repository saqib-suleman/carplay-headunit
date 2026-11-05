.class final Lcom/autochips/carplay/b/q;
.super Lcom/android/internal/util/State;


# instance fields
.field final synthetic sF:Lcom/autochips/carplay/b/o;


# direct methods
.method constructor <init>(Lcom/autochips/carplay/b/o;)V
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/b/q;->sF:Lcom/autochips/carplay/b/o;

    invoke-direct {p0}, Lcom/android/internal/util/State;-><init>()V

    return-void
.end method


# virtual methods
.method public final enter()V
    .locals 2

    const-string v0, "AlternateAudioStateMachine"

    const-string v1, "entering StartedState"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/b/q;->sF:Lcom/autochips/carplay/b/o;

    iget-object v0, v0, Lcom/autochips/carplay/b/o;->sC:Lcom/autochips/carplay/b/m;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/autochips/carplay/b/m;->a(Lcom/autochips/carplay/b/m;Z)V

    iget-object v0, p0, Lcom/autochips/carplay/b/q;->sF:Lcom/autochips/carplay/b/o;

    iget-object v1, p0, Lcom/autochips/carplay/b/q;->sF:Lcom/autochips/carplay/b/o;

    invoke-static {v1}, Lcom/autochips/carplay/b/o;->b(Lcom/autochips/carplay/b/o;)Landroid/media/AudioFocusRequest;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/autochips/carplay/b/o;->a(Lcom/autochips/carplay/b/o;Landroid/media/AudioFocusRequest;)Landroid/media/AudioFocusRequest;

    invoke-static {}, Lcom/autochips/carplay/b/o;->dk()V

    return-void
.end method

.method public final exit()V
    .locals 2

    iget-object v0, p0, Lcom/autochips/carplay/b/q;->sF:Lcom/autochips/carplay/b/o;

    iget-object v0, v0, Lcom/autochips/carplay/b/o;->sC:Lcom/autochips/carplay/b/m;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/autochips/carplay/b/m;->a(Lcom/autochips/carplay/b/m;Z)V

    invoke-static {}, Lcom/autochips/carplay/b/o;->dl()V

    iget-object v0, p0, Lcom/autochips/carplay/b/q;->sF:Lcom/autochips/carplay/b/o;

    invoke-static {v0}, Lcom/autochips/carplay/b/o;->d(Lcom/autochips/carplay/b/o;)V

    return-void
.end method

.method public final processMessage(Landroid/os/Message;)Z
    .locals 3

    const-string v0, "AlternateAudioStateMachine"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/autochips/carplay/b/q;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " processMessage: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Landroid/os/Message;->what:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x1

    packed-switch v0, :pswitch_data_0

    const-string v0, "AlternateAudioStateMachine"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "received an invalid message: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, 0x0

    return p1

    :pswitch_0
    iget-object p1, p0, Lcom/autochips/carplay/b/q;->sF:Lcom/autochips/carplay/b/o;

    invoke-static {p1, v1}, Lcom/autochips/carplay/b/o;->a(Lcom/autochips/carplay/b/o;I)I

    iget-object p1, p0, Lcom/autochips/carplay/b/q;->sF:Lcom/autochips/carplay/b/o;

    iget-object v0, p0, Lcom/autochips/carplay/b/q;->sF:Lcom/autochips/carplay/b/o;

    invoke-static {v0}, Lcom/autochips/carplay/b/o;->c(Lcom/autochips/carplay/b/o;)Lcom/android/internal/util/State;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/b/o;->transitionTo(Lcom/android/internal/util/IState;)V

    :pswitch_1
    return v1

    nop

    :pswitch_data_0
    .packed-switch 0xa
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
