.class abstract Lcom/autochips/carplay/service/b;
.super Lcom/android/internal/util/State;


# instance fields
.field final synthetic ti:Lcom/autochips/carplay/service/a;


# direct methods
.method private constructor <init>(Lcom/autochips/carplay/service/a;)V
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/service/b;->ti:Lcom/autochips/carplay/service/a;

    invoke-direct {p0}, Lcom/android/internal/util/State;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/autochips/carplay/service/a;B)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/autochips/carplay/service/b;-><init>(Lcom/autochips/carplay/service/a;)V

    return-void
.end method


# virtual methods
.method final B(Ljava/lang/String;)V
    .locals 3

    invoke-static {}, Lcom/autochips/carplay/service/a;->dr()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/autochips/carplay/service/b;->dt()I

    move-result v2

    invoke-static {v2}, Lcom/autochips/carplay/CarplayCommon;->nameForEnableState(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method final C(Ljava/lang/String;)V
    .locals 3

    invoke-static {}, Lcom/autochips/carplay/service/a;->dr()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/autochips/carplay/service/b;->dt()I

    move-result v2

    invoke-static {v2}, Lcom/autochips/carplay/CarplayCommon;->nameForEnableState(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method abstract dt()I
.end method

.method public enter()V
    .locals 3

    invoke-virtual {p0}, Lcom/autochips/carplay/service/b;->dt()I

    move-result v0

    const-string v1, "entered "

    invoke-virtual {p0, v1}, Lcom/autochips/carplay/service/b;->B(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/autochips/carplay/service/b;->ti:Lcom/autochips/carplay/service/a;

    invoke-static {v1}, Lcom/autochips/carplay/service/a;->b(Lcom/autochips/carplay/service/a;)Lcom/autochips/carplay/service/CarplayService;

    move-result-object v1

    iget-object v2, p0, Lcom/autochips/carplay/service/b;->ti:Lcom/autochips/carplay/service/a;

    invoke-static {v2}, Lcom/autochips/carplay/service/a;->a(Lcom/autochips/carplay/service/a;)I

    move-result v2

    invoke-virtual {v1, v2, v0}, Lcom/autochips/carplay/service/CarplayService;->p(II)V

    iget-object v1, p0, Lcom/autochips/carplay/service/b;->ti:Lcom/autochips/carplay/service/a;

    invoke-static {v1, v0}, Lcom/autochips/carplay/service/a;->a(Lcom/autochips/carplay/service/a;I)I

    return-void
.end method
