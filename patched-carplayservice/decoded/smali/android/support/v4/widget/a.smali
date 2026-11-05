.class public final Landroid/support/v4/widget/a;
.super Ljava/lang/Object;


# instance fields
.field private final oa:Landroid/support/v4/c/o;

.field private final ob:Landroid/support/v4/c/s;

.field private final oc:Ljava/util/ArrayList;

.field private final od:Ljava/util/HashSet;


# direct methods
.method private a(Ljava/lang/Object;Ljava/util/ArrayList;Ljava/util/HashSet;)V
    .locals 4

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p3, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p3, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Landroid/support/v4/widget/a;->ob:Landroid/support/v4/c/s;

    invoke-virtual {v0, p1}, Landroid/support/v4/c/s;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    if-eqz v0, :cond_1

    const/4 v1, 0x0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    :goto_0
    if-ge v1, v2, :cond_1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-direct {p0, v3, p2, p3}, Landroid/support/v4/widget/a;->a(Ljava/lang/Object;Ljava/util/ArrayList;Ljava/util/HashSet;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    invoke-virtual {p3, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    :cond_2
    new-instance p1, Ljava/lang/RuntimeException;

    const-string p2, "This graph contains cyclic dependencies"

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public final b(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/widget/a;->ob:Landroid/support/v4/c/s;

    invoke-virtual {v0, p1}, Landroid/support/v4/c/s;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Landroid/support/v4/widget/a;->ob:Landroid/support/v4/c/s;

    invoke-virtual {v0, p2}, Landroid/support/v4/c/s;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Landroid/support/v4/widget/a;->ob:Landroid/support/v4/c/s;

    invoke-virtual {v0, p1}, Landroid/support/v4/c/s;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    if-nez v0, :cond_1

    iget-object v0, p0, Landroid/support/v4/widget/a;->oa:Landroid/support/v4/c/o;

    invoke-interface {v0}, Landroid/support/v4/c/o;->acquire()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    :cond_0
    iget-object v1, p0, Landroid/support/v4/widget/a;->ob:Landroid/support/v4/c/s;

    invoke-virtual {v1, p1, v0}, Landroid/support/v4/c/s;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "All nodes must be present in the graph before being added as an edge"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final clear()V
    .locals 4

    iget-object v0, p0, Landroid/support/v4/widget/a;->ob:Landroid/support/v4/c/s;

    invoke-virtual {v0}, Landroid/support/v4/c/s;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    iget-object v2, p0, Landroid/support/v4/widget/a;->ob:Landroid/support/v4/c/s;

    invoke-virtual {v2, v1}, Landroid/support/v4/c/s;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/ArrayList;

    if-eqz v2, :cond_0

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    iget-object v3, p0, Landroid/support/v4/widget/a;->oa:Landroid/support/v4/c/o;

    invoke-interface {v3, v2}, Landroid/support/v4/c/o;->release(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    iget-object v0, p0, Landroid/support/v4/widget/a;->ob:Landroid/support/v4/c/s;

    invoke-virtual {v0}, Landroid/support/v4/c/s;->clear()V

    return-void
.end method

.method public final contains(Ljava/lang/Object;)Z
    .locals 1

    iget-object v0, p0, Landroid/support/v4/widget/a;->ob:Landroid/support/v4/c/s;

    invoke-virtual {v0, p1}, Landroid/support/v4/c/s;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public final cu()Ljava/util/ArrayList;
    .locals 5

    iget-object v0, p0, Landroid/support/v4/widget/a;->oc:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget-object v0, p0, Landroid/support/v4/widget/a;->od:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->clear()V

    iget-object v0, p0, Landroid/support/v4/widget/a;->ob:Landroid/support/v4/c/s;

    invoke-virtual {v0}, Landroid/support/v4/c/s;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    iget-object v2, p0, Landroid/support/v4/widget/a;->ob:Landroid/support/v4/c/s;

    invoke-virtual {v2, v1}, Landroid/support/v4/c/s;->keyAt(I)Ljava/lang/Object;

    move-result-object v2

    iget-object v3, p0, Landroid/support/v4/widget/a;->oc:Ljava/util/ArrayList;

    iget-object v4, p0, Landroid/support/v4/widget/a;->od:Ljava/util/HashSet;

    invoke-direct {p0, v2, v3, v4}, Landroid/support/v4/widget/a;->a(Ljava/lang/Object;Ljava/util/ArrayList;Ljava/util/HashSet;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/widget/a;->oc:Ljava/util/ArrayList;

    return-object v0
.end method

.method public final o(Ljava/lang/Object;)V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/widget/a;->ob:Landroid/support/v4/c/s;

    invoke-virtual {v0, p1}, Landroid/support/v4/c/s;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/widget/a;->ob:Landroid/support/v4/c/s;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroid/support/v4/c/s;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method public final p(Ljava/lang/Object;)Z
    .locals 4

    iget-object v0, p0, Landroid/support/v4/widget/a;->ob:Landroid/support/v4/c/s;

    invoke-virtual {v0}, Landroid/support/v4/c/s;->size()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_1

    iget-object v3, p0, Landroid/support/v4/widget/a;->ob:Landroid/support/v4/c/s;

    invoke-virtual {v3, v2}, Landroid/support/v4/c/s;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/ArrayList;

    if-eqz v3, :cond_0

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return v1
.end method
