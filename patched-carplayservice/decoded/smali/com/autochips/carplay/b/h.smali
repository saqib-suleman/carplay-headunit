.class final Lcom/autochips/carplay/b/h;
.super Lcom/android/internal/util/StateMachine;


# instance fields
.field private rZ:Lcom/autochips/carplay/common/f;

.field final synthetic sm:Lcom/autochips/carplay/b/f;

.field private final sn:Lcom/android/internal/util/State;

.field private final so:Lcom/android/internal/util/State;

.field private final sp:Lcom/android/internal/util/State;

.field private final sq:Lcom/android/internal/util/State;

.field private sr:I


# direct methods
.method constructor <init>(Lcom/autochips/carplay/b/f;Landroid/os/Looper;)V
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/b/h;->sm:Lcom/autochips/carplay/b/f;

    const-string p1, "FullDuplexAudioManager"

    invoke-direct {p0, p1, p2}, Lcom/android/internal/util/StateMachine;-><init>(Ljava/lang/String;Landroid/os/Looper;)V

    new-instance p1, Lcom/autochips/carplay/b/i;

    invoke-direct {p1, p0}, Lcom/autochips/carplay/b/i;-><init>(Lcom/autochips/carplay/b/h;)V

    iput-object p1, p0, Lcom/autochips/carplay/b/h;->sn:Lcom/android/internal/util/State;

    new-instance p1, Lcom/autochips/carplay/b/j;

    invoke-direct {p1, p0}, Lcom/autochips/carplay/b/j;-><init>(Lcom/autochips/carplay/b/h;)V

    iput-object p1, p0, Lcom/autochips/carplay/b/h;->so:Lcom/android/internal/util/State;

    new-instance p1, Lcom/autochips/carplay/b/l;

    invoke-direct {p1, p0}, Lcom/autochips/carplay/b/l;-><init>(Lcom/autochips/carplay/b/h;)V

    iput-object p1, p0, Lcom/autochips/carplay/b/h;->sp:Lcom/android/internal/util/State;

    new-instance p1, Lcom/autochips/carplay/b/k;

    invoke-direct {p1, p0}, Lcom/autochips/carplay/b/k;-><init>(Lcom/autochips/carplay/b/h;)V

    iput-object p1, p0, Lcom/autochips/carplay/b/h;->sq:Lcom/android/internal/util/State;

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/autochips/carplay/b/h;->rZ:Lcom/autochips/carplay/common/f;

    const/4 p1, 0x0

    iput p1, p0, Lcom/autochips/carplay/b/h;->sr:I

    iget-object p1, p0, Lcom/autochips/carplay/b/h;->sn:Lcom/android/internal/util/State;

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/b/h;->addState(Lcom/android/internal/util/State;)V

    iget-object p1, p0, Lcom/autochips/carplay/b/h;->so:Lcom/android/internal/util/State;

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/b/h;->addState(Lcom/android/internal/util/State;)V

    iget-object p1, p0, Lcom/autochips/carplay/b/h;->sp:Lcom/android/internal/util/State;

    iget-object p2, p0, Lcom/autochips/carplay/b/h;->so:Lcom/android/internal/util/State;

    invoke-virtual {p0, p1, p2}, Lcom/autochips/carplay/b/h;->addState(Lcom/android/internal/util/State;Lcom/android/internal/util/State;)V

    iget-object p1, p0, Lcom/autochips/carplay/b/h;->sq:Lcom/android/internal/util/State;

    iget-object p2, p0, Lcom/autochips/carplay/b/h;->so:Lcom/android/internal/util/State;

    invoke-virtual {p0, p1, p2}, Lcom/autochips/carplay/b/h;->addState(Lcom/android/internal/util/State;Lcom/android/internal/util/State;)V

    iget-object p1, p0, Lcom/autochips/carplay/b/h;->sn:Lcom/android/internal/util/State;

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/b/h;->setInitialState(Lcom/android/internal/util/State;)V

    invoke-virtual {p0}, Lcom/autochips/carplay/b/h;->start()V

    return-void
.end method

.method static synthetic a(Lcom/autochips/carplay/b/h;)Lcom/android/internal/util/State;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/b/h;->so:Lcom/android/internal/util/State;

    return-object p0
.end method

.method static synthetic a(Lcom/autochips/carplay/b/h;II)V
    .locals 1

    const/16 v0, 0x64

    if-ne p1, v0, :cond_0

    packed-switch p2, :pswitch_data_0

    return-void

    :pswitch_0
    iget-object p1, p0, Lcom/autochips/carplay/b/h;->sq:Lcom/android/internal/util/State;

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/b/h;->transitionTo(Lcom/android/internal/util/IState;)V

    return-void

    :pswitch_1
    iget-object p1, p0, Lcom/autochips/carplay/b/h;->sp:Lcom/android/internal/util/State;

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/b/h;->transitionTo(Lcom/android/internal/util/IState;)V

    return-void

    :cond_0
    const-string p0, "FullDuplexAudioManager"

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "ignore invalid stream id: "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :pswitch_data_0
    .packed-switch 0x4
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private a(Lcom/autochips/carplay/common/f;)Z
    .locals 2

    iget-object v0, p0, Lcom/autochips/carplay/b/h;->rZ:Lcom/autochips/carplay/common/f;

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/common/f;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iput-object p1, p0, Lcom/autochips/carplay/b/h;->rZ:Lcom/autochips/carplay/common/f;

    invoke-virtual {p0}, Lcom/autochips/carplay/b/h;->getHandler()Landroid/os/Handler;

    move-result-object v0

    invoke-static {v0}, Landroid/os/Message;->obtain(Landroid/os/Handler;)Landroid/os/Message;

    move-result-object v0

    const/16 v1, 0x10a

    iput v1, v0, Landroid/os/Message;->what:I

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    sget-object p1, Lcom/autochips/carplay/b/f;->sk:Lcom/autochips/carplay/b/f;

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/b/f;->a(Landroid/os/Message;)V

    const/4 p1, 0x1

    return p1

    :cond_0
    const-string p1, "FullDuplexAudioManager"

    const-string v0, "the same request, ignore!"

    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, 0x0

    return p1
.end method

.method static synthetic b(Lcom/autochips/carplay/b/h;)Lcom/autochips/carplay/common/f;
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/autochips/carplay/b/h;->rZ:Lcom/autochips/carplay/common/f;

    return-object v0
.end method

.method static synthetic c(Lcom/autochips/carplay/b/h;)I
    .locals 0

    iget p0, p0, Lcom/autochips/carplay/b/h;->sr:I

    return p0
.end method

.method static synthetic d(Lcom/autochips/carplay/b/h;)V
    .locals 3

    const-string v0, "FullDuplexAudioManager"

    const-string v1, "unborrowAudio"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Lcom/autochips/carplay/common/f;

    invoke-direct {v0}, Lcom/autochips/carplay/common/f;-><init>()V

    iget-object v1, v0, Lcom/autochips/carplay/common/f;->qG:Lcom/autochips/carplay/common/g;

    const/4 v2, 0x4

    iput v2, v1, Lcom/autochips/carplay/common/g;->qK:I

    invoke-direct {p0, v0}, Lcom/autochips/carplay/b/h;->a(Lcom/autochips/carplay/common/f;)Z

    move-result v0

    if-eqz v0, :cond_0

    iput v2, p0, Lcom/autochips/carplay/b/h;->sr:I

    :cond_0
    return-void
.end method

.method static synthetic dd()V
    .locals 2

    const-string v0, "FullDuplexAudioManager"

    const-string v1, "startMainAudioStreaming"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v0, Lcom/autochips/carplay/b/f;->sk:Lcom/autochips/carplay/b/f;

    const/16 v1, 0x64

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/b/f;->start(I)I

    return-void
.end method

.method static synthetic de()V
    .locals 2

    const-string v0, "FullDuplexAudioManager"

    const-string v1, "stopMainAudioStreaming"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v0, Lcom/autochips/carplay/b/f;->sk:Lcom/autochips/carplay/b/f;

    const/16 v1, 0x64

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/b/f;->S(I)I

    return-void
.end method

.method static synthetic e(Lcom/autochips/carplay/b/h;)Lcom/android/internal/util/State;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/b/h;->sn:Lcom/android/internal/util/State;

    return-object p0
.end method

.method static synthetic f(Lcom/autochips/carplay/b/h;)V
    .locals 4

    const-string v0, "FullDuplexAudioManager"

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

    const/16 v3, 0x3e8

    iput v3, v1, Lcom/autochips/carplay/common/g;->qN:I

    invoke-direct {p0, v0}, Lcom/autochips/carplay/b/h;->a(Lcom/autochips/carplay/common/f;)Z

    move-result v0

    if-eqz v0, :cond_0

    iput v2, p0, Lcom/autochips/carplay/b/h;->sr:I

    :cond_0
    return-void
.end method


# virtual methods
.method protected final onHalting()V
    .locals 3

    const-string v0, "FullDuplexAudioManager"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "onHalting:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method protected final onQuitting()V
    .locals 3

    const-string v0, "FullDuplexAudioManager"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "onQuitting:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
