.class final Landroid/support/v4/widget/d;
.super Landroid/support/v4/widget/l;


# instance fields
.field private final oR:I

.field private oS:Landroid/support/v4/widget/j;

.field private final oT:Ljava/lang/Runnable;

.field final synthetic oU:Landroid/support/v4/widget/DrawerLayout;


# virtual methods
.method public final A(Landroid/view/View;)V
    .locals 1

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    const/4 v0, 0x0

    iput-boolean v0, p1, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->oK:Z

    iget p1, p0, Landroid/support/v4/widget/d;->oR:I

    const/4 v0, 0x3

    if-ne p1, v0, :cond_0

    const/4 v0, 0x5

    :cond_0
    iget-object p1, p0, Landroid/support/v4/widget/d;->oU:Landroid/support/v4/widget/DrawerLayout;

    invoke-virtual {p1, v0}, Landroid/support/v4/widget/DrawerLayout;->H(I)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_1

    iget-object v0, p0, Landroid/support/v4/widget/d;->oU:Landroid/support/v4/widget/DrawerLayout;

    invoke-virtual {v0, p1}, Landroid/support/v4/widget/DrawerLayout;->x(Landroid/view/View;)V

    :cond_1
    return-void
.end method

.method public final B(Landroid/view/View;)I
    .locals 1

    invoke-static {p1}, Landroid/support/v4/widget/DrawerLayout;->v(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result p1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public final C(Landroid/view/View;)I
    .locals 0

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result p1

    return p1
.end method

.method public final I(I)V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/widget/d;->oU:Landroid/support/v4/widget/DrawerLayout;

    iget-object v1, p0, Landroid/support/v4/widget/d;->oS:Landroid/support/v4/widget/j;

    invoke-virtual {v1}, Landroid/support/v4/widget/j;->cI()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Landroid/support/v4/widget/DrawerLayout;->a(ILandroid/view/View;)V

    return-void
.end method

.method public final c(Landroid/view/View;F)V
    .locals 6

    invoke-static {p1}, Landroid/support/v4/widget/DrawerLayout;->s(Landroid/view/View;)F

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v1

    iget-object v2, p0, Landroid/support/v4/widget/d;->oU:Landroid/support/v4/widget/DrawerLayout;

    const/4 v3, 0x3

    invoke-virtual {v2, p1, v3}, Landroid/support/v4/widget/DrawerLayout;->h(Landroid/view/View;I)Z

    move-result v2

    const/high16 v3, 0x3f000000    # 0.5f

    const/4 v4, 0x0

    if-eqz v2, :cond_2

    cmpl-float p2, p2, v4

    if-gtz p2, :cond_1

    if-nez p2, :cond_0

    cmpl-float p2, v0, v3

    if-lez p2, :cond_0

    goto :goto_0

    :cond_0
    neg-int p2, v1

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p2, 0x0

    goto :goto_1

    :cond_2
    iget-object v2, p0, Landroid/support/v4/widget/d;->oU:Landroid/support/v4/widget/DrawerLayout;

    invoke-virtual {v2}, Landroid/support/v4/widget/DrawerLayout;->getWidth()I

    move-result v2

    cmpg-float v5, p2, v4

    if-ltz v5, :cond_3

    cmpl-float p2, p2, v4

    if-nez p2, :cond_4

    cmpl-float p2, v0, v3

    if-lez p2, :cond_4

    :cond_3
    sub-int/2addr v2, v1

    :cond_4
    move p2, v2

    :goto_1
    iget-object v0, p0, Landroid/support/v4/widget/d;->oS:Landroid/support/v4/widget/j;

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result p1

    invoke-virtual {v0, p2, p1}, Landroid/support/v4/widget/j;->f(II)Z

    iget-object p1, p0, Landroid/support/v4/widget/d;->oU:Landroid/support/v4/widget/DrawerLayout;

    invoke-virtual {p1}, Landroid/support/v4/widget/DrawerLayout;->invalidate()V

    return-void
.end method

.method public final cx()V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/widget/d;->oU:Landroid/support/v4/widget/DrawerLayout;

    iget-object v1, p0, Landroid/support/v4/widget/d;->oT:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/DrawerLayout;->removeCallbacks(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final cy()V
    .locals 4

    iget-object v0, p0, Landroid/support/v4/widget/d;->oU:Landroid/support/v4/widget/DrawerLayout;

    iget-object v1, p0, Landroid/support/v4/widget/d;->oT:Ljava/lang/Runnable;

    const-wide/16 v2, 0xa0

    invoke-virtual {v0, v1, v2, v3}, Landroid/support/v4/widget/DrawerLayout;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public final e(II)V
    .locals 1

    const/4 v0, 0x1

    and-int/2addr p1, v0

    if-ne p1, v0, :cond_0

    iget-object p1, p0, Landroid/support/v4/widget/d;->oU:Landroid/support/v4/widget/DrawerLayout;

    const/4 v0, 0x3

    :goto_0
    invoke-virtual {p1, v0}, Landroid/support/v4/widget/DrawerLayout;->H(I)Landroid/view/View;

    move-result-object p1

    goto :goto_1

    :cond_0
    iget-object p1, p0, Landroid/support/v4/widget/d;->oU:Landroid/support/v4/widget/DrawerLayout;

    const/4 v0, 0x5

    goto :goto_0

    :goto_1
    if-eqz p1, :cond_1

    iget-object v0, p0, Landroid/support/v4/widget/d;->oU:Landroid/support/v4/widget/DrawerLayout;

    invoke-virtual {v0, p1}, Landroid/support/v4/widget/DrawerLayout;->r(Landroid/view/View;)I

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Landroid/support/v4/widget/d;->oS:Landroid/support/v4/widget/j;

    invoke-virtual {v0, p1, p2}, Landroid/support/v4/widget/j;->k(Landroid/view/View;I)V

    :cond_1
    return-void
.end method

.method public final i(Landroid/view/View;I)V
    .locals 3

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v0

    iget-object v1, p0, Landroid/support/v4/widget/d;->oU:Landroid/support/v4/widget/DrawerLayout;

    const/4 v2, 0x3

    invoke-virtual {v1, p1, v2}, Landroid/support/v4/widget/DrawerLayout;->h(Landroid/view/View;I)Z

    move-result v1

    if-eqz v1, :cond_0

    add-int/2addr p2, v0

    int-to-float p2, p2

    :goto_0
    int-to-float v0, v0

    div-float/2addr p2, v0

    goto :goto_1

    :cond_0
    iget-object v1, p0, Landroid/support/v4/widget/d;->oU:Landroid/support/v4/widget/DrawerLayout;

    invoke-virtual {v1}, Landroid/support/v4/widget/DrawerLayout;->getWidth()I

    move-result v1

    sub-int/2addr v1, p2

    int-to-float p2, v1

    goto :goto_0

    :goto_1
    iget-object v0, p0, Landroid/support/v4/widget/d;->oU:Landroid/support/v4/widget/DrawerLayout;

    invoke-virtual {v0, p1, p2}, Landroid/support/v4/widget/DrawerLayout;->b(Landroid/view/View;F)V

    const/4 v0, 0x0

    cmpl-float p2, p2, v0

    if-nez p2, :cond_1

    const/4 p2, 0x4

    goto :goto_2

    :cond_1
    const/4 p2, 0x0

    :goto_2
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Landroid/support/v4/widget/d;->oU:Landroid/support/v4/widget/DrawerLayout;

    invoke-virtual {p1}, Landroid/support/v4/widget/DrawerLayout;->invalidate()V

    return-void
.end method

.method public final j(Landroid/view/View;I)I
    .locals 2

    iget-object v0, p0, Landroid/support/v4/widget/d;->oU:Landroid/support/v4/widget/DrawerLayout;

    const/4 v1, 0x3

    invoke-virtual {v0, p1, v1}, Landroid/support/v4/widget/DrawerLayout;->h(Landroid/view/View;I)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result p1

    neg-int p1, p1

    const/4 v0, 0x0

    :goto_0
    invoke-static {p2, v0}, Ljava/lang/Math;->min(II)I

    move-result p2

    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    move-result p1

    return p1

    :cond_0
    iget-object v0, p0, Landroid/support/v4/widget/d;->oU:Landroid/support/v4/widget/DrawerLayout;

    invoke-virtual {v0}, Landroid/support/v4/widget/DrawerLayout;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result p1

    sub-int p1, v0, p1

    goto :goto_0
.end method

.method public final z(Landroid/view/View;)Z
    .locals 2

    invoke-static {p1}, Landroid/support/v4/widget/DrawerLayout;->v(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/widget/d;->oU:Landroid/support/v4/widget/DrawerLayout;

    iget v1, p0, Landroid/support/v4/widget/d;->oR:I

    invoke-virtual {v0, p1, v1}, Landroid/support/v4/widget/DrawerLayout;->h(Landroid/view/View;I)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/widget/d;->oU:Landroid/support/v4/widget/DrawerLayout;

    invoke-virtual {v0, p1}, Landroid/support/v4/widget/DrawerLayout;->r(Landroid/view/View;)I

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method
