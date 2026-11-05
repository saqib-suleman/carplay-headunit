.class public final Lcom/autochips/carplay/service/ab;
.super Ljava/lang/Object;


# instance fields
.field private mStates:Ljava/util/Map;

.field final synthetic uI:Lcom/autochips/carplay/service/z;


# direct methods
.method constructor <init>(Lcom/autochips/carplay/service/z;)V
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/service/ab;->uI:Lcom/autochips/carplay/service/z;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {p1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object p1, p0, Lcom/autochips/carplay/service/ab;->mStates:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method final am(I)I
    .locals 2

    iget-object v0, p0, Lcom/autochips/carplay/service/ab;->mStates:Ljava/util/Map;

    new-instance v1, Ljava/lang/Integer;

    invoke-direct {v1, p1}, Ljava/lang/Integer;-><init>(I)V

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    return p1

    :cond_0
    const/4 p1, 0x1

    return p1
.end method

.method final s(II)V
    .locals 2

    iget-object v0, p0, Lcom/autochips/carplay/service/ab;->mStates:Ljava/util/Map;

    new-instance v1, Ljava/lang/Integer;

    invoke-direct {v1, p1}, Ljava/lang/Integer;-><init>(I)V

    new-instance p1, Ljava/lang/Integer;

    invoke-direct {p1, p2}, Ljava/lang/Integer;-><init>(I)V

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
