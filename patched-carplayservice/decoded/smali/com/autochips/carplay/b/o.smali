.class Lcom/autochips/carplay/b/o;
.super Lcom/android/internal/util/StateMachine;


# instance fields
.field private final ey:Lcom/android/internal/util/State;

.field final synthetic sC:Lcom/autochips/carplay/b/m;

.field private sD:I

.field private final sE:Lcom/android/internal/util/State;

.field private st:Landroid/media/AudioFocusRequest;


# direct methods
.method constructor <init>(Lcom/autochips/carplay/b/m;Landroid/os/Looper;)V
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/b/o;->sC:Lcom/autochips/carplay/b/m;

    const-class p1, Lcom/autochips/carplay/b/o;

    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1, p2}, Lcom/android/internal/util/StateMachine;-><init>(Ljava/lang/String;Landroid/os/Looper;)V

    const/4 p1, 0x1

    iput p1, p0, Lcom/autochips/carplay/b/o;->sD:I

    new-instance p1, Lcom/autochips/carplay/b/p;

    invoke-direct {p1, p0}, Lcom/autochips/carplay/b/p;-><init>(Lcom/autochips/carplay/b/o;)V

    iput-object p1, p0, Lcom/autochips/carplay/b/o;->sE:Lcom/android/internal/util/State;

    new-instance p1, Lcom/autochips/carplay/b/q;

    invoke-direct {p1, p0}, Lcom/autochips/carplay/b/q;-><init>(Lcom/autochips/carplay/b/o;)V

    iput-object p1, p0, Lcom/autochips/carplay/b/o;->ey:Lcom/android/internal/util/State;

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/autochips/carplay/b/o;->st:Landroid/media/AudioFocusRequest;

    iget-object p1, p0, Lcom/autochips/carplay/b/o;->sE:Lcom/android/internal/util/State;

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/b/o;->addState(Lcom/android/internal/util/State;)V

    iget-object p1, p0, Lcom/autochips/carplay/b/o;->ey:Lcom/android/internal/util/State;

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/b/o;->addState(Lcom/android/internal/util/State;)V

    iget-object p1, p0, Lcom/autochips/carplay/b/o;->sE:Lcom/android/internal/util/State;

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/b/o;->setInitialState(Lcom/android/internal/util/State;)V

    invoke-virtual {p0}, Lcom/autochips/carplay/b/o;->start()V

    return-void
.end method

.method static synthetic a(Lcom/autochips/carplay/b/o;I)I
    .locals 0

    iput p1, p0, Lcom/autochips/carplay/b/o;->sD:I

    return p1
.end method

.method static synthetic a(Lcom/autochips/carplay/b/o;Landroid/media/AudioFocusRequest;)Landroid/media/AudioFocusRequest;
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/b/o;->st:Landroid/media/AudioFocusRequest;

    return-object p1
.end method

.method static synthetic a(Lcom/autochips/carplay/b/o;)Lcom/android/internal/util/State;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/b/o;->ey:Lcom/android/internal/util/State;

    return-object p0
.end method

.method static synthetic b(Lcom/autochips/carplay/b/o;)Landroid/media/AudioFocusRequest;
    .locals 0

    invoke-direct {p0}, Lcom/autochips/carplay/b/o;->di()Landroid/media/AudioFocusRequest;

    move-result-object p0

    return-object p0
.end method

.method static synthetic c(Lcom/autochips/carplay/b/o;)Lcom/android/internal/util/State;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/b/o;->sE:Lcom/android/internal/util/State;

    return-object p0
.end method

.method static synthetic d(Lcom/autochips/carplay/b/o;)V
    .locals 0

    invoke-direct {p0}, Lcom/autochips/carplay/b/o;->dj()V

    return-void
.end method

.method private declared-synchronized di()Landroid/media/AudioFocusRequest;
    .locals 5

    monitor-enter p0

    :try_start_0
    const-string v0, "AlternateAudioStateMachine"

    const-string v1, "requestAudioFocus"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Landroid/media/AudioAttributes$Builder;

    invoke-direct {v0}, Landroid/media/AudioAttributes$Builder;-><init>()V

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Landroid/media/AudioAttributes$Builder;->setUsage(I)Landroid/media/AudioAttributes$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/media/AudioAttributes$Builder;->setContentType(I)Landroid/media/AudioAttributes$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/AudioAttributes$Builder;->build()Landroid/media/AudioAttributes;

    move-result-object v0

    new-instance v1, Landroid/media/AudioFocusRequest$Builder;

    const/4 v2, 0x3

    invoke-direct {v1, v2}, Landroid/media/AudioFocusRequest$Builder;-><init>(I)V

    invoke-virtual {v1, v0}, Landroid/media/AudioFocusRequest$Builder;->setAudioAttributes(Landroid/media/AudioAttributes;)Landroid/media/AudioFocusRequest$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/AudioFocusRequest$Builder;->build()Landroid/media/AudioFocusRequest;

    move-result-object v0

    iget-object v1, p0, Lcom/autochips/carplay/b/o;->sC:Lcom/autochips/carplay/b/m;

    invoke-static {v1}, Lcom/autochips/carplay/b/m;->c(Lcom/autochips/carplay/b/m;)Landroid/media/AudioManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/media/AudioManager;->requestAudioFocus(Landroid/media/AudioFocusRequest;)I

    move-result v1

    const-string v2, "AlternateAudioStateMachine"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "focusRequestStatus: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized dj()V
    .locals 2

    monitor-enter p0

    :try_start_0
    const-string v0, "AlternateAudioStateMachine"

    const-string v1, "abandonAudioFocus"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/b/o;->st:Landroid/media/AudioFocusRequest;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/autochips/carplay/b/o;->sC:Lcom/autochips/carplay/b/m;

    invoke-static {v0}, Lcom/autochips/carplay/b/m;->c(Lcom/autochips/carplay/b/m;)Landroid/media/AudioManager;

    move-result-object v0

    iget-object v1, p0, Lcom/autochips/carplay/b/o;->st:Landroid/media/AudioFocusRequest;

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->abandonAudioFocusRequest(Landroid/media/AudioFocusRequest;)I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/autochips/carplay/b/o;->st:Landroid/media/AudioFocusRequest;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method static synthetic dk()V
    .locals 2

    sget-object v0, Lcom/autochips/carplay/b/m;->sj:Lcom/autochips/carplay/b/m;

    const/16 v1, 0x65

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/b/m;->start(I)I

    return-void
.end method

.method static synthetic dl()V
    .locals 2

    sget-object v0, Lcom/autochips/carplay/b/m;->sj:Lcom/autochips/carplay/b/m;

    const/16 v1, 0x65

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/b/m;->start(I)I

    return-void
.end method


# virtual methods
.method protected onHalting()V
    .locals 3

    const-string v0, "AlternateAudioStateMachine"

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

    const-string v0, "AlternateAudioStateMachine"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "onQuitting:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
