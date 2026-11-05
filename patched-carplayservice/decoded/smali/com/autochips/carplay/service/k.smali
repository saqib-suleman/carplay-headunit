.class final Lcom/autochips/carplay/service/k;
.super Ljava/lang/Object;


# instance fields
.field private tS:I

.field private tT:Ljava/util/HashMap;


# direct methods
.method private constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/autochips/carplay/service/k;->tT:Ljava/util/HashMap;

    return-void
.end method

.method synthetic constructor <init>(B)V
    .locals 0

    invoke-direct {p0}, Lcom/autochips/carplay/service/k;-><init>()V

    return-void
.end method

.method static synthetic a(Lcom/autochips/carplay/service/k;I)Lcom/autochips/carplay/service/j;
    .locals 0

    invoke-direct {p0, p1}, Lcom/autochips/carplay/service/k;->ai(I)Lcom/autochips/carplay/service/j;

    move-result-object p0

    return-object p0
.end method

.method static synthetic a(Lcom/autochips/carplay/service/k;Ljava/lang/String;)Lcom/autochips/carplay/service/j;
    .locals 2

    iget-object p0, p0, Lcom/autochips/carplay/service/k;->tT:Ljava/util/HashMap;

    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/autochips/carplay/service/j;

    iget-object v1, v0, Lcom/autochips/carplay/service/j;->name:Ljava/lang/String;

    invoke-static {v1, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-object v0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method static synthetic a(Lcom/autochips/carplay/service/k;)Ljava/util/Iterator;
    .locals 0

    invoke-direct {p0}, Lcom/autochips/carplay/service/k;->dV()Ljava/util/Iterator;

    move-result-object p0

    return-object p0
.end method

.method private ai(I)Lcom/autochips/carplay/service/j;
    .locals 1

    iget-object v0, p0, Lcom/autochips/carplay/service/k;->tT:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/autochips/carplay/service/j;

    return-object p1
.end method

.method static synthetic b(Lcom/autochips/carplay/service/k;I)Lcom/autochips/carplay/service/j;
    .locals 2

    new-instance v0, Lcom/autochips/carplay/service/j;

    iget v1, p0, Lcom/autochips/carplay/service/k;->tS:I

    invoke-direct {v0, v1, p1}, Lcom/autochips/carplay/service/j;-><init>(II)V

    iget-object p1, p0, Lcom/autochips/carplay/service/k;->tT:Ljava/util/HashMap;

    iget v1, p0, Lcom/autochips/carplay/service/k;->tS:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget p1, p0, Lcom/autochips/carplay/service/k;->tS:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/autochips/carplay/service/k;->tS:I

    return-object v0
.end method

.method static synthetic c(Lcom/autochips/carplay/service/k;I)Lcom/autochips/carplay/service/j;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/service/k;->tT:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/autochips/carplay/service/j;

    return-object p0
.end method

.method private dV()Ljava/util/Iterator;
    .locals 1

    iget-object v0, p0, Lcom/autochips/carplay/service/k;->tT:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public final dU()V
    .locals 5

    invoke-direct {p0}, Lcom/autochips/carplay/service/k;->dV()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-direct {p0, v1}, Lcom/autochips/carplay/service/k;->ai(I)Lcom/autochips/carplay/service/j;

    move-result-object v1

    iget v2, v1, Lcom/autochips/carplay/service/j;->type:I

    if-nez v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    const-string v2, "CarplayNative"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Successfully remove iface "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_1
    return-void
.end method
