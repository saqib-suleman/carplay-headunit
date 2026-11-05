.class public final Landroid/arch/lifecycle/x;
.super Ljava/lang/Object;


# instance fields
.field private final mMap:Ljava/util/HashMap;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroid/arch/lifecycle/x;->mMap:Ljava/util/HashMap;

    return-void
.end method


# virtual methods
.method final a(Ljava/lang/String;Landroid/arch/lifecycle/u;)V
    .locals 1

    iget-object v0, p0, Landroid/arch/lifecycle/x;->mMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/arch/lifecycle/u;

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/arch/lifecycle/u;->p()V

    :cond_0
    return-void
.end method

.method final b(Ljava/lang/String;)Landroid/arch/lifecycle/u;
    .locals 1

    iget-object v0, p0, Landroid/arch/lifecycle/x;->mMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/arch/lifecycle/u;

    return-object p1
.end method

.method public final clear()V
    .locals 2

    iget-object v0, p0, Landroid/arch/lifecycle/x;->mMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/arch/lifecycle/u;

    invoke-virtual {v1}, Landroid/arch/lifecycle/u;->p()V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Landroid/arch/lifecycle/x;->mMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    return-void
.end method
