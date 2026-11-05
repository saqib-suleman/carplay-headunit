.class abstract Lcom/autochips/carplay/service/q;
.super Lcom/android/internal/util/State;


# instance fields
.field final synthetic uD:Lcom/autochips/carplay/service/p;


# direct methods
.method private constructor <init>(Lcom/autochips/carplay/service/p;)V
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/service/q;->uD:Lcom/autochips/carplay/service/p;

    invoke-direct {p0}, Lcom/android/internal/util/State;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/autochips/carplay/service/p;B)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/autochips/carplay/service/q;-><init>(Lcom/autochips/carplay/service/p;)V

    return-void
.end method


# virtual methods
.method final B(Ljava/lang/String;)V
    .locals 3

    invoke-static {}, Lcom/autochips/carplay/service/p;->aB()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/autochips/carplay/service/q;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public enter()V
    .locals 3

    invoke-static {}, Lcom/autochips/carplay/service/p;->aB()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Enter "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/autochips/carplay/service/q;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/autochips/carplay/service/q;->uD:Lcom/autochips/carplay/service/p;

    invoke-virtual {v2}, Lcom/autochips/carplay/service/p;->getCurrentMessage()Landroid/os/Message;

    move-result-object v2

    iget v2, v2, Landroid/os/Message;->what:I

    invoke-static {v2}, Lcom/autochips/carplay/common/CarplayMessage;->messageString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-super {p0}, Lcom/android/internal/util/State;->enter()V

    return-void
.end method

.method public exit()V
    .locals 3

    iget-object v0, p0, Lcom/autochips/carplay/service/q;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v0, p0}, Lcom/autochips/carplay/service/p;->a(Lcom/autochips/carplay/service/p;Lcom/android/internal/util/State;)Lcom/android/internal/util/State;

    invoke-static {}, Lcom/autochips/carplay/service/p;->aB()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Exit "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/autochips/carplay/service/q;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ", mPrevState: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/autochips/carplay/service/q;->uD:Lcom/autochips/carplay/service/p;

    invoke-static {v2}, Lcom/autochips/carplay/service/p;->a(Lcom/autochips/carplay/service/p;)Lcom/android/internal/util/State;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/internal/util/State;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/autochips/carplay/service/q;->uD:Lcom/autochips/carplay/service/p;

    invoke-virtual {v2}, Lcom/autochips/carplay/service/p;->getCurrentMessage()Landroid/os/Message;

    move-result-object v2

    iget v2, v2, Landroid/os/Message;->what:I

    invoke-static {v2}, Lcom/autochips/carplay/common/CarplayMessage;->messageString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-super {p0}, Lcom/android/internal/util/State;->exit()V

    return-void
.end method
