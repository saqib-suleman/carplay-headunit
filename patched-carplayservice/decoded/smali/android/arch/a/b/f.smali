.class final Landroid/arch/a/b/f;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/arch/a/b/h;
.implements Ljava/util/Iterator;


# instance fields
.field private o:Landroid/arch/a/b/e;

.field private p:Z

.field final synthetic q:Landroid/arch/a/b/b;


# direct methods
.method private constructor <init>(Landroid/arch/a/b/b;)V
    .locals 0

    iput-object p1, p0, Landroid/arch/a/b/f;->q:Landroid/arch/a/b/b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x1

    iput-boolean p1, p0, Landroid/arch/a/b/f;->p:Z

    return-void
.end method

.method synthetic constructor <init>(Landroid/arch/a/b/b;B)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/arch/a/b/f;-><init>(Landroid/arch/a/b/b;)V

    return-void
.end method


# virtual methods
.method public final c(Landroid/arch/a/b/e;)V
    .locals 1

    iget-object v0, p0, Landroid/arch/a/b/f;->o:Landroid/arch/a/b/e;

    if-ne p1, v0, :cond_1

    iget-object p1, p0, Landroid/arch/a/b/f;->o:Landroid/arch/a/b/e;

    iget-object p1, p1, Landroid/arch/a/b/e;->n:Landroid/arch/a/b/e;

    iput-object p1, p0, Landroid/arch/a/b/f;->o:Landroid/arch/a/b/e;

    iget-object p1, p0, Landroid/arch/a/b/f;->o:Landroid/arch/a/b/e;

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iput-boolean p1, p0, Landroid/arch/a/b/f;->p:Z

    :cond_1
    return-void
.end method

.method public final hasNext()Z
    .locals 3

    iget-boolean v0, p0, Landroid/arch/a/b/f;->p:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/arch/a/b/f;->q:Landroid/arch/a/b/b;

    invoke-static {v0}, Landroid/arch/a/b/b;->a(Landroid/arch/a/b/b;)Landroid/arch/a/b/e;

    move-result-object v0

    if-eqz v0, :cond_0

    return v2

    :cond_0
    return v1

    :cond_1
    iget-object v0, p0, Landroid/arch/a/b/f;->o:Landroid/arch/a/b/e;

    if-eqz v0, :cond_2

    iget-object v0, p0, Landroid/arch/a/b/f;->o:Landroid/arch/a/b/e;

    iget-object v0, v0, Landroid/arch/a/b/e;->m:Landroid/arch/a/b/e;

    if-eqz v0, :cond_2

    return v2

    :cond_2
    return v1
.end method

.method public final synthetic next()Ljava/lang/Object;
    .locals 1

    iget-boolean v0, p0, Landroid/arch/a/b/f;->p:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/arch/a/b/f;->p:Z

    iget-object v0, p0, Landroid/arch/a/b/f;->q:Landroid/arch/a/b/b;

    invoke-static {v0}, Landroid/arch/a/b/b;->a(Landroid/arch/a/b/b;)Landroid/arch/a/b/e;

    move-result-object v0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Landroid/arch/a/b/f;->o:Landroid/arch/a/b/e;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/arch/a/b/f;->o:Landroid/arch/a/b/e;

    iget-object v0, v0, Landroid/arch/a/b/e;->m:Landroid/arch/a/b/e;

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    iput-object v0, p0, Landroid/arch/a/b/f;->o:Landroid/arch/a/b/e;

    iget-object v0, p0, Landroid/arch/a/b/f;->o:Landroid/arch/a/b/e;

    return-object v0
.end method
