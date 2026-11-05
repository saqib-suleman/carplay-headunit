.class Lcom/autochips/carplay/b/s;
.super Lcom/android/internal/util/StateMachine;


# instance fields
.field private rZ:Lcom/autochips/carplay/common/f;

.field final synthetic sC:Lcom/autochips/carplay/b/m;

.field private sD:I

.field private sG:I

.field private sH:I

.field private sI:Z

.field private sJ:Z

.field private final sK:I

.field private final sL:Lcom/android/internal/util/State;

.field private final sM:Lcom/android/internal/util/State;

.field private final sN:Lcom/android/internal/util/State;

.field private final sO:Lcom/android/internal/util/State;

.field private final sn:Lcom/android/internal/util/State;

.field private final so:Lcom/android/internal/util/State;

.field private sr:I


# direct methods
.method constructor <init>(Lcom/autochips/carplay/b/m;Landroid/os/Looper;)V
    .locals 1

    iput-object p1, p0, Lcom/autochips/carplay/b/s;->sC:Lcom/autochips/carplay/b/m;

    const-class p1, Lcom/autochips/carplay/b/s;

    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1, p2}, Lcom/android/internal/util/StateMachine;-><init>(Ljava/lang/String;Landroid/os/Looper;)V

    const/4 p1, 0x0

    iput p1, p0, Lcom/autochips/carplay/b/s;->sG:I

    iput p1, p0, Lcom/autochips/carplay/b/s;->sH:I

    const/4 p2, 0x1

    iput p2, p0, Lcom/autochips/carplay/b/s;->sD:I

    iput-boolean p1, p0, Lcom/autochips/carplay/b/s;->sI:Z

    iput-boolean p1, p0, Lcom/autochips/carplay/b/s;->sJ:Z

    const-string p2, "ro.atc.carplay.audio_duck_pct"

    const/16 v0, 0x19

    invoke-static {p2, v0}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result p2

    iput p2, p0, Lcom/autochips/carplay/b/s;->sK:I

    new-instance p2, Lcom/autochips/carplay/b/t;

    invoke-direct {p2, p0}, Lcom/autochips/carplay/b/t;-><init>(Lcom/autochips/carplay/b/s;)V

    iput-object p2, p0, Lcom/autochips/carplay/b/s;->sn:Lcom/android/internal/util/State;

    new-instance p2, Lcom/autochips/carplay/b/w;

    invoke-direct {p2, p0}, Lcom/autochips/carplay/b/w;-><init>(Lcom/autochips/carplay/b/s;)V

    iput-object p2, p0, Lcom/autochips/carplay/b/s;->so:Lcom/android/internal/util/State;

    new-instance p2, Lcom/autochips/carplay/b/x;

    invoke-direct {p2, p0}, Lcom/autochips/carplay/b/x;-><init>(Lcom/autochips/carplay/b/s;)V

    iput-object p2, p0, Lcom/autochips/carplay/b/s;->sL:Lcom/android/internal/util/State;

    new-instance p2, Lcom/autochips/carplay/b/u;

    invoke-direct {p2, p0}, Lcom/autochips/carplay/b/u;-><init>(Lcom/autochips/carplay/b/s;)V

    iput-object p2, p0, Lcom/autochips/carplay/b/s;->sM:Lcom/android/internal/util/State;

    new-instance p2, Lcom/autochips/carplay/b/y;

    invoke-direct {p2, p0}, Lcom/autochips/carplay/b/y;-><init>(Lcom/autochips/carplay/b/s;)V

    iput-object p2, p0, Lcom/autochips/carplay/b/s;->sN:Lcom/android/internal/util/State;

    new-instance p2, Lcom/autochips/carplay/b/v;

    invoke-direct {p2, p0}, Lcom/autochips/carplay/b/v;-><init>(Lcom/autochips/carplay/b/s;)V

    iput-object p2, p0, Lcom/autochips/carplay/b/s;->sO:Lcom/android/internal/util/State;

    const/4 p2, 0x0

    iput-object p2, p0, Lcom/autochips/carplay/b/s;->rZ:Lcom/autochips/carplay/common/f;

    iput p1, p0, Lcom/autochips/carplay/b/s;->sr:I

    iget-object p1, p0, Lcom/autochips/carplay/b/s;->sn:Lcom/android/internal/util/State;

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/b/s;->addState(Lcom/android/internal/util/State;)V

    iget-object p1, p0, Lcom/autochips/carplay/b/s;->so:Lcom/android/internal/util/State;

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/b/s;->addState(Lcom/android/internal/util/State;)V

    iget-object p1, p0, Lcom/autochips/carplay/b/s;->sL:Lcom/android/internal/util/State;

    iget-object p2, p0, Lcom/autochips/carplay/b/s;->so:Lcom/android/internal/util/State;

    invoke-virtual {p0, p1, p2}, Lcom/autochips/carplay/b/s;->addState(Lcom/android/internal/util/State;Lcom/android/internal/util/State;)V

    iget-object p1, p0, Lcom/autochips/carplay/b/s;->sM:Lcom/android/internal/util/State;

    iget-object p2, p0, Lcom/autochips/carplay/b/s;->so:Lcom/android/internal/util/State;

    invoke-virtual {p0, p1, p2}, Lcom/autochips/carplay/b/s;->addState(Lcom/android/internal/util/State;Lcom/android/internal/util/State;)V

    iget-object p1, p0, Lcom/autochips/carplay/b/s;->sN:Lcom/android/internal/util/State;

    iget-object p2, p0, Lcom/autochips/carplay/b/s;->so:Lcom/android/internal/util/State;

    invoke-virtual {p0, p1, p2}, Lcom/autochips/carplay/b/s;->addState(Lcom/android/internal/util/State;Lcom/android/internal/util/State;)V

    iget-object p1, p0, Lcom/autochips/carplay/b/s;->sO:Lcom/android/internal/util/State;

    iget-object p2, p0, Lcom/autochips/carplay/b/s;->so:Lcom/android/internal/util/State;

    invoke-virtual {p0, p1, p2}, Lcom/autochips/carplay/b/s;->addState(Lcom/android/internal/util/State;Lcom/android/internal/util/State;)V

    iget-object p1, p0, Lcom/autochips/carplay/b/s;->sn:Lcom/android/internal/util/State;

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/b/s;->setInitialState(Lcom/android/internal/util/State;)V

    invoke-virtual {p0}, Lcom/autochips/carplay/b/s;->start()V

    return-void
.end method

.method private declared-synchronized Z(I)I
    .locals 7

    monitor-enter p0

    :try_start_0
    const-string v0, "OutputAudioStateMachine"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "requestAudioFocus audioType: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x1

    packed-switch p1, :pswitch_data_0

    move v1, v0

    goto :goto_0

    :pswitch_0
    const/4 v1, 0x4

    goto :goto_0

    :pswitch_1
    const/4 v1, 0x0

    :goto_0
    new-instance v2, Landroid/media/AudioAttributes$Builder;

    invoke-direct {v2}, Landroid/media/AudioAttributes$Builder;-><init>()V

    invoke-virtual {v2, v1}, Landroid/media/AudioAttributes$Builder;->setUsage(I)Landroid/media/AudioAttributes$Builder;

    move-result-object v1

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Landroid/media/AudioAttributes$Builder;->setContentType(I)Landroid/media/AudioAttributes$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/media/AudioAttributes$Builder;->build()Landroid/media/AudioAttributes;

    move-result-object v1

    sget-object v3, Lcom/autochips/carplay/b/m;->sj:Lcom/autochips/carplay/b/m;

    invoke-virtual {v3}, Lcom/autochips/carplay/b/m;->do()Lcom/autochips/carplay/common/b;

    move-result-object v3

    if-eqz v3, :cond_0

    invoke-virtual {v3}, Lcom/autochips/carplay/common/b;->cU()I

    move-result v4

    if-ne v0, v4, :cond_0

    const-string v4, "OutputAudioStateMachine"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "apple device is phone calling: "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/autochips/carplay/common/b;->cU()I

    move-result v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_1
    invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move v3, v2

    goto :goto_2

    :cond_0
    if-eqz v3, :cond_1

    invoke-virtual {v3}, Lcom/autochips/carplay/common/b;->cT()Lcom/autochips/carplay/common/d;

    move-result-object v4

    iget v4, v4, Lcom/autochips/carplay/common/d;->qA:I

    if-ne v0, v4, :cond_1

    invoke-virtual {v3}, Lcom/autochips/carplay/common/b;->cT()Lcom/autochips/carplay/common/d;

    move-result-object v4

    iget v4, v4, Lcom/autochips/carplay/common/d;->qB:I

    if-ne v0, v4, :cond_1

    const-string v4, "OutputAudioStateMachine"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "apple device is speech: "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/autochips/carplay/common/b;->cT()Lcom/autochips/carplay/common/d;

    move-result-object v6

    iget v6, v6, Lcom/autochips/carplay/common/d;->qA:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, ", speech mode: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Lcom/autochips/carplay/common/b;->cT()Lcom/autochips/carplay/common/d;

    move-result-object v3

    iget v3, v3, Lcom/autochips/carplay/common/d;->qB:I

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_1

    :cond_1
    move v3, v0

    :goto_2
    new-instance v4, Landroid/media/AudioFocusRequest$Builder;

    invoke-direct {v4, v3}, Landroid/media/AudioFocusRequest$Builder;-><init>(I)V

    invoke-virtual {v4, v1}, Landroid/media/AudioFocusRequest$Builder;->setAudioAttributes(Landroid/media/AudioAttributes;)Landroid/media/AudioFocusRequest$Builder;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/media/AudioFocusRequest$Builder;->setWillPauseWhenDucked(Z)Landroid/media/AudioFocusRequest$Builder;

    move-result-object v1

    iget-object v3, p0, Lcom/autochips/carplay/b/s;->sC:Lcom/autochips/carplay/b/m;

    invoke-static {v3}, Lcom/autochips/carplay/b/m;->e(Lcom/autochips/carplay/b/m;)Landroid/media/AudioManager$OnAudioFocusChangeListener;

    move-result-object v3

    iget-object v4, p0, Lcom/autochips/carplay/b/s;->sC:Lcom/autochips/carplay/b/m;

    iget-object v4, v4, Lcom/autochips/carplay/b/m;->sw:Lcom/autochips/carplay/b/s;

    invoke-virtual {v4}, Lcom/autochips/carplay/b/s;->getHandler()Landroid/os/Handler;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/media/AudioFocusRequest$Builder;->setOnAudioFocusChangeListener(Landroid/media/AudioManager$OnAudioFocusChangeListener;Landroid/os/Handler;)Landroid/media/AudioFocusRequest$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/media/AudioFocusRequest$Builder;->build()Landroid/media/AudioFocusRequest;

    move-result-object v1

    iget-object v3, p0, Lcom/autochips/carplay/b/s;->sC:Lcom/autochips/carplay/b/m;

    invoke-static {v3}, Lcom/autochips/carplay/b/m;->c(Lcom/autochips/carplay/b/m;)Landroid/media/AudioManager;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/media/AudioManager;->requestAudioFocus(Landroid/media/AudioFocusRequest;)I

    move-result v1

    const-string v3, "OutputAudioStateMachine"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "focusRequestStatus: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-ne v1, v0, :cond_4

    if-ne p1, v2, :cond_2

    iget-object p1, p0, Lcom/autochips/carplay/b/s;->sC:Lcom/autochips/carplay/b/m;

    invoke-static {p1}, Lcom/autochips/carplay/b/m;->c(Lcom/autochips/carplay/b/m;)Landroid/media/AudioManager;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/media/AudioManager;->setMode(I)V

    :cond_2
    iget p1, p0, Lcom/autochips/carplay/b/s;->sG:I

    invoke-static {p1}, Lcom/autochips/carplay/b/s;->aa(I)V

    const/4 p1, -0x3

    iget-object v2, p0, Lcom/autochips/carplay/b/s;->sC:Lcom/autochips/carplay/b/m;

    invoke-static {v2}, Lcom/autochips/carplay/b/m;->b(Lcom/autochips/carplay/b/m;)I

    move-result v2

    if-ne p1, v2, :cond_3

    sget-object p1, Lcom/autochips/carplay/b/m;->sj:Lcom/autochips/carplay/b/m;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {p1, v2, v2}, Lcom/autochips/carplay/b/m;->b(FF)I

    :cond_3
    iget-object p1, p0, Lcom/autochips/carplay/b/s;->sC:Lcom/autochips/carplay/b/m;

    invoke-static {p1, v0}, Lcom/autochips/carplay/b/m;->a(Lcom/autochips/carplay/b/m;I)I

    goto :goto_3

    :cond_4
    invoke-direct {p0}, Lcom/autochips/carplay/b/s;->dn()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_3
    monitor-exit p0

    return v1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method static synthetic a(Lcom/autochips/carplay/b/s;)I
    .locals 0

    iget p0, p0, Lcom/autochips/carplay/b/s;->sr:I

    return p0
.end method

.method static synthetic a(Lcom/autochips/carplay/b/s;I)I
    .locals 0

    iput p1, p0, Lcom/autochips/carplay/b/s;->sD:I

    return p1
.end method

.method static synthetic a(Lcom/autochips/carplay/b/s;II)V
    .locals 5

    invoke-static {}, Lcom/autochips/carplay/b/m;->dh()Z

    move-result v0

    const/4 v1, 0x3

    if-eqz v0, :cond_4

    iget-boolean v0, p0, Lcom/autochips/carplay/b/s;->sI:Z

    if-eqz v0, :cond_0

    goto :goto_1

    :cond_0
    iget-boolean v0, p0, Lcom/autochips/carplay/b/s;->sJ:Z

    if-eqz v0, :cond_1

    invoke-virtual {p0, v1}, Lcom/autochips/carplay/b/s;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    goto :goto_2

    :cond_1
    sget-object v0, Lcom/autochips/carplay/b/m;->sj:Lcom/autochips/carplay/b/m;

    invoke-virtual {v0}, Lcom/autochips/carplay/b/m;->do()Lcom/autochips/carplay/common/b;

    move-result-object v0

    const/4 v2, 0x4

    const/4 v3, 0x1

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lcom/autochips/carplay/common/b;->cU()I

    move-result v4

    if-ne v3, v4, :cond_2

    const-string v0, "OutputAudioStateMachine"

    const-string v3, "current app state is ios phone calling"

    :goto_0
    invoke-static {v0, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0, v2}, Lcom/autochips/carplay/b/s;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    goto :goto_2

    :cond_2
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Lcom/autochips/carplay/common/b;->cT()Lcom/autochips/carplay/common/d;

    move-result-object v4

    iget v4, v4, Lcom/autochips/carplay/common/d;->qA:I

    if-ne v3, v4, :cond_3

    invoke-virtual {v0}, Lcom/autochips/carplay/common/b;->cT()Lcom/autochips/carplay/common/d;

    move-result-object v0

    iget v0, v0, Lcom/autochips/carplay/common/d;->qB:I

    if-ne v3, v0, :cond_3

    const-string v0, "OutputAudioStateMachine"

    const-string v3, "current app state is ios speech speaking"

    goto :goto_0

    :cond_3
    const/16 v0, 0x11

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/s;->hasMessages(I)Z

    move-result v2

    if-nez v2, :cond_5

    const-wide/16 v2, 0x5dc

    invoke-virtual {p0, v0, v2, v3}, Lcom/autochips/carplay/b/s;->sendMessageDelayed(IJ)V

    goto :goto_3

    :cond_4
    :goto_1
    const-string v0, "OutputAudioStateMachine"

    const-string v2, "autoStart to play mainAudio because user already enableAudio"

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/s;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    :goto_2
    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/s;->deferMessage(Landroid/os/Message;)V

    :cond_5
    :goto_3
    const/16 v0, 0x64

    if-ne p1, v0, :cond_7

    const/4 p1, 0x6

    if-eq p2, p1, :cond_6

    packed-switch p2, :pswitch_data_0

    const-string p0, "OutputAudioStateMachine"

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "donot handle duplex audio: "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :pswitch_0
    iget-object p1, p0, Lcom/autochips/carplay/b/s;->sN:Lcom/android/internal/util/State;

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/b/s;->transitionTo(Lcom/android/internal/util/IState;)V

    return-void

    :pswitch_1
    iget-object p1, p0, Lcom/autochips/carplay/b/s;->sM:Lcom/android/internal/util/State;

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/b/s;->transitionTo(Lcom/android/internal/util/IState;)V

    return-void

    :pswitch_2
    iget-object p1, p0, Lcom/autochips/carplay/b/s;->sL:Lcom/android/internal/util/State;

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/b/s;->transitionTo(Lcom/android/internal/util/IState;)V

    return-void

    :cond_6
    iget-object p1, p0, Lcom/autochips/carplay/b/s;->sO:Lcom/android/internal/util/State;

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/b/s;->transitionTo(Lcom/android/internal/util/IState;)V

    return-void

    :cond_7
    const/16 v0, 0x66

    if-ne p1, v0, :cond_8

    if-ne p2, v1, :cond_8

    iget-object p1, p0, Lcom/autochips/carplay/b/s;->sN:Lcom/android/internal/util/State;

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/b/s;->transitionTo(Lcom/android/internal/util/IState;)V

    return-void

    :cond_8
    const-string p0, "OutputAudioStateMachine"

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "ignore invalid stream id: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ", audio type: "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method static synthetic a(Lcom/autochips/carplay/b/s;Z)V
    .locals 4

    const/4 v0, 0x0

    if-eqz p1, :cond_5

    const/16 p1, 0x11

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/b/s;->removeMessages(I)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/autochips/carplay/b/s;->sI:Z

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/s;->hasDeferredMessages(I)Z

    move-result p1

    if-nez p1, :cond_4

    sget-object p1, Lcom/autochips/carplay/b/m;->sj:Lcom/autochips/carplay/b/m;

    invoke-virtual {p1}, Lcom/autochips/carplay/b/m;->do()Lcom/autochips/carplay/common/b;

    move-result-object p1

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lcom/autochips/carplay/common/b;->cU()I

    move-result v0

    if-eqz v0, :cond_0

    const-string p0, "OutputAudioStateMachine"

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "current app state is phone calling, entity: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/autochips/carplay/common/b;->cU()I

    move-result p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    invoke-virtual {p1}, Lcom/autochips/carplay/common/b;->cT()Lcom/autochips/carplay/common/d;

    move-result-object v0

    if-eqz v0, :cond_1

    iget v1, v0, Lcom/autochips/carplay/common/d;->qA:I

    if-eqz v1, :cond_1

    const-string p0, "OutputAudioStateMachine"

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "current app state is specch, entity: "

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, v0, Lcom/autochips/carplay/common/d;->qA:I

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", specchMode: "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, v0, Lcom/autochips/carplay/common/d;->qA:I

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_1
    iget-object v0, p0, Lcom/autochips/carplay/b/s;->sC:Lcom/autochips/carplay/b/m;

    invoke-static {v0}, Lcom/autochips/carplay/b/m;->c(Lcom/autochips/carplay/b/m;)Landroid/media/AudioManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/AudioManager;->getMode()I

    move-result v0

    const-string v1, "OutputAudioStateMachine"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "current audio mode: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_3

    const/4 v2, 0x3

    if-ne v0, v2, :cond_2

    return-void

    :cond_2
    if-eqz p1, :cond_3

    invoke-virtual {p1}, Lcom/autochips/carplay/common/b;->getMainAudio()I

    move-result p1

    if-ne v1, p1, :cond_3

    invoke-direct {p0}, Lcom/autochips/carplay/b/s;->dm()V

    :cond_3
    return-void

    :cond_4
    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/s;->removeDeferredMessages(I)V

    const-string p0, "OutputAudioStateMachine"

    const-string p1, "already has message: 0"

    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_5
    iput-boolean v0, p0, Lcom/autochips/carplay/b/s;->sI:Z

    return-void
.end method

.method private a(Lcom/autochips/carplay/common/f;)Z
    .locals 2

    iget-object v0, p0, Lcom/autochips/carplay/b/s;->rZ:Lcom/autochips/carplay/common/f;

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/common/f;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/autochips/carplay/b/s;->sr:I

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const-string p1, "OutputAudioStateMachine"

    const-string v0, "the same request, ignore!"

    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, 0x0

    return p1

    :cond_1
    :goto_0
    iput-object p1, p0, Lcom/autochips/carplay/b/s;->rZ:Lcom/autochips/carplay/common/f;

    invoke-virtual {p0}, Lcom/autochips/carplay/b/s;->getHandler()Landroid/os/Handler;

    move-result-object v0

    invoke-static {v0}, Landroid/os/Message;->obtain(Landroid/os/Handler;)Landroid/os/Message;

    move-result-object v0

    const/16 v1, 0x10a

    iput v1, v0, Landroid/os/Message;->what:I

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    sget-object p1, Lcom/autochips/carplay/b/m;->sj:Lcom/autochips/carplay/b/m;

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/b/m;->a(Landroid/os/Message;)V

    const/4 p1, 0x1

    return p1
.end method

.method private static aa(I)V
    .locals 3

    const-string v0, "OutputAudioStateMachine"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "startMainAudioStreaming: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {p0}, Lcom/autochips/carplay/b/m;->Y(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/autochips/carplay/b/m;->sj:Lcom/autochips/carplay/b/m;

    invoke-virtual {v0, p0}, Lcom/autochips/carplay/b/m;->start(I)I

    :cond_0
    return-void
.end method

.method static synthetic ab(I)V
    .locals 0

    invoke-static {p0}, Lcom/autochips/carplay/b/s;->aa(I)V

    return-void
.end method

.method static synthetic b(Lcom/autochips/carplay/b/s;I)I
    .locals 0

    iput p1, p0, Lcom/autochips/carplay/b/s;->sG:I

    return p1
.end method

.method static synthetic b(Lcom/autochips/carplay/b/s;)V
    .locals 1

    const/16 v0, 0x12

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/s;->removeMessages(I)V

    return-void
.end method

.method static synthetic c(Lcom/autochips/carplay/b/s;)I
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/autochips/carplay/b/s;->sr:I

    return v0
.end method

.method static synthetic c(Lcom/autochips/carplay/b/s;I)I
    .locals 0

    iput p1, p0, Lcom/autochips/carplay/b/s;->sH:I

    return p1
.end method

.method static synthetic d(Lcom/autochips/carplay/b/s;)I
    .locals 0

    iget p0, p0, Lcom/autochips/carplay/b/s;->sD:I

    return p0
.end method

.method static synthetic d(Lcom/autochips/carplay/b/s;I)V
    .locals 6

    const-string v0, "OutputAudioStateMachine"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "handleAudioFocusChanged, audioFocusState: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eq p1, v1, :cond_a

    const/16 v2, 0x64

    packed-switch p1, :pswitch_data_0

    const-string v1, "OutputAudioStateMachine"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "not care audioFocus state : "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_0
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_5

    :pswitch_0
    const-string v3, "OutputAudioStateMachine"

    const-string v4, "takeAudio"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v3, Lcom/autochips/carplay/common/f;

    invoke-direct {v3}, Lcom/autochips/carplay/common/f;-><init>()V

    iget-object v4, v3, Lcom/autochips/carplay/common/f;->qG:Lcom/autochips/carplay/common/g;

    iput v1, v4, Lcom/autochips/carplay/common/g;->qK:I

    iget-object v4, v3, Lcom/autochips/carplay/common/f;->qG:Lcom/autochips/carplay/common/g;

    const/16 v5, 0x1f4

    iput v5, v4, Lcom/autochips/carplay/common/g;->qL:I

    iget-object v4, v3, Lcom/autochips/carplay/common/f;->qG:Lcom/autochips/carplay/common/g;

    iput v5, v4, Lcom/autochips/carplay/common/g;->qM:I

    iget-object v4, v3, Lcom/autochips/carplay/common/f;->qG:Lcom/autochips/carplay/common/g;

    iput v2, v4, Lcom/autochips/carplay/common/g;->qN:I

    invoke-direct {p0, v3}, Lcom/autochips/carplay/b/s;->a(Lcom/autochips/carplay/common/f;)Z

    move-result v2

    if-eqz v2, :cond_0

    iput v1, p0, Lcom/autochips/carplay/b/s;->sr:I

    const/16 v2, 0x12

    invoke-virtual {p0, v2}, Lcom/autochips/carplay/b/s;->removeMessages(I)V

    const-wide/16 v3, 0x3e8

    invoke-virtual {p0, v2, v1, v3, v4}, Lcom/autochips/carplay/b/s;->sendMessageDelayed(IIJ)V

    :cond_0
    invoke-direct {p0}, Lcom/autochips/carplay/b/s;->dj()V

    goto/16 :goto_5

    :pswitch_1
    sget-object v2, Lcom/autochips/carplay/b/m;->sj:Lcom/autochips/carplay/b/m;

    invoke-virtual {v2}, Lcom/autochips/carplay/b/m;->do()Lcom/autochips/carplay/common/b;

    move-result-object v2

    if-eqz v2, :cond_2

    invoke-virtual {v2}, Lcom/autochips/carplay/common/b;->cU()I

    move-result v3

    if-ne v1, v3, :cond_1

    const-string v1, "OutputAudioStateMachine"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "current app state is phone calling, entity: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Lcom/autochips/carplay/common/b;->cU()I

    move-result v2

    :goto_1
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    :cond_1
    invoke-virtual {v2}, Lcom/autochips/carplay/common/b;->cT()Lcom/autochips/carplay/common/d;

    move-result-object v2

    if-eqz v2, :cond_2

    iget v3, v2, Lcom/autochips/carplay/common/d;->qA:I

    if-ne v1, v3, :cond_2

    const-string v1, "OutputAudioStateMachine"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "current app state is specch, entity: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v4, v2, Lcom/autochips/carplay/common/d;->qA:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ", specchMode: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, v2, Lcom/autochips/carplay/common/d;->qA:I

    goto :goto_1

    :cond_2
    iget-object v2, p0, Lcom/autochips/carplay/b/s;->sC:Lcom/autochips/carplay/b/m;

    invoke-static {v2}, Lcom/autochips/carplay/b/m;->a(Lcom/autochips/carplay/b/m;)Lcom/autochips/carplay/c/a;

    move-result-object v2

    invoke-virtual {v2}, Lcom/autochips/carplay/c/a;->el()Z

    move-result v2

    iget-object v3, p0, Lcom/autochips/carplay/b/s;->sC:Lcom/autochips/carplay/b/m;

    invoke-static {v3}, Lcom/autochips/carplay/b/m;->a(Lcom/autochips/carplay/b/m;)Lcom/autochips/carplay/c/a;

    move-result-object v3

    invoke-virtual {v3}, Lcom/autochips/carplay/c/a;->em()I

    move-result v3

    if-nez v2, :cond_6

    const/4 v4, 0x2

    if-ne v3, v4, :cond_3

    goto :goto_3

    :cond_3
    iget-object v2, p0, Lcom/autochips/carplay/b/s;->sC:Lcom/autochips/carplay/b/m;

    invoke-static {v2}, Lcom/autochips/carplay/b/m;->c(Lcom/autochips/carplay/b/m;)Landroid/media/AudioManager;

    move-result-object v2

    invoke-virtual {v2}, Landroid/media/AudioManager;->getMode()I

    move-result v2

    if-eq v2, v4, :cond_5

    const/4 v3, 0x3

    if-eq v2, v3, :cond_5

    const/16 v3, 0x7e3

    if-eq v2, v3, :cond_5

    const/16 v3, 0x7e4

    if-ne v2, v3, :cond_4

    goto :goto_2

    :cond_4
    invoke-direct {p0}, Lcom/autochips/carplay/b/s;->dn()V

    goto/16 :goto_4

    :cond_5
    :goto_2
    const-string v1, "OutputAudioStateMachine"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "audio mode: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", borrow audio in AppStateController!"

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_5

    :cond_6
    :goto_3
    const-string v1, "OutputAudioStateMachine"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "accessoty callOn: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, ", audioState: "

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_0

    :pswitch_2
    iget-object v3, p0, Lcom/autochips/carplay/b/s;->sC:Lcom/autochips/carplay/b/m;

    invoke-static {v3}, Lcom/autochips/carplay/b/m;->d(Lcom/autochips/carplay/b/m;)Z

    move-result v3

    if-ne v1, v3, :cond_7

    const-string v1, "OutputAudioStateMachine"

    const-string v2, "duck by carplay alternate audio, ignore it."

    goto/16 :goto_0

    :cond_7
    iget v0, p0, Lcom/autochips/carplay/b/s;->sK:I

    if-ltz v0, :cond_8

    if-le v0, v2, :cond_9

    :cond_8
    const-string v0, "OutputAudioStateMachine"

    const-string v2, "Invalid duck percent using default."

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/16 v0, 0x19

    :cond_9
    int-to-float v0, v0

    const/high16 v2, 0x42c80000    # 100.0f

    div-float/2addr v0, v2

    sget-object v2, Lcom/autochips/carplay/b/m;->sj:Lcom/autochips/carplay/b/m;

    invoke-virtual {v2, v0, v0}, Lcom/autochips/carplay/b/m;->b(FF)I

    goto :goto_4

    :cond_a
    const/4 v0, -0x2

    iget-object v2, p0, Lcom/autochips/carplay/b/s;->sC:Lcom/autochips/carplay/b/m;

    invoke-static {v2}, Lcom/autochips/carplay/b/m;->b(Lcom/autochips/carplay/b/m;)I

    move-result v2

    if-ne v0, v2, :cond_b

    iput-boolean v1, p0, Lcom/autochips/carplay/b/s;->sJ:Z

    invoke-direct {p0}, Lcom/autochips/carplay/b/s;->dm()V

    goto :goto_4

    :cond_b
    const/4 v0, -0x3

    iget-object v2, p0, Lcom/autochips/carplay/b/s;->sC:Lcom/autochips/carplay/b/m;

    invoke-static {v2}, Lcom/autochips/carplay/b/m;->b(Lcom/autochips/carplay/b/m;)I

    move-result v2

    if-ne v0, v2, :cond_c

    sget-object v0, Lcom/autochips/carplay/b/m;->sj:Lcom/autochips/carplay/b/m;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v0, v2, v2}, Lcom/autochips/carplay/b/m;->b(FF)I

    :cond_c
    :goto_4
    move v0, v1

    :goto_5
    if-eqz v0, :cond_d

    iget-object p0, p0, Lcom/autochips/carplay/b/s;->sC:Lcom/autochips/carplay/b/m;

    invoke-static {p0, p1}, Lcom/autochips/carplay/b/m;->a(Lcom/autochips/carplay/b/m;I)I

    :cond_d
    return-void

    :pswitch_data_0
    .packed-switch -0x3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private declared-synchronized dj()V
    .locals 4

    monitor-enter p0

    :try_start_0
    const-string v0, "OutputAudioStateMachine"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "abandonAudioFocus, mAudioFocus: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/autochips/carplay/b/s;->sC:Lcom/autochips/carplay/b/m;

    invoke-static {v2}, Lcom/autochips/carplay/b/m;->b(Lcom/autochips/carplay/b/m;)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/b/s;->sC:Lcom/autochips/carplay/b/m;

    invoke-static {v0}, Lcom/autochips/carplay/b/m;->b(Lcom/autochips/carplay/b/m;)I

    move-result v0

    if-lez v0, :cond_1

    iget v0, p0, Lcom/autochips/carplay/b/s;->sG:I

    const-string v1, "OutputAudioStateMachine"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "stopMainAudioStreaming: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {v0}, Lcom/autochips/carplay/b/m;->Y(I)Z

    move-result v1

    if-eqz v1, :cond_0

    sget-object v1, Lcom/autochips/carplay/b/m;->sj:Lcom/autochips/carplay/b/m;

    invoke-virtual {v1, v0}, Lcom/autochips/carplay/b/m;->S(I)I

    :cond_0
    iget-object v0, p0, Lcom/autochips/carplay/b/s;->sC:Lcom/autochips/carplay/b/m;

    invoke-static {v0}, Lcom/autochips/carplay/b/m;->c(Lcom/autochips/carplay/b/m;)Landroid/media/AudioManager;

    move-result-object v0

    iget-object v1, p0, Lcom/autochips/carplay/b/s;->sC:Lcom/autochips/carplay/b/m;

    invoke-static {v1}, Lcom/autochips/carplay/b/m;->e(Lcom/autochips/carplay/b/m;)Landroid/media/AudioManager$OnAudioFocusChangeListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->abandonAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;)I

    iget-object v0, p0, Lcom/autochips/carplay/b/s;->sC:Lcom/autochips/carplay/b/m;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/autochips/carplay/b/m;->a(Lcom/autochips/carplay/b/m;I)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private dm()V
    .locals 6

    iget-object v0, p0, Lcom/autochips/carplay/b/s;->rZ:Lcom/autochips/carplay/common/f;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/autochips/carplay/b/s;->rZ:Lcom/autochips/carplay/common/f;

    iget-object v0, v0, Lcom/autochips/carplay/common/f;->qG:Lcom/autochips/carplay/common/g;

    iget v0, v0, Lcom/autochips/carplay/common/g;->qK:I

    const-string v1, "OutputAudioStateMachine"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "transferType: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v1, 0x3

    const-wide/16 v2, 0x3e8

    const/16 v4, 0x12

    if-ne v0, v1, :cond_1

    const-string v0, "OutputAudioStateMachine"

    const-string v1, "unborrowAudio"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Lcom/autochips/carplay/common/f;

    invoke-direct {v0}, Lcom/autochips/carplay/common/f;-><init>()V

    iget-object v1, v0, Lcom/autochips/carplay/common/f;->qG:Lcom/autochips/carplay/common/g;

    const/4 v5, 0x4

    iput v5, v1, Lcom/autochips/carplay/common/g;->qK:I

    invoke-direct {p0, v0}, Lcom/autochips/carplay/b/s;->a(Lcom/autochips/carplay/common/f;)Z

    move-result v0

    if-eqz v0, :cond_0

    iput v5, p0, Lcom/autochips/carplay/b/s;->sr:I

    invoke-virtual {p0, v4}, Lcom/autochips/carplay/b/s;->removeMessages(I)V

    invoke-virtual {p0, v4, v5, v2, v3}, Lcom/autochips/carplay/b/s;->sendMessageDelayed(IIJ)V

    :cond_0
    return-void

    :cond_1
    const/4 v1, 0x1

    if-ne v0, v1, :cond_2

    const-string v0, "OutputAudioStateMachine"

    const-string v1, "untakeAudio"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Lcom/autochips/carplay/common/f;

    invoke-direct {v0}, Lcom/autochips/carplay/common/f;-><init>()V

    iget-object v1, v0, Lcom/autochips/carplay/common/f;->qG:Lcom/autochips/carplay/common/g;

    const/4 v5, 0x2

    iput v5, v1, Lcom/autochips/carplay/common/g;->qK:I

    invoke-direct {p0, v0}, Lcom/autochips/carplay/b/s;->a(Lcom/autochips/carplay/common/f;)Z

    move-result v0

    if-eqz v0, :cond_2

    iput v5, p0, Lcom/autochips/carplay/b/s;->sr:I

    invoke-virtual {p0, v4}, Lcom/autochips/carplay/b/s;->removeMessages(I)V

    invoke-virtual {p0, v4, v5, v2, v3}, Lcom/autochips/carplay/b/s;->sendMessageDelayed(IIJ)V

    :cond_2
    return-void

    :cond_3
    const-string v0, "OutputAudioStateMachine"

    const-string v1, "mCurrentModeRequest is null"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private dn()V
    .locals 5

    const-string v0, "OutputAudioStateMachine"

    const-string v1, "borrowAudio"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Lcom/autochips/carplay/common/f;

    invoke-direct {v0}, Lcom/autochips/carplay/common/f;-><init>()V

    iget-object v1, v0, Lcom/autochips/carplay/common/f;->qG:Lcom/autochips/carplay/common/g;

    const/4 v2, 0x3

    iput v2, v1, Lcom/autochips/carplay/common/g;->qK:I

    iget-object v1, v0, Lcom/autochips/carplay/common/f;->qG:Lcom/autochips/carplay/common/g;

    const/16 v3, 0x1f4

    iput v3, v1, Lcom/autochips/carplay/common/g;->qL:I

    iget-object v1, v0, Lcom/autochips/carplay/common/f;->qG:Lcom/autochips/carplay/common/g;

    const/16 v3, 0x64

    iput v3, v1, Lcom/autochips/carplay/common/g;->qN:I

    invoke-direct {p0, v0}, Lcom/autochips/carplay/b/s;->a(Lcom/autochips/carplay/common/f;)Z

    move-result v0

    if-eqz v0, :cond_0

    iput v2, p0, Lcom/autochips/carplay/b/s;->sr:I

    const/16 v0, 0x12

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/s;->removeMessages(I)V

    const-wide/16 v3, 0x3e8

    invoke-virtual {p0, v0, v2, v3, v4}, Lcom/autochips/carplay/b/s;->sendMessageDelayed(IIJ)V

    :cond_0
    return-void
.end method

.method static synthetic e(Lcom/autochips/carplay/b/s;)I
    .locals 0

    iget p0, p0, Lcom/autochips/carplay/b/s;->sG:I

    return p0
.end method

.method static synthetic e(Lcom/autochips/carplay/b/s;I)I
    .locals 0

    invoke-direct {p0, p1}, Lcom/autochips/carplay/b/s;->Z(I)I

    move-result p0

    return p0
.end method

.method static synthetic f(Lcom/autochips/carplay/b/s;)I
    .locals 0

    iget p0, p0, Lcom/autochips/carplay/b/s;->sH:I

    return p0
.end method

.method static synthetic g(Lcom/autochips/carplay/b/s;)Lcom/android/internal/util/State;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/b/s;->so:Lcom/android/internal/util/State;

    return-object p0
.end method

.method static synthetic h(Lcom/autochips/carplay/b/s;)V
    .locals 1

    const/16 v0, 0x12

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/s;->removeMessages(I)V

    return-void
.end method

.method static synthetic i(Lcom/autochips/carplay/b/s;)Lcom/autochips/carplay/common/f;
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/autochips/carplay/b/s;->rZ:Lcom/autochips/carplay/common/f;

    return-object v0
.end method

.method static synthetic j(Lcom/autochips/carplay/b/s;)V
    .locals 1

    const/16 v0, 0x11

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/s;->removeMessages(I)V

    return-void
.end method

.method static synthetic k(Lcom/autochips/carplay/b/s;)V
    .locals 1

    const/16 v0, 0x12

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/s;->removeMessages(I)V

    return-void
.end method

.method static synthetic l(Lcom/autochips/carplay/b/s;)V
    .locals 2

    const/4 v0, 0x0

    iput v0, p0, Lcom/autochips/carplay/b/s;->sr:I

    iget-boolean v1, p0, Lcom/autochips/carplay/b/s;->sI:Z

    if-eqz v1, :cond_1

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/s;->hasDeferredMessages(I)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/s;->removeDeferredMessages(I)V

    :cond_0
    iget-object v1, p0, Lcom/autochips/carplay/b/s;->sC:Lcom/autochips/carplay/b/m;

    iget-object v1, v1, Lcom/autochips/carplay/b/m;->sw:Lcom/autochips/carplay/b/s;

    invoke-virtual {v1, v0}, Lcom/autochips/carplay/b/s;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/s;->sendMessage(Landroid/os/Message;)V

    :cond_1
    return-void
.end method

.method static synthetic m(Lcom/autochips/carplay/b/s;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/autochips/carplay/b/s;->sI:Z

    return p0
.end method

.method static synthetic n(Lcom/autochips/carplay/b/s;)V
    .locals 0

    invoke-direct {p0}, Lcom/autochips/carplay/b/s;->dm()V

    return-void
.end method

.method static synthetic o(Lcom/autochips/carplay/b/s;)Lcom/android/internal/util/State;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/b/s;->sn:Lcom/android/internal/util/State;

    return-object p0
.end method

.method static synthetic p(Lcom/autochips/carplay/b/s;)V
    .locals 1

    const/16 v0, 0x12

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/s;->removeMessages(I)V

    return-void
.end method

.method static synthetic q(Lcom/autochips/carplay/b/s;)V
    .locals 1

    const/16 v0, 0x12

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/s;->removeMessages(I)V

    return-void
.end method

.method static synthetic r(Lcom/autochips/carplay/b/s;)V
    .locals 0

    invoke-direct {p0}, Lcom/autochips/carplay/b/s;->dn()V

    return-void
.end method

.method static synthetic s(Lcom/autochips/carplay/b/s;)V
    .locals 0

    invoke-direct {p0}, Lcom/autochips/carplay/b/s;->dj()V

    return-void
.end method

.method static synthetic t(Lcom/autochips/carplay/b/s;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/autochips/carplay/b/s;->sJ:Z

    return p0
.end method

.method static synthetic u(Lcom/autochips/carplay/b/s;)Z
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/autochips/carplay/b/s;->sJ:Z

    return v0
.end method


# virtual methods
.method protected onHalting()V
    .locals 3

    const-string v0, "OutputAudioStateMachine"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "onHalting:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method protected onQuitting()V
    .locals 3

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/autochips/carplay/b/s;->sI:Z

    invoke-direct {p0}, Lcom/autochips/carplay/b/s;->dj()V

    const-string v0, "OutputAudioStateMachine"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "onQuitting:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
