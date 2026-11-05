.class final Lcom/autochips/carplay/b/p;
.super Lcom/android/internal/util/State;


# instance fields
.field final synthetic sF:Lcom/autochips/carplay/b/o;


# direct methods
.method constructor <init>(Lcom/autochips/carplay/b/o;)V
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/b/p;->sF:Lcom/autochips/carplay/b/o;

    invoke-direct {p0}, Lcom/android/internal/util/State;-><init>()V

    return-void
.end method


# virtual methods
.method public final enter()V
    .locals 2

    const-string v0, "AlternateAudioStateMachine"

    const-string v1, "entering IdleState"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public final processMessage(Landroid/os/Message;)Z
    .locals 4

    const-string v0, "AlternateAudioStateMachine"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/autochips/carplay/b/p;->getName()Ljava/lang/String;

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

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_0

    const-string v0, "AlternateAudioStateMachine"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "received an invalid message: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    :pswitch_0
    iget-object p1, p0, Lcom/autochips/carplay/b/p;->sF:Lcom/autochips/carplay/b/o;

    invoke-static {p1, v1}, Lcom/autochips/carplay/b/o;->a(Lcom/autochips/carplay/b/o;I)I

    iget-object p1, p0, Lcom/autochips/carplay/b/p;->sF:Lcom/autochips/carplay/b/o;

    iget-object v0, p0, Lcom/autochips/carplay/b/p;->sF:Lcom/autochips/carplay/b/o;

    invoke-static {v0}, Lcom/autochips/carplay/b/o;->a(Lcom/autochips/carplay/b/o;)Lcom/android/internal/util/State;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/b/o;->transitionTo(Lcom/android/internal/util/IState;)V

    :pswitch_1
    const/4 p1, 0x1

    return p1

    nop

    :pswitch_data_0
    .packed-switch 0xa
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
