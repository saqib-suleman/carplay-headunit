.class final Lcom/autochips/carplay/b/j;
.super Lcom/android/internal/util/State;


# instance fields
.field final synthetic ss:Lcom/autochips/carplay/b/h;


# direct methods
.method constructor <init>(Lcom/autochips/carplay/b/h;)V
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/b/j;->ss:Lcom/autochips/carplay/b/h;

    invoke-direct {p0}, Lcom/android/internal/util/State;-><init>()V

    return-void
.end method


# virtual methods
.method public final enter()V
    .locals 2

    const-string v0, "FullDuplexAudioManager"

    const-string v1, "entering ControllerState"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public final exit()V
    .locals 2

    const-string v0, "FullDuplexAudioManager"

    const-string v1, "exit ControllerState"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public final processMessage(Landroid/os/Message;)Z
    .locals 5

    const-string v0, "FullDuplexAudioManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/autochips/carplay/b/j;->getName()Ljava/lang/String;

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

    const/16 v1, 0xf

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eq v0, v1, :cond_4

    packed-switch v0, :pswitch_data_0

    packed-switch v0, :pswitch_data_1

    return v3

    :pswitch_0
    iget-object p1, p0, Lcom/autochips/carplay/b/j;->ss:Lcom/autochips/carplay/b/h;

    iget-object p1, p1, Lcom/autochips/carplay/b/h;->sm:Lcom/autochips/carplay/b/f;

    invoke-static {p1}, Lcom/autochips/carplay/b/f;->b(Lcom/autochips/carplay/b/f;)Lcom/autochips/carplay/c/a;

    move-result-object p1

    invoke-virtual {p1}, Lcom/autochips/carplay/c/a;->el()Z

    move-result p1

    iget-object v0, p0, Lcom/autochips/carplay/b/j;->ss:Lcom/autochips/carplay/b/h;

    iget-object v0, v0, Lcom/autochips/carplay/b/h;->sm:Lcom/autochips/carplay/b/f;

    invoke-static {v0}, Lcom/autochips/carplay/b/f;->b(Lcom/autochips/carplay/b/f;)Lcom/autochips/carplay/c/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/autochips/carplay/c/a;->em()I

    move-result v0

    if-nez p1, :cond_6

    if-nez v0, :cond_6

    const-string v1, "FullDuplexAudioManager"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "<ControllerState> accessoty callOn: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string p1, ", audioState: "

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/autochips/carplay/b/j;->ss:Lcom/autochips/carplay/b/h;

    invoke-static {p1}, Lcom/autochips/carplay/b/h;->c(Lcom/autochips/carplay/b/h;)I

    move-result p1

    const/4 v0, 0x3

    if-ne p1, v0, :cond_6

    iget-object p1, p0, Lcom/autochips/carplay/b/j;->ss:Lcom/autochips/carplay/b/h;

    invoke-static {p1}, Lcom/autochips/carplay/b/h;->d(Lcom/autochips/carplay/b/h;)V

    return v2

    :goto_0
    :pswitch_1
    iget-object p1, p0, Lcom/autochips/carplay/b/j;->ss:Lcom/autochips/carplay/b/h;

    iget-object v0, p0, Lcom/autochips/carplay/b/j;->ss:Lcom/autochips/carplay/b/h;

    invoke-static {v0}, Lcom/autochips/carplay/b/h;->e(Lcom/autochips/carplay/b/h;)Lcom/android/internal/util/State;

    move-result-object v0

    :goto_1
    invoke-virtual {p1, v0}, Lcom/autochips/carplay/b/h;->transitionTo(Lcom/android/internal/util/IState;)V

    return v2

    :pswitch_2
    iget p1, p1, Landroid/os/Message;->arg1:I

    const/16 v0, 0x64

    if-eq p1, v0, :cond_1

    const/16 v0, 0x66

    if-ne p1, v0, :cond_0

    goto :goto_2

    :cond_0
    const-string v0, "FullDuplexAudioManager"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "ignore invalid stream id: "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v2

    :cond_1
    :goto_2
    sget-object p1, Lcom/autochips/carplay/b/f;->sk:Lcom/autochips/carplay/b/f;

    invoke-virtual {p1}, Lcom/autochips/carplay/b/f;->do()Lcom/autochips/carplay/common/b;

    move-result-object p1

    if-eqz p1, :cond_6

    invoke-virtual {p1}, Lcom/autochips/carplay/common/b;->getMainAudio()I

    move-result p1

    const/4 v0, 0x2

    if-ne v0, p1, :cond_2

    goto :goto_0

    :cond_2
    if-ne v2, p1, :cond_3

    iget-object v0, p0, Lcom/autochips/carplay/b/j;->ss:Lcom/autochips/carplay/b/h;

    invoke-virtual {v0}, Lcom/autochips/carplay/b/h;->getCurrentState()Lcom/android/internal/util/IState;

    move-result-object v0

    iget-object v1, p0, Lcom/autochips/carplay/b/j;->ss:Lcom/autochips/carplay/b/h;

    invoke-static {v1}, Lcom/autochips/carplay/b/h;->a(Lcom/autochips/carplay/b/h;)Lcom/android/internal/util/State;

    move-result-object v1

    if-eq v0, v1, :cond_3

    iget-object p1, p0, Lcom/autochips/carplay/b/j;->ss:Lcom/autochips/carplay/b/h;

    iget-object v0, p0, Lcom/autochips/carplay/b/j;->ss:Lcom/autochips/carplay/b/h;

    invoke-static {v0}, Lcom/autochips/carplay/b/h;->a(Lcom/autochips/carplay/b/h;)Lcom/android/internal/util/State;

    move-result-object v0

    goto :goto_1

    :cond_3
    const-string v0, "FullDuplexAudioManager"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "main audio entity: "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return v2

    :pswitch_3
    iget v0, p1, Landroid/os/Message;->arg1:I

    iget p1, p1, Landroid/os/Message;->arg2:I

    iget-object v1, p0, Lcom/autochips/carplay/b/j;->ss:Lcom/autochips/carplay/b/h;

    invoke-static {v1, v0, p1}, Lcom/autochips/carplay/b/h;->a(Lcom/autochips/carplay/b/h;II)V

    return v2

    :cond_4
    iget-object p1, p0, Lcom/autochips/carplay/b/j;->ss:Lcom/autochips/carplay/b/h;

    iget-object p1, p1, Lcom/autochips/carplay/b/h;->sm:Lcom/autochips/carplay/b/f;

    invoke-static {p1}, Lcom/autochips/carplay/b/f;->a(Lcom/autochips/carplay/b/f;)Landroid/media/AudioManager;

    move-result-object p1

    invoke-virtual {p1}, Landroid/media/AudioManager;->getMode()I

    move-result p1

    const/16 v0, 0x7e3

    if-eq p1, v0, :cond_5

    const/16 v0, 0x7e4

    if-ne p1, v0, :cond_6

    :cond_5
    const-string v0, "FullDuplexAudioManager"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v4, "<ControllerState> audio mode in "

    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ", set to normal"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/autochips/carplay/b/j;->ss:Lcom/autochips/carplay/b/h;

    iget-object p1, p1, Lcom/autochips/carplay/b/h;->sm:Lcom/autochips/carplay/b/f;

    invoke-static {p1}, Lcom/autochips/carplay/b/f;->a(Lcom/autochips/carplay/b/f;)Landroid/media/AudioManager;

    move-result-object p1

    invoke-virtual {p1, v3}, Landroid/media/AudioManager;->setMode(I)V

    :cond_6
    :pswitch_4
    return v2

    :pswitch_data_0
    .packed-switch 0xa
        :pswitch_3
        :pswitch_2
        :pswitch_4
        :pswitch_1
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x901
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method
