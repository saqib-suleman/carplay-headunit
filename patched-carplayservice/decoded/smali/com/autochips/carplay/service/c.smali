.class final Lcom/autochips/carplay/service/c;
.super Lcom/autochips/carplay/service/b;


# instance fields
.field final synthetic ti:Lcom/autochips/carplay/service/a;


# direct methods
.method private constructor <init>(Lcom/autochips/carplay/service/a;)V
    .locals 1

    iput-object p1, p0, Lcom/autochips/carplay/service/c;->ti:Lcom/autochips/carplay/service/a;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/autochips/carplay/service/b;-><init>(Lcom/autochips/carplay/service/a;B)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/autochips/carplay/service/a;B)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/autochips/carplay/service/c;-><init>(Lcom/autochips/carplay/service/a;)V

    return-void
.end method


# virtual methods
.method final dt()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public final processMessage(Landroid/os/Message;)Z
    .locals 2

    iget v0, p1, Landroid/os/Message;->what:I

    invoke-static {v0}, Lcom/autochips/carplay/common/CarplayMessage;->messageString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/service/c;->B(Ljava/lang/String;)V

    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x101

    if-eq v0, v1, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Unhandled message - "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget p1, p1, Landroid/os/Message;->what:I

    invoke-static {p1}, Lcom/autochips/carplay/common/CarplayMessage;->messageString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/service/c;->B(Ljava/lang/String;)V

    const/4 p1, 0x0

    return p1

    :cond_0
    iget-object v0, p0, Lcom/autochips/carplay/service/c;->ti:Lcom/autochips/carplay/service/a;

    iget p1, p1, Landroid/os/Message;->arg1:I

    invoke-static {v0, p1}, Lcom/autochips/carplay/service/a;->b(Lcom/autochips/carplay/service/a;I)I

    iget-object p1, p0, Lcom/autochips/carplay/service/c;->ti:Lcom/autochips/carplay/service/a;

    iget-object v0, p0, Lcom/autochips/carplay/service/c;->ti:Lcom/autochips/carplay/service/a;

    invoke-static {v0}, Lcom/autochips/carplay/service/a;->c(Lcom/autochips/carplay/service/a;)Lcom/autochips/carplay/service/f;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/service/a;->transitionTo(Lcom/android/internal/util/IState;)V

    const/4 p1, 0x1

    return p1
.end method
