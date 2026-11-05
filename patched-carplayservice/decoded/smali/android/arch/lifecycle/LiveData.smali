.class public abstract Landroid/arch/lifecycle/LiveData;
.super Ljava/lang/Object;


# static fields
.field private static final V:Ljava/lang/Object;


# instance fields
.field private final U:Ljava/lang/Object;

.field private W:Landroid/arch/a/b/b;

.field private X:I

.field private volatile Y:Ljava/lang/Object;

.field private Z:Z

.field private aa:Z

.field private final ab:Ljava/lang/Runnable;

.field private volatile mData:Ljava/lang/Object;

.field private mVersion:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Landroid/arch/lifecycle/LiveData;->V:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroid/arch/lifecycle/LiveData;->U:Ljava/lang/Object;

    new-instance v0, Landroid/arch/a/b/b;

    invoke-direct {v0}, Landroid/arch/a/b/b;-><init>()V

    iput-object v0, p0, Landroid/arch/lifecycle/LiveData;->W:Landroid/arch/a/b/b;

    const/4 v0, 0x0

    iput v0, p0, Landroid/arch/lifecycle/LiveData;->X:I

    sget-object v0, Landroid/arch/lifecycle/LiveData;->V:Ljava/lang/Object;

    iput-object v0, p0, Landroid/arch/lifecycle/LiveData;->mData:Ljava/lang/Object;

    sget-object v0, Landroid/arch/lifecycle/LiveData;->V:Ljava/lang/Object;

    iput-object v0, p0, Landroid/arch/lifecycle/LiveData;->Y:Ljava/lang/Object;

    const/4 v0, -0x1

    iput v0, p0, Landroid/arch/lifecycle/LiveData;->mVersion:I

    new-instance v0, Landroid/arch/lifecycle/m;

    invoke-direct {v0, p0}, Landroid/arch/lifecycle/m;-><init>(Landroid/arch/lifecycle/LiveData;)V

    iput-object v0, p0, Landroid/arch/lifecycle/LiveData;->ab:Ljava/lang/Runnable;

    return-void
.end method

.method static synthetic a(Landroid/arch/lifecycle/LiveData;I)I
    .locals 0

    iput p1, p0, Landroid/arch/lifecycle/LiveData;->X:I

    return p1
.end method

.method static synthetic a(Landroid/arch/lifecycle/LiveData;)Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Landroid/arch/lifecycle/LiveData;->U:Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic a(Landroid/arch/lifecycle/LiveData;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    iput-object p1, p0, Landroid/arch/lifecycle/LiveData;->Y:Ljava/lang/Object;

    return-object p1
.end method

.method static synthetic a(Landroid/arch/lifecycle/LiveData;Landroid/arch/lifecycle/n;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/arch/lifecycle/LiveData;->b(Landroid/arch/lifecycle/n;)V

    return-void
.end method

.method private a(Landroid/arch/lifecycle/n;)V
    .locals 2

    iget-boolean v0, p1, Landroid/arch/lifecycle/n;->mActive:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Landroid/arch/lifecycle/n;->m()Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/arch/lifecycle/n;->a(Z)V

    return-void

    :cond_1
    iget v0, p1, Landroid/arch/lifecycle/n;->af:I

    iget v1, p0, Landroid/arch/lifecycle/LiveData;->mVersion:I

    if-lt v0, v1, :cond_2

    return-void

    :cond_2
    iget v0, p0, Landroid/arch/lifecycle/LiveData;->mVersion:I

    iput v0, p1, Landroid/arch/lifecycle/n;->af:I

    iget-object p1, p1, Landroid/arch/lifecycle/n;->ae:Landroid/arch/lifecycle/q;

    iget-object v0, p0, Landroid/arch/lifecycle/LiveData;->mData:Ljava/lang/Object;

    invoke-interface {p1, v0}, Landroid/arch/lifecycle/q;->d(Ljava/lang/Object;)V

    return-void
.end method

.method private static a(Ljava/lang/String;)V
    .locals 3

    invoke-static {}, Landroid/arch/a/a/a;->a()Landroid/arch/a/a/a;

    move-result-object v0

    invoke-virtual {v0}, Landroid/arch/a/a/a;->b()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Cannot invoke "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " on a background thread"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static synthetic b(Landroid/arch/lifecycle/LiveData;)Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Landroid/arch/lifecycle/LiveData;->Y:Ljava/lang/Object;

    return-object p0
.end method

.method private b(Landroid/arch/lifecycle/n;)V
    .locals 3

    iget-boolean v0, p0, Landroid/arch/lifecycle/LiveData;->Z:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    iput-boolean v1, p0, Landroid/arch/lifecycle/LiveData;->aa:Z

    return-void

    :cond_0
    iput-boolean v1, p0, Landroid/arch/lifecycle/LiveData;->Z:Z

    :cond_1
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/arch/lifecycle/LiveData;->aa:Z

    if-eqz p1, :cond_2

    invoke-direct {p0, p1}, Landroid/arch/lifecycle/LiveData;->a(Landroid/arch/lifecycle/n;)V

    const/4 p1, 0x0

    goto :goto_0

    :cond_2
    iget-object v1, p0, Landroid/arch/lifecycle/LiveData;->W:Landroid/arch/a/b/b;

    invoke-virtual {v1}, Landroid/arch/a/b/b;->c()Landroid/arch/a/b/f;

    move-result-object v1

    :cond_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/arch/lifecycle/n;

    invoke-direct {p0, v2}, Landroid/arch/lifecycle/LiveData;->a(Landroid/arch/lifecycle/n;)V

    iget-boolean v2, p0, Landroid/arch/lifecycle/LiveData;->aa:Z

    if-eqz v2, :cond_3

    :cond_4
    :goto_0
    iget-boolean v1, p0, Landroid/arch/lifecycle/LiveData;->aa:Z

    if-nez v1, :cond_1

    iput-boolean v0, p0, Landroid/arch/lifecycle/LiveData;->Z:Z

    return-void
.end method

.method static synthetic c(Landroid/arch/lifecycle/LiveData;)I
    .locals 0

    iget p0, p0, Landroid/arch/lifecycle/LiveData;->X:I

    return p0
.end method

.method static synthetic l()Ljava/lang/Object;
    .locals 1

    sget-object v0, Landroid/arch/lifecycle/LiveData;->V:Ljava/lang/Object;

    return-object v0
.end method


# virtual methods
.method public final a(Landroid/arch/lifecycle/g;Landroid/arch/lifecycle/q;)V
    .locals 2

    const-string v0, "observe"

    invoke-static {v0}, Landroid/arch/lifecycle/LiveData;->a(Ljava/lang/String;)V

    invoke-interface {p1}, Landroid/arch/lifecycle/g;->g()Landroid/arch/lifecycle/Lifecycle;

    move-result-object v0

    invoke-virtual {v0}, Landroid/arch/lifecycle/Lifecycle;->f()Landroid/arch/lifecycle/Lifecycle$State;

    move-result-object v0

    sget-object v1, Landroid/arch/lifecycle/Lifecycle$State;->D:Landroid/arch/lifecycle/Lifecycle$State;

    if-ne v0, v1, :cond_0

    return-void

    :cond_0
    new-instance v0, Landroid/arch/lifecycle/LiveData$LifecycleBoundObserver;

    invoke-direct {v0, p0, p1, p2}, Landroid/arch/lifecycle/LiveData$LifecycleBoundObserver;-><init>(Landroid/arch/lifecycle/LiveData;Landroid/arch/lifecycle/g;Landroid/arch/lifecycle/q;)V

    iget-object v1, p0, Landroid/arch/lifecycle/LiveData;->W:Landroid/arch/a/b/b;

    invoke-virtual {v1, p2, v0}, Landroid/arch/a/b/b;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/arch/lifecycle/n;

    if-eqz p2, :cond_2

    invoke-virtual {p2, p1}, Landroid/arch/lifecycle/n;->b(Landroid/arch/lifecycle/g;)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_0

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Cannot add the same observer with different lifecycles"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    :goto_0
    if-eqz p2, :cond_3

    return-void

    :cond_3
    invoke-interface {p1}, Landroid/arch/lifecycle/g;->g()Landroid/arch/lifecycle/Lifecycle;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/arch/lifecycle/Lifecycle;->a(Landroid/arch/lifecycle/f;)V

    return-void
.end method

.method public a(Landroid/arch/lifecycle/q;)V
    .locals 1

    const-string v0, "removeObserver"

    invoke-static {v0}, Landroid/arch/lifecycle/LiveData;->a(Ljava/lang/String;)V

    iget-object v0, p0, Landroid/arch/lifecycle/LiveData;->W:Landroid/arch/a/b/b;

    invoke-virtual {v0, p1}, Landroid/arch/a/b/b;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/arch/lifecycle/n;

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Landroid/arch/lifecycle/n;->n()V

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/arch/lifecycle/n;->a(Z)V

    return-void
.end method

.method public final getValue()Ljava/lang/Object;
    .locals 2

    iget-object v0, p0, Landroid/arch/lifecycle/LiveData;->mData:Ljava/lang/Object;

    sget-object v1, Landroid/arch/lifecycle/LiveData;->V:Ljava/lang/Object;

    if-eq v0, v1, :cond_0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method protected j()V
    .locals 0

    return-void
.end method

.method public final k()Z
    .locals 1

    iget v0, p0, Landroid/arch/lifecycle/LiveData;->X:I

    if-lez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method protected onActive()V
    .locals 0

    return-void
.end method

.method protected setValue(Ljava/lang/Object;)V
    .locals 1

    const-string v0, "setValue"

    invoke-static {v0}, Landroid/arch/lifecycle/LiveData;->a(Ljava/lang/String;)V

    iget v0, p0, Landroid/arch/lifecycle/LiveData;->mVersion:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Landroid/arch/lifecycle/LiveData;->mVersion:I

    iput-object p1, p0, Landroid/arch/lifecycle/LiveData;->mData:Ljava/lang/Object;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Landroid/arch/lifecycle/LiveData;->b(Landroid/arch/lifecycle/n;)V

    return-void
.end method
