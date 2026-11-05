.class final Lcom/autochips/carplay/b/k;
.super Lcom/android/internal/util/State;


# instance fields
.field final synthetic ss:Lcom/autochips/carplay/b/h;

.field private st:Landroid/media/AudioFocusRequest;

.field private su:Landroid/media/audiopolicy/AudioPolicy;

.field private sv:Z


# direct methods
.method constructor <init>(Lcom/autochips/carplay/b/h;)V
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/b/k;->ss:Lcom/autochips/carplay/b/h;

    invoke-direct {p0}, Lcom/android/internal/util/State;-><init>()V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/autochips/carplay/b/k;->st:Landroid/media/AudioFocusRequest;

    iput-object p1, p0, Lcom/autochips/carplay/b/k;->su:Landroid/media/audiopolicy/AudioPolicy;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/autochips/carplay/b/k;->sv:Z

    return-void
.end method


# virtual methods
.method public final enter()V
    .locals 3

    const-string v0, "FullDuplexAudioManager"

    const-string v1, "entering SpeechRecognitionState"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/b/k;->ss:Lcom/autochips/carplay/b/h;

    iget-object v0, v0, Lcom/autochips/carplay/b/h;->sm:Lcom/autochips/carplay/b/f;

    invoke-static {v0}, Lcom/autochips/carplay/b/f;->a(Lcom/autochips/carplay/b/f;)Landroid/media/AudioManager;

    move-result-object v0

    const/16 v1, 0x7e4

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->setMode(I)V

    const-string v0, "FullDuplexAudioManager"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "SpeechRecognitionState, mode: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/autochips/carplay/b/k;->ss:Lcom/autochips/carplay/b/h;

    iget-object v2, v2, Lcom/autochips/carplay/b/h;->sm:Lcom/autochips/carplay/b/f;

    invoke-static {v2}, Lcom/autochips/carplay/b/f;->a(Lcom/autochips/carplay/b/f;)Landroid/media/AudioManager;

    move-result-object v2

    invoke-virtual {v2}, Landroid/media/AudioManager;->getMode()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    iget-boolean v0, p0, Lcom/autochips/carplay/b/k;->sv:Z

    if-nez v0, :cond_0

    const-string v0, "FullDuplexAudioManager"

    const-string v1, "requestAudioFocusForSpeech"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/b/k;->ss:Lcom/autochips/carplay/b/h;

    iget-object v0, v0, Lcom/autochips/carplay/b/h;->sm:Lcom/autochips/carplay/b/f;

    invoke-static {v0}, Lcom/autochips/carplay/b/f;->a(Lcom/autochips/carplay/b/f;)Landroid/media/AudioManager;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Landroid/media/AudioManager;->requestAudioFocusForCall(II)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/autochips/carplay/b/k;->sv:Z

    :cond_0
    invoke-static {}, Lcom/autochips/carplay/b/h;->dd()V

    return-void
.end method

.method public final exit()V
    .locals 3

    const-string v0, "FullDuplexAudioManager"

    const-string v1, "exit SpeechRecognitionState"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/autochips/carplay/b/h;->de()V

    iget-boolean v0, p0, Lcom/autochips/carplay/b/k;->sv:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const-string v0, "FullDuplexAudioManager"

    const-string v2, "abandonAudioFocusForSpeech"

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/b/k;->ss:Lcom/autochips/carplay/b/h;

    iget-object v0, v0, Lcom/autochips/carplay/b/h;->sm:Lcom/autochips/carplay/b/f;

    invoke-static {v0}, Lcom/autochips/carplay/b/f;->a(Lcom/autochips/carplay/b/f;)Landroid/media/AudioManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/AudioManager;->abandonAudioFocusForCall()V

    iput-boolean v1, p0, Lcom/autochips/carplay/b/k;->sv:Z

    :cond_0
    iget-object v0, p0, Lcom/autochips/carplay/b/k;->ss:Lcom/autochips/carplay/b/h;

    iget-object v0, v0, Lcom/autochips/carplay/b/h;->sm:Lcom/autochips/carplay/b/f;

    invoke-static {v0}, Lcom/autochips/carplay/b/f;->a(Lcom/autochips/carplay/b/f;)Landroid/media/AudioManager;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->setMode(I)V

    return-void
.end method

.method public final processMessage(Landroid/os/Message;)Z
    .locals 3

    const-string v0, "FullDuplexAudioManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/autochips/carplay/b/k;->getName()Ljava/lang/String;

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

    const/4 p1, 0x0

    return p1

    :cond_0
    iget p1, p1, Landroid/os/Message;->arg1:I

    const/16 v0, 0x64

    if-ne p1, v0, :cond_1

    iget-object p1, p0, Lcom/autochips/carplay/b/k;->ss:Lcom/autochips/carplay/b/h;

    iget-object v0, p0, Lcom/autochips/carplay/b/k;->ss:Lcom/autochips/carplay/b/h;

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

    :goto_0
    const/4 p1, 0x1

    return p1
.end method
