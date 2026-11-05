.class final Lcom/autochips/carplay/b/x;
.super Lcom/android/internal/util/State;


# instance fields
.field final synthetic sP:Lcom/autochips/carplay/b/s;


# direct methods
.method constructor <init>(Lcom/autochips/carplay/b/s;)V
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/b/x;->sP:Lcom/autochips/carplay/b/s;

    invoke-direct {p0}, Lcom/android/internal/util/State;-><init>()V

    return-void
.end method


# virtual methods
.method public final enter()V
    .locals 2

    const-string v0, "OutputAudioStateMachine"

    const-string v1, "entering DefaultState"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public final exit()V
    .locals 2

    iget-object v0, p0, Lcom/autochips/carplay/b/x;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {v0}, Lcom/autochips/carplay/b/s;->s(Lcom/autochips/carplay/b/s;)V

    const-string v0, "OutputAudioStateMachine"

    const-string v1, "exit DefaultState"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public final processMessage(Landroid/os/Message;)Z
    .locals 3

    const-string v0, "OutputAudioStateMachine"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/autochips/carplay/b/x;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " processMessage: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Landroid/os/Message;->what:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget p1, p1, Landroid/os/Message;->what:I

    const/4 v0, 0x1

    if-eqz p1, :cond_0

    const/4 v1, 0x3

    if-eq p1, v1, :cond_1

    const/4 p1, 0x0

    return p1

    :cond_0
    iget-object p1, p0, Lcom/autochips/carplay/b/x;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {p1, v0}, Lcom/autochips/carplay/b/s;->a(Lcom/autochips/carplay/b/s;Z)V

    :cond_1
    iget-object p1, p0, Lcom/autochips/carplay/b/x;->sP:Lcom/autochips/carplay/b/s;

    iget-object p1, p1, Lcom/autochips/carplay/b/s;->sC:Lcom/autochips/carplay/b/m;

    invoke-static {p1}, Lcom/autochips/carplay/b/m;->b(Lcom/autochips/carplay/b/m;)I

    move-result p1

    if-gtz p1, :cond_2

    iget-object p1, p0, Lcom/autochips/carplay/b/x;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {p1, v0}, Lcom/autochips/carplay/b/s;->e(Lcom/autochips/carplay/b/s;I)I

    goto :goto_0

    :cond_2
    iget-object p1, p0, Lcom/autochips/carplay/b/x;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {p1}, Lcom/autochips/carplay/b/s;->e(Lcom/autochips/carplay/b/s;)I

    move-result p1

    invoke-static {p1}, Lcom/autochips/carplay/b/s;->ab(I)V

    :goto_0
    iget-object p1, p0, Lcom/autochips/carplay/b/x;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {p1}, Lcom/autochips/carplay/b/s;->t(Lcom/autochips/carplay/b/s;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/autochips/carplay/b/x;->sP:Lcom/autochips/carplay/b/s;

    invoke-static {p1}, Lcom/autochips/carplay/b/s;->u(Lcom/autochips/carplay/b/s;)Z

    :cond_3
    return v0
.end method
