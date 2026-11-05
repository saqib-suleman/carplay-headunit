.class final Lcom/autochips/carplay/b/ac;
.super Lcom/android/internal/util/StateMachine;


# instance fields
.field private final ey:Lcom/android/internal/util/State;

.field private mSurface:Landroid/view/Surface;

.field private rZ:Lcom/autochips/carplay/common/f;

.field private sD:I

.field final synthetic sT:Lcom/autochips/carplay/b/aa;

.field private sU:Z

.field private sV:Z

.field private final sn:Lcom/android/internal/util/State;

.field private final so:Lcom/android/internal/util/State;

.field private sr:I


# direct methods
.method constructor <init>(Lcom/autochips/carplay/b/aa;Landroid/os/Looper;)V
    .locals 1

    iput-object p1, p0, Lcom/autochips/carplay/b/ac;->sT:Lcom/autochips/carplay/b/aa;

    const-string p1, "ScreenManager"

    invoke-direct {p0, p1, p2}, Lcom/android/internal/util/StateMachine;-><init>(Ljava/lang/String;Landroid/os/Looper;)V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/autochips/carplay/b/ac;->sU:Z

    const/4 p2, 0x0

    iput-object p2, p0, Lcom/autochips/carplay/b/ac;->mSurface:Landroid/view/Surface;

    const/4 v0, 0x1

    iput v0, p0, Lcom/autochips/carplay/b/ac;->sD:I

    iput-boolean p1, p0, Lcom/autochips/carplay/b/ac;->sV:Z

    new-instance v0, Lcom/autochips/carplay/b/ad;

    invoke-direct {v0, p0}, Lcom/autochips/carplay/b/ad;-><init>(Lcom/autochips/carplay/b/ac;)V

    iput-object v0, p0, Lcom/autochips/carplay/b/ac;->sn:Lcom/android/internal/util/State;

    new-instance v0, Lcom/autochips/carplay/b/ae;

    invoke-direct {v0, p0}, Lcom/autochips/carplay/b/ae;-><init>(Lcom/autochips/carplay/b/ac;)V

    iput-object v0, p0, Lcom/autochips/carplay/b/ac;->so:Lcom/android/internal/util/State;

    new-instance v0, Lcom/autochips/carplay/b/af;

    invoke-direct {v0, p0}, Lcom/autochips/carplay/b/af;-><init>(Lcom/autochips/carplay/b/ac;)V

    iput-object v0, p0, Lcom/autochips/carplay/b/ac;->ey:Lcom/android/internal/util/State;

    iput-object p2, p0, Lcom/autochips/carplay/b/ac;->rZ:Lcom/autochips/carplay/common/f;

    iput p1, p0, Lcom/autochips/carplay/b/ac;->sr:I

    iget-object p1, p0, Lcom/autochips/carplay/b/ac;->sn:Lcom/android/internal/util/State;

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/b/ac;->addState(Lcom/android/internal/util/State;)V

    iget-object p1, p0, Lcom/autochips/carplay/b/ac;->so:Lcom/android/internal/util/State;

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/b/ac;->addState(Lcom/android/internal/util/State;)V

    iget-object p1, p0, Lcom/autochips/carplay/b/ac;->ey:Lcom/android/internal/util/State;

    iget-object p2, p0, Lcom/autochips/carplay/b/ac;->so:Lcom/android/internal/util/State;

    invoke-virtual {p0, p1, p2}, Lcom/autochips/carplay/b/ac;->addState(Lcom/android/internal/util/State;Lcom/android/internal/util/State;)V

    iget-object p1, p0, Lcom/autochips/carplay/b/ac;->sn:Lcom/android/internal/util/State;

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/b/ac;->setInitialState(Lcom/android/internal/util/State;)V

    invoke-virtual {p0}, Lcom/autochips/carplay/b/ac;->start()V

    return-void
.end method

.method private A(Ljava/lang/String;)V
    .locals 3

    iget-object v0, p0, Lcom/autochips/carplay/b/ac;->sT:Lcom/autochips/carplay/b/aa;

    invoke-static {v0}, Lcom/autochips/carplay/b/aa;->e(Lcom/autochips/carplay/b/aa;)Landroid/widget/Toast;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/autochips/carplay/b/ac;->sT:Lcom/autochips/carplay/b/aa;

    iget-object v2, p0, Lcom/autochips/carplay/b/ac;->sT:Lcom/autochips/carplay/b/aa;

    invoke-static {v2}, Lcom/autochips/carplay/b/aa;->f(Lcom/autochips/carplay/b/aa;)Landroid/content/Context;

    move-result-object v2

    invoke-static {v2, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/autochips/carplay/b/aa;->a(Lcom/autochips/carplay/b/aa;Landroid/widget/Toast;)Landroid/widget/Toast;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/autochips/carplay/b/ac;->sT:Lcom/autochips/carplay/b/aa;

    invoke-static {v0}, Lcom/autochips/carplay/b/aa;->e(Lcom/autochips/carplay/b/aa;)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->cancel()V

    iget-object v0, p0, Lcom/autochips/carplay/b/ac;->sT:Lcom/autochips/carplay/b/aa;

    iget-object v2, p0, Lcom/autochips/carplay/b/ac;->sT:Lcom/autochips/carplay/b/aa;

    invoke-static {v2}, Lcom/autochips/carplay/b/aa;->f(Lcom/autochips/carplay/b/aa;)Landroid/content/Context;

    move-result-object v2

    invoke-static {v2, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/autochips/carplay/b/aa;->a(Lcom/autochips/carplay/b/aa;Landroid/widget/Toast;)Landroid/widget/Toast;

    iget-object v0, p0, Lcom/autochips/carplay/b/ac;->sT:Lcom/autochips/carplay/b/aa;

    invoke-static {v0}, Lcom/autochips/carplay/b/aa;->e(Lcom/autochips/carplay/b/aa;)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/widget/Toast;->setText(Ljava/lang/CharSequence;)V

    :goto_0
    iget-object p1, p0, Lcom/autochips/carplay/b/ac;->sT:Lcom/autochips/carplay/b/aa;

    invoke-static {p1}, Lcom/autochips/carplay/b/aa;->e(Lcom/autochips/carplay/b/aa;)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method static synthetic A(Lcom/autochips/carplay/b/ac;)Z
    .locals 0

    invoke-direct {p0}, Lcom/autochips/carplay/b/ac;->dq()Z

    move-result p0

    return p0
.end method

.method static synthetic B(Lcom/autochips/carplay/b/ac;)I
    .locals 0

    iget p0, p0, Lcom/autochips/carplay/b/ac;->sD:I

    return p0
.end method

.method static synthetic C(Lcom/autochips/carplay/b/ac;)V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/ac;->removeMessages(I)V

    return-void
.end method

.method static synthetic D(Lcom/autochips/carplay/b/ac;)V
    .locals 1

    const/16 v0, 0x16

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/ac;->removeMessages(I)V

    return-void
.end method

.method static synthetic E(Lcom/autochips/carplay/b/ac;)V
    .locals 1

    const/16 v0, 0x17

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/ac;->removeMessages(I)V

    return-void
.end method

.method static synthetic F(Lcom/autochips/carplay/b/ac;)V
    .locals 1

    const/16 v0, 0x15

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/ac;->removeMessages(I)V

    return-void
.end method

.method static synthetic G(Lcom/autochips/carplay/b/ac;)V
    .locals 1

    const/16 v0, 0x18

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/ac;->removeMessages(I)V

    return-void
.end method

.method static synthetic H(Lcom/autochips/carplay/b/ac;)V
    .locals 1

    const/16 v0, 0x14

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/ac;->removeMessages(I)V

    return-void
.end method

.method static synthetic I(Lcom/autochips/carplay/b/ac;)Z
    .locals 1

    const/16 v0, 0x17

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/ac;->hasMessages(I)Z

    move-result p0

    return p0
.end method

.method static synthetic J(Lcom/autochips/carplay/b/ac;)Z
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/ac;->hasDeferredMessages(I)Z

    move-result p0

    return p0
.end method

.method static synthetic K(Lcom/autochips/carplay/b/ac;)Z
    .locals 1

    const/16 v0, 0x15

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/ac;->hasMessages(I)Z

    move-result p0

    return p0
.end method

.method static synthetic L(Lcom/autochips/carplay/b/ac;)Z
    .locals 1

    const/16 v0, 0x15

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/ac;->hasMessages(I)Z

    move-result p0

    return p0
.end method

.method static synthetic M(Lcom/autochips/carplay/b/ac;)Z
    .locals 1

    const/16 v0, 0x17

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/ac;->hasMessages(I)Z

    move-result p0

    return p0
.end method

.method static synthetic N(Lcom/autochips/carplay/b/ac;)V
    .locals 1

    const/16 v0, 0x17

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/ac;->removeMessages(I)V

    return-void
.end method

.method static synthetic O(Lcom/autochips/carplay/b/ac;)Z
    .locals 1

    const/16 v0, 0x15

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/ac;->hasMessages(I)Z

    move-result p0

    return p0
.end method

.method static synthetic P(Lcom/autochips/carplay/b/ac;)V
    .locals 1

    const/16 v0, 0x15

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/ac;->removeMessages(I)V

    return-void
.end method

.method static synthetic a(Lcom/autochips/carplay/b/ac;I)I
    .locals 0

    iput p1, p0, Lcom/autochips/carplay/b/ac;->sD:I

    return p1
.end method

.method static synthetic a(Lcom/autochips/carplay/b/ac;Landroid/view/Surface;)Landroid/view/Surface;
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/b/ac;->mSurface:Landroid/view/Surface;

    return-object p1
.end method

.method static synthetic a(Lcom/autochips/carplay/b/ac;)Lcom/android/internal/util/State;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/b/ac;->ey:Lcom/android/internal/util/State;

    return-object p0
.end method

.method static synthetic a(Lcom/autochips/carplay/b/ac;Landroid/os/Message;Z)Z
    .locals 10

    iget v0, p1, Landroid/os/Message;->what:I

    sget-object v1, Lcom/autochips/carplay/b/aa;->si:Lcom/autochips/carplay/b/aa;

    invoke-virtual {v1}, Lcom/autochips/carplay/b/aa;->do()Lcom/autochips/carplay/common/b;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-nez v0, :cond_9

    const/16 v0, 0x17

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/ac;->removeMessages(I)V

    iput-boolean v3, p0, Lcom/autochips/carplay/b/ac;->sU:Z

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/view/Surface;

    iput-object v0, p0, Lcom/autochips/carplay/b/ac;->mSurface:Landroid/view/Surface;

    iget v0, p1, Landroid/os/Message;->what:I

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/ac;->hasDeferredMessages(I)Z

    move-result v0

    if-nez v0, :cond_7

    const/4 v0, 0x2

    if-eqz v1, :cond_4

    invoke-virtual {v1}, Lcom/autochips/carplay/common/b;->cU()I

    move-result v4

    if-ne v0, v4, :cond_0

    const-string v4, "ScreenManager"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "current app state is phone calling, entity: "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/autochips/carplay/common/b;->cU()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v4, "carkit call active, carplay screen cannot start"

    invoke-direct {p0, v4}, Lcom/autochips/carplay/b/ac;->A(Ljava/lang/String;)V

    move v4, v3

    goto :goto_0

    :cond_0
    move v4, v2

    :goto_0
    invoke-virtual {v1}, Lcom/autochips/carplay/common/b;->cT()Lcom/autochips/carplay/common/d;

    move-result-object v5

    if-eqz v5, :cond_1

    iget v6, v5, Lcom/autochips/carplay/common/d;->qA:I

    if-ne v0, v6, :cond_1

    const-string v4, "ScreenManager"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "current app state is specch, entity: "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v7, v5, Lcom/autochips/carplay/common/d;->qA:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, ", specchMode: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v5, v5, Lcom/autochips/carplay/common/d;->qA:I

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v4, "carkit speech active, carplay screen cannot start"

    invoke-direct {p0, v4}, Lcom/autochips/carplay/b/ac;->A(Ljava/lang/String;)V

    move v4, v3

    :cond_1
    if-nez v4, :cond_3

    iget-object v5, p0, Lcom/autochips/carplay/b/ac;->sT:Lcom/autochips/carplay/b/aa;

    invoke-static {v5}, Lcom/autochips/carplay/b/aa;->b(Lcom/autochips/carplay/b/aa;)Lcom/autochips/carplay/c/a;

    move-result-object v5

    invoke-virtual {v5}, Lcom/autochips/carplay/c/a;->el()Z

    move-result v5

    iget-object v6, p0, Lcom/autochips/carplay/b/ac;->sT:Lcom/autochips/carplay/b/aa;

    invoke-static {v6}, Lcom/autochips/carplay/b/aa;->b(Lcom/autochips/carplay/b/aa;)Lcom/autochips/carplay/c/a;

    move-result-object v6

    invoke-virtual {v6}, Lcom/autochips/carplay/c/a;->em()I

    move-result v6

    const-string v7, "ScreenManager"

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "accessoty callOn: "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v9, ", audioState: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz v5, :cond_2

    const-string v4, "carkit call active, carplay screen cannot start"

    :goto_1
    invoke-direct {p0, v4}, Lcom/autochips/carplay/b/ac;->A(Ljava/lang/String;)V

    move v4, v3

    goto :goto_2

    :cond_2
    if-eqz v6, :cond_3

    const-string v4, "carkit speech active, carplay screen cannot start"

    goto :goto_1

    :cond_3
    :goto_2
    if-eqz v4, :cond_4

    const-string p0, "ScreenManager"

    const-string p1, "accessory phone/speech ongoing, ignore screenOwnerships"

    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v4

    :cond_4
    if-eqz v1, :cond_5

    invoke-virtual {v1}, Lcom/autochips/carplay/common/b;->cS()I

    move-result v4

    if-ne v0, v4, :cond_5

    invoke-direct {p0}, Lcom/autochips/carplay/b/ac;->dp()V

    goto :goto_3

    :cond_5
    iget-boolean v0, p0, Lcom/autochips/carplay/b/ac;->sV:Z

    if-nez v0, :cond_6

    iget v0, p0, Lcom/autochips/carplay/b/ac;->sD:I

    if-nez v0, :cond_6

    iget-object v0, p0, Lcom/autochips/carplay/b/ac;->ey:Lcom/android/internal/util/State;

    invoke-virtual {p0}, Lcom/autochips/carplay/b/ac;->getCurrentState()Lcom/android/internal/util/IState;

    move-result-object v4

    if-eq v0, v4, :cond_6

    iget-object v0, p0, Lcom/autochips/carplay/b/ac;->ey:Lcom/android/internal/util/State;

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/ac;->transitionTo(Lcom/android/internal/util/IState;)V

    goto :goto_3

    :cond_6
    if-eqz v1, :cond_8

    invoke-virtual {v1}, Lcom/autochips/carplay/common/b;->cS()I

    move-result v0

    if-ne v3, v0, :cond_8

    iget v0, p0, Lcom/autochips/carplay/b/ac;->sD:I

    if-eqz v0, :cond_8

    const/16 v0, 0x18

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/ac;->removeMessages(I)V

    const-wide/16 v3, 0x3e8

    invoke-virtual {p0, v0, v3, v4}, Lcom/autochips/carplay/b/ac;->sendMessageDelayed(IJ)V

    goto :goto_3

    :cond_7
    const-string v0, "ScreenManager"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "already has message: "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v3, p1, Landroid/os/Message;->what:I

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    iget v0, p1, Landroid/os/Message;->what:I

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/ac;->removeDeferredMessages(I)V

    :cond_8
    :goto_3
    if-eqz p2, :cond_c

    :goto_4
    invoke-virtual {p0, p1}, Lcom/autochips/carplay/b/ac;->deferMessage(Landroid/os/Message;)V

    return v2

    :cond_9
    if-ne v0, v3, :cond_c

    const/16 v0, 0x14

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/ac;->removeMessages(I)V

    const/16 v0, 0x16

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/ac;->removeMessages(I)V

    iput-boolean v2, p0, Lcom/autochips/carplay/b/ac;->sU:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/autochips/carplay/b/ac;->mSurface:Landroid/view/Surface;

    iget v0, p1, Landroid/os/Message;->what:I

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/ac;->hasDeferredMessages(I)Z

    move-result v0

    if-nez v0, :cond_b

    iget p1, p1, Landroid/os/Message;->arg1:I

    const/16 p2, 0x11e

    if-ne p1, p2, :cond_a

    invoke-direct {p0}, Lcom/autochips/carplay/b/ac;->dq()Z

    move-result v2

    return v2

    :cond_a
    const-string p0, "ScreenManager"

    const-string p1, "not need to takeScreen"

    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move v2, v3

    return v2

    :cond_b
    const-string v0, "ScreenManager"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "already has message: "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v3, p1, Landroid/os/Message;->what:I

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    iget v0, p1, Landroid/os/Message;->what:I

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/ac;->removeDeferredMessages(I)V

    if-eqz p2, :cond_c

    goto :goto_4

    :cond_c
    return v2
.end method

.method static synthetic a(Lcom/autochips/carplay/b/ac;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/autochips/carplay/b/ac;->sV:Z

    return p1
.end method

.method private a(Lcom/autochips/carplay/common/f;)Z
    .locals 2

    iget-object v0, p0, Lcom/autochips/carplay/b/ac;->rZ:Lcom/autochips/carplay/common/f;

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/common/f;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/autochips/carplay/b/ac;->sr:I

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const-string p1, "ScreenManager"

    const-string v0, "the same request, ignore!"

    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, 0x0

    return p1

    :cond_1
    :goto_0
    iput-object p1, p0, Lcom/autochips/carplay/b/ac;->rZ:Lcom/autochips/carplay/common/f;

    invoke-virtual {p0}, Lcom/autochips/carplay/b/ac;->getHandler()Landroid/os/Handler;

    move-result-object v0

    invoke-static {v0}, Landroid/os/Message;->obtain(Landroid/os/Handler;)Landroid/os/Message;

    move-result-object v0

    const/16 v1, 0x10a

    iput v1, v0, Landroid/os/Message;->what:I

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    sget-object p1, Lcom/autochips/carplay/b/aa;->si:Lcom/autochips/carplay/b/aa;

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/b/aa;->a(Landroid/os/Message;)V

    const/4 p1, 0x1

    return p1
.end method

.method static synthetic b(Lcom/autochips/carplay/b/ac;)Z
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/autochips/carplay/b/ac;->sU:Z

    return v0
.end method

.method static synthetic c(Lcom/autochips/carplay/b/ac;)I
    .locals 0

    iget p0, p0, Lcom/autochips/carplay/b/ac;->sr:I

    return p0
.end method

.method static synthetic d(Lcom/autochips/carplay/b/ac;)V
    .locals 1

    const/16 v0, 0x14

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/ac;->removeMessages(I)V

    return-void
.end method

.method private dp()V
    .locals 8

    iget-object v0, p0, Lcom/autochips/carplay/b/ac;->rZ:Lcom/autochips/carplay/common/f;

    const-wide/16 v1, 0x3e8

    const/4 v3, 0x0

    const/16 v4, 0x14

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/autochips/carplay/b/ac;->rZ:Lcom/autochips/carplay/common/f;

    iget-object v0, v0, Lcom/autochips/carplay/common/f;->qF:Lcom/autochips/carplay/common/g;

    iget v0, v0, Lcom/autochips/carplay/common/g;->qK:I

    const-string v5, "ScreenManager"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "transferType: "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v5, 0x3

    if-ne v0, v5, :cond_1

    const-string v0, "ScreenManager"

    const-string v5, "unborrowScreen"

    invoke-static {v0, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Lcom/autochips/carplay/common/f;

    invoke-direct {v0}, Lcom/autochips/carplay/common/f;-><init>()V

    iget-object v5, v0, Lcom/autochips/carplay/common/f;->qF:Lcom/autochips/carplay/common/g;

    const/4 v6, 0x4

    iput v6, v5, Lcom/autochips/carplay/common/g;->qK:I

    iget-object v5, v0, Lcom/autochips/carplay/common/f;->qF:Lcom/autochips/carplay/common/g;

    const/16 v7, 0x1f4

    iput v7, v5, Lcom/autochips/carplay/common/g;->qL:I

    iget-object v5, v0, Lcom/autochips/carplay/common/f;->qF:Lcom/autochips/carplay/common/g;

    iput v3, v5, Lcom/autochips/carplay/common/g;->qM:I

    iget-object v5, v0, Lcom/autochips/carplay/common/f;->qF:Lcom/autochips/carplay/common/g;

    iput v3, v5, Lcom/autochips/carplay/common/g;->qN:I

    invoke-direct {p0, v0}, Lcom/autochips/carplay/b/ac;->a(Lcom/autochips/carplay/common/f;)Z

    move-result v0

    if-eqz v0, :cond_0

    iput v6, p0, Lcom/autochips/carplay/b/ac;->sr:I

    invoke-virtual {p0, v4}, Lcom/autochips/carplay/b/ac;->removeMessages(I)V

    invoke-virtual {p0, v4, v6, v1, v2}, Lcom/autochips/carplay/b/ac;->sendMessageDelayed(IIJ)V

    :cond_0
    return-void

    :cond_1
    const/4 v3, 0x1

    if-ne v0, v3, :cond_2

    const-string v0, "ScreenManager"

    const-string v3, "untakeScreen"

    invoke-static {v0, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Lcom/autochips/carplay/common/f;

    invoke-direct {v0}, Lcom/autochips/carplay/common/f;-><init>()V

    iget-object v3, v0, Lcom/autochips/carplay/common/f;->qF:Lcom/autochips/carplay/common/g;

    const/4 v5, 0x2

    iput v5, v3, Lcom/autochips/carplay/common/g;->qK:I

    invoke-direct {p0, v0}, Lcom/autochips/carplay/b/ac;->a(Lcom/autochips/carplay/common/f;)Z

    move-result v0

    if-eqz v0, :cond_2

    iput v5, p0, Lcom/autochips/carplay/b/ac;->sr:I

    invoke-virtual {p0, v4}, Lcom/autochips/carplay/b/ac;->removeMessages(I)V

    invoke-virtual {p0, v4, v5, v1, v2}, Lcom/autochips/carplay/b/ac;->sendMessageDelayed(IIJ)V

    :cond_2
    return-void

    :cond_3
    const-string v0, "ScreenManager"

    const-string v5, "mCurrentModeRequest is null"

    invoke-static {v0, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0, v4}, Lcom/autochips/carplay/b/ac;->removeMessages(I)V

    invoke-virtual {p0, v4, v3, v1, v2}, Lcom/autochips/carplay/b/ac;->sendMessageDelayed(IIJ)V

    return-void
.end method

.method private dq()Z
    .locals 5

    const-string v0, "ScreenManager"

    const-string v1, "takeScreen"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Lcom/autochips/carplay/common/f;

    invoke-direct {v0}, Lcom/autochips/carplay/common/f;-><init>()V

    iget-object v1, v0, Lcom/autochips/carplay/common/f;->qF:Lcom/autochips/carplay/common/g;

    const/4 v2, 0x1

    iput v2, v1, Lcom/autochips/carplay/common/g;->qK:I

    iget-object v1, v0, Lcom/autochips/carplay/common/f;->qF:Lcom/autochips/carplay/common/g;

    const/16 v3, 0x1f4

    iput v3, v1, Lcom/autochips/carplay/common/g;->qL:I

    iget-object v1, v0, Lcom/autochips/carplay/common/f;->qF:Lcom/autochips/carplay/common/g;

    iput v3, v1, Lcom/autochips/carplay/common/g;->qM:I

    iget-object v1, v0, Lcom/autochips/carplay/common/f;->qF:Lcom/autochips/carplay/common/g;

    const/16 v3, 0x64

    iput v3, v1, Lcom/autochips/carplay/common/g;->qN:I

    invoke-direct {p0, v0}, Lcom/autochips/carplay/b/ac;->a(Lcom/autochips/carplay/common/f;)Z

    move-result v0

    if-eqz v0, :cond_0

    iput v2, p0, Lcom/autochips/carplay/b/ac;->sr:I

    const/16 v1, 0x14

    invoke-virtual {p0, v1}, Lcom/autochips/carplay/b/ac;->removeMessages(I)V

    const-wide/16 v3, 0x3e8

    invoke-virtual {p0, v1, v2, v3, v4}, Lcom/autochips/carplay/b/ac;->sendMessageDelayed(IIJ)V

    :cond_0
    return v0
.end method

.method static synthetic e(Lcom/autochips/carplay/b/ac;)I
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/autochips/carplay/b/ac;->sr:I

    return v0
.end method

.method static synthetic f(Lcom/autochips/carplay/b/ac;)V
    .locals 1

    const/16 v0, 0x14

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/ac;->removeMessages(I)V

    return-void
.end method

.method static synthetic g(Lcom/autochips/carplay/b/ac;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/autochips/carplay/b/ac;->sU:Z

    return p0
.end method

.method static synthetic h(Lcom/autochips/carplay/b/ac;)V
    .locals 1

    const/16 v0, 0x14

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/ac;->removeMessages(I)V

    return-void
.end method

.method static synthetic i(Lcom/autochips/carplay/b/ac;)Lcom/android/internal/util/State;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/b/ac;->so:Lcom/android/internal/util/State;

    return-object p0
.end method

.method static synthetic j(Lcom/autochips/carplay/b/ac;)Lcom/autochips/carplay/common/f;
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/autochips/carplay/b/ac;->rZ:Lcom/autochips/carplay/common/f;

    return-object v0
.end method

.method static synthetic k(Lcom/autochips/carplay/b/ac;)V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/ac;->removeMessages(I)V

    return-void
.end method

.method static synthetic l(Lcom/autochips/carplay/b/ac;)V
    .locals 1

    const/16 v0, 0x16

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/ac;->removeMessages(I)V

    return-void
.end method

.method static synthetic m(Lcom/autochips/carplay/b/ac;)V
    .locals 1

    const/16 v0, 0x17

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/ac;->removeMessages(I)V

    return-void
.end method

.method static synthetic n(Lcom/autochips/carplay/b/ac;)V
    .locals 1

    const/16 v0, 0x15

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/ac;->removeMessages(I)V

    return-void
.end method

.method private n(Z)V
    .locals 3

    const-string v0, "ScreenManager"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "doErrorHandler, mIsEnableVideo:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean v2, p0, Lcom/autochips/carplay/b/ac;->sU:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    if-nez p1, :cond_1

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/ac;->hasDeferredMessages(I)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "ScreenManager"

    const-string v2, "doErrorHandler, mode change timeout, remove deffered start cmd"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/ac;->removeDeferredMessages(I)V

    :cond_0
    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/ac;->hasMessages(I)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/ac;->removeMessages(I)V

    :cond_1
    iget-boolean v1, p0, Lcom/autochips/carplay/b/ac;->sU:Z

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/autochips/carplay/b/ac;->sT:Lcom/autochips/carplay/b/aa;

    iget-object v1, v1, Lcom/autochips/carplay/b/aa;->sQ:Lcom/autochips/carplay/b/ac;

    invoke-virtual {v1, v0}, Lcom/autochips/carplay/b/ac;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    iget-object v2, p0, Lcom/autochips/carplay/b/ac;->mSurface:Landroid/view/Surface;

    iput-object v2, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-eqz p1, :cond_2

    const/16 p1, 0x16

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/b/ac;->hasMessages(I)Z

    move-result v0

    if-nez v0, :cond_3

    const-wide/16 v0, 0x2710

    invoke-virtual {p0, p1, v0, v1}, Lcom/autochips/carplay/b/ac;->sendMessageDelayed(IJ)V

    return-void

    :cond_2
    invoke-virtual {p0, v1}, Lcom/autochips/carplay/b/ac;->sendMessage(Landroid/os/Message;)V

    invoke-static {}, Lcom/autochips/carplay/service/g;->dx()Lcom/autochips/carplay/service/g;

    move-result-object p1

    invoke-virtual {p1}, Lcom/autochips/carplay/service/g;->dC()Lcom/autochips/carplay/service/p;

    move-result-object p1

    if-eqz p1, :cond_3

    invoke-virtual {p1}, Lcom/autochips/carplay/service/p;->getConnectedDevices()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_3

    const/16 v0, 0x106

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/service/p;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    const/4 v1, 0x1

    iput v1, v0, Landroid/os/Message;->arg1:I

    const/4 v1, 0x0

    iput-object v1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/service/p;->sendMessage(Landroid/os/Message;)V

    :cond_3
    return-void
.end method

.method static synthetic o(Lcom/autochips/carplay/b/ac;)V
    .locals 1

    const/16 v0, 0x18

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/ac;->removeMessages(I)V

    return-void
.end method

.method static synthetic p(Lcom/autochips/carplay/b/ac;)V
    .locals 1

    const/16 v0, 0x14

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/ac;->removeMessages(I)V

    return-void
.end method

.method static synthetic q(Lcom/autochips/carplay/b/ac;)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/autochips/carplay/b/ac;->sr:I

    invoke-direct {p0, v0}, Lcom/autochips/carplay/b/ac;->n(Z)V

    return-void
.end method

.method static synthetic r(Lcom/autochips/carplay/b/ac;)Z
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/ac;->hasMessages(I)Z

    move-result p0

    return p0
.end method

.method static synthetic s(Lcom/autochips/carplay/b/ac;)Landroid/view/Surface;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/b/ac;->mSurface:Landroid/view/Surface;

    return-object p0
.end method

.method static synthetic t(Lcom/autochips/carplay/b/ac;)V
    .locals 0

    invoke-direct {p0}, Lcom/autochips/carplay/b/ac;->dp()V

    return-void
.end method

.method static synthetic u(Lcom/autochips/carplay/b/ac;)V
    .locals 1

    const/16 v0, 0x18

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/ac;->removeMessages(I)V

    return-void
.end method

.method static synthetic v(Lcom/autochips/carplay/b/ac;)V
    .locals 1

    const/16 v0, 0x14

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/ac;->removeMessages(I)V

    return-void
.end method

.method static synthetic w(Lcom/autochips/carplay/b/ac;)V
    .locals 1

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/autochips/carplay/b/ac;->n(Z)V

    return-void
.end method

.method static synthetic x(Lcom/autochips/carplay/b/ac;)Lcom/android/internal/util/State;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/b/ac;->sn:Lcom/android/internal/util/State;

    return-object p0
.end method

.method static synthetic y(Lcom/autochips/carplay/b/ac;)V
    .locals 1

    const/16 v0, 0x14

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/ac;->removeMessages(I)V

    return-void
.end method

.method static synthetic z(Lcom/autochips/carplay/b/ac;)V
    .locals 1

    const/16 v0, 0x14

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/b/ac;->removeMessages(I)V

    return-void
.end method


# virtual methods
.method protected final onHalting()V
    .locals 3

    const-string v0, "ScreenManager"

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

    const-string v0, "ScreenManager"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "onQuitting:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
