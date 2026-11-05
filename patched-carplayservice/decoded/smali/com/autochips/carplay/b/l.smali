.class final Lcom/autochips/carplay/b/l;
.super Lcom/android/internal/util/State;


# instance fields
.field final synthetic ss:Lcom/autochips/carplay/b/h;

.field private sv:Z


# direct methods
.method constructor <init>(Lcom/autochips/carplay/b/h;)V
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/b/l;->ss:Lcom/autochips/carplay/b/h;

    invoke-direct {p0}, Lcom/android/internal/util/State;-><init>()V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/autochips/carplay/b/l;->sv:Z

    return-void
.end method

.method private df()V
    .locals 3

    iget-boolean v0, p0, Lcom/autochips/carplay/b/l;->sv:Z

    if-nez v0, :cond_0

    const-string v0, "FullDuplexAudioManager"

    const-string v1, "requestAudioFocusForCall"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/b/l;->ss:Lcom/autochips/carplay/b/h;

    iget-object v0, v0, Lcom/autochips/carplay/b/h;->sm:Lcom/autochips/carplay/b/f;

    invoke-static {v0}, Lcom/autochips/carplay/b/f;->a(Lcom/autochips/carplay/b/f;)Landroid/media/AudioManager;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Landroid/media/AudioManager;->requestAudioFocusForCall(II)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/autochips/carplay/b/l;->sv:Z

    :cond_0
    return-void
.end method


# virtual methods
.method public final enter()V
    .locals 5

    const-string v0, "FullDuplexAudioManager"

    const-string v1, "entering TelephonyState"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/b/l;->ss:Lcom/autochips/carplay/b/h;

    iget-object v0, v0, Lcom/autochips/carplay/b/h;->sm:Lcom/autochips/carplay/b/f;

    invoke-static {v0}, Lcom/autochips/carplay/b/f;->b(Lcom/autochips/carplay/b/f;)Lcom/autochips/carplay/c/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/autochips/carplay/c/a;->ek()I

    move-result v0

    iget-object v1, p0, Lcom/autochips/carplay/b/l;->ss:Lcom/autochips/carplay/b/h;

    iget-object v1, v1, Lcom/autochips/carplay/b/h;->sm:Lcom/autochips/carplay/b/f;

    invoke-static {v1}, Lcom/autochips/carplay/b/f;->b(Lcom/autochips/carplay/b/f;)Lcom/autochips/carplay/c/a;

    move-result-object v1

    invoke-virtual {v1}, Lcom/autochips/carplay/c/a;->em()I

    move-result v1

    const/4 v2, 0x1

    if-eq v0, v2, :cond_1

    const/4 v2, 0x2

    if-ne v0, v2, :cond_0

    if-ne v1, v2, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/autochips/carplay/b/l;->ss:Lcom/autochips/carplay/b/h;

    iget-object v0, v0, Lcom/autochips/carplay/b/h;->sm:Lcom/autochips/carplay/b/f;

    invoke-static {v0}, Lcom/autochips/carplay/b/f;->a(Lcom/autochips/carplay/b/f;)Landroid/media/AudioManager;

    move-result-object v0

    const/16 v1, 0x7e3

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->setMode(I)V

    const-string v0, "FullDuplexAudioManager"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "TelephonyState, mode: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/autochips/carplay/b/l;->ss:Lcom/autochips/carplay/b/h;

    iget-object v2, v2, Lcom/autochips/carplay/b/h;->sm:Lcom/autochips/carplay/b/f;

    invoke-static {v2}, Lcom/autochips/carplay/b/f;->a(Lcom/autochips/carplay/b/f;)Landroid/media/AudioManager;

    move-result-object v2

    invoke-virtual {v2}, Landroid/media/AudioManager;->getMode()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    invoke-direct {p0}, Lcom/autochips/carplay/b/l;->df()V

    invoke-static {}, Lcom/autochips/carplay/b/h;->dd()V

    return-void

    :cond_1
    :goto_0
    const-string v2, "FullDuplexAudioManager"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "<TelephonyState> accessoty callType: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ", audioState: "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/b/l;->ss:Lcom/autochips/carplay/b/h;

    invoke-static {v0}, Lcom/autochips/carplay/b/h;->f(Lcom/autochips/carplay/b/h;)V

    return-void
.end method

.method public final exit()V
    .locals 3

    const-string v0, "FullDuplexAudioManager"

    const-string v1, "exit TelephonyState"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/autochips/carplay/b/h;->de()V

    iget-boolean v0, p0, Lcom/autochips/carplay/b/l;->sv:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const-string v0, "FullDuplexAudioManager"

    const-string v2, "abandonAudioFocusForCall"

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/b/l;->ss:Lcom/autochips/carplay/b/h;

    iget-object v0, v0, Lcom/autochips/carplay/b/h;->sm:Lcom/autochips/carplay/b/f;

    invoke-static {v0}, Lcom/autochips/carplay/b/f;->a(Lcom/autochips/carplay/b/f;)Landroid/media/AudioManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/AudioManager;->abandonAudioFocusForCall()V

    iput-boolean v1, p0, Lcom/autochips/carplay/b/l;->sv:Z

    :cond_0
    iget-object v0, p0, Lcom/autochips/carplay/b/l;->ss:Lcom/autochips/carplay/b/h;

    iget-object v0, v0, Lcom/autochips/carplay/b/h;->sm:Lcom/autochips/carplay/b/f;

    invoke-static {v0}, Lcom/autochips/carplay/b/f;->a(Lcom/autochips/carplay/b/f;)Landroid/media/AudioManager;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->setMode(I)V

    return-void
.end method

.method public final processMessage(Landroid/os/Message;)Z
    .locals 4

    const-string v0, "FullDuplexAudioManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/autochips/carplay/b/l;->getName()Ljava/lang/String;

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

    const/16 v1, 0xb

    if-eq v0, v1, :cond_0

    packed-switch v0, :pswitch_data_0

    const/4 p1, 0x0

    return p1

    :pswitch_0
    iget-object p1, p0, Lcom/autochips/carplay/b/l;->ss:Lcom/autochips/carplay/b/h;

    iget-object p1, p1, Lcom/autochips/carplay/b/h;->sm:Lcom/autochips/carplay/b/f;

    invoke-static {p1}, Lcom/autochips/carplay/b/f;->b(Lcom/autochips/carplay/b/f;)Lcom/autochips/carplay/c/a;

    move-result-object p1

    invoke-virtual {p1}, Lcom/autochips/carplay/c/a;->el()Z

    move-result p1

    iget-object v0, p0, Lcom/autochips/carplay/b/l;->ss:Lcom/autochips/carplay/b/h;

    iget-object v0, v0, Lcom/autochips/carplay/b/h;->sm:Lcom/autochips/carplay/b/f;

    invoke-static {v0}, Lcom/autochips/carplay/b/f;->b(Lcom/autochips/carplay/b/f;)Lcom/autochips/carplay/c/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/autochips/carplay/c/a;->em()I

    move-result v0

    if-nez p1, :cond_2

    if-nez v0, :cond_2

    const-string v1, "FullDuplexAudioManager"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "<TelephonyState> accessoty callOn: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string p1, ", audioState: "

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/autochips/carplay/b/l;->ss:Lcom/autochips/carplay/b/h;

    invoke-static {p1}, Lcom/autochips/carplay/b/h;->c(Lcom/autochips/carplay/b/h;)I

    move-result p1

    const/4 v0, 0x3

    if-ne p1, v0, :cond_2

    iget-object p1, p0, Lcom/autochips/carplay/b/l;->ss:Lcom/autochips/carplay/b/h;

    invoke-static {p1}, Lcom/autochips/carplay/b/h;->d(Lcom/autochips/carplay/b/h;)V

    iget-object p1, p0, Lcom/autochips/carplay/b/l;->ss:Lcom/autochips/carplay/b/h;

    iget-object p1, p1, Lcom/autochips/carplay/b/h;->sm:Lcom/autochips/carplay/b/f;

    invoke-static {p1}, Lcom/autochips/carplay/b/f;->a(Lcom/autochips/carplay/b/f;)Landroid/media/AudioManager;

    move-result-object p1

    const/16 v0, 0x7e3

    invoke-virtual {p1, v0}, Landroid/media/AudioManager;->setMode(I)V

    const-string p1, "FullDuplexAudioManager"

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "TelephonyState, mode: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/autochips/carplay/b/l;->ss:Lcom/autochips/carplay/b/h;

    iget-object v1, v1, Lcom/autochips/carplay/b/h;->sm:Lcom/autochips/carplay/b/f;

    invoke-static {v1}, Lcom/autochips/carplay/b/f;->a(Lcom/autochips/carplay/b/f;)Landroid/media/AudioManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/media/AudioManager;->getMode()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    invoke-direct {p0}, Lcom/autochips/carplay/b/l;->df()V

    invoke-static {}, Lcom/autochips/carplay/b/h;->dd()V

    goto :goto_0

    :cond_0
    iget p1, p1, Landroid/os/Message;->arg1:I

    const/16 v0, 0x64

    if-ne p1, v0, :cond_1

    iget-object p1, p0, Lcom/autochips/carplay/b/l;->ss:Lcom/autochips/carplay/b/h;

    iget-object v0, p0, Lcom/autochips/carplay/b/l;->ss:Lcom/autochips/carplay/b/h;

    invoke-static {v0}, Lcom/autochips/carplay/b/h;->a(Lcom/autochips/carplay/b/h;)Lcom/android/internal/util/State;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/b/h;->transitionTo(Lcom/android/internal/util/IState;)V

    goto :goto_0

    :cond_1
    const-string v0, "FullDuplexAudioManager"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "ignore invalid stream id: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    :goto_0
    const/4 p1, 0x1

    return p1

    nop

    :pswitch_data_0
    .packed-switch 0x901
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method
