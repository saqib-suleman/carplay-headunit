.class final Landroid/support/v4/widget/b;
.super Landroid/support/v4/view/b;


# virtual methods
.method public final a(Landroid/view/View;Landroid/support/v4/view/a/a;)V
    .locals 0

    invoke-super {p0, p1, p2}, Landroid/support/v4/view/b;->a(Landroid/view/View;Landroid/support/v4/view/a/a;)V

    invoke-static {p1}, Landroid/support/v4/widget/DrawerLayout;->y(Landroid/view/View;)Z

    move-result p1

    if-nez p1, :cond_0

    invoke-virtual {p2}, Landroid/support/v4/view/a/a;->cr()V

    :cond_0
    return-void
.end method
