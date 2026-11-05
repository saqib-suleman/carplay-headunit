.class public final Lcom/autochips/carplay/service/a;
.super Lcom/android/internal/util/StateMachine;


# static fields
.field private static final TAG:Ljava/lang/String;

.field private static final th:Z


# instance fields
.field private mCarplayMonitor:Lcom/autochips/carplay/service/h;

.field private sZ:Lcom/autochips/carplay/service/CarplayService;

.field private ta:Lcom/autochips/carplay/service/i;

.field private tb:Lcom/autochips/carplay/service/f;

.field private tc:Lcom/autochips/carplay/service/e;

.field private td:Lcom/autochips/carplay/service/d;

.field private te:Lcom/autochips/carplay/service/c;

.field private tf:I

.field private tg:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const-class v0, Lcom/autochips/carplay/service/a;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/autochips/carplay/service/a;->TAG:Ljava/lang/String;

    const-string v0, "persist.carplay.wireless.enable"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    const/4 v2, 0x1

    if-ne v2, v0, :cond_0

    move v1, v2

    :cond_0
    sput-boolean v1, Lcom/autochips/carplay/service/a;->th:Z

    return-void
.end method

.method private constructor <init>(Lcom/autochips/carplay/service/CarplayService;)V
    .locals 2

    sget-object v0, Lcom/autochips/carplay/service/a;->TAG:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/android/internal/util/StateMachine;-><init>(Ljava/lang/String;)V

    new-instance v0, Lcom/autochips/carplay/service/f;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/autochips/carplay/service/f;-><init>(Lcom/autochips/carplay/service/a;B)V

    iput-object v0, p0, Lcom/autochips/carplay/service/a;->tb:Lcom/autochips/carplay/service/f;

    new-instance v0, Lcom/autochips/carplay/service/e;

    invoke-direct {v0, p0, v1}, Lcom/autochips/carplay/service/e;-><init>(Lcom/autochips/carplay/service/a;B)V

    iput-object v0, p0, Lcom/autochips/carplay/service/a;->tc:Lcom/autochips/carplay/service/e;

    new-instance v0, Lcom/autochips/carplay/service/d;

    invoke-direct {v0, p0, v1}, Lcom/autochips/carplay/service/d;-><init>(Lcom/autochips/carplay/service/a;B)V

    iput-object v0, p0, Lcom/autochips/carplay/service/a;->td:Lcom/autochips/carplay/service/d;

    new-instance v0, Lcom/autochips/carplay/service/c;

    invoke-direct {v0, p0, v1}, Lcom/autochips/carplay/service/c;-><init>(Lcom/autochips/carplay/service/a;B)V

    iput-object v0, p0, Lcom/autochips/carplay/service/a;->te:Lcom/autochips/carplay/service/c;

    iput v1, p0, Lcom/autochips/carplay/service/a;->tf:I

    iput v1, p0, Lcom/autochips/carplay/service/a;->tg:I

    iget-object v0, p0, Lcom/autochips/carplay/service/a;->td:Lcom/autochips/carplay/service/d;

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/service/a;->addState(Lcom/android/internal/util/State;)V

    iget-object v0, p0, Lcom/autochips/carplay/service/a;->te:Lcom/autochips/carplay/service/c;

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/service/a;->addState(Lcom/android/internal/util/State;)V

    iget-object v0, p0, Lcom/autochips/carplay/service/a;->tb:Lcom/autochips/carplay/service/f;

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/service/a;->addState(Lcom/android/internal/util/State;)V

    iget-object v0, p0, Lcom/autochips/carplay/service/a;->tc:Lcom/autochips/carplay/service/e;

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/service/a;->addState(Lcom/android/internal/util/State;)V

    iput-object p1, p0, Lcom/autochips/carplay/service/a;->sZ:Lcom/autochips/carplay/service/CarplayService;

    iget-object p1, p0, Lcom/autochips/carplay/service/a;->te:Lcom/autochips/carplay/service/c;

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/service/a;->setInitialState(Lcom/android/internal/util/State;)V

    return-void
.end method

.method static synthetic a(Lcom/autochips/carplay/service/a;)I
    .locals 0

    iget p0, p0, Lcom/autochips/carplay/service/a;->tf:I

    return p0
.end method

.method static synthetic a(Lcom/autochips/carplay/service/a;I)I
    .locals 0

    iput p1, p0, Lcom/autochips/carplay/service/a;->tf:I

    return p1
.end method

.method public static a(Lcom/autochips/carplay/service/CarplayService;)Lcom/autochips/carplay/service/a;
    .locals 2

    sget-object v0, Lcom/autochips/carplay/service/a;->TAG:Ljava/lang/String;

    const-string v1, "make() - Creating CarplayEnableStateMachine"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Lcom/autochips/carplay/service/a;

    invoke-direct {v0, p0}, Lcom/autochips/carplay/service/a;-><init>(Lcom/autochips/carplay/service/CarplayService;)V

    return-object v0
.end method

.method static synthetic a(Lcom/autochips/carplay/service/a;Landroid/os/Message;)V
    .locals 0

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/service/a;->deferMessage(Landroid/os/Message;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/a;->tc:Lcom/autochips/carplay/service/e;

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/service/a;->transitionTo(Lcom/android/internal/util/IState;)V

    return-void
.end method

.method static synthetic b(Lcom/autochips/carplay/service/a;I)I
    .locals 0

    iput p1, p0, Lcom/autochips/carplay/service/a;->tg:I

    return p1
.end method

.method static synthetic b(Lcom/autochips/carplay/service/a;)Lcom/autochips/carplay/service/CarplayService;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/service/a;->sZ:Lcom/autochips/carplay/service/CarplayService;

    return-object p0
.end method

.method static synthetic c(Lcom/autochips/carplay/service/a;)Lcom/autochips/carplay/service/f;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/service/a;->tb:Lcom/autochips/carplay/service/f;

    return-object p0
.end method

.method static synthetic d(Lcom/autochips/carplay/service/a;)V
    .locals 1

    const/16 v0, 0x205

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/service/a;->removeMessages(I)V

    return-void
.end method

.method static synthetic dr()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/autochips/carplay/service/a;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic ds()Z
    .locals 1

    sget-boolean v0, Lcom/autochips/carplay/service/a;->th:Z

    return v0
.end method

.method static synthetic e(Lcom/autochips/carplay/service/a;)V
    .locals 1

    const/16 v0, 0x305

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/service/a;->removeMessages(I)V

    return-void
.end method

.method static synthetic f(Lcom/autochips/carplay/service/a;)V
    .locals 1

    const/16 v0, 0x405

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/service/a;->removeMessages(I)V

    return-void
.end method

.method static synthetic g(Lcom/autochips/carplay/service/a;)V
    .locals 1

    const/16 v0, 0x505

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/service/a;->removeMessages(I)V

    return-void
.end method

.method static synthetic h(Lcom/autochips/carplay/service/a;)V
    .locals 1

    const/16 v0, 0x605

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/service/a;->removeMessages(I)V

    return-void
.end method

.method static synthetic i(Lcom/autochips/carplay/service/a;)Lcom/autochips/carplay/service/i;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/service/a;->ta:Lcom/autochips/carplay/service/i;

    return-object p0
.end method

.method static synthetic j(Lcom/autochips/carplay/service/a;)Lcom/autochips/carplay/service/d;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/service/a;->td:Lcom/autochips/carplay/service/d;

    return-object p0
.end method

.method static synthetic k(Lcom/autochips/carplay/service/a;)V
    .locals 1

    const/16 v0, 0x705

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/service/a;->removeMessages(I)V

    return-void
.end method

.method static synthetic l(Lcom/autochips/carplay/service/a;)I
    .locals 0

    iget p0, p0, Lcom/autochips/carplay/service/a;->tg:I

    return p0
.end method

.method static synthetic m(Lcom/autochips/carplay/service/a;)V
    .locals 1

    const/16 v0, 0x705

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/service/a;->removeMessages(I)V

    return-void
.end method

.method static synthetic n(Lcom/autochips/carplay/service/a;)Lcom/autochips/carplay/service/e;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/service/a;->tc:Lcom/autochips/carplay/service/e;

    return-object p0
.end method

.method static synthetic o(Lcom/autochips/carplay/service/a;)V
    .locals 1

    const/16 v0, 0x47

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/service/a;->removeMessages(I)V

    return-void
.end method

.method static synthetic p(Lcom/autochips/carplay/service/a;)V
    .locals 1

    const/16 v0, 0x706

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/service/a;->removeMessages(I)V

    return-void
.end method

.method static synthetic q(Lcom/autochips/carplay/service/a;)V
    .locals 1

    const/16 v0, 0x606

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/service/a;->removeMessages(I)V

    return-void
.end method

.method static synthetic r(Lcom/autochips/carplay/service/a;)V
    .locals 1

    const/16 v0, 0x506

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/service/a;->removeMessages(I)V

    return-void
.end method

.method static synthetic s(Lcom/autochips/carplay/service/a;)V
    .locals 1

    const/16 v0, 0x406

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/service/a;->removeMessages(I)V

    return-void
.end method

.method static synthetic t(Lcom/autochips/carplay/service/a;)V
    .locals 1

    const/16 v0, 0x306

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/service/a;->removeMessages(I)V

    return-void
.end method

.method static synthetic u(Lcom/autochips/carplay/service/a;)V
    .locals 1

    const/16 v0, 0x206

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/service/a;->removeMessages(I)V

    return-void
.end method

.method static synthetic v(Lcom/autochips/carplay/service/a;)Z
    .locals 1

    const/16 v0, 0x47

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/service/a;->hasMessages(I)Z

    move-result p0

    return p0
.end method

.method static synthetic w(Lcom/autochips/carplay/service/a;)Lcom/autochips/carplay/service/c;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/service/a;->te:Lcom/autochips/carplay/service/c;

    return-object p0
.end method


# virtual methods
.method public final a(Lcom/autochips/carplay/service/i;Lcom/autochips/carplay/service/h;)V
    .locals 1

    iput-object p1, p0, Lcom/autochips/carplay/service/a;->ta:Lcom/autochips/carplay/service/i;

    iput-object p2, p0, Lcom/autochips/carplay/service/a;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    sget-object p1, Lcom/autochips/carplay/service/a;->TAG:Ljava/lang/String;

    const-string p2, "registerForMonitorEvents"

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/autochips/carplay/service/a;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {p0}, Lcom/autochips/carplay/service/a;->getHandler()Landroid/os/Handler;

    move-result-object p2

    const/16 v0, 0x201

    invoke-virtual {p1, v0, p2}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/a;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {p0}, Lcom/autochips/carplay/service/a;->getHandler()Landroid/os/Handler;

    move-result-object p2

    const/16 v0, 0x202

    invoke-virtual {p1, v0, p2}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/a;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {p0}, Lcom/autochips/carplay/service/a;->getHandler()Landroid/os/Handler;

    move-result-object p2

    const/16 v0, 0x203

    invoke-virtual {p1, v0, p2}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/a;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {p0}, Lcom/autochips/carplay/service/a;->getHandler()Landroid/os/Handler;

    move-result-object p2

    const/16 v0, 0x204

    invoke-virtual {p1, v0, p2}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/a;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {p0}, Lcom/autochips/carplay/service/a;->getHandler()Landroid/os/Handler;

    move-result-object p2

    const/16 v0, 0x301

    invoke-virtual {p1, v0, p2}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/a;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {p0}, Lcom/autochips/carplay/service/a;->getHandler()Landroid/os/Handler;

    move-result-object p2

    const/16 v0, 0x302

    invoke-virtual {p1, v0, p2}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/a;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {p0}, Lcom/autochips/carplay/service/a;->getHandler()Landroid/os/Handler;

    move-result-object p2

    const/16 v0, 0x303

    invoke-virtual {p1, v0, p2}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/a;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {p0}, Lcom/autochips/carplay/service/a;->getHandler()Landroid/os/Handler;

    move-result-object p2

    const/16 v0, 0x304

    invoke-virtual {p1, v0, p2}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/a;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {p0}, Lcom/autochips/carplay/service/a;->getHandler()Landroid/os/Handler;

    move-result-object p2

    const/16 v0, 0x401

    invoke-virtual {p1, v0, p2}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/a;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {p0}, Lcom/autochips/carplay/service/a;->getHandler()Landroid/os/Handler;

    move-result-object p2

    const/16 v0, 0x402

    invoke-virtual {p1, v0, p2}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/a;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {p0}, Lcom/autochips/carplay/service/a;->getHandler()Landroid/os/Handler;

    move-result-object p2

    const/16 v0, 0x403

    invoke-virtual {p1, v0, p2}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/a;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {p0}, Lcom/autochips/carplay/service/a;->getHandler()Landroid/os/Handler;

    move-result-object p2

    const/16 v0, 0x404

    invoke-virtual {p1, v0, p2}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/a;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {p0}, Lcom/autochips/carplay/service/a;->getHandler()Landroid/os/Handler;

    move-result-object p2

    const/16 v0, 0x501

    invoke-virtual {p1, v0, p2}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/a;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {p0}, Lcom/autochips/carplay/service/a;->getHandler()Landroid/os/Handler;

    move-result-object p2

    const/16 v0, 0x502

    invoke-virtual {p1, v0, p2}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/a;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {p0}, Lcom/autochips/carplay/service/a;->getHandler()Landroid/os/Handler;

    move-result-object p2

    const/16 v0, 0x503

    invoke-virtual {p1, v0, p2}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/a;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {p0}, Lcom/autochips/carplay/service/a;->getHandler()Landroid/os/Handler;

    move-result-object p2

    const/16 v0, 0x504

    invoke-virtual {p1, v0, p2}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/a;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {p0}, Lcom/autochips/carplay/service/a;->getHandler()Landroid/os/Handler;

    move-result-object p2

    const/16 v0, 0x701

    invoke-virtual {p1, v0, p2}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/a;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {p0}, Lcom/autochips/carplay/service/a;->getHandler()Landroid/os/Handler;

    move-result-object p2

    const/16 v0, 0x702

    invoke-virtual {p1, v0, p2}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/a;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {p0}, Lcom/autochips/carplay/service/a;->getHandler()Landroid/os/Handler;

    move-result-object p2

    const/16 v0, 0x703

    invoke-virtual {p1, v0, p2}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/a;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {p0}, Lcom/autochips/carplay/service/a;->getHandler()Landroid/os/Handler;

    move-result-object p2

    const/16 v0, 0x704

    invoke-virtual {p1, v0, p2}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/a;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {p0}, Lcom/autochips/carplay/service/a;->getHandler()Landroid/os/Handler;

    move-result-object p2

    const/16 v0, 0x601

    invoke-virtual {p1, v0, p2}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/a;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {p0}, Lcom/autochips/carplay/service/a;->getHandler()Landroid/os/Handler;

    move-result-object p2

    const/16 v0, 0x602

    invoke-virtual {p1, v0, p2}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/a;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {p0}, Lcom/autochips/carplay/service/a;->getHandler()Landroid/os/Handler;

    move-result-object p2

    const/16 v0, 0x603

    invoke-virtual {p1, v0, p2}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/a;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {p0}, Lcom/autochips/carplay/service/a;->getHandler()Landroid/os/Handler;

    move-result-object p2

    const/16 v0, 0x604

    invoke-virtual {p1, v0, p2}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/a;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {p0}, Lcom/autochips/carplay/service/a;->getHandler()Landroid/os/Handler;

    move-result-object p2

    const/16 v0, 0x801

    invoke-virtual {p1, v0, p2}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/a;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {p0}, Lcom/autochips/carplay/service/a;->getHandler()Landroid/os/Handler;

    move-result-object p2

    const/16 v0, 0x802

    invoke-virtual {p1, v0, p2}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    iget-object p1, p0, Lcom/autochips/carplay/service/a;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    invoke-virtual {p0}, Lcom/autochips/carplay/service/a;->getHandler()Landroid/os/Handler;

    move-result-object p2

    const/16 v0, 0x803

    invoke-virtual {p1, v0, p2}, Lcom/autochips/carplay/service/h;->a(ILandroid/os/Handler;)V

    return-void
.end method

.method public final declared-synchronized getEnableState()I
    .locals 3

    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/autochips/carplay/service/a;->getCurrentState()Lcom/android/internal/util/IState;

    move-result-object v0

    iget-object v1, p0, Lcom/autochips/carplay/service/a;->te:Lcom/autochips/carplay/service/c;

    const/4 v2, 0x0

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/autochips/carplay/service/a;->tb:Lcom/autochips/carplay/service/f;

    if-ne v0, v1, :cond_1

    const/4 v2, 0x1

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/autochips/carplay/service/a;->td:Lcom/autochips/carplay/service/d;

    if-ne v0, v1, :cond_2

    const/4 v2, 0x2

    goto :goto_0

    :cond_2
    iget-object v1, p0, Lcom/autochips/carplay/service/a;->tc:Lcom/autochips/carplay/service/e;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-ne v0, v1, :cond_3

    const/4 v2, 0x3

    :cond_3
    :goto_0
    monitor-exit p0

    return v2

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected final getLogRecString(Landroid/os/Message;)Ljava/lang/String;
    .locals 0

    iget p1, p1, Landroid/os/Message;->what:I

    invoke-static {p1}, Lcom/autochips/carplay/common/CarplayMessage;->messageString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected final onQuitting()V
    .locals 2

    iget-object v0, p0, Lcom/autochips/carplay/service/a;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iput-object v1, p0, Lcom/autochips/carplay/service/a;->mCarplayMonitor:Lcom/autochips/carplay/service/h;

    :cond_0
    iget-object v0, p0, Lcom/autochips/carplay/service/a;->ta:Lcom/autochips/carplay/service/i;

    if-eqz v0, :cond_1

    iput-object v1, p0, Lcom/autochips/carplay/service/a;->ta:Lcom/autochips/carplay/service/i;

    :cond_1
    iget-object v0, p0, Lcom/autochips/carplay/service/a;->sZ:Lcom/autochips/carplay/service/CarplayService;

    if-eqz v0, :cond_2

    iput-object v1, p0, Lcom/autochips/carplay/service/a;->sZ:Lcom/autochips/carplay/service/CarplayService;

    :cond_2
    return-void
.end method
